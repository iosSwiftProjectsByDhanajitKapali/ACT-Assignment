//
//  SideMenu.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 15/06/21.
//

import UIKit

protocol SideMenuDelegate {
    func LogoutButtonPress()
    func menuButtonPressed(_ ofTitle : String?)
    func dismissMenuWithTouch()
}
class SideMenu: UIView{
    
    @IBOutlet var xibMainView: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet var imageAndNameContainerView: UIView!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var userName: UILabel!
    
    var delegate : SideMenuDelegate?
    
    @IBAction func buttonOnePressed(_ sender: UIButton) {
        delegate?.menuButtonPressed(sender.title(for: .normal))
    }
    
    @IBAction func buttonTwoPressed(_ sender: UIButton) {
        delegate?.menuButtonPressed(sender.title(for: .normal))
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
       
        delegate?.LogoutButtonPress()
    }
    
    //Boilerplate to load xib
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
        addDesignToMenu()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    func addDesignToMenu(){
        //make the bottomRight and topRight corners round
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 20.0
        mainView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        //make the bottomRight, topRight, bottom left corners round
        imageAndNameContainerView.clipsToBounds = true
        imageAndNameContainerView.layer.cornerRadius = 20.0
        imageAndNameContainerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        
        //animating the SideMenu
        mainView.center.x = -280
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
            self.mainView.center.x = 0
        } completion: { (done) in
            if done{
                //do something after animation is completed
            }
        }

        
        //resixing the imageView according to image
        resizeImageView(for: K.Image.AssetImage.MALE_USER!)
        
    }
    
    func loadViewFromNib(){
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = bounds
        addSubview(view)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == self.xibMainView {
                //calling delegate to dismiss menu
                delegate?.dismissMenuWithTouch()
            } else {
                return
            }
        }
    }
   
    
    func resizeImageView(for image : UIImage?)  {
        guard image != nil else {
            return
        }
        
        userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor, multiplier: 1.0).isActive = true
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(
            item:  userImageView!  , attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: userImageView  , attribute: NSLayoutConstraint.Attribute.width,
            multiplier: image!.size.height / image!.size.width, constant: 0.0)
        
        userImageView.addConstraint(constraint)
        
    }
    

}

