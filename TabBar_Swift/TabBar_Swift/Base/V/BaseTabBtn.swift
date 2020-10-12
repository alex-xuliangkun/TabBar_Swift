//
//  BaseTabBtn.swift
//  TabBar_Swift
//
//  Created by Dancer on 2020/10/12.
//

import UIKit
import SnapKit

class BaseTabBtn: UIButton {
    var _config: [String: String]!
    var _iconImg: UIImageView!
    
    
    
    
    
    func shared(frame:CGRect,config:[String:String]){
        _config = config
        
        _iconImg = UIImageView.init()
        self.addSubview(_iconImg)
        _iconImg.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.width.height.equalTo(24)
            make.bottom.equalTo(21)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
