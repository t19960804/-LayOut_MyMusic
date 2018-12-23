//
//  File.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/23.
//  Copyright © 2018 t19960804. All rights reserved.
//

import Foundation
import UIKit

class NewestAlbumCell: UICollectionViewCell {
    let backGroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    let backGroundView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "exo_Album")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    let styleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backGroundView)
        self.addSubview(backGroundView2)
        self.addSubview(albumImageView)
        self.addSubview(styleLabel)
        
        backGroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 7).isActive = true
        backGroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -7).isActive = true
        backGroundView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 7).isActive = true
        backGroundView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -7).isActive = true
        
        albumImageView.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 4).isActive = true
        albumImageView.leftAnchor.constraint(equalTo: backGroundView.leftAnchor, constant: 4).isActive = true
        albumImageView.heightAnchor.constraint(equalTo: backGroundView.heightAnchor, constant: -8).isActive = true
        albumImageView.widthAnchor.constraint(equalTo: backGroundView.heightAnchor, constant: -8).isActive = true
        
        backGroundView2.topAnchor.constraint(equalTo: albumImageView.topAnchor).isActive = true
        backGroundView2.leftAnchor.constraint(equalTo: albumImageView.rightAnchor).isActive = true
        backGroundView2.heightAnchor.constraint(equalTo: albumImageView.heightAnchor).isActive = true
        backGroundView2.rightAnchor.constraint(equalTo: backGroundView.rightAnchor, constant: -4).isActive = true
        
        
        styleLabel.centerYAnchor.constraint(equalTo: backGroundView2.centerYAnchor).isActive = true
        styleLabel.centerXAnchor.constraint(equalTo: backGroundView2.centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
