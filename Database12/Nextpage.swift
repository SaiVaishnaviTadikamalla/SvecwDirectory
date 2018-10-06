//
//  Nextpage.swift
//  Database12
//
//  Created by SVECW-4 on 18/09/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import Foundation
import UIKit

class Nextpage: UIViewController {
    
    
    
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func nxtBtn(_ sender: Any) {
        performSegue(withIdentifier: "dir1", sender: nil)
    }
       override func viewDidLoad() {
        super.viewDidLoad()
    }
}
