//
//  ProfileViewController.swift
//  ServiceMe!
//
//  Created by Evan on 6/7/17.
//  Copyright © 2017 George&Evan. All rights reserved.
//

import UIKit
import FirebaseStorageUI
import FirebaseStorage
import FirebaseAuth

class ProfileViewController: UIViewController {
    var storage: Storage!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        /*
        let storage = Storage.storage().reference()
        let tempImageRef = storage.child("dkk3ZoR43PeUAGWnQL7ZOD43qZs2/userPhoto.jpg")
        tempImageRef.getData(maxSize: 1*1000*1000) { (data,error) in
            if error == nil {
                self.imageView.image = UIImage(data:data!)
            } else {
                print(error?.localizedDescription ?? "error")
            }
        }
        */
         let storage = Storage.storage().reference(forURL: "gs://sparespace-3be0f.appspot.com/\(Auth.auth().currentUser!.uid)/\("userPhoto")")
        
        storage.getData(maxSize: 11 * 1024 * 1024, completion: {
            (data, error) in
            if let error = error{
                print("Error -: \(error.localizedDescription)")
            }
            else{
                let image = UIImage(data: data!)
                self.imageView.image = image
            }
        })
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
