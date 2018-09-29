//
//  HomeHotScrollView.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/29.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

//MARK: home hot scrollView

class HomeHotScrollView: UIView {

    ///titleLabel
    fileprivate lazy var titleLabel:UILabel = {
        let label = UILabel(withText: "HOT", font: UIFont.bigBoldFont, textColor: UIColor.orange)
        label.textAlignment = .center
        return label
    }()

    ///scrollView
    fileprivate lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        scrollView.contentSize = CGSize(width: SCREEN_WIDTH, height: 0)
        return scrollView
    }()
    
    ///titlesArray，标题数组
    var titlesArray:[String?]? {
        didSet {
            configScrollView()
        }
    }
    
    ///block
    var block:commonBlock<String?>?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //UI
    fileprivate func createView() {
        addSubview(titleLabel)
        addSubview(scrollView)
        
        //constraints
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(fontSizeScale(60))
        }
        
        scrollView.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.right)
            make.top.bottom.right.equalToSuperview()
        }
    }
    
    //config scrollView
    fileprivate func configScrollView() {
        guard let tmpTitlesArray = titlesArray else {
            fatalError("titlesArray is nil")
        }
        
        var contentWidth:CGFloat = 0//scrollView可滚动的宽度范围
        var subLabelW:CGFloat = 0//宽度总和
        let margin:CGFloat = fontSizeScale(10)//间距
        
        for i in 0..<tmpTitlesArray.count {
            let titleText = tmpTitlesArray[i]
            let label = UILabel(withText: titleText, font: UIFont.smallFont, textColor: UIColor.blackTextColor)
            label.textAlignment = .center
            label.backgroundColor = UIColor.lineColor
            
            let labelW:CGFloat = label.textWidth()+margin
            let labelH:CGFloat = fontSizeScale(20)
            
            subLabelW += labelW//求得宽度和
            contentWidth += margin//累加上间距
            
            label.setCornerRadius(withCornerRadius: labelH/2)
            scrollView.addSubview(label)
            
            label.snp.makeConstraints { (make) in
                make.left.equalTo(CGFloat(i+1)*margin+subLabelW-labelW)//若为第二个标签，距离左边顶点的距离 = 两个间距之和 + 第一个标签的宽度
                make.centerY.equalToSuperview()
                make.size.equalTo(CGSize(width: labelW, height: labelH))
            }
            
            //手势
            label.tag = i
            label.isUserInteractionEnabled = true
            label.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapClick(_:))))
        }
        
        contentWidth += subLabelW+margin
        
        //contentSize
        scrollView.contentSize = CGSize(width: contentWidth, height: 0)
    }
    
    //点击事件
    @objc fileprivate func tapClick(_ gesture:UITapGestureRecognizer) {
        guard let label = gesture.view as? UILabel else {
            fatalError("tap.View is nil")
        }
        
        if block != nil {
            block!(label.text)
        }
    }
}
