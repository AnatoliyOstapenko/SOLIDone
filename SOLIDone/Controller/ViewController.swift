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
    var dataFetcherService = DataFetcherService()

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var namesButton: UIButton!
    
    // MARK:- View LifeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 25.0
        namesButton.layer.cornerRadius = 20.0
        dataStore.loadData() // load data from Core Data
        
//        // Interaction with News Model, print every title from API
//        dataFetcherService.fetchNews { (news) in
//            guard let data = news else { return }
//            for index in 0...data.articles.count - 1 {
//                print(data.articles[index].title)
//            }
//        }
//        // Interaction with Apple RSS Model, print every artistName from API
//        dataFetcherService.fetchAppleApps { (apps) in
//            guard let data = apps else { return }
//            for index in 0...data.feed.results.count - 1 {
//                print(data.feed.results[index].artistName)
//            }
//        }
//        // Interaction with Apple RSS Model, print every name from API
//        dataFetcherService.fetchAppleBooks { (books) in
//            guard let data = books else { return }
//            for index in 0...data.feed.results.count - 1 {
//                print(data.feed.results[index].name)
//            }
//        }
        dataFetcherService.fetchLocalData { (localNews) in
            guard let data = localNews else { return }
            for index in 0...data.articles.count - 1 {
                print(data.articles[index].title)
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
    
    @IBAction func namesButtonPressed(_ sender: UIButton) {
        goToNamesVC()
    }
    // MARK:- Business Logic
    func chekName() {
        guard let name = nameTextField.text, name != "" else { return K.alert("Type a name", self)}
        dataStore.saveData(name)
        
    }
    // Sending an user to NamesVC
    func goToNamesVC() {
        let vc = UIStoryboard.init(name: "Names", bundle: nil).instantiateViewController(withIdentifier: K.namesStoryboard)
        vc.modalPresentationStyle = .fullScreen // open NamesVC full screen
        present(vc, animated: true, completion: nil)
    }
}


