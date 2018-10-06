//
//  Searchtable.swift
//  Database12
//
//  Created by SVECW-4 on 10/09/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

//
//  search.swift
//  Database12
//
//  Created by SVECW-4 on 10/09/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import UIKit
import FirebaseDatabase
import MessageUI

class Searchtable: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate,UITableViewDataSource ,UITableViewDelegate{
    var ref: DatabaseReference!
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var dropDown: UIPickerView!
    var count:Int = 0
    @IBOutlet weak var table1: UITableView!
    var regdArr:[String] = []
    var empty2:[String] = []
    var empty1:[String] = []
    var phone2:[Int64] = []
    var branchArr:[String] = []
    //var urlArr:[String] = []
    var phnumArr:[Int64] = []
    //var nameArr:[String] = []
    //var cgpaArr:[String] = []
    //var sArr:[String] = []
    var selectedBr:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        table1.dataSource  = self
        table1.delegate = self
        getData1()
        empty1 = branchArr
        empty2 = regdArr
        phone2 = phnumArr
        self.table1.reloadData()
    }
    var list = ["ALL","IT", "CSE", "ECE", "CE", "ME", "EEE"]
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.textBox.text = self.list[row]
        selectedBr = self.textBox.text!
        //print(self.textBox.text!)
        //print(selectedBr)
        self.searchBranch(selectedBr)
        self.dropDown.isHidden = true
    }
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.textBox {
            self.dropDown.isHidden = false
            //if you don't want the users to se the keyboard type:
            print(textField.text!)
            //getData1()
            //print(branchArr)
            textField.endEditing(true)
        }
    }
    func searchBranch(_ str : String) {
        empty1.removeAll()
        empty2.removeAll()
        phone2.removeAll()
        if(str == "ALL") {
            empty1 = branchArr
            empty2 = regdArr
            phone2 = phnumArr
        }
        else {
            for index in 0..<branchArr.count{
                if  branchArr[index] == str {
                    //print(branchArr[index]+" "+regdArr[index])
                    empty1.append(branchArr[index])
                    empty2.append(regdArr[index])
                    phone2.append(phnumArr[index])
                }
            }
        }
        //print(empty1)
        //print(empty2)
        //print(phone2)
        table1.reloadData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table1.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as? CustomCell2
        //print(regdArr)
        cell?.regdL?.text = empty2[indexPath.row]
        cell?.branchL?.text = empty1[indexPath.row]
        //print(phone2[indexPath.row])
        cell?.phnum = phone2[indexPath.row]
        return cell!
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(empty1)
        return empty1.count
    }
        
    func getData1(){
        ref.child("Faculty").observeSingleEvent(of: .value, with: { snapshot in
            var i:Int = 0
            self.count = Int(snapshot.childrenCount)
            //print(snapshot)
            //print(self.count)
            for rest in snapshot.children.allObjects as! [DataSnapshot] {
                //print(i)
                let restDict = rest.value as? [String:Any]
                //print(restDict!)
                
                let branch = restDict?["Branch"] as? String
                let regd = restDict?["Name"] as? String
                let mobnum = restDict?["phoneNum"] as? Int64
                //print(mobnum)
                self.regdArr.insert(regd!, at: i)
                self.empty2 = self.regdArr
                self.branchArr.insert(branch!, at: i)
                self.empty1 = self.branchArr
                self.phnumArr.insert(mobnum!,at :i)
                self.phone2 = self.phnumArr
                self.table1.reloadData()
                i = i + 1
            }
        })
    }

}
    
