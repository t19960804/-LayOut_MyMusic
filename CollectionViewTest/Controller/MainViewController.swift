//
//  MainViewController.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/18.
//  Copyright © 2018 t19960804. All rights reserved.
//

import UIKit
import PageMenu
//重點整理
//每一個collectionView初始化的時候要給UICollectionViewFlowLayout,frame可以給zero
//zero代表了一個以（0,0）為原點的矩形，並且長度和寬度皆為0
//滑動方向
//註冊cell
//如果有多個collectionView,用tag來識別
//翻頁效果:isPageEnable

let safeAreaHeight_Top = UIApplication.shared.keyWindow!.safeAreaInsets.top


class MainViewController: UIViewController {
    let cellID_1 = "Cell_1"
    let cellID_2 = "Cell_2"
    let headerID_1 = "HeaderID_1"
    let headerID_2 = "HeaderID_2"
    let image_List = UIImage(named: "list")?.withRenderingMode(.alwaysOriginal)
    let image_Search = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
    var isHidden = true
    var leftAnchor_ListView: NSLayoutConstraint?
    var leftAnchor_GrayView: NSLayoutConstraint?
    var pageMenu : CAPSPageMenu?

    let grayBackgroundView = GrayBackgroundView()
    let listView = ListView()
    
    lazy var collectionView_1: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        //layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: (self.view.frame.width - 10 - 10) / 3, height: (self.view.frame.height * 0.18) - 10)
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(AlbumCell.self, forCellWithReuseIdentifier: cellID_1)
        cv.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID_1)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.white
        cv.tag = 0
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
//        self.collectionView_1.delegate = self
//        self.collectionView_1.dataSource = self
//        self.view.addSubview(collectionView_1)
        setUpPageMenu()
        self.view.addSubview(pageMenu!.view)
        self.view.addSubview(grayBackgroundView)
        self.view.addSubview(listView)
        setUpBarButtonItem()
        setUpGrayBackGround()
        setUpListView()
        //讓View縮回去
        leftAnchor_GrayView?.constant = -(self.view.frame.width * 1 + 10)
        leftAnchor_ListView?.constant = -(self.view.frame.width * 0.75 + 10)
        listView.layer.shadowOpacity = 1
        listView.layer.shadowRadius = 5
        
        
    }
    
    func setUpBarButtonItem(){
        self.navigationItem.title = "音樂情報"
        let leftBarButton = UIButton(type: .system)
        leftBarButton.addTarget(self, action: #selector(handleListClicked), for: .touchUpInside)
        leftBarButton.setImage(image_List, for: .normal)
        
        let rightBarButton = UIButton(type: .system)
        rightBarButton.addTarget(self, action: #selector(handleSearchClicked), for: .touchUpInside)
        rightBarButton.setImage(image_Search, for: .normal)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarButton)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButton)
    }
    @objc func handleListClicked(){
        
        //如果隱藏起來則打開
        leftAnchor_ListView?.constant = (isHidden == true) ? 0 : -(self.view.frame.width * 0.75 + 10)
        leftAnchor_GrayView?.constant = (isHidden == true) ? 0 : -(self.view.frame.width * 1 + 10)
        UIView.animate(withDuration: 0.15) {self.view.layoutIfNeeded()}
        isHidden = !isHidden
    }
    @objc func handleSearchClicked(){
        print("its search")
    }
    func setUpGrayBackGround(){
        grayBackgroundView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        grayBackgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        leftAnchor_GrayView = grayBackgroundView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0)
        leftAnchor_GrayView?.isActive = true
        grayBackgroundView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
    }
    func setUpListView(){
        
//        //safeArea的高度加上NavBar的高度
//        collectionView_1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: safeAreaHeight_Top + 44).isActive = true
//        collectionView_1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        collectionView_1.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.18).isActive = true
//        collectionView_1.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        
        
        listView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        listView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        leftAnchor_ListView = listView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0)
        leftAnchor_ListView?.isActive = true
        listView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75).isActive = true
    }
    func setUpPageMenu(){
        var controllerArray : [UIViewController] = []
        let testController1 = TestController1()
        let testController2 = TestController2()
        let testController3 = TestController3()
        testController1.title = "音樂速報"
        testController2.title = "熱門排行"
        testController3.title = "歌單"
        controllerArray.append(testController1)
        controllerArray.append(testController2)
        controllerArray.append(testController3)
        
        let parameters: [CAPSPageMenuOption] = [
            CAPSPageMenuOption.scrollMenuBackgroundColor(UIColor.white),
            //未選中時label顏色
            CAPSPageMenuOption.unselectedMenuItemLabelColor(UIColor.gray),
            //CAPSPageMenuOption.selectionIndicatorColor(themeColor),
            //選中時label顏色
            CAPSPageMenuOption.selectedMenuItemLabelColor(themeColor),
            //menu高度
            CAPSPageMenuOption.menuHeight(60),
            //item居中
            CAPSPageMenuOption.centerMenuItems(true),
            CAPSPageMenuOption.menuItemFont(UIFont.systemFont(ofSize: 17))
        ]
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0 , y: safeAreaHeight_Top + 44.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
        
    }
   

}
extension MainViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0{
            return 6
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView_1.dequeueReusableCell(withReuseIdentifier: cellID_1, for: indexPath) as! AlbumCell
            cell.albumImageView.image = UIImage(named: "hsiao_Album")
            return cell

    }
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        
//            let header = self.collectionView_1.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID_1, for: indexPath)
//            header.backgroundColor = UIColor.red
//            return header
//       
//        
//        
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        if collectionView.tag == 0{
//            return CGSize(width: 50, height: 10)
//        }else{
//            //改寬沒有用,預設就是同寬
//            return CGSize(width: self.view.frame.width, height: 100)
//        }
//    }
//    
}
