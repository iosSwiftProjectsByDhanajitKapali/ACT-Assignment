//
//  VaccineSlots.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 22/06/21.
//

import UIKit

class VaccineSlots: UIView {

   
    @IBOutlet var pincodeTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var searchSlotsButton: UIButton!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private var dateSelected : String?
    private var presenter : VaccineSlotPresenter!
    
    //Boilerplate to load xib
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
        //perfrom actions after loading view
        initializer()
        addDesign()
        
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
    } //:BoilerPlate ends
    
    private func initializer(){
        //initailizing the dateSelected
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateSelected = dateFormatter.string(from: datePicker.date)
        
        //setting the DatePicker
        datePicker.date = Date()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.addTarget(self, action: #selector(dateSetter), for: .valueChanged)
        
        //setting delegate
        presenter = VaccineSlotPresenter(withDelegate: self)
        
        //hiding the activityIndicator
        activityIndicator.isHidden = true
    }
    
    @IBAction func searchSlotsButton(_ sender: UIButton) {
        if let pincode = pincodeTextField.text , !pincode.isEmpty, let date = dateSelected{
            print(pincode)
            print(date)
            showLoader()
            presenter.getVaccinationCenterDetails(pincode: pincode, withDate: date)
        }
    }
    
    private func addDesign(){
        searchSlotsButton.layer.cornerRadius = 15.0
    }
    
    @objc private func dateSetter(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.string(from: datePicker.date)
        dateSelected = date
    }
    
}

extension VaccineSlots : VaccineSlotPresenterDelegate{
    func presentVaccinationCenterDetails(centers: [VaccineCenters]) {
        print(centers.count)
    }
    
    func presentAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            //present(alert, animated: true)
            print("Error -> presentAlert From VaccineSlots")
        }
    }
    
    func stopAndHideLoader() {
        hideLoader()
    }
    
    private func showLoader(){
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
    }
    
    private func hideLoader(){
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
        }
    }
    
    
}
