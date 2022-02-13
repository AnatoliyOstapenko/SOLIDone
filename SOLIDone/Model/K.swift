//
//  K.swift
//  SOLIDone
//
//  Created by MacBook on 13.02.2022.
//

import UIKit

struct K {
    static let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=5da05c606b6846f7b5dbf3bd05653340"
    
    static func alert(_ message: String, _ viewController: UIViewController) {
        let alert = UIAlertController.init(title: "Warning", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        viewController.present(alert, animated: true, completion: nil)

    }
    
}
