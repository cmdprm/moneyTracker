//
//  CategoryList.swift
//  moneyTracker
//
//  Created by User on 29.10.2022.
//

import Foundation

enum CategoryList: String, CaseIterable {
    
    // Wastes
    case food = "Food"
    case health = "Health"
    case sport = "Sport"
    case fun = "Entertainment"
    
    // Earnings
    case salary = "Salary"
    
    case uncat = "Uncategorized"
}

enum IconsList: String {
    
    // Wastes
    case foodIcon = "cart.fill"
    case healthIcon = "cross.case.fill"
    case sportIcon = "dumbbell.fill"
    case funIcon = "gamecontroller.fill"
    
    // Earnings
    case salaryIcon = "creditcard.fill"
    
    case uncatIcon = "banknote.fill"
}
