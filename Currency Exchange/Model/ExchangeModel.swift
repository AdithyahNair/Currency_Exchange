//
//  ExchangeModel.swift
//  Currency Exchange
//
//  Created by Adithyah Nair on 27/06/22.
//

import Foundation

struct ExchangeModel: Codable {
    
    let conversion_rates: Conversion
    
}

struct Conversion: Codable {
    
    let USD: Double
    
}
