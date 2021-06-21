//
//  SideMenu.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 15/06/21.
//

import UIKit

protocol SideMenuDelegate {
    func menuButtonPressed(_ ofTitle : String?)
    func dismissMenuWithTouch()
}
class SideMenu: UIView{
    
    @IBOutlet weak private var xibMainView: UIView!
    @IBOutlet weak private var mainView: UIView!
    @IBOutlet weak private var imageAndNameContainerView: UIView!
    @IBOutlet weak private var userImageView: UIImageView!
    @IBOutlet weak private var userName: UILabel!
    @IBOutlet weak private var tableViewForMenuButtons: UITableView!
    
    var delegate : SideMenuDelegate?
    
    //Boilerplate to load xib
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
        
        setAllDelegates()
        populateTableView()
        addDesignToMenu()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    func setAllDelegates(){
        tableViewForMenuButtons.delegate = self
        tableViewForMenuButtons.dataSource = self
        ProfileHomeNotificationTabBarViewController.profileHomeNotificationTabBarViewControllerDelegate = self
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
        
        animateShowMenu()
        
        //resixing the imageView according to image
        resizeImageView(for: K.Image.AssetImage.MALE_USER!)
        
    }
    
    func animateShowMenu(){
        //animating the appearance SideMenu
        mainView.center.x = -280
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
            self.mainView.center.x = 0
        } completion: { (done) in
            if done{
                //do something after animation is completed
            }
        }
    }
    
    func animateHideMenu(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
            self.mainView.center.x = -280
        } completion: { (done) in
            if done{
                //do something after animation is completed
                self.delegate?.dismissMenuWithTouch()
            }
        }
    }
    
    func loadViewFromNib(){
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = bounds
        addSubview(view)
    }
    
    //function to dismiss menu when touched outside the Menu
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == self.xibMainView {
                //calling delegate to dismiss menu
                animateHideMenu()
            } else {
                return
            }
        }
    }
   
    
    //function to resize the user-imageView according to the image
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


//MARK: - ProfileHomeNotificationTabBarViewControllerDelegate
extension SideMenu : ProfileHomeNotificationTabBarViewControllerDelegate{
    func animateHideMenuOnMenuButtonClick() {
        animateHideMenu()
    }
}

//MARK: - UITableView DataSource and Delegate Methods
extension SideMenu : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = K.Array.menuButtonTitleArr.count
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewForMenuButtons.dequeueReusableCell(withIdentifier: K.TableViewCellID.MENU_BUTTON_CELL_ID , for: indexPath) as! MenuButtonCell
        cell.setButtonTitle(with: K.Array.menuButtonTitleArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
            self.mainView.center.x = -280
        } completion: { (done) in
            if done{
                //do something after animation is completed
                self.delegate?.dismissMenuWithTouch()
                self.delegate?.menuButtonPressed(K.Array.menuButtonTitleArr[row])
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func populateTableView(){
        //tableViewForMenuButtons.allowsSelection = true
        tableViewForMenuButtons.register(UINib(nibName: K.XibWithName.MENU_BUTTON_CELL, bundle: nil), forCellReuseIdentifier: K.TableViewCellID.MENU_BUTTON_CELL_ID)
        
    }
}

