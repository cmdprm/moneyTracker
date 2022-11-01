//
//  ViewController.swift
//  moneyTracker
//
//  Created by User on 28.10.2022.
//

import UIKit

class AccountViewController: UIViewController, AddOperationDelegate {
    
    var balance: Float = 100
    
    var operations = [
        Operation(shop: "Sosedi", category: .food, amount: 12.4, date: "Test", type: false, icon: .foodIcon),
        Operation(shop: "Gym", category: .sport, amount: 2.5, date: "Test 1", type: false, icon: .sportIcon)
    ]

    var balanceCalculator = CalculatorBalance()

    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editButton.setTitle("", for: .normal)
        editButton.layer.cornerRadius = 10
        
        let nib = UINib(nibName: C.Account.cellNibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: C.Account.cellIndentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        balanceLabel.text = balanceCalculator.calculateBalance(
            balance: balance,
            operations: operations
        )
    }
    
    func addOperation(oper: Operation) {
        self.operations.insert(oper, at: 0)
        self.tableView.reloadData()
        self.balanceLabel.text = balanceCalculator.calculateBalance(
            balance: balance,
            operations: operations
        )
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToAdd", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAdd" {
            let VC = segue.destination as! EditViewController
            VC.operationDelegate = self
        }
        
        if segue.identifier == "goToOperation" {
            let oper = operations[selectedIndex]
            
            let VC = segue.destination as! OperationViewController
            VC.shop = oper.shop
            VC.category = oper.category
            VC.amount = oper.amount
            VC.date = oper.date
            VC.type = oper.type
            VC.iconName = oper.icon
        }
    }
    
}

extension AccountViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        performSegue(withIdentifier: "goToOperation", sender: self)
    }
    
}

extension AccountViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let oper = operations[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: C.Account.cellIndentifier, for: indexPath) as! OperationTableViewCell
        
        cell.iconImageView.image = UIImage(systemName: oper.icon.rawValue)
        
        cell.shopLabel.text = oper.shop
        cell.categoryLabel.text = oper.category.rawValue
        
        if oper.type == true {
            cell.amountLabel.textColor = .systemGreen
        } else if oper.type == false {
            cell.amountLabel.textColor = .systemRed
        }
        
        cell.amountLabel.text = "\(oper.amount)"
        
        cell.dateLabel.text = "\(oper.date)"
        
        return cell
    }
    
    
}

