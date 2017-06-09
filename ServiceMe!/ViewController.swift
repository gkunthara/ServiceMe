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
    @IBOutlet weak var pass_field: UITextField!
    @IBOutlet weak var pass_label: UILabel!
    @IBOutlet weak var email_field: UITextField!
    @IBOutlet weak var email_label: UILabel!
    
    @IBAction func signup_click(_ sender: Any) {
    }
    
    
    @IBAction func login_click(_ sender: Any) {
        Auth.auth().signIn(withEmail: email_field.text!, password: pass_field.text!) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "homeToQuestionSegue", sender: nil)
            } else {
                self.error_label.isHidden = false
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
    


}

//this is to get the text field to just have bottom line
extension UITextField {
    
    func setBottomLine(borderColor: UIColor) {
        
        self.borderStyle = UITextBorderStyle.none
        self.backgroundColor = UIColor.clear
        
        let borderLine = UIView()
        let height = 1.0
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - height, width: Double(self.frame.width), height: height)
        
        borderLine.backgroundColor = borderColor
        self.addSubview(borderLine)
    }
    
}




