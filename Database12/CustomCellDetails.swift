//
//  CustomCellDetails.swift
//  Database12
//
//  Created by SVECW-4 on 30/08/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import UIKit
import Firebase
import MessageUI

class CustomCellDetails: UITableViewCell,MFMessageComposeViewControllerDelegate{
    
    
    @IBOutlet weak var RegdL: UILabel!
    @IBOutlet weak var BranchL: UILabel!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img: UIImageView!
    
    
    var phnum:String!
    //var imgName:String!
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func callingBtn(_ sender: UIButton) {
        sender.setTitle(phnum, for: .normal)
        if(phnum != "") {
        guard let num = sender.titleLabel?.text , let url = URL(string : "tel://\(num)") else {
            return
        }
        print(url)
        UIApplication.shared.open(url)
        print(sender.titleLabel?.text!)
        }
    }
    @IBOutlet weak var call2: UIButton!
    
    
    @IBAction func messageBtn(_ sender: Any) {
        if(phnum != ""){
        let number = "sms:"+phnum
        
        UIApplication.shared.openURL(NSURL(string: number)! as URL)
        }
    }
    
    @IBOutlet weak var msgBtn: UIButton!
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        // Check the result or perform other tasks.
        
        // Dismiss the message compose view controller.
       // controller.dismiss(animated: true, completion: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
