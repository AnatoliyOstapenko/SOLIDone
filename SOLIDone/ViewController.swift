//
//  ViewController.swift
//  SOLIDone
//
//  Created by MacBook on 12.02.2022.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    
    var coreData = [SolidCoreData]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!

    // MARK:- View LifeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 25.0
        loadData()
    }

    // MARK:- Business Logic
    
    func checkName() {
        guard let name = nameTextField.text, name != "" else { return alert()}
        saveData(name)
        print("Name \(name) is saved")
        nameLabel.text = name
    }
    
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
    
    // MARK:- Data Storage
    
    // Save data to Core Data
    func saveData(_ data: String) {
        let item = SolidCoreData(context: context)
        item.name = data
        coreData.append(item)
        do {
            try context.save()
        } catch { print("load data failed, error \(error)") }
            
    }
    // Fetch data from Core Data
    func loadData() {
        do {
            coreData = try context.fetch(SolidCoreData.fetchRequest())
            // Print every name from storage
            for index in coreData {
                print("saved name is \(index.name ?? "no name")")
            }
        } catch { print("load data failed: \(error)")}
    }
    // MARK:- Networking
    
    func requestData(completion: @escaping(Data?, Error?) -> Void) {
        guard let url = URL(string: K.apiKey) else { return }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        task.resume()
    }
}


