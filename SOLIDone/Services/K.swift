//
//  K.swift
//  SOLIDone
//
//  Created by MacBook on 13.02.2022.
//

import UIKit

struct K {
    
    static func alert(_ message: String, _ viewController: UIViewController) {
        let alert = UIAlertController.init(title: "Warning", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        viewController.present(alert, animated: true, completion: nil)

    }
    static let namesIdentifier = "NamesCell"
    static let namesStoryboard = "Names"
    
}
