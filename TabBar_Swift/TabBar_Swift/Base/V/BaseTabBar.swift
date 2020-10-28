//
//  BaseTabBar.swift
//  TabBar_Swift
//
//  Created by Dancer on 2020/10/10.
//

import UIKit

class BaseTabBar: UITabBar {
    var topLine: UIView?
    var bgView: UIView?
    var tabBarConfigDic: [TitleModel]?
    
    weak var adelegate: TabBarProtocol?
    
    var tabButtons: [BaseTabBtn]?
    var selectedIndex: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        self.initSubViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bringSubviewToFront(self.bgView!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI
    func initSubViews(){
        if #available(iOS 13, *){
            let tabbarAppearance = self.standardAppearance
            tabbarAppearance.shadowImage = UIImage.init()
            self.standardAppearance = tabbarAppearance
        }
        else{
            self.backgroundImage = UIImage.init()
            self.shadowImage = UIImage.init()
        }
        
        if(bgView == nil){
            bgView = UIView.init()
            bgView?.backgroundColor = RGB(h: 0xffffff, alpha: 1)
            self.addSubview(bgView!)
            bgView?.snp.makeConstraints({ (make) in
                make.edges.equalToSuperview()
            })
        }
        
        if(topLine == nil){
            topLine = UIView.init()
            topLine?.backgroundColor = RGB(h: 0x000000, alpha: 1)
            bgView!.addSubview(topLine!)
            topLine?.snp.makeConstraints { (make) in
                make.left.top.right.equalToSuperview()
                make.height.equalTo(1)
            }
        }
        
        for subView in bgView!.subviews{
            subView.removeFromSuperview()
        }
        
        if(tabBarConfigDic == nil){
            guard let path = Bundle.main.path(forResource: "Directions", ofType: "geojson") else { return }
                let jsonData: Data = NSData.init(contentsOfFile: path)! as Data
                do{
                    let banner = try JSONDecoder().decode(TabBarModel.self, from: jsonData)
                    if let da = banner.tabBars{
                        tabBarConfigDic = da
                    }
                }catch{}
        }
        
        var lastBtn: BaseTabBtn!
        for(index,item) in (tabBarConfigDic?.enumerated())! {
            let btn: BaseTabBtn = BaseTabBtn.init()
            btn.config = ["imageNor":"icon_tabbar_home_nor","imageSel":"icon_tabbar_home_sel","title":"首页"]
            btn.addTarget(self, action: #selector(tabBtnDidClicked(btn:)), for: .touchUpInside)
            self.tabButtons?.append(btn)
            btn.tag = index + 10
            self.bgView?.addSubview(btn)
            btn.snp.makeConstraints { (make) in
                make.top.equalTo(0)
                make.height.equalTo(49)
                make.width.equalTo(90)
                if(lastBtn == nil){
                    make.left.equalTo(self).offset(5)
                }
                else{
                    make.left.equalTo(lastBtn.snp.right).offset(15)
                }
            }
            lastBtn = btn
            
            if index == self.selectedIndex{
                btn.isSelected = true
            }
        }
    }
    
    func selectedIndex(index: Int){
        if(self.tabButtons == nil){
            return
        }
        if(index < 0 || index >= self.tabButtons!.count){
            return
        }
        
        let btn: BaseTabBtn? = self.tabButtons?[selectedIndex]
        if(btn == nil){
            return
        }
        self .tabBtnDidClicked(btn: btn!)
    }
    
    @objc func tabBtnDidClicked(btn: BaseTabBtn){
        let index = btn.tag - 10
        
        if(index != self.selectedIndex){
            let oldBtn: BaseTabBtn = self.viewWithTag(self.selectedIndex + 10) as! BaseTabBtn
            oldBtn.isSelected = false
            
            self.selectedIndex = index
            btn.isSelected = true
        
            self.adelegate?.TabBar?(self, didSelectIndex: self.selectedIndex)
        }
        
    }
}


class TabBarModel: Codable{
    var tabBars: [TitleModel]?
}

class TitleModel: Codable{
    var imageNor: String = ""
    var imageSel: String = ""
    var title: String = ""
}
