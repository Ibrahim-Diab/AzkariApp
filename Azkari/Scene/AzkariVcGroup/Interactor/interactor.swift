//
//  interactor.swift
//  Azkari
//
//  Created by Deepo on 29/09/2021.
//

import Foundation
import Alamofire


class Interactor
{
    let decoder = JSONDecoder()
    
    func getAzkar(url:String,compilationHandler: @escaping (AzkariModel?)->Void)  {
        Alamofire.request(url, method: .get, parameters: nil, headers: nil).responseJSON { response in
            if let response = response.data
            {
                guard  let result = try? self.decoder.decode(AzkariModel.self, from: response) else {return}
                if result != nil
                {
                compilationHandler(result)
                }
                print("AAAAAAA")
            }
          
        }
        
    }
    
    
    
    
}




