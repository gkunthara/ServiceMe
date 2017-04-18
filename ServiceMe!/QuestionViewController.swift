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
    var questions: Array = ["Do you enjoy working with the elderly?","Do you like to work with smokers?","How about drinkers?","What about murderers?","Do you like kids?"]
    
    
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
    
    @IBAction func yes_button(_ sender: UIButton)
    {
        print(count)
        if count > 4
        {
            self.performSegue(withIdentifier: "table_transition", sender: self)
        }
        else
        {
            self.message_label.text = questions[count]
            //self.answers.append(1)
            return
        }
        
        guard count <= 4 else {
            self.performSegue(withIdentifier: "table_transition", sender: self)
            return
        }

    }
    
    @IBAction func no_button(_ sender: Any)
    {
        print(count)
        if count > 4
        {
            self.performSegue(withIdentifier: "table_transition", sender: self)
        }
        else
        {
            self.message_label.text = questions[count]
            //self.answers.append(0)
            return
        }

    }

    

    
}
