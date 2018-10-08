//
//  LookAtTabBar.swift
//  LookAt
//
//  Created by zhifu360 on 2018/10/8.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

//MARK: LookAt TabBar 标签栏

class LookAtTabBar: UIView {

    ///line
    fileprivate lazy var line:UIView = {
        let view = UIView(withBackgroundColor: UIColor.green)
        return view
    }()

    ///topLine
    fileprivate lazy var topLine:UIView = {
        let view = UIView(withBackgroundColor: UIColor.lineColor)
        return view
    }()
    
    ///bottomLine
    fileprivate lazy var bottomLine:UIView = {
        let view = UIView(withBackgroundColor: UIColor.lineColor)
        return view
    }()
    
    fileprivate let buttonW:CGFloat = SCREEN_WIDTH/3
    
    ///selectedButton 选中的按钮
    fileprivate var selectedButton:UIButton!
    
    ///titlesArray 标题数组
    fileprivate var titlesArray = [String]()
    
    init(frame: CGRect, titlesArray:[String]) {
        super.init(frame: frame)
        self.titlesArray = titlesArray
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //UI
    fileprivate func createView() {
        let buttonH:CGFloat = bounds.size.height
        
        for i in 0..<titlesArray.count {
            let button = UIButton(withTitle: titlesArray[i], titleColor: UIColor.grayTextColor, normalImage: nil, target: self, action: #selector(buttonClick(_:)))
            button.titleLabel?.font = UIFont.mediumFont
            button.tag = i
            button.frame = CGRect(x: buttonW*CGFloat(i), y: 0, width: buttonW, height: buttonH)
            addSubview(button)
            
            if i == 0 {
                button.setTitleColor(UIColor.blackTextColor, for: .normal)
                selectedButton = button
            }
        }
        
        addSubview(line)
        addSubview(topLine)
        addSubview(bottomLine)
        
        //constraints
        line.snp.makeConstraints { (make) in
            make.centerX.equalTo(selectedButton)
            make.size.equalTo(CGSize(width: fontSizeScale(30), height: fontSizeScale(2)))
            make.bottom.equalToSuperview()
        }
        
        topLine.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(1))
        }
        
        bottomLine.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(fontSizeScale(1))
        }
    }
    
    //点击事件
    @objc fileprivate func buttonClick(_ button:UIButton) {
        if selectedButton != button {
            selectedButton.setTitleColor(UIColor.grayTextColor, for: .normal)
            button.setTitleColor(UIColor.blackTextColor, for: .normal)
        }
        
        selectedButton = button
        
        //设置line的位置
        UIView.animate(withDuration: ANIMATE_DURATION) {
            self.line.transform = CGAffineTransform.identity.translatedBy(x: self.buttonW*CGFloat(button.tag), y: 0)
        }
    }
}
