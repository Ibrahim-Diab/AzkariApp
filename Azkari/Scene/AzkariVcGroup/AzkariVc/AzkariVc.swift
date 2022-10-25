//
//  ViewController.swift
//  Azkari
//
//  Created by Deepo on 29/09/2021.
//

import UIKit
import Alamofire

class AzkariVc: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var counterZekr:Int = 100000
    var presenter : PresenterZekr?
    var url:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        
    }
    
}

extension AzkariVc:azkarProtocol
{
    func removeCell(cell: AzkarTableViewCell, index: Int) {
        var x =  cell.repeatLabel.text?.toInt(defaultt: 1)
        if x == 1
        {
            counterZekr = presenter?.getAzkariCount() ?? 0
            presenter?.content.remove(at: index)
            tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: UITableView.RowAnimation.fade)
            tableView.reloadData()
        }
        else
        {
            x = x!-1
            cell.repeatLabel.text = String(x!)
            
        }
    }
    
    
    func fetchData() {
        print("Fetch Data Success")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showDone() {
        showAlertWithAction(target: self, title: "  صلي علي محمد ❤️ ", message:  "لقد انتهيت", okAction: "حسنا") {_ in
            self.dismiss(animated: true, completion: nil)
            
        }
     
    }
    
    
}
extension AzkariVc:UITableViewDelegate,UITableViewDataSource
{
    
    
    func setUpTableView()  {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AzkarTableViewCell", bundle: nil), forCellReuseIdentifier: "AzkarTableViewCell")
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getAzkariCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "AzkarTableViewCell", for: indexPath) as! AzkarTableViewCell
        presenter?.configureCell(cell: cell, index: indexPath.row)
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? AzkarTableViewCell {
            presenter?.deleteCell(cell: cell, index: indexPath.row)
            if counterZekr-1 == 0
            {
                presenter?.FinishZekr()
            }
            
        }
    }
    

}




