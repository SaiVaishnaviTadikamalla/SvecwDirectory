//
//  Login.swift
//  Database12
//
//  Created by SVECW-4 on 17/09/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import UIKit
import FirebaseAuth

class Login: UIViewController {
    
    @IBOutlet weak var unameL: UITextField!
    
    @IBOutlet weak var pswdL: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let color = UIColor(red:0.34,green:0.80,blue:0.95,alpha:1.0)
        view.backgroundColor = color
        
        
        /*if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.email!)
            self.performSegue(withIdentifier: "dir0", sender: nil)
            print("User Exists")
            
        }
                else {
            print("No active User")
        }*/
        print("View Did Load")
        //self.performSegue(withIdentifier: "dir0", sender: nil)
        
    }
    
    @IBAction func submit(_ sender: Any) {
        if unameL.text != "" && pswdL.text != "" {
            Auth.auth().createUser(withEmail: unameL.text!, password: pswdL.text!, completion: {
                (result,error) in
                if error == nil{
                    print("User created")
                    self.performSegue(withIdentifier: "dir0", sender: nil)
                    //self.suc.text =   (result?.user.email)! + "User account created"
                }
                else{
                    print("Error")
                    //self.suc.text = "Error"
                }
            })
        }
        else{
            print("Enter details")
            //suc.text = "Enter ur details"
        }
        unameL.resignFirstResponder()
        //performSegue(withIdentifier: "dir0", sender: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        unameL.becomeFirstResponder()
        
    }
    
    
}
