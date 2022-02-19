//
//  NamesViewController.swift
//  SOLIDone
//
//  Created by MacBook on 19.02.2022.
//

import UIKit
//import CoreData

class NamesViewController: UIViewController {
    
    // External dependencies
    var dataStore = DataStore()
    var array = [SolidCoreData]()
    
    @IBOutlet weak var namesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        namesTableView.dataSource = self
        namesTableView.delegate = self
        dataStore.loadData() // fetch names from Core Data when VC appears
        array = dataStore.coreData // transfer data from DataStore array to local array
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
// MARK: - TableView DataSource

extension NamesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.namesIdentifier, for: indexPath)
        cell.textLabel?.text = array[indexPath.row].name
        cell.backgroundColor = .clear // set the same color to cell as local View backgroung color
        cell.textLabel?.font = UIFont(name: "System Thin", size: 20)
        return cell
    }
}
// MARK: - TableView Delegate

extension NamesViewController: UITableViewDelegate {
    
}
