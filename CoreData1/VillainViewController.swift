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
    
    var managedObjectContext: NSManagedObjectContext!
    
    @IBOutlet weak var tableView: UITableView!
    
    var villainCollection = [Villain]()

    @IBAction func addName(sender: AnyObject) {
        
        let addVillainVC = storyboard?.instantiateViewControllerWithIdentifier("addVillainVC") as! AddVillainViewController
        
        presentViewController(addVillainVC, animated: true, completion: nil)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return villainCollection.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("villainCell") as! VillainCell
        
        let person = villainCollection[indexPath.row]
        cell.name.text = person.valueForKey("name") as? String
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("villainCell") as! VillainCell
        
        println("You just touched the cell.")
        
        let villainToLoad = villainCollection[indexPath.row]
        
        let villainDetailVC = storyboard?.instantiateViewControllerWithIdentifier("villainDetailVC") as! VillainDetailViewController
        
        villainDetailVC.name = villainToLoad.name
        villainDetailVC.age = Int(villainToLoad.age)
        villainDetailVC.isEvil = Bool(villainToLoad.evilness)
        villainDetailVC.likes = villainToLoad.likes
        villainDetailVC.loathes = villainToLoad.loathes
        villainDetailVC.archrival = villainToLoad.archrival
        villainDetailVC.coolness = Double(villainToLoad.coolness)
        
        self.navigationController?.pushViewController(villainDetailVC, animated: true)
        
    }
    
    // Override to support conditional editing of the table view.
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    
    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    
        if editingStyle == .Delete {
            // Delete the row from the data source
            
            let itemToDelete = villainCollection[indexPath.row]
            
            managedObjectContext.deleteObject(itemToDelete)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {

        super.viewWillAppear(animated)
        
        getData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Villains"
        
    }
    
    func getData() {
        
        let request = NSFetchRequest(entityName: "Villain")
        
        let tentativeVillains = managedObjectContext!.executeFetchRequest(request, error: nil) as! [Villain]
        
        villainCollection = tentativeVillains
        
        tableView.reloadData()
        
        println("Villain Collection!")
        println(villainCollection)
        
    }

}
















