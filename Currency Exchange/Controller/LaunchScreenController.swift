//
//  ViewController.swift
//  Currency Exchange
//
//  Created by Adithyah Nair on 27/06/22.
//

import UIKit
import CLTypingLabel

class LaunchScreenController: UIViewController {

    @IBOutlet weak var appName: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appName.text = "Currency_Exchange"
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
            self.performSegue(withIdentifier: "LTC", sender: self)
        }
    
    }

}

