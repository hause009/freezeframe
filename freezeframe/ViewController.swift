//
//  ViewController.swift
//  freezeframe
//
//  Created by Alex on 16.03.17.
//  Copyright © 2017 AnsA. All rights reserved.
//
import Foundation
import UIKit
import Alamofire
import Kanna
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var shows = Array<modelList>()
    let networkClient = NetworkClient()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let result = networkClient.getList(apiEndPoint: "get")
        { (ResponsePackage) in

            if ResponsePackage.success == true
            {
                self.shows = self.networkClient.shows
                self.tableView.reloadData()
            }
            
            
        }
        print(result)
        self.tableView.estimatedRowHeight = 70
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = Bundle.main.loadNibNamed("viewCell", owner: self, options: nil)?.first as! viewCell
        
        let row = indexPath.row
        
        cell.text1.text = shows[row].text1
        cell.text2.text = shows[row].text2
        cell.textData.text = shows[row].textData
        
        let url = NSURL (string: shows[row].image!)
        cell.cellImage.af_setImage(withURL:(withURL: url as! URL))
        
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.blue.cgColor
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        
        return cell
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



