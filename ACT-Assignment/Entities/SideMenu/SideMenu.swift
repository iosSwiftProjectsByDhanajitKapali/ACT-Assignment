//
//  SideMenu.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 15/06/21.
//

import UIKit

class SideMenu: UIView {

    let kCONTENT_XIB_NAME = "PopUpViewTwo"
    var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }
    
//    init(frame: CGRect, data : PopUpModel) {
//        super.init(frame: frame)
//        loadViewFromNib()
//        populatePopUp(popUpData: data)
//    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    func loadViewFromNib(){
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = bounds
        addSubview(view)
    }
    

}

