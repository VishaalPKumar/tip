//
//  SettingsViewController.swift
//  tip
//
//  Created by Vishaal Kumar on 8/19/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

 
    
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var userDefaults: UserDefaults?
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaults = UserDefaults.standard
        index = userDefaults!.integer(forKey: "tip")
        tipControl.selectedSegmentIndex = index
    }
    

    @IBAction func tipChanged(_ sender: Any) {
        index = tipControl.selectedSegmentIndex
        userDefaults?.set(index, forKey: "tip")
        
    }
    
 

}
