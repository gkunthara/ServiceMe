//
//  MapViewController.swift
//  ServiceMe!
//
//  Created by Evan on 6/7/17.
//  Copyright © 2017 George&Evan. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {
    
    
    // Add a pair of UILabels in Interface Builder, and connect the outlets to these variables.
    //@IBOutlet weak var mapP: MKMapView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    var placesClient: GMSPlacesClient!
    
    override func viewDidLoad() {
       
        GMSPlacesClient.provideAPIKey("AIzaSyCCP4gsMv79MyEJwI5OEyajqoTuPaKqr9Y")
        GMSServices.provideAPIKey("AIzaSyCCP4gsMv79MyEJwI5OEyajqoTuPaKqr9Y")
        placesClient = GMSPlacesClient.shared()
        //mapP.showsUserLocation = true
        //mapP.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func curr_loc_click(_ sender: Any) {
        
        
        placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            self.nameLabel.text = "No current place"
            self.addressLabel.text = ""
            
            if let placeLikelihoodList = placeLikelihoodList {
                let place = placeLikelihoodList.likelihoods.first?.place
                if let place = place {
                    self.nameLabel.text = place.name
                    self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
                        .joined(separator: "\n")
                }
            }
        })
        //************
    }

    

}
