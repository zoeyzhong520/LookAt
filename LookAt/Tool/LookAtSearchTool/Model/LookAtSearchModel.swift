//
//  LookAtSearchModel.swift
//  LookAt
//
//  Created by zhifu360 on 2018/10/8.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit
import RealmSwift

class LookAtSearchModel: BaseModel {

    //热门公司
    var hotCompanys:Array<Array<String?>>?
    
}

class LookAtSearchKeyword: Object {
    
    @objc dynamic var keyword:String?
}
