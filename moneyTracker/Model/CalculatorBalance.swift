//
//  CalculatorBalance.swift
//  moneyTracker
//
//  Created by User on 31.10.2022.
//

import Foundation

struct CalculatorBalance {
    var balance: Float?
    
    mutating func calculateBalance(balance: Float, operations: [Operation]) -> String {
        self.balance = balance
        
        let earnings = calculateEarnings(operations: operations)
        let wastes = calculateWastes(operations: operations)
        
        self.balance! += earnings
        self.balance! -= wastes
        
        return "\(String(format: "%.2f", self.balance!))"
    }
    
    func calculateEarnings(operations: [Operation]) -> Float {
        var earnings: Float = 0
        
        for oper in operations {
            if oper.type == true {
                earnings += oper.amount
            }
        }
        
        return earnings
    }
    
    func calculateWastes(operations: [Operation]) -> Float {
        var wastes: Float = 0
        
        for oper in operations {
            if oper.type == false {
                wastes += oper.amount
            }
        }
        
        return wastes
    }
    
}
