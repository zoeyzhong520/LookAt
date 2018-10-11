//
//  String+Extension.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/28.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

extension String {
    
    ///homeBannerImagePath1
    static var homeBannerImagePath1:String {
        return "http://www.91danji.com/upload/20121126/20121126112350101.jpg"
    }
    
    ///homeBannerImagePath2
    static var homeBannerImagePath2:String {
        return "http://i3.3conline.com/images/piclib/201103/16/batch/1/88597/1300289351754y50khmcg9j.jpg"
    }
    
    ///homeBannerImagePath3
    static var homeBannerImagePath3:String {
        return "http://dik.img.lgdsy.com/pic/46/31942/cc60410147be9066_1680x1050.jpg"
    }
    
    ///homeBannerImagePath4
    static var homeBannerImagePath4:String {
        return "http://pic28.photophoto.cn/20130801/0006019338033465_b.jpg"
    }
    
    ///LookAt SearchTool搜索记录保存位置
    static var lookAtSearchToolSearchHistorySavePath:String {
        return (NSHomeDirectory() as NSString).appendingPathComponent("Documents/lookAtSearchToolSearchHistory.realm")
    }
}
