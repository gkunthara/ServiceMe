//
//  QuestionViewController.swift
//  ServiceMe!
//
//  Created by George Kunthara on 4/6/17.
//  Copyright © 2017 George&Evan. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var message_label: UITextView!
    var count: Int = 0
    var questions: Array = ["elderly","smokers","drinkers","killers","delinquents"]
    @IBAction func startOverButton(_ sender: Any)
    {
        //does the segue from the questionaire to the start page
        performSegue(withIdentifier: "startOverSegue", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func yes_button(_ sender: Any) {
        if count > 4 {
            self.performSegue(withIdentifier: "table_transition", sender: self)
        } else {
            self.message_label.text = questions[count]
            self.count  = count + 1
        }
    }
    @IBAction func no_button(_ sender: Any) {
        if count > 4 {
            self.performSegue(withIdentifier: "table_transition", sender: self)
        } else {
            self.message_label.text = questions[count]
            self.count  = count + 1
        }
    }
   
   
    

    
}
