//
//  ViewController.swift
//  ServiceMe!
//
//  Created by George Kunthara & Evan Arends on 4/6/17.
//  Copyright © 2017 George&Evan. All rights reserved.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {
    
    @IBOutlet weak var error_label: UILabel!
    @IBOutlet weak var pass_text: UITextField!
    @IBOutlet weak var email_text: UITextField!
    @IBOutlet weak var toggle_label: UISegmentedControl!
    @IBAction func volunteerButton(_ sender: Any) {
        if toggle_label.selectedSegmentIndex == 0 {
            Auth.auth().signIn(withEmail: email_text.text!, password: pass_text.text!) { (user, error) in
                if user != nil {
                    //user exist
                    self.performSegue(withIdentifier: "homeToQuestionSegue", sender: nil)
                } else {
                    self.error_label.isHidden = false
                    print("no dojo")
                }
            }
            
            
        } else {
            Auth.auth().createUser(withEmail: email_text.text!, password: pass_text.text!) { (user, error) in
                // ...
            }
        }
        
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        error_label.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func togle_click(_ sender: Any) {
        
    }


}

