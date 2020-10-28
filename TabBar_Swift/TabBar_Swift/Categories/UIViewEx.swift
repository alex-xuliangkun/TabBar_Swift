//
//  UIViewEx.swift
//  TabBar_Swift
//
//  Created by Mac on 2020/10/27.
//

import Foundation
import UIKit

extension UIView{
    func addTopShadowWithColor(theColor: UIColor){
        self.layer.masksToBounds = false
        self.layer.shadowColor = theColor.cgColor
        self.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 5
        
        let shadowPathWidth = self.layer.shadowRadius
        let shadowRect = CGRect.init(x: 0, y: 0-shadowPathWidth/2.0, width: self.bounds.size.width, height: shadowPathWidth)
        let path = UIBezierPath.init(rect: shadowRect)
        self.layer.shadowPath = path.cgPath
    }
}
