//
//  ExchangeModel.swift
//  Currency Exchange
//
//  Created by Adithyah Nair on 27/06/22.
//

import Foundation


struct ExchangeManager {
    
    
    
    func fetchExchangeRate(currency: String) {
                
        let urlString = "https://v6.exchangerate-api.com/v6/12e51b0158da43bf85f97380/latest/\(currency)"
        
        performNetworking(urlString)
    }
        
    
    
    //MARK: - performNetworking()
    
    func performNetworking(_ urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let urlSession = URLSession(configuration: .default)
            
            let task = urlSession.dataTask(with: url) { data, response, error in
                
                if let safeData = data {
                    
                    if let newValue = self.parseJSON(safeData) {

                    }
       
                } else {
                    
                    if let safeError = error {
                        
                        print("Error parsing data. Error: \(safeError)")
                        
                        
                    }
                    
                }
                
            }
            
            task.resume()
            
        }
 
        
    }
    
    //MARK: - parseJSON()
    
    func parseJSON(_ safeData: Data) -> Double? {
        
        let decoder = JSONDecoder()
        
        
        do {
            
            let decodedData = try decoder.decode(ExchangeModel.self, from: safeData)
            
            let usdValue = decodedData.conversion_rates.USD
            
            print("USD value: \(usdValue)")
            
            return usdValue

        } catch {
            
            print("Error decoding data. Error:\(error)")
            
            return nil
            
            
        }
        
    }
    
    
}
