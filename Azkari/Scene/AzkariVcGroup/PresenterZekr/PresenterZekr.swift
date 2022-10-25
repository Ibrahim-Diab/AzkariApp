//
//  PresenterZekr.swift
//  Azkari
//
//  Created by Deepo on 18/10/2021.
//

import Foundation

protocol azkarProtocol:AnyObject {
  
    var presenter:PresenterZekr? {get set}
    func fetchData()
    func showDone()
    func removeCell(cell:AzkarTableViewCell,index:Int)
}

protocol azkariTableViewCellProtocol:AnyObject {
  
    func setUpView()
    func ConfigurationCell(azkarName:String,azkariRepeat:Int)
    
}
class PresenterZekr {
    let interactor:Interactor?
    var content :[Content] = []
    let routerr:AzkariRouter?
   
    
    weak var view:azkarProtocol?
    init(view:azkarProtocol,interactor:Interactor,router:AzkariRouter) {
        self.view = view
        self.interactor = interactor
        self.routerr = router
        
    }
    
    func passurltype(url:String)
    {
        interactor?.getAzkar(url: url) { Azkar in
            guard let Azkar = Azkar else {return}
            print(Azkar.content.count)
            self.content.append(contentsOf: Azkar.content)
            self.view?.fetchData()
            
            
        }
    }
    
    func getAzkariCount() -> Int
    {
        return content.count
    }
    func deleteCell(cell: AzkarTableViewCell, index: Int)
    {
        view?.removeCell(cell: cell, index: index)
        
    }
    func FinishZekr()
    {
        view?.showDone()
    }
    
    func didload(url:String)
    {
        passurltype(url: url)
    }
    func configureCell(cell:azkariTableViewCellProtocol,index:Int)
    {
        let zekr = content[index]
        cell.ConfigurationCell(azkarName: zekr.zekr, azkariRepeat: zekr.contentRepeat)
    }
    
    
     

}
