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
    
    ///创建Realm对象
    static func initRealm(_ fileUrl:URL) -> Realm {
        do {
            let lookAtRealm = try Realm(fileURL: fileUrl)
            return lookAtRealm
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    ///LookAt SearchTool Realm数据库
    static func lookAtSearchToolRealm() -> Realm {
        return LookAtRealmTool.initRealm(URL(fileURLWithPath: String.lookAtSearchToolSearchHistorySavePath))
    }
    
    ///add
    static func add(withObject object:Object, andRealm realm:Realm) {
        do {
            try realm.write({
                realm.add(object)
            })
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    ///delete
    static func delete(withObject object:Object, andRealm realm:Realm) {
        do {
            try realm.write({
                realm.delete(object)
            })
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }

    ///使用属性update
    static func update<T,U>(withOldAttribute oldAttribute:T, newAttribute:U, andRealm realm:Realm) {
        do {
            try realm.write({
                
            })
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
}
