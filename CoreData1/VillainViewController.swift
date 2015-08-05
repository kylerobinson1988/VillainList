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
    
    var managedContext: NSManagedObjectContext!

    @IBAction func addName(sender: AnyObject) {
        
        let addVillainVC = storyboard?.instantiateViewControllerWithIdentifier("addVillainVC") as! AddVillainViewController
        
//        let name = 
        
        presentViewController(addVillainVC, animated: true, completion: nil)
        
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
        
        let fetchRequest = NSFetchRequest(entityName: "Villain")
        
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

        title = "Villains"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    }
    
    func addData() {
        
        let fetchRequest = NSFetchRequest(entityName: "Villain")
        
        fetchRequest.predicate = NSPredicate(format: "searchKey != nil")
        
        let count = managedContext.countForFetchRequest(fetchRequest, error: nil)
        
        if count > 0 { return }
        
        let path = NSBundle.mainBundle().pathForResource("SampleData", ofType: "plist")
        
        let dataArray = NSArray(contentsOfFile: path!)!
        
        for dict: AnyObject in dataArray {
            
            let entity = NSEntityDescription.entityForName("Villain", inManagedObjectContext: managedContext)
            
            let villain = Villain(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            let villainDict = dict as! NSDictionary
            
            villain.name = villainDict["name"] as! String
//            villain.age =
            
        }
        
    }

}
















