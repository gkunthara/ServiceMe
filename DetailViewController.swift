//
//  DetailViewController.swift
//  ServiceMe!
//
//  Created by George Kunthara on 4/25/17.
//  Copyright © 2017 George&Evan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let prefs = UserDefaults.standard
        if let city = prefs.string(forKey: "detail"){
            label.text = city
        }else{
            //Nothing stored in NSUserDefaults yet. Set a value.
            prefs.setValue("Berlin", forKey: "detail")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
