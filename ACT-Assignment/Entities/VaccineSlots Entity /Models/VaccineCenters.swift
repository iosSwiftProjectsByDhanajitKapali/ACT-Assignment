//
//  VaccineCenters.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 22/06/21.
//

import Foundation


//Temporary strcuts for VaccineCenters
struct VaccineCenters : Codable{
    let sessions : [CenterDetails]
}

struct CenterDetails : Codable{
    let center_id : Int
    let name : String
}
