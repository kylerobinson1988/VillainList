//
//  AddVillainViewController.swift
//  CoreData1
//
//  Created by Kyle Brooks Robinson on 8/5/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit
import CoreData

class AddVillainViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var evilOrNotSegment: UISegmentedControl!
    @IBOutlet weak var likesTextField: UITextField!
    @IBOutlet weak var loathesTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var coolnessTextField: UITextField!
    @IBOutlet weak var archrivalTextField: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var evilness = true
    var people = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillChangeFrameNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            self.view.setNeedsUpdateConstraints()
            self.view.setNeedsLayout()
            
            if let kbSize = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size{
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    
                    self.bottomConstraint.constant = 20 + kbSize.height
                    
                })
                
            }
            
        }
        
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardDidHideNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                
                self.bottomConstraint.constant = 20
                
            })
            
        }
        
    }
    
    
    @IBAction func evilSegmentPressed(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
            
        case 0: evilness = true;
            
        case 1: evilness = false;
            
        default: break
        
        }
        
    }
    
    func saveName() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Villain", inManagedObjectContext: managedContext)
        
        let villain = Villain(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        villain.name = nameTextField.text
        villain.likes = likesTextField.text
        villain.loathes = loathesTextField.text
        villain.age = ageTextField.text.toInt()!
        villain.archrival = archrivalTextField.text
        villain.evilness = evilness
        villain.coolness = NSString(string: coolnessTextField.text!).doubleValue
        
        managedContext.save(nil)
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func submitButtonPressed(sender: AnyObject) {
        
        saveName()
        
    }

}
