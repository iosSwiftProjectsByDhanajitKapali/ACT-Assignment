//
//  MenuButtonCell.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 17/06/21.
//

import UIKit



class MenuButtonCell: UITableViewCell {

   
    @IBOutlet weak private var buttonTitleLabel: UILabel!
    
    func setButtonTitle(with title : String)  {
        buttonTitleLabel.text = title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
