//
//  OperationViewController.swift
//  moneyTracker
//
//  Created by User on 31.10.2022.
//

import UIKit

class OperationViewController: UIViewController {
    
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var shopLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var shop: String?
    var category: CategoryList?
    var amount: Float?
    var date: String?
    var type: Bool?
    
    var iconName: IconsList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        iconView.layer.cornerRadius = iconView.layer.bounds.width / 2
        iconView.clipsToBounds = true
        
        iconImageView.image = UIImage(systemName: iconName!.rawValue)
        
        if type == true {
            amountLabel.textColor = .systemGreen
        } else if type == false {
            amountLabel.textColor = .systemRed
        }
        
        shopLabel.text = shop!
        categoryLabel.text = category?.rawValue
        amountLabel.text = "\(amount!)"
        dateLabel.text = date!
    }

}
