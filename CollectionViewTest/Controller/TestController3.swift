//
//  TestController3.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/21.
//  Copyright © 2018 t19960804. All rights reserved.
//

import UIKit
import FSPagerView

class TestController3: UIViewController {
    let albumArray_Roulette = ["gem_Album2","bigbang_Album","blackPink_Album","mayday_Album"]
    //
    let albumArray_Recommand = ["allan_Album","justin_Album","lee_Album","linkinpark_Album","cnblue_Album"]
    let singerName_Recommand = ["Alan Walker","Justin Beiber","李榮浩","聯合公園","CNBLUE"]
    let albumName_Recommand = ["Faded","Purpose","模特","Minutes To Midnight","First Step"]
    //
    let album_Category_1 = ["華語","歐美","日韓","綜合"]
    let album_Category_2 = ["流行","說唱藝術","動漫","演奏"]

    //
    let recommandCellID = "RecommandCellID"
    let categoryCellID = "CategoryCellID"
    lazy var myScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        //滾動區域大小
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1200)
        scrollView.bounces = false
        return scrollView
    }()
    let containerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let pagerView: FSPagerView = {
        let view = FSPagerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(PagerViewCell.self, forCellWithReuseIdentifier: "PageViewCell")
        view.automaticSlidingInterval = 5
        return view
    }()
    let recommend_Label = CustomLabel(content: "推薦歌單", fontSize: 18)
    let allSongs_Label = CustomLabel(content: "全部歌單", fontSize: 16)
    lazy var recommandSons_CollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.view.frame.width - 10) / 2.5, height: (self.view.frame.width - 10) / 1.8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HotSaleCell.self, forCellWithReuseIdentifier: recommandCellID)
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        return collectionView
    }()
    lazy var categoryTableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RecommandSongsCell.self, forCellReuseIdentifier: categoryCellID)
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        pagerView.delegate = self
        pagerView.dataSource = self
        recommandSons_CollectionView.delegate = self
        recommandSons_CollectionView.dataSource = self
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        self.view.addSubview(myScrollView)
        //這裡用self.view會滑不起來
        myScrollView.addSubview(containerView)
        myScrollView.addSubview(pagerView)
        myScrollView.addSubview(recommend_Label)
        myScrollView.addSubview(allSongs_Label)
        myScrollView.addSubview(recommandSons_CollectionView)
        myScrollView.addSubview(categoryTableView)
        
        
        setUpScrollView()
        setUpPagerView()
        setUpRecommandSongs()
        setUpCategoryTableView()
    }
    func setUpScrollView(){
        myScrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        myScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        myScrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        myScrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        containerView.heightAnchor.constraint(equalToConstant: 1200).isActive = true
        containerView.widthAnchor.constraint(equalTo: myScrollView.widthAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: myScrollView.topAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: myScrollView.centerXAnchor).isActive = true
    }
    func setUpPagerView(){
        pagerView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        pagerView.leftAnchor.constraint(equalTo: containerView.leftAnchor,constant: 7).isActive = true
        pagerView.rightAnchor.constraint(equalTo: containerView.rightAnchor,constant: -7).isActive = true
        pagerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25).isActive = true
    }
    func setUpRecommandSongs(){
        recommend_Label.topAnchor.constraint(equalTo: pagerView.bottomAnchor, constant: 15).isActive = true
        recommend_Label.leftAnchor.constraint(equalTo: pagerView.leftAnchor).isActive = true
        
        allSongs_Label.topAnchor.constraint(equalTo: pagerView.bottomAnchor, constant: 15).isActive = true
        allSongs_Label.rightAnchor.constraint(equalTo: pagerView.rightAnchor).isActive = true
        
        
        recommandSons_CollectionView.topAnchor.constraint(equalTo: recommend_Label.bottomAnchor, constant: 10).isActive = true
        recommandSons_CollectionView.leftAnchor.constraint(equalTo: pagerView.leftAnchor).isActive = true
        recommandSons_CollectionView.rightAnchor.constraint(equalTo: pagerView.rightAnchor).isActive = true
        recommandSons_CollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.23).isActive = true
    }
    func setUpCategoryTableView(){
        categoryTableView.topAnchor.constraint(equalTo: recommandSons_CollectionView.bottomAnchor, constant: 10).isActive = true
        categoryTableView.leftAnchor.constraint(equalTo: pagerView.leftAnchor).isActive = true
        categoryTableView.rightAnchor.constraint(equalTo: pagerView.rightAnchor).isActive = true
        categoryTableView.heightAnchor.constraint(equalToConstant: 600).isActive = true

    }

}
extension TestController3:FSPagerViewDataSource,FSPagerViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource{
    
    
    //MARK: - ColletionView設定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumArray_Recommand.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = recommandSons_CollectionView.dequeueReusableCell(withReuseIdentifier: recommandCellID, for: indexPath) as! HotSaleCell
        cell.albumImageView.image = UIImage(named: albumArray_Recommand[indexPath.row])
        cell.albumNameLabel.text = albumName_Recommand[indexPath.row]
        cell.singerNameLabel.text = singerName_Recommand[indexPath.row]
        return cell
    }
    //MARK: - PagerView設定
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return albumArray_Roulette.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "PageViewCell", at: index) as! PagerViewCell
        cell.albumImageView.image = UIImage(named: albumArray_Roulette[index])
        return cell
    }
    //MARK: - TableView設定
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = categoryTableView.dequeueReusableCell(withIdentifier: categoryCellID, for: indexPath) as! RecommandSongsCell
            cell.categoryLabel.text = album_Category_1[indexPath.row]
            cell.albumImageView.image = UIImage(named: album_Category_1[indexPath.row])
            return cell
        }else{
            let cell = categoryTableView.dequeueReusableCell(withIdentifier: categoryCellID, for: indexPath) as! RecommandSongsCell
            cell.categoryLabel.text = album_Category_2[indexPath.row]
            cell.albumImageView.image = UIImage(named: album_Category_2[indexPath.row])

            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    //Header高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    //客製化Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let containerView = UIView()
        let categoryLabel_1: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 20)
            label.text = "語種"
            return label
        }()
        let categoryLabel_2: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 20)
            label.text = "曲風類型"
            return label
        }()
        if section == 0 {
            containerView.addSubview(categoryLabel_1)
            categoryLabel_1.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 4).isActive = true
            categoryLabel_1.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        }else{
            containerView.addSubview(categoryLabel_2)
            categoryLabel_2.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 4).isActive = true
            categoryLabel_2.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        }
        return containerView
    }
    
}
