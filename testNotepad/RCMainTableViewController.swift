//
//  RCMainTableViewController.swift
//  testNotepad
//
//  Created by Chiang Siek Siang on 2015/5/11.
//  Copyright (c) 2015年 Chiang Siek Siang. All rights reserved.
//

import UIKit

class RCMainTableViewController: UITableViewController { 
    var data: NSMutableArray = NSMutableArray()
    var select: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a button for
        let barButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("addNote:"))
        navigationItem.rightBarButtonItem = barButton
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("noteCell", forIndexPath: indexPath) as! UITableViewCell
        
        // get label with tag is 11
        let label = cell.viewWithTag(11) as? UILabel
        label?.text = data[indexPath.row] as? String

        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        select = indexPath.row
        return indexPath
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // get the next viewController for pass value
        let viewController = segue.destinationViewController as! RCDetailViewController
        viewController.data = data
        viewController.select = select
    }
    
    // MARK: - Target event
    /*
        add new note in array
    */
    func addNote(barButton: UIBarButtonItem) {
        data.insertObject("\(NSDate())", atIndex: 0)
        
        tableView.insertRowsAtIndexPaths(NSArray(object: NSIndexPath(forRow: 0, inSection: 0)) as [AnyObject], withRowAnimation: UITableViewRowAnimation.Top)
    }

}
