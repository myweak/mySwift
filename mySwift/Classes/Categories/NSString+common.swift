
//
//  NSstring.swift
//  mySwift
//
//  Created by 飞礼科技 on 2018/5/7.
//  Copyright © 2018年 飞礼科技. All rights reserved.
//

import UIKit
extension NSString{
    func decryptString() -> NSString {
        return self
    }
    
    // MARK: -- 编码
    private func rot13(text:NSString) -> NSString {
//        let source:Character = self.cString(using: NSASCIIStringEncoding.rawValue)
//        var dest:Character  = Character(malloc((self.length + 1) * 1))
//        if dest {
//            return nil;
//        }
//        var i:NSInteger = 0
        
//        for c:Character in source {
//            if c>= 'A' && c < 'Z'{
//                c = (c - 'A' + 13) % 26 + 'A';
//            }
//            else if c >= 'a' && c <= 'z' {
//                c = (c - 'a' + 13) % 26 + 'a';
//            }
//            dest[i] = c;
//        }
        return self
    }
    
//    func <#name#>(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
}
// TODO: -- NSString对象
// MARK: -- 编码
class EnCodeing: NSString {
    func rot13(text:NSString) -> NSString {
//        let source:Character = text.cString(using: NSASCIIStringEncoding)
//        let dest:Character  = malloc(text)
        return self
    }
}
