//
//  ViewController.swift
//  mySwift
//
//  Created by 飞礼科技 on 2018/4/19.
//  Copyright © 2018年 飞礼科技. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var dataArray = ["1","2","3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabelView = UITableView(frame: CGRect(x:0,y:10,width:self.view.bounds.width, height:self.view.bounds.height-100))

//        let tabelView:UITableView = UITableView.init()
//        tabelView.frame = CGRect(x:0,y:10,width:self.view.bounds.width, height:self.view.bounds.height-100)
        tabelView.delegate = self
        tabelView.dataSource = self
        tabelView.tableFooterView = UIView()
        self.view.addSubview(tabelView)
        tabelView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "11")


        let 老肖 = "曾"
        let name:String? = "老王"
        let age = 80
        let location = "隔壁"
        print(location + (name ?? "a") + String(age) + "岁")
        //  '\(变量名)' 会自动转换拼接
        print("\(location)\(name)\(age)岁")
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "11", for: indexPath)
       cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }

}

