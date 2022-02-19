//
//  NamesViewController.swift
//  SOLIDone
//
//  Created by MacBook on 19.02.2022.
//

import UIKit

class NamesViewController: UIViewController {
    
    var array = [SolidCoreData]() // Invoke SolidCoreData to interact with table view
    
    @IBOutlet weak var namesTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        namesTableView.dataSource = self
        namesTableView.delegate = self

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
        return cell
    }
}
// MARK: - TableView Delegate

extension NamesViewController: UITableViewDelegate {
    
}
