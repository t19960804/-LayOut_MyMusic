//
//  RecommandSongsCell.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/31.
//  Copyright © 2018 t19960804. All rights reserved.
//

import Foundation
import UIKit

class RecommandSongsCell: UITableViewCell {
    let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.brown
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let categoryLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.addSubview(albumImageView)
        self.addSubview(categoryLabel)
        setUpConstraints()
    }
    func setUpConstraints(){
        albumImageView.topAnchor.constraint(equalTo: self.topAnchor,constant: 4).isActive = true
        albumImageView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 4).isActive = true
        albumImageView.widthAnchor.constraint(equalTo: self.heightAnchor, constant: -8).isActive = true
        albumImageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -8).isActive = true
        
        categoryLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        categoryLabel.leftAnchor.constraint(equalTo: albumImageView.rightAnchor, constant: 12).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
