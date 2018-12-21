//
//  AlbumCell.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/18.
//  Copyright © 2018 t19960804. All rights reserved.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    
    let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(albumImageView)
        albumImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        albumImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        albumImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        albumImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
