//
//  LookAtConfig.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/26.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

/*
 尺寸
 */
///screen width
let SCREEN_WIDTH = UIScreen.main.bounds.size.width

///screen height
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

///screen rect
let SCREEN_RECT = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)

///statusBar height
let STATUSBAR_HEIGHT = UIApplication.shared.statusBarFrame.height

///navigationBar height
let NAVIGATIONBAR_HEIGHT:CGFloat = 44

///content height
let CONTENT_HEIGHT = SCREEN_HEIGHT - STATUSBAR_HEIGHT - NAVIGATIONBAR_HEIGHT

///searchBar height
let SEARCHBAR_HEIGHT:CGFloat = 34

///cornerRadius
let CORNERRADIUS:CGFloat = 5

///自适应字体大小
let fontSizeScale:(CGFloat) -> CGFloat = { scale in
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.fontSizeScale(withScale: scale)
}

///home banner height
let HOME_BANNER_HEIGHT = fontSizeScale(180) + STATUSBAR_HEIGHT

/*
 设备
 */
///is pad
let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad

///is iphone
let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone

///is retina
let IS_RETINA = UIScreen.main.scale >= 2.0

///screen max length
let SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)

///screen min length
let SCREEN_MIN_LENGTH = min(SCREEN_WIDTH, SCREEN_HEIGHT)

/*
 机型判断
 */
///iphone4s
let iPhone4s = IS_IPHONE && SCREEN_MAX_LENGTH < 568.0

///iphonese
let iPhoneSE = IS_IPHONE && SCREEN_MAX_LENGTH == 568.0

///iphone8
let iPhone8 = IS_IPHONE && SCREEN_MAX_LENGTH == 667.0

///iphone8p
let iPhone8P = IS_IPHONE && SCREEN_MAX_LENGTH == 736.0

///iphonex
let iPhoneX = IS_IPHONE && SCREEN_MAX_LENGTH == 812.0

///iphonexs
let iPhoneXS = IS_IPHONE && SCREEN_MAX_LENGTH == 812.0

///iphonexsmax
let iPhoneXSMax = IS_IPHONE && SCREEN_MAX_LENGTH == 896.0

///iphonexr
let iPhoneXR = IS_IPHONE && SCREEN_MAX_LENGTH == 896.0

