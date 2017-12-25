//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Wilson on 2017/12/25.
//  Copyright © 2017年 Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.registerReuseCellWithIdentifier(indentifier: "tableViewCell")
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        

        let nameLabel=cell.viewWithTag(1001)as? UILabel
        let aqiLabel=cell.viewWithTag(1002)as? UILabel
        
        
        nameLabel?.text="城市地點"
        aqiLabel?.text="100"
        
    
        return cell

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    

    

}

