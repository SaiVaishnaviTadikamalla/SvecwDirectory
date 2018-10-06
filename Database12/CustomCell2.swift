//
//  CustomCell2.swift
//  Database12
//
//  Created by SVECW-4 on 15/09/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import MessageUI

class CustomCell2: UITableViewCell , MFMessageComposeViewControllerDelegate  {
    @IBOutlet weak var regdL: UILabel!
    
    @IBOutlet weak var branchL: UILabel!
    var phnum:Int64!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func callingBtn(_ sender: UIButton) {
        let ph = String(phnum)
        sender.setTitle(ph, for: .normal)
        guard let num = sender.titleLabel?.text , let url = URL(string : "tel://\(num)") else {
            return
        }
        print(url)
        UIApplication.shared.open(url)
        print(sender.titleLabel?.text!)
    }
    
    
    @IBAction func messageBtn(_ sender: UIButton) {
        //UIApplication.shared.open(URL(string: "sms:")!, options: [:], completionHandler: nil)
        let ph = String(phnum)
        let number = "sms:"+ph
        
        UIApplication.shared.openURL(NSURL(string: number)! as URL)
        
        
        /*let cont = MFMessageComposeViewController()
        cont.messageComposeDelegate = self
        cont.body = "Message Body.."
        let mobnum = "8008402854"
        cont.recipients = [mobnum]
        if !MFMessageComposeViewController.canSendText() {
            print("Can't send Message")
        }
        else {
            cont.messageComposeDelegate = self
            print("Message")
            
            cont.present(cont, animated: true, completion: nil)
            
        }
        print("If condition")
         let msgVC = MFMessageComposeViewController()
        msgVC.messageComposeDelegate = self
        
        msgVC.recipients = ["555555"]
        
        msgVC.present(msgVC, animated: true, completion: nil)*/
    }
    
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        // Check the result or perform other tasks.
        
        // Dismiss the message compose view controller.
         controller.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
