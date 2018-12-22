//
//  HotSaleCell.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/22.
//  Copyright © 2018 t19960804. All rights reserved.
//

import Foundation
import UIKit

class HotSaleCell: UICollectionViewCell {
    let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let albumNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        return label
    }()
    let singerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.gray
        return label
    }()
    let playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "playButton"), for: UIControl.State.normal)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(albumImageView)
        self.addSubview(playButton)
        self.addSubview(albumNameLabel)
        self.addSubview(singerNameLabel)
//        self.backgroundColor = UIColor.red
        albumImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        albumImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        albumImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        albumImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        
        playButton.rightAnchor.constraint(equalTo: albumImageView.rightAnchor, constant: -12).isActive = true
        playButton.bottomAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: -12).isActive = true
        playButton.widthAnchor.constraint(equalTo: albumImageView.widthAnchor, multiplier: 1 / 10).isActive = true
        playButton.heightAnchor.constraint(equalTo: albumImageView.widthAnchor, multiplier: 1 / 10).isActive = true

        
        albumNameLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 10).isActive = true
        albumNameLabel.leftAnchor.constraint(equalTo: albumImageView.leftAnchor).isActive = true
        albumNameLabel.widthAnchor.constraint(equalTo: albumImageView.widthAnchor).isActive = true
        
        singerNameLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 2).isActive = true
        singerNameLabel.leftAnchor.constraint(equalTo: albumImageView.leftAnchor).isActive = true
        singerNameLabel.widthAnchor.constraint(equalTo: albumImageView.widthAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
