//
//  ViewController.swift
//  ServiceMe!
//
//  Created by George Kunthara & Evan Arends on 4/6/17.
//  Copyright © 2017 George&Evan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func volunteerButton(_ sender: Any) {
        
        //does the segue from the homepage to the start of the Questionaire
        
        performSegue(withIdentifier: "homeToQuestionSegue", sender: nil)
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

