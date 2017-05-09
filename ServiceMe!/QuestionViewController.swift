//
//  QuestionViewController.swift
//  ServiceMe!
//
//  Created by George Kunthara on 4/6/17.
//  Copyright © 2017 George&Evan. All rights reserved.
//

import UIKit
class QuestionViewController: UIViewController {

    @IBOutlet weak var message_label: UILabel!
    var count: Int = 0
    var questions: Array = ["Do you enjoy working with homeless people?","Do you enjoy working with the elderly?","How about working for Catholic Charities?","How about working with kids?","Would you like to work with the sick?", "What about working for the underprivileged?"]
    var answers: Array <String> = [];
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        message_label.text = questions[0]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yes_button(_ sender: Any)
    {
        // if you have more questions to ask the user
        guard count > 4  else {
            self.count  = count + 1
            self.message_label.text = questions[count]
            self.answers.append("1")
            return
        }
        // if you have no more questions to ask the user send responses to tb_controller
        guard count <= 4 else {
            let prefs = UserDefaults.standard
            self.answers.append("1")
            let value = answers[0] + answers[1] + answers[2] + answers[3] + answers[4] + answers[5]
            prefs.setValue(value, forKey: "q_tb")
            self.performSegue(withIdentifier: "table_transition", sender: Int())
            return
        }
        
    }
    
    @IBAction func no_button(_ sender: Any)
    {
        
        
        guard count > 4 else {
            self.count  = count + 1
            self.message_label.text = questions[count]
            self.answers.append("0")
            return
        }
        //same as above for yes button
        guard count <= 4 else {
            let prefs = UserDefaults.standard
            self.answers.append("0")
            let value = answers[0] + answers[1] + answers[2] + answers[3] + answers[4] + answers[5]
            prefs.setValue(value, forKey: "q_tb")
            self.performSegue(withIdentifier: "table_transition", sender: Int())
            return
        }
        

    }
    
    
    
    

    

    
}
