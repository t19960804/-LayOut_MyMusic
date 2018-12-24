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
   
    
    let hotSaleCellID = "Cell"
    let newSongsCellID = "NewSongCell"
    let newestAlbumCellID = "NewestAlbumCell"
    let specialAlbumCellID = "SpecialAlbumCell"
    //
    let albumArray_Roulette = ["gem_Album2","bigbang_Album","blackPink_Album","mayday_Album"]
    //
    let albumArray_HotSale = ["allan_Album","justin_Album","lee_Album","linkinpark_Album","cnblue_Album"]
    let singerName_HotSale = ["Alan Walker","Justin Beiber","李榮浩","聯合公園","CNBLUE"]
    let albumName_HotSale = ["Faded","Purpose","模特","Minutes To Midnight","First Step"]
    //
    let albumArray_NewSongs = ["alin_Album","exo_Album","gan_Album","sj_Album","zhan_Album"]
    let singerName_NewSongs = ["Alin","EXO","李玉剛","圭賢","曾沛慈"]
    let albumName_NewSongs = ["未單身","Love Me Right","剛好遇見你","在光化門","我愛你以上"]
    //
    let style_NewsetAlbum = ["國語","日語","台語","電視","古典","西洋","韓語","粵語","電影","爵士"]
    let albumArray_NewsetAlbum = ["國語專輯","日語專輯","台語專輯","電視專輯","古典專輯","西洋專輯","韓語專輯","粵語專輯","電影專輯","爵士專輯"]
    //
    let albumArray_Special = ["hsie_Album","xmas_Album1","xmas_Album2","xmas_Album3","xmas_Album4"]
    let albumName_Special = ["friDay音樂 明星DJ合集大精選","聖誕節有我陪著你","記憶聖誕-最有過節氣氛的歌曲","節巷 / 無雪的我們","聖誕節必聽經典"]
    
    
    let hotSale_Label = CustomLabel(content: "熱門推薦", fontSize: 18)
    let newestAlbum_Label = CustomLabel(content: "最新專輯", fontSize: 18)
    let specialAlbum_Label = CustomLabel(content: "精選歌單", fontSize: 18)
    let moreLabel_1 = CustomLabel(content: "更多", fontSize: 18)
    let moreLabel_2 = CustomLabel(content: "更多", fontSize: 18)
    
    
    lazy var myScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame:self.view.frame)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width:self.view.frame.width , height: 1500)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
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
    
    
    
    lazy var hotSaleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.view.frame.width - 10) / 2.5, height: (self.view.frame.width - 10) / 1.9)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HotSaleCell.self, forCellWithReuseIdentifier: hotSaleCellID)
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.tag = 0
        return collectionView
    }()
    lazy var newestAlbumCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        layout.itemSize = CGSize(width: (self.view.frame.width - 8) / 2.5, height: (160 - 4) / 1.9)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(NewestAlbumCell.self, forCellWithReuseIdentifier: newestAlbumCellID)
        collectionView.backgroundColor = backGroundGray
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.tag = 1
        return collectionView
        
    }()
    lazy var specialAlbumCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (self.view.frame.width - 10) / 2.5, height: (self.view.frame.width - 10) / 1.9)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.white
        collectionView.register(SpecialAlbumCell.self, forCellWithReuseIdentifier: specialAlbumCellID)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.tag = 2
        return collectionView
    }()
    lazy var newSongTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewSongsCell.self, forCellReuseIdentifier: newSongsCellID)
        return tableView
    }()
    let backGround_NewestAlbum: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = backGroundGray
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        pagerView.delegate = self
        pagerView.dataSource = self
        hotSaleCollectionView.delegate = self
        hotSaleCollectionView.dataSource = self
        newSongTableView.delegate = self
        newSongTableView.dataSource = self
        newestAlbumCollectionView.delegate = self
        newestAlbumCollectionView.dataSource = self
        specialAlbumCollectionView.delegate = self
        specialAlbumCollectionView.dataSource = self
        
        
        self.view.addSubview(myScrollView)
        myScrollView.addSubview(backGroundView)
        backGroundView.addSubview(pagerView)
        backGroundView.addSubview(hotSale_Label)
        backGroundView.addSubview(hotSaleCollectionView)
        backGroundView.addSubview(newSongTableView)
        backGroundView.addSubview(backGround_NewestAlbum)
        backGroundView.addSubview(newestAlbum_Label)
        backGroundView.addSubview(moreLabel_1)
        backGroundView.addSubview(newestAlbumCollectionView)
        backGroundView.addSubview(specialAlbum_Label)
        backGroundView.addSubview(moreLabel_2)
        backGroundView.addSubview(specialAlbumCollectionView)
        
        setUpScrollView()
        setUpPagerView()
        setUpHotSaleAlbumCollectionView()
        setUpNewSongTableView()
        setUpNewestAlbumCollectionView()
        setUpSpecialAlbumCollectionView()
    }
    func setUpScrollView(){
        myScrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        myScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        myScrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        myScrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        backGroundView.widthAnchor.constraint(equalTo: myScrollView.widthAnchor).isActive = true
        backGroundView.heightAnchor.constraint(equalToConstant: 1500 ).isActive = true
        backGroundView.topAnchor.constraint(equalTo: myScrollView.topAnchor, constant: -safeAreaHeight_Top).isActive = true
        backGroundView.centerXAnchor.constraint(equalTo: myScrollView.centerXAnchor).isActive = true
    }
    func setUpPagerView(){
        pagerView.topAnchor.constraint(equalTo: backGroundView.topAnchor).isActive = true
        pagerView.leftAnchor.constraint(equalTo: backGroundView.leftAnchor,constant: 7).isActive = true
        pagerView.rightAnchor.constraint(equalTo: backGroundView.rightAnchor,constant: -7).isActive = true
        pagerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25).isActive = true
    }
    func setUpHotSaleAlbumCollectionView(){
        
        hotSale_Label.topAnchor.constraint(equalTo: pagerView.bottomAnchor, constant: 15).isActive = true
        hotSale_Label.leftAnchor.constraint(equalTo: pagerView.leftAnchor).isActive = true
        
        hotSaleCollectionView.topAnchor.constraint(equalTo: hotSale_Label.bottomAnchor, constant: 10).isActive = true
        hotSaleCollectionView.leftAnchor.constraint(equalTo: pagerView.leftAnchor).isActive = true
        hotSaleCollectionView.rightAnchor.constraint(equalTo: pagerView.rightAnchor).isActive = true
        hotSaleCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.23).isActive = true
    }
    func setUpNewSongTableView(){
        newSongTableView.topAnchor.constraint(equalTo: hotSaleCollectionView.bottomAnchor, constant: 25).isActive = true
        newSongTableView.rightAnchor.constraint(equalTo: hotSaleCollectionView.rightAnchor).isActive = true
        newSongTableView.leftAnchor.constraint(equalTo: hotSaleCollectionView.leftAnchor).isActive = true
        newSongTableView.heightAnchor.constraint(equalToConstant: 300 + 45).isActive = true
    }
    func setUpNewestAlbumCollectionView(){
        
        backGround_NewestAlbum.topAnchor.constraint(equalTo: newSongTableView.bottomAnchor, constant: 20).isActive = true
        backGround_NewestAlbum.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        backGround_NewestAlbum.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        newestAlbum_Label.topAnchor.constraint(equalTo: backGround_NewestAlbum.topAnchor, constant: 15).isActive = true
        newestAlbum_Label.leftAnchor.constraint(equalTo: pagerView.leftAnchor).isActive = true

        
        moreLabel_1.topAnchor.constraint(equalTo: newestAlbum_Label.topAnchor).isActive = true
        moreLabel_1.rightAnchor.constraint(equalTo: pagerView.rightAnchor).isActive = true
        
        newestAlbumCollectionView.topAnchor.constraint(equalTo: newestAlbum_Label.bottomAnchor, constant: 10).isActive = true
        newestAlbumCollectionView.leftAnchor.constraint(equalTo: backGroundView.leftAnchor).isActive = true
        newestAlbumCollectionView.rightAnchor.constraint(equalTo: backGroundView.rightAnchor).isActive = true
        newestAlbumCollectionView.heightAnchor.constraint(equalToConstant: 160).isActive = true
    }
    func setUpSpecialAlbumCollectionView(){
        specialAlbum_Label.topAnchor.constraint(equalTo: backGround_NewestAlbum.bottomAnchor, constant: 15).isActive = true
        specialAlbum_Label.leftAnchor.constraint(equalTo: pagerView.leftAnchor).isActive = true
        
        moreLabel_2.topAnchor.constraint(equalTo: specialAlbum_Label.topAnchor).isActive = true
        moreLabel_2.rightAnchor.constraint(equalTo: pagerView.rightAnchor).isActive = true
        
        specialAlbumCollectionView.topAnchor.constraint(equalTo: specialAlbum_Label.bottomAnchor, constant: 10).isActive = true
        specialAlbumCollectionView.leftAnchor.constraint(equalTo: pagerView.leftAnchor).isActive = true
        specialAlbumCollectionView.rightAnchor.constraint(equalTo: pagerView.rightAnchor).isActive = true
        specialAlbumCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.23).isActive = true
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
    //MARK: - CollecitonView處理
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let tag = collectionView.tag
        switch tag {
        case 0:
            return albumArray_HotSale.count
        case 1:
            return albumArray_NewsetAlbum.count
        case 2:
            return albumArray_Special.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let tag = collectionView.tag
        if tag == 0{
            let cell = hotSaleCollectionView.dequeueReusableCell(withReuseIdentifier: hotSaleCellID, for: indexPath) as! HotSaleCell
            cell.albumImageView.image = UIImage(named: albumArray_HotSale[indexPath.row])
            cell.albumNameLabel.text = albumName_HotSale[indexPath.row]
            cell.singerNameLabel.text = singerName_HotSale[indexPath.row]
            return cell
        }else if tag == 1{
            let cell = newestAlbumCollectionView.dequeueReusableCell(withReuseIdentifier: newestAlbumCellID, for: indexPath) as! NewestAlbumCell
            cell.styleLabel.text = style_NewsetAlbum[indexPath.row]
            cell.albumImageView.image = UIImage(named: albumArray_NewsetAlbum[indexPath.row])
            return cell
        }else{
            let cell = specialAlbumCollectionView.dequeueReusableCell(withReuseIdentifier: specialAlbumCellID, for: indexPath) as! SpecialAlbumCell
            cell.albumImageView.image = UIImage(named: albumArray_Special[indexPath.row])
            cell.albumNameLabel.text = albumName_Special[indexPath.row]
            return cell
        }
       
        
    }
    //MARK: - 新歌推薦UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumArray_NewSongs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newSongTableView.dequeueReusableCell(withIdentifier: newSongsCellID, for: indexPath) as! NewSongsCell
        cell.albumImageView.image = UIImage(named: albumArray_NewSongs[indexPath.row])
        cell.placeLabel.text = "\(indexPath.row + 1)"
        cell.songNameLabel.text = albumName_NewSongs[indexPath.row]
        cell.singerNameLabel.text = singerName_NewSongs[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let newSongsLabel = CustomLabel(content: "新歌排行", fontSize: 18)
        let moreLabel = CustomLabel(content: "更多", fontSize: 18)
        view.addSubview(newSongsLabel)
        view.addSubview(moreLabel)
        newSongsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        newSongsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 7).isActive = true
        moreLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        moreLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -7).isActive = true
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
}
