//
//  ViewController.swift
//  Database12
//
//  Created by SVECW-4 on 28/08/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import UIKit
//import PopUpViewController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


        
    @IBAction func showPopUp(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let popOverVC = storyboard.instantiateViewController(withIdentifier: "sbPopUpID")
        //self.present(popOverVC, animated: true, completion: nil)
        
        //let popOverVC1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
        
        
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
    }
}

