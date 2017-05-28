//
//  ViewController.swift
//  ServiceMe!
//
//  Created by George Kunthara & Evan Arends on 4/6/17.
//  Copyright © 2017 George&Evan. All rights reserved.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController,UITextFieldDelegate  {
    
    @IBOutlet weak var error_label: UILabel!
    @IBOutlet weak var pass_text: UITextField!
    @IBOutlet weak var email_text: UITextField!
    @IBAction func loginButton(_ sender: Any) {
    
            Auth.auth().signIn(withEmail: email_text.text!, password: pass_text.text!) { (user, error) in
                if user != nil {
                    //user exist
                    self.performSegue(withIdentifier: "homeToQuestionSegue", sender: nil)
                } else {
                    self.error_label.isHidden = false
                    print("no dojo")
                }
            
            
    }
    }
    
    @IBAction func signupButton(_ sender: Any) {
        
            Auth.auth().createUser(withEmail: email_text.text!, password: pass_text.text!) { (user, error) in
                // ...
                
            }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        error_label.isHidden = true
        email_text.delegate = self
        email_text.tag = 0 //Increment accordingly
        pass_text.delegate = self
        pass_text.tag = 0 //Increment accordingly

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func togle_click(_ sender: Any) {
        
    }
    

    //add just the bottom line to text fields to our view
    override func viewDidLayoutSubviews() {
        
        let lineColor = UIColor.white
        email_text.setBottomLine(borderColor: lineColor)
        pass_text.setBottomLine(borderColor: lineColor)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
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


