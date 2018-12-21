//
//  TestController1.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/21.
//  Copyright © 2018 t19960804. All rights reserved.
//

import UIKit
import FSPagerView

class TestController1: UIViewController {
    let albumArray = ["gem_Album2","bigbang_Album","blackPink_Album","mayday_Album"]
    let pagerView: FSPagerView = {
        let view = FSPagerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(PagerViewCell.self, forCellWithReuseIdentifier: "PageViewCell")
        view.automaticSlidingInterval = 5
        return view
    }()
    lazy var albumCollectionView: UICollectionView = {
        let layOut = UICollectionViewFlowLayout()
        layOut.minimumInteritemSpacing = 5
        layOut.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layOut.itemSize = CGSize(width: self.view.frame.width, height: 60)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layOut)
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        pagerView.delegate = self
        pagerView.dataSource = self
        self.view.addSubview(pagerView)
        setUpPagerView()
    }
    func setUpPagerView(){
        pagerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        pagerView.leftAnchor.constraint(equalTo: self.view.leftAnchor,constant: 7).isActive = true
        pagerView.rightAnchor.constraint(equalTo: self.view.rightAnchor,constant: -7).isActive = true
        pagerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25).isActive = true
    }

}

extension TestController1: FSPagerViewDataSource,FSPagerViewDelegate{
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 4
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "PageViewCell", at: index) as! PagerViewCell
        cell.albumImageView.image = UIImage(named: albumArray[index])
        return cell
    }
    
}
