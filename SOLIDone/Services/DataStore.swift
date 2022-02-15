//
//  DataStore.swift
//  SOLIDone
//
//  Created by MacBook on 13.02.2022.
//

import UIKit
import CoreData

class DataStore {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var coreData = [SolidCoreData]()
    
    // Save data to Core Data
    func saveData(_ data: String) {
        let item = SolidCoreData(context: context)
        item.name = data
        print("\(data) is saved in Core Data store")
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
}
