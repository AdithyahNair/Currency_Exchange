//
//  CurrencyTableViewController.swift
//  Currency Exchange
//
//  Created by Adithyah Nair on 27/06/22.
//

import UIKit
import CoreData

class CurrencyTableViewController: UITableViewController {
    
    var currenciesArray = [Currency]()
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let request: NSFetchRequest<Currency> = Currency.fetchRequest()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        loadCurrencies()
        
        tableView.rowHeight = 80
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        currenciesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Currency", for: indexPath)

        cell.textLabel!.text = currenciesArray[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "CTE", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CTE" {
            let destinationVC = segue.destination as! ExchangeViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
    
                destinationVC.currencyValue = currenciesArray[indexPath.row].name!
            }
        }
    }
    
    func saveCurrencies() {
        
        do {
            
            try context.save()
            
        } catch {
            
            print("Error saving currencies. Error: \(error)")
            
        }
        
        tableView.reloadData()
        
    }
    
    func loadCurrencies() {
        
        do {
            
            currenciesArray = try context.fetch(request)
            
        } catch {
            
            print("Error fetching currencies. Error: \(error)")
            
        }
        
        tableView.reloadData()
        
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Currency", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (alertTextField) in
            
            textField = alertTextField
            
            textField.placeholder = "Add a currency"
            
        }
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            if let safeText = textField.text {
                
                let newCurrency = Currency(context: self.context)
                
                newCurrency.name = safeText

                self.currenciesArray.append(newCurrency)
                
                self.saveCurrencies()
                
            }
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}
