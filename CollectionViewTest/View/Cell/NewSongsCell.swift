//
//  File.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/23.
//  Copyright © 2018 t19960804. All rights reserved.
//

import Foundation
import UIKit

class NewSongsCell: UITableViewCell {
    let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    let placeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    let songNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    let singerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(albumImageView)
        self.addSubview(placeLabel)
        self.addSubview(songNameLabel)
        self.addSubview(singerNameLabel)
        //.automatic 根據圖片的使用環境和所處的繪圖上下文自動調整渲染模式
        //.alwaysOriginal 始終繪製圖片原始狀態，不使用Tint Color
        //.alwaysTemplate 始終根據Tint Color繪製圖片，忽略圖片的顏色資訊
        let accImageView = UIImageView(image: UIImage(named: "more")?.withRenderingMode(.alwaysTemplate))
        accImageView.tintColor = UIColor.gray
        accImageView.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        
        self.accessoryType = .none
        self.accessoryView = accImageView
        //選中cell時不會有顏色
        self.selectionStyle = .none
        albumImageView.topAnchor.constraint(equalTo: self.topAnchor,constant: 4).isActive = true
        albumImageView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 4).isActive = true
        albumImageView.widthAnchor.constraint(equalTo: self.heightAnchor, constant: -8).isActive = true
        albumImageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -8).isActive = true
        
        placeLabel.leftAnchor.constraint(equalTo: albumImageView.rightAnchor, constant: 18).isActive = true
        placeLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 7).isActive = true
        
        songNameLabel.topAnchor.constraint(equalTo: placeLabel.topAnchor).isActive = true
        songNameLabel.leftAnchor.constraint(equalTo: placeLabel.rightAnchor, constant: 18).isActive = true
        
        singerNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 2).isActive = true
        singerNameLabel.leftAnchor.constraint(equalTo: songNameLabel.leftAnchor).isActive = true


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
