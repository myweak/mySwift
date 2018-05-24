//
//  UIView+Frame.swift
//  mySwift
//
//  Created by 飞礼科技 on 2018/4/24.
//  Copyright © 2018年 飞礼科技. All rights reserved.
//

import UIKit


extension UIView{
    
    // 左边
    func left() -> CGFloat {
        return self.frame.origin.x
    }
    func left(left: CGFloat) {
        var rect = self.frame
        rect.origin.x = left
        self.frame = rect
    }
    
    // 右边
    func right() -> CGFloat {
        return self.frame.origin.x + width()
    }
    func right(right: CGFloat) {
        var rect = self.frame
        rect.origin.x = right - width();
        self.frame = rect
    }

    // 顶部
    func top() -> CGFloat {
        return self.frame.origin.y
    }
    func top(top: CGFloat) {
        var rect = self.frame
        rect.origin.y = top;
        self.frame = rect
    }
    // 底部
    func bottom() -> CGFloat {
        return self.frame.origin.y + height()
    }
    func bottom(bottom: CGFloat) {
        var rect = self.frame
        rect.origin.y = bottom - height()
        self.frame = rect
    }
    // 宽
    func width() -> CGFloat {
        return  self.frame.size.width
    }
    func width(width: CGFloat) {
        var rect = self.frame
        rect.size.width = width;
        self.frame = rect
    }
    // 高
    func height() -> CGFloat {
        return  self.frame.size.height
    }
    func height(height: CGFloat) {
        var rect = self.frame
        rect.size.height = height;
        self.frame = rect
    }

}
