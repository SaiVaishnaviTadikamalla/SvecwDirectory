//
//  Directory.swift
//  Database12
//
//  Created by SVECW-4 on 17/09/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import UIKit
class Directory: UIViewController {
    
    @IBAction func facultyDir(_ sender: Any) {
        performSegue(withIdentifier: "dir2", sender: nil)
    }
    @IBAction func studentDir(_ sender: Any) {
        performSegue(withIdentifier: "dir3", sender: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
