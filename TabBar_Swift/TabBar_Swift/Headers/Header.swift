//
//  Header.swift
//  TabBar_Swift
//
//  Created by Dancer on 2020/10/10.
//

import Foundation
import UIKit

let kWidth = UIScreen.main.bounds.width
let kHeight = UIScreen.main.bounds.height
let kScale = UIScreen.main.scale
let kWSacle = kWidth/375.0

let IS_IPhoneX_All = (kHeight == 812 || kHeight == 896)
let HYDevice_NaviBar_Height = (IS_IPhoneX_All ? 88 : 64)

//状态栏高
let HYDevice_StatusBar_Height = (IS_IPhoneX_All ? 44 : 20)

//选项卡高
let HYDevice_TabBar_Height = (IS_IPhoneX_All ? 83 : 49)

//安全区高
let HYDevice_SafeArea_BottomHeight = (IS_IPhoneX_All ? 34 : 0)


let isIpone = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone

//let SCREEN_MIN_LENGTH = MIN

//MARK: - 版本号
let IOS_VERSION = UIDevice.current.systemVersion._bridgeToObjectiveC().doubleValue



