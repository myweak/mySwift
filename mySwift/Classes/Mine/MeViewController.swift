//
//  MeViewController.swift
//  mySwift
//
//  Created by 飞礼科技 on 2018/4/20.
//  Copyright © 2018年 飞礼科技. All rights reserved.
//

import UIKit

class MeViewController: BaseViewController,MineSelectRowBtnViewDelegate{

    
//    let userFace:String = "头像"
    let dataArray = ["头像","新的好友","新手任务","我的故事册","我的点评","我的赞","微博钱包","熊抱守护者","微博运动","免流量","客户中心","草稿箱"]
    let Identifier:String = "MeViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rect:CGRect = CGRect(x:0,y:0,width:KScreenWidth,height:KScreenHeight)
        self.tableView.frame = rect;
//        self.tableView.register(MeBodyTableViewCell.classForCoder(), forCellReuseIdentifier: Identifier)
        
        headerView.titleArray = ["微博","关注","粉丝"]
        let btn:MineSelectRowBtnView = headerView.bottomBtn
        btn.delegate = self;
        btn.tapBtnActionBlock = {button in
            print("按钮点击block: \((button as! UIButton).tag)")
        }

    }
    
    func fetchBackButtonAction(btn: UIButton) {
        print("按钮点击delegate: \((btn as! UIButton).tag)")

    }
    
    
    lazy var headerView = { ()-> MineHeaderFaceView in
        let view = MineHeaderFaceView.init(frame: CGRect(x:0,y:0,width:KScreenWidth,height:150))
    
    return view
    }()
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return headerView.frame.size.height}
        return CGFloat(KCellHight_default)
    }
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
           let cell = MeBodyTableViewCell.blankCell()
            cell.backgroundColor = UIColor.white
            cell.addSubview(headerView)
            return cell
        }
        
//        var cell = tableView.dequeueReusableCell(withIdentifier: Identifier, for: indexPath)
//        var cell:MeBodyTableViewCell! = tableView.dequeueReusableCell(withIdentifier: Identifier) as? MeBodyTableViewCell
//        if cell == nil{
//            cell = MeBodyTableViewCell.init(style: .value1, reuseIdentifier: Identifier)
//        }
        
        let cell = MeBodyTableViewCell.blankCellWithID(tableView: tableView as UITableView, indexPath: indexPath as NSIndexPath, Identifier: Identifier as NSString)
        
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.imageView?.image = UIImage(named:"profile_share")
//        cell.detailTextLabel?.text = "完成任务，抽取大奖"
//        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 10)
//        cell.accessoryType = .none
        cell.setSubTitleLable(indexPath: indexPath as NSIndexPath, subTitle: "我是副标题")
        if indexPath.row%2 == 0 { // arrowImage
            cell.detailLabel.text = "我是右边的"
            let image = UIImage(named:"arrowImage")
            cell.accesImageView.image = image
            
        }


        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
