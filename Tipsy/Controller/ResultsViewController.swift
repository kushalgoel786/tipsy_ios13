//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Kapil Kedar on 13/04/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var amtpPerson : String = ""
    var percent : String = ""
    var noOfPersons: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if amtpPerson != "0.0"{
            totalLabel.text = amtpPerson
            settingsLabel.text = "Split between \(noOfPersons) people, with \(percent) tip."
        }else{
            totalLabel.text = "0.0"
            settingsLabel.text = "Nothing Entered"
        }
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
