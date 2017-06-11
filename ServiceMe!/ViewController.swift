//
//  ViewController.swift
//  ServiceMe!
//
//  Created by George Kunthara & Evan Arends on 4/6/17.
//  Copyright © 2017 George&Evan. All rights reserved.
//

import UIKit
import FirebaseAuth
import NotificationBannerSwift

class ViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var pass_field: UITextField!
    @IBOutlet weak var pass_label: UILabel!
    @IBOutlet weak var email_field: UITextField!
    @IBOutlet weak var email_label: UILabel!
    
    @IBAction func signup_click(_ sender: Any) {
        
        self.performSegue(withIdentifier: "sign_to_login", sender: nil)
        
    }
    
    
    @IBAction func login_click(_ sender: Any) {
        Auth.auth().signIn(withEmail: email_field.text!, password: pass_field.text!) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "homeToQuestionSegue", sender: nil)
            } else {
                let banner = NotificationBanner(title: "Incorrect Username or Password!", subtitle: "Please Try Again", style: .danger)
                banner.show()
            }
        }
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        
        pass_field.resignFirstResponder()
        return true;
    }
    
        
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.email_field.setBottomLine(borderColor: UIColor.white)
        self.pass_field.setBottomLine(borderColor: UIColor.white)
        
        pass_field.delegate = self

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





