//
//  ViewController.swift
//  ToDoList
//
//  Created by Jerry on 7/24/15.
//  Copyright (c) 2015 Jerry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var memolist = [Memo]()
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memolist.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var tableviewcell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        tableviewcell.textLabel?.text = memolist[indexPath.row].title
        return tableviewcell
    }
    
    // UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated:true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show" {
            var row = tableview.indexPathForSelectedRow()?.row
            var destination = segue.destinationViewController as! MemotableviewTableViewController
            destination.memo = memolist[row!]
        }
    }
    
    @IBAction func unwindSegue(Segue: UIStoryboardSegue){
        
    }
}


