//
//  MasterViewController.swift
//  Coursework Management Tool
//
//  Created by MACBOOKPRO on 20/03/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController {
    
    
    
    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()
    
   // var modules = [Module]()
    
    var dataController = DataController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(MasterViewController.insertNewModule(_:)))
        
        
        
        // let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewCourse:")
        
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
            self.detailViewController!.table = self.table()
            
        }
        self.view.backgroundColor = UIColor.blackColor()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.detailViewController!.modules = dataController.fetchAll()
        
    }
    
    
    func table() -> UITableView {
        return self.tableView
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func insertNewModule(sender: AnyObject) {
        
        var moduleNames = [String]()
        
        for m in self.detailViewController!.modules {
            
            moduleNames.insert(m.name, atIndex: 0)
            
        }
        
        if moduleNames.contains("New Module") {
            print("New module already exists")
        }else{
            self.detailViewController!.modules.insert(Module(name:  "New Module", code: "0000"), atIndex: 0)
            let indexPath = NSIndexPath(forRow: 0, inSection: 0)
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let module = self.detailViewController!.modules[indexPath.row]
                print(indexPath.row)
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = module
                controller.position = indexPath.row
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
                
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.detailViewController!.modules.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let course = self.detailViewController!.modules[indexPath.row]
        cell.textLabel!.text = course.name
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            self.detailViewController!.dataController.deleteEach(String(self.detailViewController!.modules[indexPath.row].name))
            self.detailViewController!.modules.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 0.021, green:0.055, blue:0.081, alpha:1.00)
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00)
        cell.textLabel?.font = UIFont(name:"Calibri-Light", size: 50.0)
        cell.selectedBackgroundView = backgroundView
        
    }
    
    
    
}

