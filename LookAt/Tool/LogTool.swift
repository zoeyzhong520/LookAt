//
//  LogTool.swift
//  LookAt
//
//  Created by 陈琳 on 2018/9/28.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

///自定义log输出
func log<T>(message:T, file:String = #file, method:String = #function, line:Int = #line) {
    #if DEBUG
    print("\((file as NSString).lastPathComponent)[\(line)], \(method) -> \(message)")
    #endif
}

