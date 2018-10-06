//
//  PopUpViewController.swift
//  Database12
//
//  Created by SVECW-4 on 06/09/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import UIKit
import FirebaseStorage

class PopUpViewContoller:UIViewController   {
    
   // @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var regd: UILabel!
    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var phL: UILabel!
    //@IBOutlet weak var cgpaL: UILabel!
    @IBOutlet weak var branchL: UILabel!
    @IBOutlet weak var dshL: UILabel!
    
    var refRet:RetrivedData!
    var imgName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image:String = (UserDefaults.standard.value(forKey:"img") as? String) {
            //print("qwer"+image+"1234")
            //imgName = image+".jpg"
        }
        if let name:String = (UserDefaults.standard.value(forKey:"name") as? String) {
            //print("Name:"+name)
            nameL.text = name
        }
        if let regdnum:String = (UserDefaults.standard.value(forKey:"reg") as? String) {
            //print("Regd:"+regdnum)
            regd.text = regdnum
            imgName = regdnum+".jpg"
        }
        if let branch:String = (UserDefaults.standard.value(forKey:"br") as? String) {
            //print("Branch:"+branch)
            branchL.text = branch
        }
        if let dsh:String = (UserDefaults.standard.value(forKey:"dsh") as? String) {
            //print("Branch:"+branch)
            phL.text = dsh
        }
        if let mName:String = (UserDefaults.standard.value(forKey:"mname") as? String) {
            //print("Branch:"+branch)
            dshL.text = mName
        }

        

        //self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        let storage = Storage.storage().reference()
        let tempImageRef = storage.child(imgName)
        tempImageRef.getData(maxSize: 1*1000*1000) {
            (data,error) in
            if error == nil{
                self.photo.image = UIImage(named : "img1.png")
                self.photo.layer.borderWidth = 1
                self.photo.layer.masksToBounds = false
                self.photo.layer.borderColor = UIColor.white.cgColor
                self.photo.layer.cornerRadius = self.photo.frame.height/2
                self.photo.clipsToBounds = true
                self.photo.image = UIImage(data:data!)
                print(data!)
            }
            else{
                print(error?.localizedDescription)
            }
        }
        print("helllo in did load")
                self.showAnimate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
   /* func printImage(_ t:String){
        imgName = t
        print("print Image")
    }*/
    
    @IBAction func closePopUp(_ sender: Any) {
        self.removeAnimate()
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.35, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
}
