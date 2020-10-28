//
//  TabBarProtocol.swift
//  TabBar_Swift
//  Created by Mac on 2020/10/27.
//
import UIKit

@objc protocol TabBarProtocol: NSObjectProtocol {
    
    @objc optional func TabBar(_ tabbar:BaseTabBar, didSelectIndex:Int)
}
