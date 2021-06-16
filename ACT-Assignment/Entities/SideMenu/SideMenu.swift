//
//  SideMenu.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 15/06/21.
//

import UIKit

class SideMenu: UIView {
    
    @IBOutlet var userName: UILabel!
    
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        print("from SideMenuVC-> Logout button pressed")
        //jump to login scene
        let storyboard : UIStoryboard? = UIStoryboard(name: K.StoryBoardID.MAIN , bundle: nil)
        guard let destinationVC = storyboard?.instantiateViewController(identifier: K.SceneID.LOGIN_SCENE ) else {
            return
        }
        //navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    //Boilerplate to load xib
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }
    
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

