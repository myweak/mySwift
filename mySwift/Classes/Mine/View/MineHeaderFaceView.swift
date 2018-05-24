//
//  MineHeaderFaceView.swift
//  mySwift
//
//  Created by 飞礼科技 on 2018/4/23.
//  Copyright © 2018年 飞礼科技. All rights reserved.
//

import UIKit

class MineHeaderFaceView: UIView {
    
    override init(frame: CGRect) {
        self.titleArray = []
        super.init(frame: frame)
        addUI() 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addUI() {
        self.addSubview(faceImageView)
        self.addSubview(nickNameLabel)
        self.addSubview(subLabel)
        self.addSubview(bottomBtn)
    }
    
    lazy var faceImageView = { ()->UIImageView in
        let imageView  = UIImageView()
        imageView.frame = CGRect(x:15,y:20,width:60,height:60)
        imageView.image = UIImage(named:"icon")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    

    
    lazy var nickNameLabel = { ()->UILabel in
        let label = UILabel.init(frame: CGRect(x:90,y:faceImageView.top(),width:200,height:30))
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "大佬"
        return label
    }()
    
    lazy var subLabel = { ()->UILabel in
        let label = UILabel.init(frame: CGRect(x:nickNameLabel.left(),y:nickNameLabel.bottom(),width:200,height:15))
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "广东老大"
        
        return label
    }()
    
    lazy var bottomBtn = { ()-> MineSelectRowBtnView in
        let rowBtn = MineSelectRowBtnView.init(frame: CGRect(x:0, y:self.frame.size.height - 60,width:KScreenWidth,height:60))
        rowBtn.backgroundColor = UIColor.init(white:0, alpha: 0.3)
        
        return rowBtn
    }()
    
     //重写 set get 方法
    var titleArray:NSArray{
        didSet{
            bottomBtn.addRowButton(titleArray: titleArray)
        }
    }
}

//  MARK:  底部view
//-------------------------------------------------------------------

// 代理方法定义
protocol MineSelectRowBtnViewDelegate {
    func fetchBackButtonAction(btn:UIButton)
}
// block
typealias tapBlock = (_ button : UIButton?) -> Void

class MineSelectRowBtnView: UIView {
    
    open  var tapBtnActionBlock: tapBlock?
    open  var delegate: MineSelectRowBtnViewDelegate?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addRowButton(titleArray:NSArray) ->  Void{
        for view in self.subviews {
            view.removeFromSuperview()
        }
        var i = 0
        let tapBtn_W = self.frame.size.width / CGFloat(titleArray.count)
        for title in titleArray as! [NSString] {
            let origin_X = CGFloat(i) * tapBtn_W
            let numberLabel = UILabel.init(frame: CGRect(x:origin_X,y:10,width:tapBtn_W,height:self.frame.size.height/3.0))
            numberLabel.text = "0"
            numberLabel.textAlignment = .center
            numberLabel.textColor = UIColor.black
            numberLabel.font = UIFont.systemFont(ofSize: 16)
            
            let titleLabel = UILabel.init(frame: CGRect(x:numberLabel.frame.origin.x,y:numberLabel.frame.size.height+10,width:tapBtn_W,height:self.frame.size.height/3.0))
            titleLabel.text = title  as String
            titleLabel.textAlignment = .center
            titleLabel.textColor = UIColor.gray
            titleLabel.font = UIFont.systemFont(ofSize: 14)
            
            let tapBtn = UIButton.init(frame: CGRect(x:numberLabel.frame.origin.x,y:0,width:tapBtn_W,height:self.frame.size.height))
            tapBtn.backgroundColor = UIColor.clear
            tapBtn.adjustsImageWhenDisabled = false
            tapBtn.adjustsImageWhenHighlighted = false
            tapBtn.isUserInteractionEnabled = true
            tapBtn.tag = i
            tapBtn.addTarget(self, action: #selector(addTapClick), for: UIControlEvents.touchUpInside)
            
            self.addSubview(numberLabel)
            self.addSubview(titleLabel)
            self.addSubview(tapBtn)
            
            if i == 1{
                tapBtn.line_left_xy(x:10,y: 15)
                tapBtn.line_left_xy(x:0,y: 15)
                tapBtn.line_top_xy(x: 15, y: 10)
                tapBtn.line_top_xy(x: 15, y: 0)
                tapBtn.line_right_xy(x: 10, y: 15)
                tapBtn.line_right_xy(x: 0, y: 15)
                tapBtn.line_bottom_xy(x: 15, y: 10)
                tapBtn.line_bottom_xy(x: 15, y: 0)
            }
            if i == 1{
                tapBtn.layer.masksToBounds = true
                tapBtn.layer.cornerRadius = 10
                tapBtn.layer.borderColor = UIColor.white.cgColor
                tapBtn.layer.borderWidth = 2
            }
            i += 1
        }
    }
    @objc func addTapClick(btn:UIButton) {
        if btn.tag == 1 {
        
            btn.removeAllLayer()
        }
        btn.line_bottom_xy(x: 15, y: 0)

        self.delegate?.fetchBackButtonAction(btn: btn)
        self.tapBtnActionBlock?(btn)
    }
    var finishBlock = {(button:UIButton) -> (UIButton) in
        print("test")
        return button;
    }


  
}
