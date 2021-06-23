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
    @IBOutlet var centerDetailsTableView: UITableView!
    
    private var dateSelected : String?
    private var presenter : VaccineSlotPresenter!
    private var centerDetails = [CenterDetails]()
    
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
        
        //setting self as ddelegate of presenter
        presenter = VaccineSlotPresenter(withDelegate: self)
        
        //setting delegates and datasource of TableView
        centerDetailsTableView.delegate = self
        centerDetailsTableView.dataSource = self
        centerDetailsTableView.register(UITableViewCell.self, forCellReuseIdentifier: K.TableViewCellID.CENTER_DETAILS_CELL_ID)
        
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
    func presentVaccinationCenterDetails(centers: VaccineCenters) {
        centerDetails = centers.sessions
//        for i in 0...centerDetails.sessions.count-1{
//            print(centerDetails.sessions[i].name)
//            print("\n")
//        }
        print(centerDetails.count)
        DispatchQueue.main.async {
            self.centerDetailsTableView.reloadData()
        }
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


extension VaccineSlots : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return centerDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = centerDetailsTableView.dequeueReusableCell(withIdentifier: K.TableViewCellID.CENTER_DETAILS_CELL_ID, for: indexPath)
        cell.textLabel?.text = centerDetails[indexPath.row].name
        cell.detailTextLabel?.text = String(centerDetails[indexPath.row].center_id)
            
        return cell
    }
    
    
}
