//
//  Page2.swift
//  Database12
//
//  Created by SVECW-4 on 28/08/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import MessageUI

class Page2: UIViewController,MFMessageComposeViewControllerDelegate,UISearchBarDelegate {
    
    var ref:DatabaseReference!
    var t:Int = 0

    var regdArr:[String] = ["apple","ass","ball","cat"]
    @IBOutlet weak var text1: UITextField!
    
    @IBOutlet weak var search1: UISearchBar!
    /*@IBAction func login(_ sender: Any) {
        let text: String = text1.text!
       ref.child("Login/username").setValue(text)
    }*/
    
    
    @IBAction func call1(_ sender: UIButton) {
        guard let num = sender.titleLabel?.text , let url = URL(string : "tel://\(num)") else {
            return
        }
        print(url)
        let phnum = "8008402854"
        sender.setTitle(phnum, for: .normal)
        print(sender.titleLabel?.text!)
        UIApplication.shared.open(url)
    }
    
    @IBAction func message1(_ sender: Any) {
        if MFMessageComposeViewController.canSendText() {
            let cont = MFMessageComposeViewController()
            cont.body = "Message Body.."
            let mobnum = "8008402854"
            cont.recipients = [mobnum]
            cont.messageComposeDelegate = self
            self.present(cont, animated: true, completion: nil)
            
        }
        else {
            print("waesdrftgyuhijokres")
        }
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        //retrieveData()
    }
    
    
    func retrieveData(){
        ref.child("Login").observeSingleEvent(of: .value, with: { snapshot in
            
            if !snapshot.exists() { return }
            
            print(snapshot)
            
             let name = snapshot.childSnapshot(forPath: "username").value as! String
            print(name)
        })
    }
}
