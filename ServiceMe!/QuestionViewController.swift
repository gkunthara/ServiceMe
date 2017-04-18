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
    var questions: Array = ["Do you enjoy working with homeless people?", "Do you enjoy working with elderly people?", "Do you enjoy working with hooker people?", "Do you enjoy working with kids?", "Do you enjoy working with mentally ill people?"]
    var answers: Array = [0,0,0,0,0];
    @IBAction func startOverButton(_ sender: Any)
    {
        //does the segue from the questionaire to the start page
        performSegue(withIdentifier: "startOverSegue", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.message_label.text = questions[count]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func yes_button(_ sender: Any) {
        self.count  = count + 1
        
        guard count > 4  else {
            self.message_label.text = questions[count]
            self.answers.append(1)
            return
        }
        
        guard count <= 4 else {
            self.performSegue(withIdentifier: "table_transition", sender: self)
            return
        }
    }
    @IBAction func no_button(_ sender: Any) {
        self.count  = count + 1
        
        guard count > 4  else {
            self.message_label.text = questions[count]
            self.answers.append(0)
            return
        }
        
        guard count <= 4 else {
            self.performSegue(withIdentifier: "table_transition", sender: self)
            return
        }
        
        
      
        
    }
    
    
   
    

    
}
