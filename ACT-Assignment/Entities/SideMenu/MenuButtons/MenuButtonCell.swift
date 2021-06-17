//
//  MenuButtonCell.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 17/06/21.
//

import UIKit

protocol MenuButtonCellDelegate {
    func menuButtonPressed(ofTitle : String?)
}

class MenuButtonCell: UITableViewCell {

    @IBOutlet var buttonTitle: UIButton!
    
    var delegate : MenuButtonCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func menuButtonPressed(_ sender: UIButton) {
        delegate?.menuButtonPressed(ofTitle: sender.title(for: .normal) ?? nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
