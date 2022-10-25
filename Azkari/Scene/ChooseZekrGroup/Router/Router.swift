//
//  Router.swift
//  Azkari
//
//  Created by Deepo on 13/10/2021.
//

import UIKit
class Router {
    
    class var mainStoryboard : UIStoryboard
    {return UIStoryboard(name: "Main", bundle: Bundle.main)}
    
    class func CreaterChooseAzkariVC() -> UIViewController {
        let chooseZekrVC = mainStoryboard.instantiateViewController(identifier: "ChooseType")
        if let chooseZekr = chooseZekrVC as? chooseAzkarTypeProtocol
        {
            let interactor = Interactor()
            let router = Router()
            let presenter = Presenter( delegate: chooseZekr, interactor: interactor, router: router)
            chooseZekr.presenter = presenter
        }
        return chooseZekrVC
    }
    
  class  func navigateToZekrVc(from view: chooseAzkarTypeProtocol?, url: String) {
        let AzkariVc = AzkariRouter.CreateAzkariVC(url: url)
        if let viewController = view as? UIViewController {
            viewController.present(AzkariVc, animated: true, completion: nil)
        }
    }
    
    class  func navigateToZekrnotification( viewController:UIViewController,url: String) {
          let AzkariVc = AzkariRouter.CreateAzkariVC(url: url)
              viewController.present(AzkariVc, animated: true, completion: nil)
          
      }
    
    
}
