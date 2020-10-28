//  BaseTabBarVC.swift
//  TabBar_Swift
//  Created by Dancer on 2020/10/10.
//

import UIKit

class BaseTabBarVC: UITabBarController {
    var myTabBar: BaseTabBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
        
        UITabBar.appearance().backgroundImage = UIImage.init()
        UITabBar.appearance().shadowImage = UIImage.init()
        
        myTabBar = BaseTabBar.init(frame: self.tabBar.bounds)
        myTabBar.adelegate = self
        self.setValue(myTabBar, forKey: "tabBar")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTabBar.addTopShadowWithColor(theColor: RGB(h: 0x000000, alpha: 0.2))
    }
    
    
    deinit {
        let msg = String.init(format: "%@ dealloc", NSStringFromClass(self.classForCoder))
        Dprint(msg)
    }
}

extension BaseTabBarVC: TabBarProtocol{
    func TabBar(_ tabbar: BaseTabBar, didSelectIndex: Int) {
        Dprint(didSelectIndex)
        if(self.selectedIndex != didSelectIndex){
            self.selectedIndex = didSelectIndex
        }
    }
}
