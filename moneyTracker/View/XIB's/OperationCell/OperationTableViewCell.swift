//
//  OperationTableViewCell.swift
//  moneyTracker
//
//  Created by User on 29.10.2022.
//

import UIKit

class OperationTableViewCell: UITableViewCell {

    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var shopLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconView.layer.cornerRadius = iconView.layer.bounds.width / 2
        iconView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
