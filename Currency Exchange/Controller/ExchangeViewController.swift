//
//  ExchangeTableViewController.swift
//  Currency Exchange
//
//  Created by Adithyah Nair on 27/06/22.
//

import UIKit
import CoreData

class ExchangeViewController: UIViewController {
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    let exchangeRateModel = ExchangeManager()

    var currencyValue = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyLabel.text = currencyValue
        
        exchangeRateModel.fetchExchangeRate(currency: currencyValue)
  
        
    }



}

