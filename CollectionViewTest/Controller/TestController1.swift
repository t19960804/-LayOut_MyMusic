//
//  TestController1.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/21.
//  Copyright © 2018 t19960804. All rights reserved.
//

import UIKit
import FSPagerView

class TestController1: UIViewController{
   
    
    let cellID = "Cell"
    let newSongCellID = "NewSongCell"
    
    let albumArray_Roulette = ["gem_Album2","bigbang_Album","blackPink_Album","mayday_Album"]
    let albumArray_HotSale = ["allan_Album","justin_Album","lee_Album","linkinpark_Album","cnblue_Album"]
    let singerName = ["Alan Walker","Justin Beiber","李榮浩","聯合公園","CNBLUE"]
    let albumName = ["Faded","Purpose","模特","Minutes To Midnight","First Step"]
    
    lazy var myScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame:self.view.frame)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width:self.view.frame.width , height: 1300)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    let backGroundView: UIView = {
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
    let hotSale_Label = CustomLabel(content: "熱門推薦", fontSize: 17)
    lazy var hotSaleCollectionView: UICollectionView = {
        let layOut = UICollectionViewFlowLayout()
        layOut.minimumInteritemSpacing = 5
        //如果collectionView有左右Anchor,還會加上這邊的值
        layOut.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layOut.itemSize = CGSize(width: (self.view.frame.width - 14 - 10) / 2.5, height: (self.view.frame.width - 14 - 10) / 1.9)
        layOut.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layOut)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HotSaleCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    lazy var newSongTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: newSongCellID)
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        pagerView.delegate = self
        pagerView.dataSource = self
        hotSaleCollectionView.delegate = self
        hotSaleCollectionView.dataSource = self
        newSongTableView.delegate = self
        newSongTableView.dataSource = self
        
        
        self.view.addSubview(myScrollView)
        myScrollView.addSubview(backGroundView)
        backGroundView.addSubview(pagerView)
        backGroundView.addSubview(hotSale_Label)
        backGroundView.addSubview(hotSaleCollectionView)
        backGroundView.addSubview(newSongTableView)
        
        setUpPagerView()
        setUpHotSaleLabel()
        setUpAlbumCollectionView()
        setUpNewSongTableView()
        ////////////////////////////////////////
        ////////////////////////////////////////

       
        
        myScrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        myScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        myScrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        myScrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        backGroundView.widthAnchor.constraint(equalTo: myScrollView.widthAnchor).isActive = true
        backGroundView.heightAnchor.constraint(equalToConstant: 1300 ).isActive = true
        backGroundView.topAnchor.constraint(equalTo: myScrollView.topAnchor, constant: -safeAreaHeight_Top).isActive = true
        backGroundView.centerXAnchor.constraint(equalTo: myScrollView.centerXAnchor).isActive = true
        
    }
    func setUpPagerView(){
        pagerView.topAnchor.constraint(equalTo: backGroundView.topAnchor).isActive = true
        pagerView.leftAnchor.constraint(equalTo: backGroundView.leftAnchor,constant: 7).isActive = true
        pagerView.rightAnchor.constraint(equalTo: backGroundView.rightAnchor,constant: -7).isActive = true
        pagerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25).isActive = true
    }
    func setUpHotSaleLabel(){
        hotSale_Label.topAnchor.constraint(equalTo: pagerView.bottomAnchor, constant: 15).isActive = true
        hotSale_Label.leftAnchor.constraint(equalTo: pagerView.leftAnchor).isActive = true
        hotSale_Label.widthAnchor.constraint(equalToConstant: 70).isActive = true
        hotSale_Label.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    func setUpAlbumCollectionView(){
        hotSaleCollectionView.topAnchor.constraint(equalTo: hotSale_Label.bottomAnchor, constant: 0).isActive = true
        hotSaleCollectionView.leftAnchor.constraint(equalTo: pagerView.leftAnchor).isActive = true
        hotSaleCollectionView.rightAnchor.constraint(equalTo: pagerView.rightAnchor).isActive = true
        hotSaleCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.23).isActive = true
    }
    func setUpNewSongTableView(){
        newSongTableView.topAnchor.constraint(equalTo: hotSaleCollectionView.bottomAnchor, constant: 10).isActive = true
        newSongTableView.rightAnchor.constraint(equalTo: hotSaleCollectionView.rightAnchor).isActive = true
        newSongTableView.leftAnchor.constraint(equalTo: hotSaleCollectionView.leftAnchor).isActive = true
        newSongTableView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

extension TestController1: FSPagerViewDataSource,FSPagerViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource{
   
    
    //MARK: - PagerView設定
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return albumArray_Roulette.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "PageViewCell", at: index) as! PagerViewCell
        cell.albumImageView.image = UIImage(named: albumArray_Roulette[index])
        return cell
    }
    //MARK: - 熱門推薦CollecitonView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumArray_HotSale.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = hotSaleCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HotSaleCell
        cell.albumImageView.image = UIImage(named: albumArray_HotSale[indexPath.row])
        cell.albumNameLabel.text = albumName[indexPath.row]
        cell.singerNameLabel.text = singerName[indexPath.row]
        return cell
        
    }
    //MARK: - 新歌推薦UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newSongTableView.dequeueReusableCell(withIdentifier: newSongCellID, for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
}
