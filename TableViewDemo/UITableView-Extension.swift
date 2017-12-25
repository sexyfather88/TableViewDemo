//
//  UITableView-Extension.swift
//  TableViewDemo
//
//  Created by Wilson on 2017/12/25.
//  Copyright © 2017年 Wilson. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerReuseCellWithIdentifier(indentifier:String) {
        
        
        self.register(UINib.init(nibName: indentifier, bundle: nil), forCellReuseIdentifier: indentifier)
        
        print("asd")
    }

    
    
    //
//    func cropToCircleWithBorderColor(color: UIColor, lineWidth: CGFloat) -> UIImage {
//        
//        // code to create the cropped circle with colored border
//        
//        return newImage
//    }
}
