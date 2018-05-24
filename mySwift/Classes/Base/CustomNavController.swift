//
//  CustomNavController.swift
//  mySwift
//
//  Created by 飞礼科技 on 2018/4/20.
//  Copyright © 2018年 飞礼科技. All rights reserved.
//

import UIKit
public enum NavigationGestureType : Int {
    case dragType
    case panType
    
}
class CustomNavController: UINavigationController,UIGestureRecognizerDelegate {

    
    let gesture:UIPanGestureRecognizer? = nil
    let navigationGestureType:NavigationGestureType? = nil
    var popGestureDeleage:UIGestureRecognizerDelegate? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       popGestureDeleage = self.interactivePopGestureRecognizer?.delegate
        
    }
    
    func addGesture() -> () {
        if (gesture == nil) && (popGestureDeleage!.isKind(of: UIPercentDrivenInteractiveTransition.self)){
            if navigationGestureType == NavigationGestureType.dragType{
//                gesture = UIScreenEdgePanGestureRecognizer.init(target: popGestureDeleage!, action: <#T##Selector?#>)
                let a:NSString = "a"
            }else{
                
            }
            

        }
    }
    
    
//    lazy var gesture = {()-> UIPanGestureRecognizer in
//        let pan = <#value#>
//
//
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
