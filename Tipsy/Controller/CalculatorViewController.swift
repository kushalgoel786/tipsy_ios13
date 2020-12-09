//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var percentTip = 0.1
    var noOfPeopleToSplitBetween = 2.0
    var amountPerPerson = "0.0"
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        billTextField.endEditing(true)
        
        percentTip = (Double((sender.currentTitle!).dropLast())!)/100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        
        noOfPeopleToSplitBetween = Double(sender.value)
        
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let stringBaseAmount = billTextField.text!
        
        if stringBaseAmount != ""{
            let baseAmount = Double(stringBaseAmount)!
            let netAmount = baseAmount*(1+percentTip)
            
            amountPerPerson = String(format: "%.2f", netAmount/noOfPeopleToSplitBetween)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.amtpPerson = amountPerPerson
            destinationVC.percent = "\(percentTip*100)%"
            destinationVC.noOfPersons = String(Int(noOfPeopleToSplitBetween))
        }
    }
    
    
    
}

