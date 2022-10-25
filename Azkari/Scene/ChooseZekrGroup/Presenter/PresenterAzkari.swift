//
//  Presenter.swift
//  Azkari
//
//  Created by Deepo on 29/09/2021.
//
import Foundation



protocol chooseAzkarTypeProtocol:AnyObject{
    var presenter:Presenter? { get set }
}
class Presenter {
    let router:Router?
    let interactor:Interactor?
    var content :[Content] = []
    
    weak var delegateChooseAzkarType:chooseAzkarTypeProtocol?
    init(delegate:chooseAzkarTypeProtocol,interactor:Interactor,router:Router) {
        delegateChooseAzkarType = delegate
        self.interactor  = interactor
        self.router = router
    }
    
    
    func allDataStaticForZekr() ->String
    {
        
        let ArrayofData = ["أسْتَغْفِرُ اللهَ وَأتُوبُ إلَيْهِ","سُبْحـانَ اللهِ وَبِحَمْـدِهِ ","لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ","اللهُ أكبَر","الـحَمْدُ للهِ الَّذي أَطْـعَمَنا وَسَقـانا،","” الْحَمْدُ لِلَّهِ كَثِيرًا طَيِّبًا مُبَارَكً","اللّهُـمَّ إِنَّـي أَسْـأَلُـكَ العـافِـيَة","حَسْبِيَ اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ عَلَيْهِ تَوَكَّلْتُ ","رَضيتُ بِالله رَبًّا","صلي ع اللي هيشفع فيك","صلي علي النبي"]
        let oneZekr = ArrayofData[Int.random(in: 0 ... 10)]
        return ("\(oneZekr) 💜")
    }

}
