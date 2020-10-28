//
//  HeaderFunc.swift
//  TabBar_Swift
//
//  Created by Dancer on 2020/10/12.
//

import Foundation
import UIKit

class Common {
    class var sharedInstance: Common {
        struct instance {
            static let _instance:Common = Common()
        }
        return instance._instance
    }
}


private func kHalfFloor(_ value: CGFloat) -> CGFloat{
    let a = floor(value*2)*0.5
    return a
}

func widthScale(_ value: CGFloat) -> CGFloat{
    var size = value * kWSacle
    size = kHalfFloor(size)
    return size;
}

// MARK: - 颜色相关
func RGB(h:Int,alpha:CGFloat) ->UIColor {
    return RGBCOLOR(r: CGFloat(((h)>>16) & 0xFF), g:   CGFloat(((h)>>8) & 0xFF), b:  CGFloat((h) & 0xFF),alpha: alpha)
} //根据十六进制数生成颜色 HEXCOLOR(h:0xe6e6e6,alpha:0.8)

private func RGBCOLOR(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
} //根据R,G,B生成颜色

func RANDOMCOLOR() -> UIColor {
    return RGBCOLOR(r: CGFloat(arc4random()%256), g: CGFloat(arc4random()%256), b: CGFloat(arc4random()%256),alpha: 1)
} //随机色

//MARK: - Font
func regularFont(_ size: CGFloat) -> UIFont{
    if IOS_VERSION > 9.0{
        return UIFont.init(name: "PingFangSC-Regular", size: size * CGFloat(kWSacle))!
    }
    else{
        return UIFont.systemFont(ofSize: size * CGFloat(kWSacle))
    }
}

func mediumFont(_ size: CGFloat) -> UIFont{
    if IOS_VERSION > 9.0{
        return UIFont.init(name: "PingFangSC-Medium", size: size * CGFloat(kWSacle))!
    }
    else{
        return UIFont.systemFont(ofSize: size * CGFloat(kWSacle))
    }
}

func semiboldFont(_ size: CGFloat) -> UIFont{
    if IOS_VERSION > 9.0{
        return UIFont.init(name: "PingFangSC-Semibold", size: size * CGFloat(kWSacle))!
    }
    else{
        return UIFont.systemFont(ofSize: size * CGFloat(kWSacle))
    }
}

//MARK: - DEBUG模式下打印(Swift)
func Dprint<T>(_ message: T, filePath: String = #file, rowCount: Int = #line) {
    #if DEBUG
    let fileName = (filePath as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: "")
    
    let dformatter = DateFormatter.init()
    dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
    let str = dformatter.string(from: Date.init())
    
    print("class:" + fileName + "  time:" + "\(str)" + " line:" + "\(rowCount)" + "  \(message)" + "\n")
    #endif
}
