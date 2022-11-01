//
//  EditViewController.swift
//  moneyTracker
//
//  Created by User on 29.10.2022.
//

import UIKit

protocol AddOperationDelegate {
    func addOperation(oper: Operation)
}

class EditViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var amountInput: UITextField!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    var type = true
    var category = CategoryList.uncat
    
    var operationDelegate: AddOperationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        plusButton.setTitle("", for: .normal)
        plusButton.layer.cornerRadius = plusButton.layer.bounds.width / 2
        plusButton.clipsToBounds = true
        
        minusButton.setTitle("", for: .normal)
        minusButton.layer.cornerRadius = minusButton.layer.bounds.width / 2
        minusButton.clipsToBounds = true
        
        amountInput.textColor = .systemGreen
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        type = true
        
        amountInput.textColor = .systemGreen
    }
    
    @IBAction func minusButtonPressed(_ sender: Any) {
        type = false
        
        amountInput.textColor = .systemRed
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        if amountInput.text != "" {
            let name = nameInput.text!
            let amount = Float(amountInput.text!)
            let date = Date()
            
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .short
            
            let formatedDate = formatter.string(from: date)
            
            var iconName: IconsList?
            switch category {
                // Wastes
            case .food:
                iconName = .foodIcon
            case .health:
                iconName = .healthIcon
            case .sport:
                iconName = .sportIcon
            case .fun:
                iconName = .funIcon
                
                // Earnings
            case .salary:
                iconName = .salaryIcon
                
            case .uncat:
                iconName = .uncatIcon
            
            }
            
            let newOper = createOperation(name: name, category: category, amount: amount!, date: formatedDate, type: self.type, icon: iconName!)
            
            operationDelegate?.addOperation(oper: newOper)
            
            self.dismiss(animated: true)
        } else {
            print("Enter amount!")
        }
        
        
    }
    
    func createOperation(name: String, category: CategoryList, amount: Float, date: String, type: Bool, icon: IconsList) -> Operation {
        return Operation(shop: name, category: category, amount: amount, date: date, type: type, icon: icon)
    }
    
}

extension EditViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nameInput.text = CategoryList.allCases[indexPath.row].rawValue
        self.category = CategoryList.allCases[indexPath.row]
    }
    
}

extension EditViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CategoryList.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = CategoryList.allCases[indexPath.row].rawValue
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = category
        
        return cell
    }
    
}
