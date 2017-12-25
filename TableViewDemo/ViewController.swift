//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Wilson on 2017/12/25.
//  Copyright © 2017年 Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var DataArray = [City]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // NSObject instance/static method
        
        AppDataManager.staticFunction()
        AppDataManager().instanceFunction()
       
        
        //
        
        tableView.registerReuseCellWithIdentifier(indentifier: "tableViewCell")

        
        DispatchQueue.global().async {
            
            AppData.checkAirData()
            
            DispatchQueue.main.async {
                self.retrieveData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func retrieveData(){

        
        let info : NSArray =   AppData.readJSonFromFile() as NSArray
        
        for cool in info
        {
            
            let dictionary=cool as! NSDictionary

            var name=dictionary.object(forKey: "County")! as! String
            let locationName=dictionary.object(forKey: "SiteName")! as! String
            name=name+locationName

        
            let AQI=dictionary.object(forKey: "AQI")! as! String
            
            let city=City.init(name: name, aqi: AQI)
        
            DataArray.append(city)
        }
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
    
        let nameLabel=cell.viewWithTag(1001)as? UILabel
        let aqiLabel=cell.viewWithTag(1002)as? UILabel
        
        let city=DataArray[indexPath.row]
        
        nameLabel?.text=city.name
        aqiLabel?.text=city.AQI
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataArray.count
    }
    
    
    
    
}

