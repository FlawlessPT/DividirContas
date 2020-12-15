//
//  CalculatorBrain.swift
//  DividirContas
//
//  Created by ISTEC on 08/07/2020.
//  Copyright © 2020 ISTEC. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var bill: Bill?
    
    func getTip() -> Float {
        return bill?.tip ?? 0.0
    }
    
    func getSplitNumber() -> Float {
        return bill?.splitNumber ?? 0.0
    }
    
    func getResult() -> Float {
        return bill?.result ?? 0.0
    }
    
    mutating func calculateResult(totalBill: Float, tip: Float, splitNumber: Float) {
        let resultValue = (totalBill + (totalBill * tip)) / splitNumber
        bill = Bill(tip: tip, splitNumber: splitNumber, result: resultValue)
        
    }
}
