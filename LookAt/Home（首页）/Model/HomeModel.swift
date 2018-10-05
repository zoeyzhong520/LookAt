//
//  HomeModel.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/25.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

class HomeModel: BaseModel {

    @objc var companyName:String?
    @objc var companyLocation:String?
    @objc var companyInfo:String?
    
    @objc var companyHonor:String?
    @objc var companyLogo:String?
    
    //排行榜
    @objc var homeLeaderboardImg:String?
    @objc var homeLeaderboardTitle:String?
    @objc var homeLeaderboardInfo:String?
    
    var homeLeaderboardCompanys:Array<String?>?
    
    //企业专题
    @objc var homeBusinessTopicTitle:String?
    @objc var homeBusinessTopicSubTitle:String?
    @objc var homeBusinessTopicImg:String?
}
