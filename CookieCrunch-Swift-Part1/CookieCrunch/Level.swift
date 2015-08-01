//
//  Level.swift
//  CookieCrunch
//
//  Created by Matthijs on 19-06-14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import Foundation

let NumColumns = 9
let NumRows = 9

class Level {
  // The 2D array that keeps track of where the Cookies are.
  private var cookies = Array2D<Cookie>(columns: NumColumns, rows: NumRows)

  // The 2D array that contains the layout of the level.
  private var tiles = Array2D<Tile>(columns: NumColumns, rows: NumRows)

  // The list of swipes that result in a valid swap. Used to determine whether
  // the player can make a certain swap, whether the board needs to be shuffled,
  // and to generate hints.
  private var possibleSwaps = Set<Swap>()

  // Create a level by loading it from a file.
  init(filename: String) {
    if let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename) {

      // The dictionary contains an array named "tiles". This array contains
      // one element for each row of the level. Each of those row elements in
      // turn is also an array describing the columns in that row. If a column
      // is 1, it means there is a tile at that location, 0 means there is not.
      if let tilesArray: AnyObject = dictionary["tiles"] {

        // Loop through the rows...
        for (row, rowArray) in enumerate(tilesArray as! [[Int]]) {

          // Note: In Sprite Kit (0,0) is at the bottom of the screen,
          // so we need to read this file upside down.
          let tileRow = NumRows - row - 1

          // Loop through the columns in the current row...
          for (column, value) in enumerate(rowArray) {

            // If the value is 1, create a tile object.
            if value == 1 {
              tiles[column, tileRow] = Tile()
            }
          }
        }
      }
    }
  }

  // MARK: Game Setup

  // Fills up the level with new Cookie objects. The level is guaranteed free
  // from matches at this point.
  // You call this method at the beginning of a new game and whenever the player
  // taps the Shuffle button.
  // Returns a set containing all the new Cookie objects.
  func shuffle() -> Set<Cookie> {
    var set: Set<Cookie>

    do {
      // Removes the old cookies and fills up the level with all new ones.
      set = createInitialCookies()

      // At the start of each turn we need to detect which cookies the player can
      // actually swap. If the player tries to swap two cookies that are not in
      // this set, then the game does not accept this as a valid move.
      // This also tells you whether no more swaps are possible and the game needs
      // to automatically reshuffle.
      detectPossibleSwaps()

      //println("possible swaps: \(possibleSwaps)")

      // If there are no possible moves, then keep trying again until there are.
    }
    while possibleSwaps.count == 0

    return set
  }

  private func createInitialCookies() -> Set<Cookie> {
    var set = Set<Cookie>()

    // Loop through the rows and columns of the 2D array. Note that column 0,
    // row 0 is in the bottom-left corner of the array.
    for row in 0..<NumRows {
      for column in 0..<NumColumns {

        // Only make a new cookie if there is a tile at this spot.
        if tiles[column, row] != nil {

          // Pick the cookie type at random, and make sure that this never
          // creates a chain of 3 or more. We want there to be 0 matches in
          // the initial state.
          var cookieType: CookieType
          do {
            cookieType = CookieType.random()
          }
          while (column >= 2 &&
                  cookies[column - 1, row]?.cookieType == cookieType &&
                  cookies[column - 2, row]?.cookieType == cookieType)
             || (row >= 2 &&
                  cookies[column, row - 1]?.cookieType == cookieType &&
                  cookies[column, row - 2]?.cookieType == cookieType)

          // Create a new cookie and add it to the 2D array.
          let cookie = Cookie(column: column, row: row, cookieType: cookieType)
          cookies[column, row] = cookie

          // Also add the cookie to the set so we can tell our caller about it.
          set.insert(cookie)
        }
      }
    }
    return set
  }

  // MARK: Querying the Level

  // Returns the cookie at the specified column and row, or nil when there is none.
  func cookieAtColumn(column: Int, row: Int) -> Cookie? {
    assert(column >= 0 && column < NumColumns)
    assert(row >= 0 && row < NumRows)
    return cookies[column, row]
  }

  // Determines whether there's a tile at the specified column and row.
  func tileAtColumn(column: Int, row: Int) -> Tile? {
    assert(column >= 0 && column < NumColumns)
    assert(row >= 0 && row < NumRows)
    return tiles[column, row]
  }

  // Determines whether the suggested swap is a valid one, i.e. it results in at
  // least one new chain of 3 or more cookies of the same type.
  func isPossibleSwap(swap: Swap) -> Bool {
    return possibleSwaps.contains(swap)
  }

  // MARK: Swapping

  // Swaps the positions of the two cookies from the Swap object.
  func performSwap(swap: Swap) {
    // Need to make temporary copies of these because they get overwritten.
    let columnA = swap.cookieA.column
    let rowA = swap.cookieA.row
    let columnB = swap.cookieB.column
    let rowB = swap.cookieB.row

    // Swap the cookies. We need to update the array as well as the column
    // and row properties of the Cookie objects, or they go out of sync!
    cookies[columnA, rowA] = swap.cookieB
    swap.cookieB.column = columnA
    swap.cookieB.row = rowA

    cookies[columnB, rowB] = swap.cookieA
    swap.cookieA.column = columnB
    swap.cookieA.row = rowB
  }

  // MARK: Detecting Swaps

  // Recalculates which moves are valid.
  func detectPossibleSwaps() {
    var set = Set<Swap>()

    for row in 0..<NumRows {
      for column in 0..<NumColumns {
        if let cookie = cookies[column, row] {

          // Is it possible to swap this cookie with the one on the right?
          // Note: don't need to check the last column.
          if column < NumColumns - 1 {

            // Have a cookie in this spot? If there is no tile, there is no cookie.
            if let other = cookies[column + 1, row] {
              // Swap them
              cookies[column, row] = other
              cookies[column + 1, row] = cookie

              // Is either cookie now part of a chain?
              if hasChainAtColumn(column + 1, row: row) ||
                 hasChainAtColumn(column, row: row) {
                set.insert(Swap(cookieA: cookie, cookieB: other))
              }

              // Swap them back
              cookies[column, row] = cookie
              cookies[column + 1, row] = other
            }
          }

          // Is it possible to swap this cookie with the one above?
          // Note: don't need to check the last row.
          if row < NumRows - 1 {

            // Have a cookie in this spot? If there is no tile, there is no cookie.
            if let other = cookies[column, row + 1] {
              // Swap them
              cookies[column, row] = other
              cookies[column, row + 1] = cookie

              // Is either cookie now part of a chain?
              if hasChainAtColumn(column, row: row + 1) ||
                 hasChainAtColumn(column, row: row) {
                set.insert(Swap(cookieA: cookie, cookieB: other))
              }

              // Swap them back
              cookies[column, row] = cookie
              cookies[column, row + 1] = other
            }
          }
        }
      }
    }

    possibleSwaps = set
  }

  private func hasChainAtColumn(column: Int, row: Int) -> Bool {
    // Here we do ! because we know there is a cookie here
    let cookieType = cookies[column, row]!.cookieType

    // Here we do ? because there may be no cookie there; if there isn't then
    // the loop will terminate because it is != cookieType. (So there is no
    // need to check whether cookies[i, row] != nil.)
    var horzLength = 1
    for var i = column - 1; i >= 0 && cookies[i, row]?.cookieType == cookieType; --i, ++horzLength { }
    for var i = column + 1; i < NumColumns && cookies[i, row]?.cookieType == cookieType; ++i, ++horzLength { }
    if horzLength >= 3 { return true }

    var vertLength = 1
    for var i = row - 1; i >= 0 && cookies[column, i]?.cookieType == cookieType; --i, ++vertLength { }
    for var i = row + 1; i < NumRows && cookies[column, i]?.cookieType == cookieType; ++i, ++vertLength { }
    return vertLength >= 3
  }
}
