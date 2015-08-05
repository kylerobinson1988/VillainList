//
//  VillainDetailViewController.swift
//  CoreData1
//
//  Created by Kyle Brooks Robinson on 8/4/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit
import CoreData

class VillainDetailViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var evilOrNotSegment: UISegmentedControl!
    @IBOutlet weak var likesTextField: UITextField!
    @IBOutlet weak var loathesTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var coolnessTextField: UITextField!
    @IBOutlet weak var archrivalTextField: UITextField!
    
    var people = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }

    func saveName(name: String) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
        
        let villain = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        villain.setValue(nameTextField.text, forKey: "name")
        villain.setValue(ageTextField.text, forKey: "age")
        villain.setValue(likesTextField.text, forKey: "likes")
        villain.setValue(loathesTextField.text, forKey: "loathes")
        villain.setValue(archrivalTextField.text, forKey: "archrival")
        villain.setValue(coolnessTextField.text, forKey: "food")
        villain.setValue(evilOrNotSegment.selectedSegmentIndex, forKey: "evilness")
        
        
        var error: NSError?
        if !managedContext.save(&error) {
            
            println("Could not save \(error), \(error?.userInfo)")
            
        }
        
        people.append(villain)
        
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    @IBAction func submitButtonPressed(sender: AnyObject) {
        
        
        
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
