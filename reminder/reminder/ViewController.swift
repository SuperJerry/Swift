//
//  ViewController.swift
//  reminder
//
//  Created by Jerry on 7/22/15.
//  Copyright (c) 2015 Jerry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var memolist = [Memo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        memolist.append(Memo(passtitle:"I am Hungry", passdescription:"I haven't eat for 2 seconds"))
        memolist.append(Memo(passtitle: "I am thirsty", passdescription: "I haven't drink for 1 minute"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memolist.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var tableviewcell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        tableviewcell.textLabel?.text = memolist[indexPath.row].title
        return tableviewcell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated:true)
    }
    
}
