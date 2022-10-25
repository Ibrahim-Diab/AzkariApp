//
//  extension.swift
//  Azkari
//
//  Created by Deepo on 05/10/2021.
//

import Foundation
import UIKit
extension String {

 // default: it is a number suitable for your project if the string is not an integer

    func toInt(defaultt: Int) -> Int {
        if let result = Int(self) {
            return result
        }
        else {
            return defaultt
        }
    }

}
extension UIViewController
{
    
     func showAlertWithAction(target: UIViewController, title: String, message: String, okAction: String, actionCompletion: ((UIAlertAction) -> Void)?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okAction , style: .default, handler: actionCompletion))
        target.present(alert, animated: true, completion: nil)
    }
}
