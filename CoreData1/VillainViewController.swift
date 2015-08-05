//
//  NewViewController.swift
//  CoreData1
//
//  Created by Kyle Brooks Robinson on 6/24/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit
import CoreData

class VillainViewController: UIViewController, UITableViewDataSource {

    @IBAction func addName(sender: AnyObject) {
    
        var alert = UIAlertController(title: "New name", message: "Add a new name", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default) { (action: UIAlertAction!) -> Void in
            
            let nameField = alert.textFields![0] as! UITextField
            let ageField = alert.textFields![0] as! UITextField
            nameField.placeholder = "Name"
            self.saveName(nameField.text)
            self.tableView.reloadData()
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (action: UIAlertAction!) -> Void in
            
            
        }
        
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
            
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var people = [NSManagedObject]()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return people.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        
        let person = people[indexPath.row]
        cell.textLabel!.text = person.valueForKey("name") as? String
        
        return cell
        
    }
    
    override func viewWillAppear(animated: Bool) {

        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Person")
        
        var error: NSError?
        
        let fetchedResults = managedContext?.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults {
            
            people = results
            
        } else {
            
            println("Could not fetch \(error), \(error!.userInfo)")
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "\"Hypervillains\""
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    }

    func saveName(name: String) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Villain", inManagedObjectContext: managedContext)
        
        let villain = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        villain.setValue(name, forKey: "name")
        
        var error: NSError?
        if !managedContext.save(&error) {
            
            println("Could not save \(error), \(error?.userInfo)")
            
        }
        
        people.append(villain)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
