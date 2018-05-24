//
//  CustomTabBarController.swift
//  mySwift
//
//  Created by 飞礼科技 on 2018/4/20.
//  Copyright © 2018年 飞礼科技. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConterll()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.addSubview(taBarCenterBtn)
    }
    private  var taBarCenterBtn:UIButton{
        let btn = UIButton(type: .custom)
        let width = KScreenWidth/5.0
        btn.frame = CGRect(x: width*2,y:0,width:width,height:self.tabBar.frame.size.height)
//        btn.frame.offsetBy(dx: width*2, dy: 0)
//        btn.setBackgroundImage((named: "tabbar_compose_button"), for: UIControlState.normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: .normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: .highlighted)
        btn.setImage(UIImage(named:"tabbar_compose_icon_add"), for: .normal)
        btn.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), for: .selected)
        btn.addTarget(self, action: #selector(addTabarClick), for: .touchUpInside)
        return btn
    }
    @objc func addTabarClick(btn:UIButton) {
        print("中间tabard按钮点击")
    }
    
    private  func setupConterll() -> Void {
        let path = Bundle.main.path(forResource: "MainVCSettings.json", ofType: nil)
        if let jsonData = path {
            let data = NSData.init(contentsOfFile: jsonData)
            let array = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
            //遍历数组
            do {
                for dict in array as! [[String: String]]
                {
                    
                    addOneChildVc(childVcName:dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!, selectedImageName:"")
                }
            }catch{
                print(error)
                addOneChildVc(childVcName:"HomeViewController", title: "首页", imageName: "tabbar_home", selectedImageName: "tabbar_home_selected")
                
                addOneChildVc(childVcName:"MessageViewController", title: "消息", imageName: "tabbar_message_center", selectedImageName: "tabbar_message_center_selected")
                
                addOneChildVc(childVcName:"DiscoverViewController", title: "发现", imageName: "tabbar_discover", selectedImageName: "tabbar_discover_selected")
                
                addOneChildVc(childVcName:"MeViewController", title: "我的", imageName: "tabbar_profile", selectedImageName: "tabbar_profile_selected")
            }
        }
        
    }
    
    func addOneChildVc(childVcName:String,title:String,imageName:String,selectedImageName:String) {
        
        tabBar.isTranslucent = false
        
        tabBar.tintColor = UIColor.red
        
        
        // 实例化VC
        var childVc = UIViewController()
        // 将sring类型转为 对象类型
        if let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String?
        {
            let classStringName = appName + "." + childVcName

            let conttrollerClass = NSClassFromString(classStringName) as! UIViewController.Type
            childVc = conttrollerClass.init()
        }
        //设置标题
        childVc.title = title;
         //设置图片
        childVc.tabBarItem.title = title
        childVc.tabBarItem.image = UIImage(named:imageName)
        childVc.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        
        //设置tabBarItem的默认文字的颜色
        let dict_normal = NSMutableDictionary(objects:[UIColor.black,UIFont.systemFont(ofSize: 10)], forKeys:[NSAttributedStringKey.foregroundColor as NSCopying, NSAttributedStringKey.font as NSCopying] , count:2)
        childVc.tabBarItem.setBadgeTextAttributes(dict_normal as? [String : Any], for: .normal)
        
        //设置tabBarItem的选中文字的颜色
        let dict_select = NSMutableDictionary(objects:[UIColor.orange,UIFont.systemFont(ofSize: 10)], forKeys:[NSAttributedStringKey.foregroundColor as NSCopying, NSAttributedStringKey.font as NSCopying])
        childVc.tabBarItem.setBadgeTextAttributes(dict_select as? [String : Any], for: .selected)
        
        // 添加导航栏
        let naviVC = CustomNavController(rootViewController:childVc)
        self.addChildViewController(naviVC)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
