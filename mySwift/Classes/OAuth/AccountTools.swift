//
//  AccountTools.swift
//  mySwift
//
//  Created by 飞礼科技 on 2018/4/20.
//  Copyright © 2018年 飞礼科技. All rights reserved.
//

import UIKit
let document = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
let documentsDirectory = document[0] as! String
let path = documentsDirectory + "account.plist"

class AccountTools: NSObject {
    var name:NSString = "11"
}
