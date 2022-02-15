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

        dataStore.loadData()
        networkDataFetcher.fetchData()
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


