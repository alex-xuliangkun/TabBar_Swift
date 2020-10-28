//
//  BaseTabBtn.swift
//  TabBar_Swift
//
//  Created by Dancer on 2020/10/12.
//

import UIKit
import SnapKit

class BaseTabBtn: UIButton {
    var config: [String: String]? {
        didSet{
            self.titleLab.text = self.config!["title"]
        }
    }
    var iconImg: UIImageView!
    var titleLab: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        iconImg = UIImageView.init()
        self.addSubview(self.iconImg)
        self.iconImg.backgroundColor = .yellow
        iconImg.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.width.height.equalTo(20)
            make.top.equalTo(5)
        }
        
        titleLab = UILabel.init()
        titleLab.font = regularFont(14)
        titleLab.textAlignment = .center
        titleLab.backgroundColor = .red
        titleLab.textColor = .darkText
        self.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.top.equalTo(self.iconImg.snp_bottomMargin).offset(5)
            make.bottom.equalTo(5)
            make.left.right.equalTo(self)
        }
        
        self.isSelected = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
