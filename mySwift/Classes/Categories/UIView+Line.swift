//
//  Line.swift
//  mySwift
//
//  Created by 飞礼科技 on 2018/5/1.
//  Copyright © 2018年 飞礼科技. All rights reserved.
//

import UIKit
extension UIView{
//    let color:CGColor = UIColor.red.cgColor
    
  
    func removeAllLayer() -> () {
        let array:NSArray = getAllLayer()
        
        for layer in  array as! [CALayer] {
            layer.removeFromSuperlayer()
        }
    }
    func getAllLayer() -> (NSArray) {
        return  self.layer.sublayers! as NSArray 
    }
    

    func line_left_xy(x:CGFloat, y:CGFloat) -> () {
        let layer = CALayer()
        layer.backgroundColor = UIColor.red.cgColor
        layer.frame = CGRect(x:x,y:y,width:0.5,height:self.height()-2*y)
        self.layer .addSublayer(layer)
    }
    func line_right_xy(x:CGFloat, y:CGFloat) -> () {
        let layer = CALayer()
        layer.backgroundColor = UIColor.red.cgColor
        layer.frame = CGRect(x:self.width()-x,y:y,width:0.5,height:self.height()-2*y)
        self.layer .addSublayer(layer)
    }
    func line_top_xy(x:CGFloat, y:CGFloat) -> () {
        let layer = CALayer()
        layer.backgroundColor = UIColor.red.cgColor
        layer.frame = CGRect(x:x,y:y,width:self.width()-2*x,height:0.5)
        self.layer .addSublayer(layer)
    }
    func line_bottom_xy(x:CGFloat, y:CGFloat) -> () {
        let layer = CALayer()
        layer.backgroundColor = UIColor.red.cgColor
        layer.frame = CGRect(x:x,y:self.height()-y,width:self.width()-2*x,height:0.5)
        self.layer .addSublayer(layer)
    }
    
    func line_left() -> () {
        let layer = CALayer()
        layer.backgroundColor = UIColor.red.cgColor
        layer.frame = CGRect(x:0,y:0,width:0.5,height:self.height())
        self.layer .addSublayer(layer)
    }
    func line_right() -> () {
        let layer = CALayer()
        layer.backgroundColor = UIColor.red.cgColor
        layer.frame = CGRect(x:self.width(),y:0,width:0.5,height:self.height())
        self.layer .addSublayer(layer)
    }
    func line_top() -> () {
        let layer = CALayer()
        layer.backgroundColor = UIColor.red.cgColor
        layer.frame = CGRect(x:0,y:0,width:self.width(),height:0.5)
        self.layer .addSublayer(layer)
    }
    func line_bottom() -> () {
        let layer = CALayer()
        layer.backgroundColor = UIColor.red.cgColor
        layer.frame = CGRect(x:0,y:self.height(),width:self.width(),height:0.5)
        self.layer .addSublayer(layer)
    }
}
