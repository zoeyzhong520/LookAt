//
//  HomeHotTableViewCell.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/29.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

//MARK: hot cell

class HomeHotTableViewCell: UITableViewCell {

    ///hotScrollView
    fileprivate lazy var hotScrollView:HomeHotScrollView = {
        let scrollView = HomeHotScrollView()
        scrollView.block = { [weak self] clickText in
            log(message: clickText)
        }
        return scrollView
    }()
    
    ///buttonsView
    fileprivate lazy var buttonsView:UIView = {
        return UIView()
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //UI
    fileprivate func createView() {
        contentView.addSubview(hotScrollView)
        contentView.addSubview(buttonsView)
        
        //constraints
        hotScrollView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(NAVIGATIONBAR_HEIGHT)
        }
        
        buttonsView.snp.makeConstraints { (make) in
            make.top.equalTo(hotScrollView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        configButtonsView()
        
        //hot scrollView
        hotScrollView.titlesArray = ["12432三个","dsvfsbvfsv","稳定","32454546","山东分公司的 v","asfavcads"]
    }
    
    //config buttons view
    fileprivate func configButtonsView() {
        let btnW:CGFloat = SCREEN_WIDTH / 4
        let btnH:CGFloat = btnW
        
        let images = ["","","","","","","",""]
        let names = ["1","2","3","4","5","6","7","8"]
        
        for i in 0..<images.count {
            let button = LookAtButton()
            button.titleText = names[i]
//            button.imageName = images[i]
            button.frame = CGRect(x: btnW*CGFloat(i%4), y: btnH*CGFloat(i/4), width: btnW, height: btnH)
            button.tag = i
            button.block = { [weak self] in
                log(message: button.tag)
            }
            buttonsView.addSubview(button)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
