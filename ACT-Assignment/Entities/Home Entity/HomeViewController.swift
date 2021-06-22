//
//  HomeViewController.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 17/06/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var vaccineSlotsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //adding design to UI elements
        vaccineSlotsButton.layer.cornerRadius = 20.0

    }
    @IBAction func vaccineSlotsButtonPressed(_ sender: UIButton) {
        //load VaccineSlots Scene from xib
        let view = VaccineSlots(frame: self.view.bounds)
        self.view.addSubview(view)
        
    }
    
}
