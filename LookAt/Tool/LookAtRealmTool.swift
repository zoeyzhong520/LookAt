//
//  LookAtRealmTool.swift
//  LookAt
//
//  Created by zhifu360 on 2018/10/11.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit
import RealmSwift

//MARK: LookAt RealmTool

class LookAtRealmTool: NSObject {
    
    ///获取Realm
    class func realm() -> Realm {
        return try! Realm()
    }
    
    ///存储搜索keyword关键词
    class func saveKeyword(withKeyword keyword:String) {
        
        if keyword.count <= 0 || keyword == "" || (keyword as NSString).range(of: " ").length > 0 {
            return
        }
        
        //判断是否重复添加
        if self.realm().objects(LookAtSearchKeyword.self).filter("keyword == %@", keyword).isEmpty == false {
            return
        }
        
        let model = LookAtSearchKeyword()
        model.keyword = keyword
        
        try! self.realm().write {
            self.realm().add(model)
        }
    }
}
