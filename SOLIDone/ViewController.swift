//
//  ViewController.swift
//  SOLIDone
//
//  Created by MacBook on 12.02.2022.
//

import UIKit

class ViewController: UIViewController {

    // External dependencies
    let networkService = NetworkService()
    let dataStore = DataStore()

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!

    // MARK:- View LifeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 25.0

        dataStore.loadData()
        networkService.fetchData()
    }

    // MARK:- Business Logic
    
    func checkName() {
        guard let name = nameTextField.text, name != "" else { return alert()}
        dataStore.saveData(name)
        print("Name \(name) is saved")
        nameLabel.text = name
    }
    
    // MARK:- User Interaction and interface
    
    func alert() {
        let alert = UIAlertController.init(title: "Warning", message: "you can't leave field emplty", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func nameTextFieldAction(_ sender: UITextField) {
        nameLabel.text = nameTextField.text
    }

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        checkName()
    }

}


