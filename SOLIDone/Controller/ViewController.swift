//
//  ViewController.swift
//  SOLIDone
//
//  Created by MacBook on 12.02.2022.
//

import UIKit

class ViewController: UIViewController {

    // External dependencies
    //var networkService = NetworkService()
    var dataStore = DataStore()
    var networkDataFetcher = NetworkDataFetcher()

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!

    // MARK:- View LifeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 25.0
        dataStore.loadData() // load data from Core Data
        
        //Activate completion handler to print title from News API
        networkDataFetcher.fetchNews(Password.url) { (data) in
            guard let data = data else { return }
            for index in 0...data.articles.count - 1 {
                print(data.articles[index].title)
            }
        }
        // Add second completion handler to print top app name company in UA
        networkDataFetcher.fetchAppleRss(Password.appleURL) { (data) in
            guard let data = data else { return }
            for index in 0...data.feed.results.count - 1 {
                print(data.feed.results[index].artistName)
            }
        }
    }
    // MARK:- Interaction with user
    
    @IBAction func nameTextFieldAction(_ sender: UITextField) {
        nameLabel.text = nameTextField.text
        
    }

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        chekName()
        
    }
    // MARK:- Business Logic
    func chekName() {
        guard let name = nameTextField.text, name != "" else { return K.alert("Type a name", self)}
        dataStore.saveData(name)
        
    }
    


}


