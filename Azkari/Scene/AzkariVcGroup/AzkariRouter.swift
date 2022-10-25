//
//  AzkariRouter.swift
//  Azkari
//
//  Created by Deepo on 18/10/2021.
//

import UIKit

class AzkariRouter {
    
   class var mainStoryboard:UIStoryboard
    {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
   class func CreateAzkariVC(url:String) -> UIViewController
    {
        let azkariVc = mainStoryboard.instantiateViewController(identifier: "AzkariVc")
        if let azkariView = azkariVc as? azkarProtocol
        {
            let interactor  = Interactor()
            let router = AzkariRouter()
            let presenter = PresenterZekr(view: azkariView , interactor: interactor, router: router)
            azkariView.presenter = presenter
            azkariView.presenter?.didload(url: url)
        }
        
        return azkariVc
    }
}
