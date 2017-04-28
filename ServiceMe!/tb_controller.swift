//
//  tb_controller.swift
//  ServiceMe!
//
//  Created by Evan on 4/14/17.
//  Copyright © 2017 George&Evan. All rights reserved.
//

import UIKit

class tb_controller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    enum serviceType {
        case FamilyTrue
        case FamilyFalse
        case KidsTrue
        case KidsFalse
        case ThrillTrue
        case ThrillFalse
        case ScaryTrue
        case ScaryFalse
        case RelaxingTrue
        case RelaxingFalse
    }
    struct service {
        let question: String
        var val: Bool
    }
    var list = ["one","two","three","four","five"]
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       print(1)
        return(list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        print(2)
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
        if let city = prefs.string(forKey: "q_tb"){
            
            let arrayofstring = city.characters.map { (Character) -> Character in
                return Character
            }
            let responses = options(values: arrayofstring)
            
            
            list = responses
            

        }else{
            //Nothing stored in NSUserDefaults yet. Set a value.
            prefs.setValue("Berlin", forKey: "q_tb")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func options(values:Array<Character>) -> Array<String> {
        var numbers: Array <serviceType> = []
        var responses: Array<String> = []
        let serviceTypeOptions = [serviceType.FamilyTrue,serviceType.FamilyFalse,serviceType.KidsTrue,serviceType.KidsFalse,serviceType.ThrillTrue,serviceType.ThrillFalse,serviceType.ScaryTrue,serviceType.ScaryFalse,serviceType.RelaxingTrue,serviceType.RelaxingFalse]
        for i in 0...4 {
            var x = serviceTypeOptions[(i*2)]
            if (Int(String(values[i]))!) == 1 {
                x = serviceTypeOptions[i]
            }
            else {
                x = serviceTypeOptions[(i*2)+1]
            }
            numbers.append(x)
        }
        
        for i in 0...4 {
            switch numbers[i] {
            case .FamilyTrue:
                responses.append("Familys")
            case .FamilyFalse:
                responses.append("not Familys")
            case .KidsTrue:
                responses.append("Kids")
            case .KidsFalse:
                responses.append("not Kids")
            case .ThrillTrue:
                responses.append("Thrills")
            case .ThrillFalse:
                responses.append("not Thrills")
            case .ScaryTrue:
                responses.append("Scary")
            case .ScaryFalse:
                responses.append("not scary")
            case .RelaxingTrue:
                responses.append("relaxing")
            case .RelaxingFalse:
                responses.append("not relaxing")

            }
        }
        /*
        if numbers[0] == 1 {
            responses.append("knights")
        } else {
            responses.append("not knights")
        }
        
        if numbers[1] == 1 {
            responses.append("knights")
        } else {
            responses.append("not knights")
        }
        if numbers[2] == 1 {
            responses.append("knights")
        } else {
            responses.append("not knights")
        }
        if numbers[3] == 1 {
            responses.append("knights")
        } else {
            responses.append("not knights")
        }
        if numbers[4] == 1 {
            responses.append("knights")
        } else {
            responses.append("not knights")
        }
       */
        return responses
    }
    
    
}

