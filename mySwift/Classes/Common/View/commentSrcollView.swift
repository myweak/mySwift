//
//  commentScorllView.swift
//  mySwift
//
//  Created by 飞礼科技 on 2018/5/14.
//  Copyright © 2018年 飞礼科技. All rights reserved.
//

import UIKit

class commentSrcollView: UICollectionView {
    
    override init(frme:CGRect){
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addUI(){
        let layout = UICollectionViewFlowLayout.init()
        self.collectionViewLayout = layout
    }
    
}

//lazy var collection = {()->}
