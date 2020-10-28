//
//  MainTabBarVC.swift
//  TabBar_Swift
//
//  Created by Mac on 2020/10/27.
//

import UIKit

class MainTabBarVC: BaseTabBarVC {
    var _currentRole: Int?
    
    var currentRole: Int? {
        set{
            _currentRole = newValue
        }
        get{
            return _currentRole
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.setupViewControllers()
    }
    
    //MARK: - UI
    func setupViewControllers(){
        let vcs:[UINavigationController] = [self.navWithClass(vc: HomeVC()),
                                            self.navWithClass(vc: ShopVC())]
        self.setViewControllers(vcs, animated: false)
        
        self.myTabBar.selectedIndex(index: 0)
    }
    
    func navWithClass(vc: UIViewController) -> UINavigationController{
        return UINavigationController.init(rootViewController: vc)
    }
}
