//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/17.
//  Copyright © 2018 t19960804. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let cellID = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.backgroundColor = UIColor.blue
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        //翻頁效果
        self.collectionView.isPagingEnabled = true
        //隱藏滾動條
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.showsHorizontalScrollIndicator = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = UIColor.yellow
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //寬度線先扣掉sectionInset的左右( 2 * 8 = 16)
        //再扣掉想要多少個item為一列(下面為2) * itemSpacing( 1 * 8 = 8)
//        return CGSize(width: (self.view.frame.width - 16 - 8) / 2, height: 150)
//        return CGSize(width: (self.view.frame.width - 16 - 8) / 2 , height: 150)
        return CGSize(width: self.view.frame.width , height: self.view.frame.height - 70)

    }

}
