//
//  HomeLeaderboardTableViewCell.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/29.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

//MARK: 排行榜 cell

class HomeLeaderboardTableViewCell: UITableViewCell {

    ///collectionView
    fileprivate lazy var collectionView:UICollectionView = {
        let layout = HomeLeaderboardFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        collectionView.registerClassOf(HomeLeaderboardCollectionViewCell.self)
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    ///block
    var block:commonBlock<HomeModel?>?
    
    ///model
    var model:HomeModel? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func createView() {
        contentView.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: fontSizeScale(10), left: 0, bottom: fontSizeScale(10), right: 0))
        }
    }
    
    //设置Block
    fileprivate func createBlock(_ model:HomeModel?) {
        if block != nil {
            block!(model)
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

extension HomeLeaderboardTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:HomeLeaderboardCollectionViewCell = collectionView.dequeueReusableCell(withIndexPath: indexPath)
        cell.model = model
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        defer {
            collectionView.deselectItem(at: indexPath, animated: true)
        }
        
        createBlock(model)
    }
    
}
