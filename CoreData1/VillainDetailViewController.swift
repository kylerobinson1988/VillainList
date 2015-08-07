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

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var isEvilLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var dislikesLabel: UILabel!
    @IBOutlet weak var coolnessLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var archrivalLabel: UILabel!
    
    var name: String!
    var isEvil: Bool!
    var likes: String!
    var loathes: String!
    var coolness: Double!
    var age: Int!
    var archrival: String!
    
    override func viewDidLoad() {
        
        nameLabel.text = name
        
        if isEvil == true {
            
            isEvilLabel.text = "Is Definitely Evil."
            
        } else {
            
            isEvilLabel.text = "Not actually evil."
            
        }
        
        likesLabel.text = "Likes: \(likes)"
        dislikesLabel.text = "Loathes: \(loathes)"
        coolnessLabel.text = "Coolness: \(coolness)"
        ageLabel.text = "Age: \(age)"
        archrivalLabel.text = "Archrival: \(archrival)"
        
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
}
