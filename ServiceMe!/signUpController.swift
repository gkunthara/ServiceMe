//
//  signUpController.swift
//  ServiceMe!
//
//  Created by Evan on 6/1/17.
//  Copyright © 2017 George&Evan. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseStorage
import FirebaseDatabase
import NotificationBannerSwift


class signUpController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var fileP: String?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var c_pass_field: UITextField!
    @IBOutlet weak var pass_field: UITextField!
    @IBOutlet weak var email_field: UITextField!
    @IBOutlet weak var name_field: UITextField!
    
    let picker = UIImagePickerController()
    
    var userStorage: StorageReference!
   
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.email_field.setBottomLine(borderColor: UIColor.white)
        self.pass_field.setBottomLine(borderColor: UIColor.white)
        self.c_pass_field.setBottomLine(borderColor: UIColor.white)
        self.name_field.setBottomLine(borderColor: UIColor.white)


        
        
        picker.delegate = self
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func add_pic_click(_ sender: Any) {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
    }
        
    @IBAction func signup_click(_ sender: Any) {
        Auth.auth().createUser(withEmail: email_field.text!, password: pass_field.text!) { (user, error) in
            if user != nil {
                //***********************
                // Get a reference to the storage service using the default Firebase App
                let storage = Storage.storage()
                
                // Create a storage reference from our storage service
                let storageRef = storage.reference()
                var data = NSData()
                data = UIImageJPEGRepresentation(self.imageView.image!, 0.8)! as NSData
                // set upload path
                let filePath = "\(Auth.auth().currentUser!.uid)/\("userPhoto")"
                self.fileP = "Im6lflyE5ChniPlJtYXxJqB4sQi2/userPhoto"
                let metaData = StorageMetadata()
                metaData.contentType = "image/jpg"
                storageRef.child(filePath).putData(data as Data, metadata: metaData){(metaData,error) in
                    
                    
                }
                //***********************
                
                
                self.performSegue(withIdentifier: "sign_to_login", sender: nil)
            } else {
                let banner = NotificationBanner(title: "Email is already in use!", subtitle: "Please Try Again", style: .danger)
                banner.show()
            }
        }

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            
            self.imageView.image = image
            self.imageView.contentMode = .scaleAspectFit
            
        }
        self.dismiss(animated: true, completion: nil)
    }
    
   

}


