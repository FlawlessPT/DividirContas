//
//  ResultViewController.swift
//  DividirContas
//
//  Created by ISTEC on 08/07/2020.
//  Copyright © 2020 ISTEC. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var tip: String?
    var splitNumber: String?
    var result: String?
    
    @IBOutlet weak var recalculateButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = result
        loadDescription()
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadDescription() {
        let convertedTip: String = convertTip()
        
        descriptionLabel.text = "Split between \(splitNumber ?? "0") people, with \(convertedTip)% tip."
    }
    
    func convertTip() -> String {
        var tipConverted: String = "0"
        
        if tip == "0.1" {
            tipConverted = "10"
        } else if tip == "0.2" {
            tipConverted = "20"
        }
        
        return tipConverted
    }
}
