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
    var count: Int = 0 // counts what question the user is on
    var questions: Array = ["Do you enjoy working with the elderly?","Do you like to work with smokers?","How about drinkers?","What about murderers?","Do you like kids?"] // list of questions
    var answers: Array <String> = []; // array to store answers 1s and 0s
    
    
    
    
    @IBAction func startOverButton(_ sender: Any)
    {
        //does the segue from the questionaire to the start page
        performSegue(withIdentifier: "startOverSegue", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
            self.message_label.text = questions[count]
            self.answers.append("1")
            self.count  = count + 1
            return
        }
        // if you have no more questions to ask the user send responses to tb_controller
        guard count <= 4 else {
            
            let prefs = UserDefaults.standard // set up datatransfer
            let value = answers[0] + answers[1] + answers[2] + answers[3] + answers[4] // value to be sent
            prefs.setValue(value, forKey: "q_tb") // key associated with value
            self.performSegue(withIdentifier: "table_transition", sender: Int()) // head to tb_controller
            return
        }
        
    }
    
    @IBAction func no_button(_ sender: Any)
    {
        
        //same as above for yes button 
        guard count > 4  else {
            self.message_label.text = questions[count]
            self.answers.append("0")
            self.count  = count + 1
            return
        }
        //same as above for yes button
        guard count <= 4 else {
            let prefs = UserDefaults.standard
            let value = answers[0] + answers[1] + answers[2] + answers[3] + answers[4]
            prefs.setValue(value, forKey: "q_tb")
            self.performSegue(withIdentifier: "table_transition", sender: Int())
            return
        }
        

    }
    
    
    
    

    

    
}
