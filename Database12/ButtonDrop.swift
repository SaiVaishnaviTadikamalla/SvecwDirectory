//
//  ButtonDrop.swift
//  Database12
//
//  Created by SVECW-4 on 09/09/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import UIKit

class ButtonDrop:
UIViewController {
    @IBOutlet var one: [UIButton]!
    @IBAction func clickBtn(_ sender: UIButton) {
        one.forEach { (button) in UIView.animate(withDuration: 0.3, animations: {
            button.isHidden = !button.isHidden
        })
        }
        
    }
    enum Citys: String {
        case boston = "1"
        case sanFranscisco = "2"
    }
    @IBAction func oneBtn(_ sender: UIButton) {
        guard let title = sender.currentTitle, let city = Citys(rawValue: title)
            
            else {
            return
        }
        let title1 = sender.currentTitle
        print(title1!)
        
        switch city {
        case .boston:
            print("Boston")
        default:
            print("San fran")
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
