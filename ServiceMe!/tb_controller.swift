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
    
    //information for next view controller
    let unionGospel = ["Phone: (509) 535-8510","Address: 1224 E. Trent Ave. Spokane, WA 99202", "Volunteers make a huge difference within the ministries of the Union Gospel Mission. They served thousands of meals, mended clothes, provided medical and legal care, baked birthday cakes, led worship, and added to our services in countless other ways. Most significantly, they demonstrated hearts of love and compassion for people who often feel unloved, unnoticed, unworthy."]
    let retirementCenter = ["Phone: (509) 483-6483", "Address: 1801 E. Upriver Dr. Spokane, Wa 99207", "We love volunteers! Riverview welcomes your time and talents. Are you interested in reading to residents? Assisting on outings? Helping with special events? Do you have a special talent you'd like to share? We treasure all of our volunteers and the contribution they make to the quality of life for our community members is invaluable!"]
    let catholicCharities = ["Phone: (509) 358-4250","Address: 12 E. 5th Ave. Spokane, WA 99202", "While we are Catholic in name and in values, we serve all persons in need; our caring and assistance extends throughout the 13 counties of Eastern Washington. Catholic Charities administers programs in the 13 counties of Eastern Washington which provide food, shelter, clothing, education, counseling and support to those in need, regardless of creed."]
    let transitionKids = ["Phone: (509) 328-6702","Address: 3128 N Hemlock St. Spokane, WA 99205", "EduCare is an onsite licensed day care for the children that reside or are alumnae of the Transitional Living Center. Childcare consists of a nurturing environment for toddlers, a preschool program, an after school/ summer program for school aged children and a USDA funded food program for the children in our care. It allows the parents to pursue work, school or other needed services while living at the Transitional Living Center."]
    let providenceHospital = ["Phone: (509) 474-3131","Address: 101 W 8th Ave. Spokane, WA 99204", "For a few hours a week, you can be part of a world-class team at Providence Sacred Heart Medical Center & Children’s Hospital through its volunteer program.This is a place where medical miracles happen every day and where leading-edge research is translated into extraordinary care for patients and their families. It’s a place where you can make a difference through your acts of kindness, making life better for you and for those you help!"]
    let artisansSpokane = ["Phone: (509) 325-4489","Address: 200 E 2nd Ave. Spokane, WA 99202", "Artisans has been a proud partner of the Spokane Community since 1987.  Artisans provides employment and community access services for persons with intellectual and physical disabilities. Although the focus of our employment offerings have changed to community based employment, the creativity in our employment development and support efforts harnessed by the direction of the agency and its staff members keeps the name applicable to our mission."]
    
    
    
    
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
            vc.selectedTitle = list[indexPath.row]
            if vc.selectedTitle == "Union Gospel Mission"
            {
                vc.selectedNumber = unionGospel[0]
                vc.selectedAddress = unionGospel[1]
                vc.selectedDescription = unionGospel[2]
                
            }
            if vc.selectedTitle == "Riverview Retirement Center"
            {
                vc.selectedNumber = retirementCenter[0]
                vc.selectedAddress = retirementCenter[1]
                vc.selectedDescription = retirementCenter[2]
                
            }
            if vc.selectedTitle == "Catholic Charities Spokane"
            {
                vc.selectedNumber = catholicCharities[0]
                vc.selectedAddress = catholicCharities[1]
                vc.selectedDescription = catholicCharities[2]
                
            }
            if vc.selectedTitle == "Transitions"
            {
                vc.selectedNumber = transitionKids[0]
                vc.selectedAddress = transitionKids[1]
                vc.selectedDescription = transitionKids[2]
                
            }
            if vc.selectedTitle == "Providence Sacred Heart Hospital"
            {
                vc.selectedNumber = providenceHospital[0]
                vc.selectedAddress = providenceHospital[1]
                vc.selectedDescription = providenceHospital[2]
                
            }
            if vc.selectedTitle == "Artisans of Spokane"
            {
                vc.selectedNumber = artisansSpokane[0]
                vc.selectedAddress = artisansSpokane[1]
                vc.selectedDescription = artisansSpokane[2]
                
            }

            
            navigationController?.pushViewController(vc, animated: true)
            
            
        }
      

        
    }
    
    func alphabetically(s1: String, s2: String) -> Bool
    {
        return s1 < s2
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.isNavigationBarHidden = true //hide nav bar when loading view controller
        let prefs = UserDefaults.standard
        if let answers = prefs.string(forKey: "q_tb")
        {
            
            let charArr = Array(answers.characters)
            let responses = options(values: charArr)
            

            list = responses
            //list.sort{$0 < $1} //closure which sorts list alphabetically
            //list.sort(by: alphabetically(s1:s2:))
            list = list.sorted(by: { (s1: String, s2: String) -> Bool in return s1 < s2 } )
            

        }
        else
        {
            //Nothing stored in NSUserDefaults yet. Set a value.
            prefs.setValue("", forKey: "q_tb")
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated) //show nav bar again navigating to next view controller
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
                responses.append("Union Gospel Mission")
            case .ElderlyTrue:
                responses.append("Riverview Retirement Center")
            case .CharityTrue:
                responses.append("Catholic Charities Spokane")
            case .KidsTrue:
                responses.append("Transitions")
            case .SickTrue:
                responses.append("Providence Sacred Heart Hospital")
            case .PrivilegeTrue:
                responses.append("Artisans of Spokane")
            default:
                continue

            }
        }
            return responses
    }
    
    
}

