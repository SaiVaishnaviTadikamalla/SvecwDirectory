//
//  DisplayPage.swift
//  Database12
//
//  Created by SVECW-4 on 04/09/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
class DisplayPage: UIViewController,UITextFieldDelegate,UISearchBarDelegate {
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var regd: UILabel!
    @IBOutlet weak var branch: UILabel!
    var ref: DatabaseReference!
    
    @IBOutlet weak var SearchBtn: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchBtn.delegate = self
        print("wasedrftgyhu")
        
        photo.image = UIImage(named : "images-2.png")
        
        ref = Database.database().reference()
        let storage = Storage.storage().reference()
        let tempImageRef = storage.child("16B01A1272.jpg")
        tempImageRef.getData(maxSize: 1*1000*1000) {
            (data,error) in
            if error == nil{
                self.photo.image = UIImage(data:data!)
                print(data!)
            }
            else{
                print(error?.localizedDescription)
            }
            
        }
    }
    /*func textFieldDidEndEditing(_ textField: UITextField) {
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let x = SearchBtn.text!
        print(x)
        ref.child("Login").observeSingleEvent(of: .value, with: { snapshot in
            
            if !snapshot.exists() { return }
            
            print(snapshot)
            let branch1 = snapshot.childSnapshot(forPath: x).childSnapshot(forPath: "Branch").value as! String
            self.branch.text = branch1
            
            let regd1 = snapshot.childSnapshot(forPath: x).childSnapshot(forPath: "Regd").value as! String
            self.regd.text = regd1
            let proUrl = snapshot.childSnapshot(forPath: x).childSnapshot(forPath: "ProfileUrl").value as! String
            //let mobnum = snapshot.childSnapshot(forPath: x).childSnapshot(forPath: "mobile").value as! String
            
            print("Details:")
            print(branch1)
            print(regd1)
 
            let storage = Storage.storage().reference()
            let tempImageRef = storage.child("16B01A1272.jpg")
            tempImageRef.getData(maxSize: 1*1000*1000) {
                (data,error) in
                if error == nil{
                    self.photo.image = UIImage(data:data!)
                    print(data!)
                }
                else{
                    print(error?.localizedDescription)
                }
                
            }
            
            //print(proUrl)
            //print(mobnum)
            
        })
        SearchBtn.resignFirstResponder()
        return true
    }*/

}
