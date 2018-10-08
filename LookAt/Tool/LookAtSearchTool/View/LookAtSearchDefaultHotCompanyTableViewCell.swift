//
//  LookAtSearchDefaultTableViewCell.swift
//  LookAt
//
//  Created by zhifu360 on 2018/10/8.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

//MARK: LookAtSearch Default hot company TableViewCell

class LookAtSearchDefaultHotCompanyTableViewCell: UITableViewCell {

    ///model
    var model:Array<String?>? {
        didSet {
            configCompanysView()
        }
    }
    
    ///buttonsArray，存放UIButton的数组
    fileprivate var buttonsArray = [UIButton]()
    
    ///block
    var block:commonBlock<String?>?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //UI
    fileprivate func createView() {
        
    }
    
    //设置block
    fileprivate func createBlock(_ buttonTitle:String?) {
        if block != nil {
            block!(buttonTitle)
        }
    }
    
    //config companysView
    fileprivate func configCompanysView() {
        let buttonW:CGFloat = SCREEN_WIDTH/3
        let buttonH:CGFloat = bounds.size.height
        
        guard let companysArray = model else {
            fatalError("model is nil")
        }
        
        if buttonsArray.count == companysArray.count {
            return
        }
        
        for i in 0..<companysArray.count {
            let button = UIButton(withTitle: companysArray[i], titleColor: UIColor.blackTextColor, normalImage: nil, target: self, action: #selector(buttonClick(_:)))
            button.tag = i
            button.frame = CGRect(x: buttonW*CGFloat(i), y: 0, width: buttonW, height: buttonH)
            button.titleLabel?.font = UIFont.mediumFont
            contentView.addSubview(button)
            
            //赋值数组
            buttonsArray.append(button)
        }
    }
    
    //点击事件
    @objc fileprivate func buttonClick(_ button:UIButton) {
        createBlock(button.titleLabel?.text)
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
