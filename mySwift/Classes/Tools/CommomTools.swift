//
//  CommomTools.swift
//  mySwift
//
//  Created by 飞礼科技 on 2018/4/21.
//  Copyright © 2018年 飞礼科技. All rights reserved.
//

import UIKit

func textSize(text : String , font : UIFont , maxSize : CGSize) -> CGSize{
    return text.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [NSAttributedStringKey.font : font], context: nil).size
}

let KCellHight_default:CGFloat  = 49

let KScreenWidth  = UIScreen.main.bounds.size.width
let KScreenHeight =  UIScreen.main.bounds.size.height


/// 当前app信息
let GetAppInfo = Bundle.main.infoDictionary
/// 当前app版本号
let GetAppCurrentVersion = Bundle.main.object(forInfoDictionaryKey:"CFBundleShortVersionString")
/// 获取设备系统号
let GetSystemVersion = UIDevice.current.systemVersion

/// iPhone设备
let isIPhone = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? true : false)
/// iPad设备
let isIPad = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? true : false)

/// iPhone4设备
let isIPhone4 = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) < 568.0 ? true : false)
/// iPhone5设备
let isIPhone5 = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 568.0 ? true : false)
/// iPhone6设备
let isIPhone6 = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 667.0 ? true : false)

/// iPhone6Plus设备
let isIPhone6P = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 736.0 ? true : false)

class CommomTools: NSObject {

}
