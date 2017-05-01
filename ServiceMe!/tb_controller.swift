//
//  tb_controller.swift
//  ServiceMe!
//
//  Created by Evan on 4/14/17.
//  Copyright © 2017 George&Evan. All rights reserved.
//

import UIKit

class tb_controller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    enum serviceType
    {
        case HomelessTrue
        case HomelessFalse
        case ElderlyTrue
        case ElderlyFalse
        case CharityTrue
        case CharityFalse
        case KidsTrue
        case KidsFalse
        case SickTrue
        case SickFalse
        case PrivilegeTrue
        case PrivilegeFalse
    }
    var list = ["one","two","three","four","five"]
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return(list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            let prefs = UserDefaults.standard
            let value = "hello its me"
            prefs.setValue(value, forKey: "detail")
            navigationController?.pushViewController(vc, animated: true)
            
        }
      

        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let prefs = UserDefaults.standard
        if let answers = prefs.string(forKey: "q_tb")
        {
            
            let charArr = Array(answers.characters)
            let responses = options(values: charArr)
            

            list = responses
            

        }
        else
        {
            //Nothing stored in NSUserDefaults yet. Set a value.
            prefs.setValue("", forKey: "q_tb")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func options(values:Array<Character>) -> Array<String>
    {
        var numbers: Array <serviceType> = []
        var responses: Array<String> = []
        let serviceTypeOptions = [serviceType.HomelessTrue,.HomelessFalse,.ElderlyTrue,.ElderlyFalse,.CharityTrue,.CharityFalse,.KidsTrue,.KidsFalse,.SickTrue,.SickFalse, .PrivilegeTrue, .PrivilegeFalse]
        
        for i in 0...5
        {
            var x = serviceTypeOptions[(i*2)]
            if (Int(String(values[i]))!) == 1
            {
                x = serviceTypeOptions[i*2]
            }
            else
            {
                x = serviceTypeOptions[(i*2)+1]
            }
            numbers.append(x)
            
        }
        
        for i in 0...5
        {
            switch numbers[i]
            {
            case .HomelessTrue:
                responses.append("Homeless")
            case .ElderlyTrue:
                responses.append("Elderly")
            case .CharityTrue:
                responses.append("Charity")
            case .KidsTrue:
                responses.append("Kids")
            case .SickTrue:
                responses.append("Sick")
            case .PrivilegeTrue:
                responses.append("Underprivileged")
            default:
                print("nope")

            }
        }
            return responses
    }
    
    
}

