//
//  AzkarTableViewCell.swift
//  Azkari
//
//  Created by Deepo on 29/09/2021.
//

import UIKit

class AzkarTableViewCell: UITableViewCell {
  
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var repeatLabel: UILabel!
    @IBOutlet weak var repeatView: UIView!
    @IBOutlet weak var azkarLabel: UILabel!
    @IBOutlet weak var btnVIew: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var finishZekr: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    
  }
    
   
}
extension AzkarTableViewCell:azkariTableViewCellProtocol
{
    
    func setUpView() {
        
        // MARK :- bottomView
        btnVIew.clipsToBounds = false
        btnVIew.layer.cornerRadius = 15
        btnVIew.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
     
        // MARK :- repeatedLabel
        repeatView.layer.cornerRadius = 12.5
        repeatView.clipsToBounds = true
    }
    
    func ConfigurationCell(azkarName:String,azkariRepeat:Int) {
        azkarLabel.text = azkarName
        repeatLabel.text = String(azkariRepeat)
        
    }
    
    
    
    
}


