//
//  HomeLeaderboardFlowLayout.swift
//  LookAt
//
//  Created by 陈琳 on 2018/10/3.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

//MARK: HomeLeaderboard FlowLayout

class HomeLeaderboardFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        self.itemSize = CGSize(width: fontSizeScale(165), height: fontSizeScale(180))
        self.sectionInset = UIEdgeInsets(top: fontSizeScale(10), left: fontSizeScale(15), bottom: fontSizeScale(0), right: fontSizeScale(15))
        self.minimumLineSpacing = fontSizeScale(10)
        self.minimumInteritemSpacing = fontSizeScale(15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
