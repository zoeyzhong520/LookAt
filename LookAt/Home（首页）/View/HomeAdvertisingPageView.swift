//
//  HomeAdvertisingPageView.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/28.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

//MARK: Ad page

class HomeAdvertisingPageView: BaseView {

    ///scrollView
    fileprivate lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView(frame: self.bounds)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        scrollView.contentOffset = CGPoint(x: SCREEN_WIDTH, y: 0)
        scrollView.contentSize = CGSize(width: SCREEN_WIDTH*3, height: 0)
        scrollView.delegate = self
        return scrollView
    }()
    
    ///pageControl
    fileprivate lazy var pageControl:UIPageControl = {
        let pageControl = UIPageControl(frame: .zero)
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    ///leftImageView
    fileprivate lazy var leftImageView:UIImageView = {
        let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: self.bounds.size.height))
        return leftImageView
    }()
    
    ///centerImageView
    fileprivate lazy var centerImageView:UIImageView = {
        let centerImageView = UIImageView(frame: CGRect(x: SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: self.bounds.size.height))
        return centerImageView
    }()
    
    ///rightImageView
    fileprivate lazy var rightImageView:UIImageView = {
        let rightImageView = UIImageView(frame: CGRect(x: SCREEN_WIDTH*2, y: 0, width: SCREEN_WIDTH, height: self.bounds.size.height))
        return rightImageView
    }()
    
    ///imageCount
    fileprivate var imageCount:Int = 0
    
    ///currentImageIndex
    fileprivate var currentImageIndex:Int = 0
    
    ///timer
    fileprivate var timer:Timer?
    
    ///imagesPath
    var imagesPathArray:[String?]? {
        didSet {
            configScrollView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //UI
    fileprivate func createView() {
        addSubview(self.scrollView)
        scrollView.addSubview(leftImageView)
        scrollView.addSubview(centerImageView)
        scrollView.addSubview(rightImageView)
        
        addSubview(self.pageControl)
        
        //添加约束
        self.pageControl.snp.makeConstraints { (make) in
            make.left.right.centerY.equalToSuperview()
            make.height.equalTo(fontSizeScale(30))
        }
    }
    
    //config scrollView
    fileprivate func configScrollView() {
        guard let tmpImagesPath = imagesPathArray else {
            fatalError("imagesPath不能为nil")
        }
        
        //设置默认图片
        centerImageView.kf.setImage(with: URL(string: tmpImagesPath[currentImageIndex] ?? ""), placeholder: UIImage.placeholderImage)
        leftImageView.image = UIImage.placeholderImage
        rightImageView.image = UIImage.placeholderImage
        
        //imageCount
        imageCount = tmpImagesPath.count
        
        //设置contentSize
        scrollView.contentSize = CGSize(width: CGFloat(tmpImagesPath.count)*SCREEN_WIDTH, height: 0)
        
        //pageControl numberOfPages
        pageControl.numberOfPages = tmpImagesPath.count
        
        //timer
        startTimer()
    }
    
    //reload images
    fileprivate func reloadImages() {
        guard let tmpImagesPath = imagesPathArray else {
            fatalError("imagesPath不能为nil")
        }
        
        var leftImageIndex:Int = 0
        var rightImageIndex:Int = 0
        
        let offSet:CGPoint = scrollView.contentOffset
        if offSet.x > SCREEN_WIDTH {//向右滑动
            currentImageIndex = (currentImageIndex+1)%imageCount
        } else if offSet.x < SCREEN_WIDTH {//向左滑动
            currentImageIndex = (currentImageIndex+imageCount-1)%imageCount
        }
        
        leftImageIndex = (currentImageIndex+imageCount-1)%imageCount
        rightImageIndex = (currentImageIndex+1)%imageCount
        
        //设置图片
        centerImageView.kf.setImage(with: URL(string: tmpImagesPath[currentImageIndex] ?? ""), placeholder: UIImage.placeholderImage)
        leftImageView.kf.setImage(with: URL(string: tmpImagesPath[leftImageIndex] ?? ""), placeholder: UIImage.placeholderImage)
        rightImageView.kf.setImage(with: URL(string: tmpImagesPath[rightImageIndex] ?? ""), placeholder: UIImage.placeholderImage)
    }
    
    //设置timer
    fileprivate func startTimer() {
        if timer == nil {
            timer = Timer(timeInterval: 2, target: self, selector: #selector(timeMove), userInfo: nil, repeats: true)
            RunLoop.main.add(timer!, forMode: .common)
        }
    }
    
    fileprivate func stopTimer() {
        if let tmpTimer = timer {
            tmpTimer.invalidate()
        }
        timer = nil
    }
    
    @objc fileprivate func timeMove() {
        scrollView.setContentOffset(CGPoint(x: SCREEN_WIDTH*2, y: 0), animated: true)
    }
}

extension HomeAdvertisingPageView:UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        reloadImages()
        scrollView.contentOffset = CGPoint(x: SCREEN_WIDTH, y: 0)
        pageControl.currentPage = currentImageIndex
        print("currentImageIndex = \(currentImageIndex)")
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        reloadImages()
        scrollView.contentOffset = CGPoint(x: SCREEN_WIDTH, y: 0)
        pageControl.currentPage = currentImageIndex
        print("currentImageIndex = \(currentImageIndex)")
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        stopTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        startTimer()
    }
}
