//
//  ChooseAzkarType.swift
//  Azkari
//
//  Created by Deepo on 29/09/2021.
//

import UIKit
import AVKit
import AVFoundation
import Alamofire

class ChooseAzkarType: UIViewController,chooseAzkarTypeProtocol {
    var presenter:Presenter?
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var zekrLabel: UILabel!
    @IBOutlet weak var presentZekrView: UIView!
    @IBOutlet weak var afterPrayContiner: UIImageView!
    @IBOutlet weak var masaaImageContainer: UIImageView!
    @IBOutlet weak var sabaaImageContainer: UIImageView!
    @IBOutlet weak var ShowVideo: UIButton!
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
      
        timer = Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(fireZekr), userInfo: nil, repeats: true)
        makeNotification()
        
        
    }
    @objc func fireZekr()
    {
        UIView.animate(withDuration: 6, delay: 1, options: .transitionCurlUp) {
            self.presentZekrView.isHidden = false
            self.zekrLabel.text = self.presenter?.allDataStaticForZekr()
        } completion: { end in
            if end
            {
                
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+8) {
            self.presentZekrView.isHidden = true
            
        }
       

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        iconImage.alpha = 0
    }
    
    func setUpView()
    {
        presentZekrView.isHidden = true
        ShowVideo.setTitle("", for: .normal)
        sabaaImageContainer.layer.cornerRadius = 10
        sabaaImageContainer.clipsToBounds = true
        masaaImageContainer.layer.cornerRadius = 10
        masaaImageContainer.clipsToBounds = true
        afterPrayContiner.layer.cornerRadius = 10
        afterPrayContiner.clipsToBounds = true
        presentZekrView.layer.cornerRadius = 10
        presentZekrView.clipsToBounds = true
        
        
        iconImage.layer.cornerRadius = 25
        iconImage.layer.masksToBounds = true
        
    }
    
    
    func makeNotification()
    {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound,.badge,.alert]) { gurante, error in
            if gurante
            {
                DispatchQueue.main.async {
                    self.scheduleNotification()
                }
            }
            else {
                print(error?.localizedDescription)
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2, delay: 0, options: .beginFromCurrentState) { [self] in
            self.iconImage.alpha = 1
            self.iconImage.transform3D = CATransform3DMakeScale(1.3, 1.3, 1)
            self.view.bringSubviewToFront(iconImage)
        } completion: { done in
            if done
            {
                print("done")
            }
        }

    }
    
    @IBAction func afterPrayBtn(_ sender: UIButton) {
        Router.navigateToZekrVc(from: self, url: AppUrl.b3dSala)
    }
    
    
    @IBAction func morningBtn(_ sender: UIButton) {
        Router.navigateToZekrVc(from: self, url: AppUrl.sabaaUrl)
        
    }
    
    @IBAction func eveningBtnn(_ sender: UIButton) {
        Router.navigateToZekrVc(from: self, url: AppUrl.massaUrl)
    }
   
    
    
    @IBAction func ShowVideo(_ sender: Any) {
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "One", ofType: "mp4")!))
        let layerVC = AVPlayerViewController()
        layerVC.player = player
        layerVC.player?.play()
        present(layerVC, animated: true)
                              
        
    }
    
    
    
    func scheduleNotification()
    {
        let content = UNMutableNotificationContent()
        content.badge = 1
        content.sound = .default
        content.title  = "اذكار الصباح"
        content.body = " 😍 صلي علي النبي  "
        
        let content1 = UNMutableNotificationContent()
        content1.badge = 1
        content1.sound = .default
        content1.title  = "اذكار المساء"
        content1.body = " 😍 صلي علي النبي  "
        _ = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        var data   = DateComponents()
        data.calendar  = .current
        data.hour = 12
        data.minute = 00
        
        var data1   = DateComponents()
        data1.calendar  = .current
        data1.hour = 17
        data1.minute = 8
        
        let dataTrigarSabba = UNCalendarNotificationTrigger(dateMatching: data, repeats: true)
        let dataTrigarMasaa = UNCalendarNotificationTrigger(dateMatching: data1, repeats: true)
      
        
        let requestSabaa = UNNotificationRequest(identifier: "sabaa", content:content, trigger: dataTrigarSabba)
        let requestMasaa = UNNotificationRequest(identifier: "Masaa", content: content1, trigger: dataTrigarMasaa)
        UNUserNotificationCenter.current().add(requestSabaa)
        UNUserNotificationCenter.current().add(requestMasaa)
    }
    
}



