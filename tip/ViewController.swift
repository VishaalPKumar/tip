//
//  ViewController.swift
//  tip
//
//  Created by Vishaal Kumar on 8/19/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billAmountTextField: UITextField!
    var local : Locale?
    var currencySymbol: String = "$"
    
    var userDefaults: UserDefaults?
    var index: Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Tip Calculator"
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        tipPercentageLabel.text = String(format: "\(currencySymbol)%.2f", "0.00")
        totalLabel.text = String(format: "\(currencySymbol)%.2f", "0.00")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userDefaults = UserDefaults.standard
        index = userDefaults!.integer(forKey: "tip")
        tipControl.selectedSegmentIndex = index
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billAmountTextField.becomeFirstResponder()
    }

    @IBAction func onTap(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill : Double = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.20]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        
        tipPercentageLabel.text = String(format: "\(currencySymbol)%.2f", tip)
        totalLabel.text = String(format: "\(currencySymbol)%.2f", total)
        
    }
}


