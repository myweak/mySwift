//
//  MeBodyTableViewCell.swift
//  mySwift
//
//  Created by 飞礼科技 on 2018/4/21.
//  Copyright © 2018年 飞礼科技. All rights reserved.
//

import UIKit

class MeBodyTableViewCell: UITableViewCell {

    
    class func blankCell() ->MeBodyTableViewCell {
       let cell = MeBodyTableViewCell.init(style: .value1, reuseIdentifier: "blankCell")
        cell.textLabel?.text = ""
        cell.detailLabel.text = ""
        cell.accesImageView = UIImageView()
        cell.backgroundColor = UIColor.gray
        return cell;
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    class func blankCellWithID(tableView:UITableView,indexPath:NSIndexPath,Identifier:NSString) ->MeBodyTableViewCell {
        var cell:MeBodyTableViewCell! = tableView.dequeueReusableCell(withIdentifier: Identifier as String) as? MeBodyTableViewCell
        if cell == nil{
            cell = MeBodyTableViewCell.init(style: .value1, reuseIdentifier: Identifier as String)
            cell.addSubview(cell.subLabel)
            cell.addSubview(cell.detailLabel)
            cell.addSubview(cell.accesImageView)
        }
        return cell
    }
    override init(style:UITableViewCellStyle,reuseIdentifier:String?) {
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        self.selectionStyle = .none
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")

    }
    lazy var subLabel = { ()->UILabel in
        let label = UILabel(frame:CGRect(x:0,y:0,width:150,height:KCellHight_default))
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = ""
        return label
    }()
    
    lazy var detailLabel = { ()->UILabel in
        let label = UILabel(frame:CGRect(x:KScreenWidth-125,y:0,width:100,height:KCellHight_default))
        label.textColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .right
        label.text = "开通"
        return label
    }()
   public lazy var accesImageView = { ()-> UIImageView in
        let imageView = UIImageView.init(frame:CGRect(x:KScreenWidth-25,y:0,width:25,height:KCellHight_default))
//    let imageView = UIImageView(image:#imageLiteral(resourceName: "arrowImage"))
        imageView.frame = CGRect(x:KScreenWidth-25,y:0,width:25,height:KCellHight_default)
        imageView.contentMode = .center
        return imageView
    }()

    func setSubTitleLable(indexPath:NSIndexPath,subTitle:NSString) {
        var title_W:CGFloat = 0
        title_W = textSize(text :(self.textLabel?.text)! , font : (self.textLabel?.font)! , maxSize : CGSize(width:KScreenWidth,height:KCellHight_default)).width
        let leftTitleLabel_x = 60 + title_W
//        subLabel.frame = CGRect(x:leftTitleLabel_x,y:0,width:subLabel.frame.size.width,height:subLabel.frame.size.height)
        subLabel.frame.origin.x = leftTitleLabel_x
        if indexPath.row%3 == 0 {
            subLabel.text = subTitle as String
        }
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
