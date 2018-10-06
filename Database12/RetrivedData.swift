//
//  RetrivedData.swift
//  Database12
//
//  Created by SVECW-4 on 29/08/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
import UIKit


class RetrivedData: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var table1: UITableView!
    var ref: DatabaseReference!
    var count:Int = 0
    var regdArr:[String] = []
    var branchArr:[String] = []
    var phnumArr:[String] = []
    var nameArr:[String] = []
    var sArr:[String] = []
    var mNameArr:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        table1.dataSource  = self
        table1.delegate = self
        ref = Database.database().reference()
        
    }
    
    @IBOutlet weak var SearchField: UITextField!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(regdArr.count)
        return regdArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Array")
        let cell = table1.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as? CustomCellDetails
        
        
        print(regdArr)
        cell?.RegdL?.text = regdArr[indexPath.row]
        cell?.BranchL?.text = branchArr[indexPath.row]
        cell?.phnum = phnumArr[indexPath.row]
        if(phnumArr[indexPath.row] == "") {
            let btnImage = UIImage(named: "callRed.jpg")
            cell?.call2.setImage(btnImage, for: .normal)
        }
        if(phnumArr[indexPath.row] == "") {
            let btnImage = UIImage(named: "mess_red.png")
            cell?.msgBtn.setImage(btnImage, for: .normal)
        }
        //cell?.img =
        let imgName = regdArr[indexPath.row]+".jpg"
        let storage = Storage.storage().reference()
        let tempImageRef = storage.child(imgName)
        tempImageRef.getData(maxSize: 1*1000*1000) {
            (data,error) in
            if error == nil{
                
                cell?.img.image = UIImage(data:data!)
                print(data!)
            }
            else{
                print(error?.localizedDescription)
            }
        }
        return cell!
    }

    
    @IBAction func searchBtn(_ sender: Any) {
        regdArr.removeAll()
        branchArr.removeAll()
        phnumArr.removeAll()
        mNameArr.removeAll()
        sArr.removeAll()
        nameArr.removeAll()
        print("Button Clicked")
        var x = SearchField.text!

        ref.child("Login").queryOrdered(byChild: "RegdNo").queryStarting(atValue: x).queryEnding(atValue: x+"uf8ff").observeSingleEvent(of: DataEventType.value, with: { snapshot in
            var i:Int = 0
            print(snapshot)
            for rest in snapshot.children.allObjects as! [DataSnapshot] {
                print(i)
                let restDict = rest.value as? [String:Any]
                //print(restDict!)
                let branch = restDict?["Branch"] as? String
                let regd = restDict?["RegdNo"] as? String
                //let url1 = restDict?["ProfileUrl"] as? String
                let mobnum = restDict?["MobileNo"] as? String
                let name = restDict? ["StudentName"] as? String
                //let cgpa = restDict? ["CGPA"] as? String
                let dsh = restDict? ["FatherName"] as? String
                let mname = restDict? ["MotherName"] as? String
                print(regd!)
                print(branch!)
                //print(url1!)
                print(name!)
                //print(cgpa!)
                print("*")
                print(self.regdArr)
                self.regdArr.insert(regd!, at: i)
                self.branchArr.insert(branch!, at: i)
                //self.urlArr.insert(url1!, at: i)
                self.phnumArr.insert(mobnum!,at :i)
                self.nameArr.insert(name!,at :i)
                //self.cgpaArr.insert(cgpa!,at :i)
                self.sArr.insert(dsh!,at :i)
                self.mNameArr.insert(mname!, at: i)
                i = i + 1
                self.table1.reloadData()
                
            }
        })
        //print(regdArr)
        //self.table1.reloadData()
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didse")
        //img1 = regdArr[indexPath.row]+".jpg"
        //UserDefaults.standard.set(img1, forKey:"img")
        
        let name = nameArr[indexPath.row]
        //let cgpa = cgpaArr[indexPath.row]
        let br = branchArr[indexPath.row]
        let reg = regdArr[indexPath.row]
        let ph = phnumArr[indexPath.row]
        let dsh = sArr[indexPath.row]
        let mname = mNameArr[indexPath.row]
        UserDefaults.standard.set(name, forKey:"name")
        //UserDefaults.standard.set(cgpa, forKey:"cgpa")
        UserDefaults.standard.set(br, forKey:"br")
        UserDefaults.standard.set(reg, forKey:"reg")
        UserDefaults.standard.set(ph, forKey:"ph")
        UserDefaults.standard.set(dsh, forKey:"dsh")
        UserDefaults.standard.set(mname, forKey:"mname")
        print(name)
        // print(cgpa)
        //print("didselect"+urlArr[indexPath.row])
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let popOverVC = storyboard.instantiateViewController(withIdentifier: "sbPopUpID")
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
   
}
