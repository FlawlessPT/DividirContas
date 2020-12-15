//
//  ViewController.swift
//  DividirContas
//
//  Created by ISTEC on 08/07/2020.
//  Copyright © 2020 ISTEC. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var tip0Button: UIButton!
    @IBOutlet weak var tip10Button: UIButton!
    @IBOutlet weak var tip20Button: UIButton!
    
    @IBOutlet weak var splitLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    var tip: Float = 0.0
    
    let greenColor: UIColor = UIColor.init(red: 64/255, green: 184/255, blue: 131/255, alpha: 1)
    let defaultColor: UIColor = UIColor.init(red: 225/255, green: 250/255, blue: 240/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func tip0ButtonPressed(_ sender: UIButton) {
        updateButton(sender: sender)
    }
    
    @IBAction func tip10ButtonPressed(_ sender: UIButton) {
        updateButton(sender: sender)
    }
    
    @IBAction func tip20ButtonPressed(_ sender: UIButton) {
        updateButton(sender: sender)
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f", sender.value)
    }
    
    func changeToGreen(button: UIButton) {
        button.backgroundColor = greenColor
        button.setTitleColor(defaultColor, for: .normal)
    }
    
    func changeToDefault(button: UIButton) {
        button.backgroundColor = defaultColor
        button.setTitleColor(greenColor, for: .normal)
    }
    
    func updateButton(sender: UIButton) {
        billTextField.endEditing(true)
        
        if (sender.currentTitle == "0%") {
            tip = 0
            changeToGreen(button: sender)
            changeToDefault(button: tip10Button)
            changeToDefault(button: tip20Button)
        }
        else if (sender.currentTitle == "10%") {
            tip = 0.1
            changeToGreen(button: tip10Button)
            changeToDefault(button: tip0Button)
            changeToDefault(button: tip20Button)
        }
        else {
            tip = 0.2
            changeToGreen(button: sender)
            changeToDefault(button: tip0Button)
            changeToDefault(button: tip10Button)
        }
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let totalBill = Float(billTextField.text!)!
        let splitNumber = Float(splitLabel.text!)!
        
        calculatorBrain.calculateResult(totalBill: totalBill, tip: tip, splitNumber: splitNumber)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController //as = downcasting / as! = forced downcasting
            destinationVC.tip = String(format: "%.1f", calculatorBrain.getTip())
            destinationVC.splitNumber = String(format: "%.0f", calculatorBrain.getSplitNumber())
            destinationVC.result = String(format: "%.2f", calculatorBrain.getResult())
        }
    }
}

