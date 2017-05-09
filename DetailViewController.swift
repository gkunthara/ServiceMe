//
//  DetailViewController.swift
//  ServiceMe!
//
//  Created by George Kunthara on 4/25/17.
//  Copyright © 2017 George&Evan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var nameOfPlace: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var placeDescription: UILabel!
    
    
    var selectedTitle: String?
    var selectedNumber: String?
    var selectedAddress: String?
    var selectedDescription: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameOfPlace.text = selectedTitle
        phoneNumber.text = selectedNumber
        address.text = selectedAddress
        placeDescription.text = selectedDescription
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
