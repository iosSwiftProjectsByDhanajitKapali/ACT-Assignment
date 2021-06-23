//
//  VaccineSlotPresenter.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 22/06/21.
//

import Foundation

protocol VaccineSlotPresenterDelegate : AnyObject{
    func presentAlert(title : String, message : String)
    func stopAndHideLoader()
    func presentVaccinationCenterDetails(centers : VaccineCenters)
}

class VaccineSlotPresenter{
    
    weak var delegate : VaccineSlotPresenterDelegate?
    
    init(withDelegate delegate : VaccineSlotPresenterDelegate) {
        self.delegate  = delegate
    }
    
    public func getVaccinationCenterDetails(pincode : String, withDate : String){
        var urlString = "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?"
        urlString += "pincode=\(pincode)&date=\(withDate)"
        let url = URL(string: urlString)
        
        //make the call
        NetworkManager().getApiData(forUrl: url!, resultType: VaccineCenters.self) { (result) in
            switch result{
            case .success(let details):
                self.delegate?.presentVaccinationCenterDetails(centers: details)
                self.delegate?.stopAndHideLoader()
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate?.stopAndHideLoader()
                self.delegate?.presentAlert(title: "Error" , message: error.localizedDescription)
            }
        }
    }
}
