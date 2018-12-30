//
//  HotRankCell.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/30.
//  Copyright © 2018 t19960804. All rights reserved.
//

import Foundation
import UIKit

class HotRankCell: UITableViewCell {
    
    let albumImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        return imageView
    }()
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    let seperateLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        return view
    }()
    //
    let songNameLabel_1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    let songNameLabel_2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    let songNameLabel_3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    //
    lazy var songNameStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 3
        stackView.addArrangedSubview(songNameLabel_1)
        stackView.addArrangedSubview(songNameLabel_2)
        stackView.addArrangedSubview(songNameLabel_3)
        return stackView
    }()
    let playButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "play-button2"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(albumImageView)
        self.addSubview(categoryLabel)
        self.addSubview(seperateLine)
        self.addSubview(songNameStackView)
        self.addSubview(playButton)
        setUpConstraints()
    }
    func setUpConstraints(){
        albumImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        albumImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        albumImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        categoryLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        categoryLabel.leftAnchor.constraint(equalTo: albumImageView.rightAnchor, constant: 60).isActive = true
        
        seperateLine.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        seperateLine.leftAnchor.constraint(equalTo: categoryLabel.rightAnchor, constant: 15).isActive = true
        seperateLine.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        seperateLine.widthAnchor.constraint(equalToConstant: 3.5).isActive = true
        
        
        songNameLabel_1.widthAnchor.constraint(equalToConstant: 140).isActive = true
        songNameLabel_2.widthAnchor.constraint(equalToConstant: 140).isActive = true
        songNameLabel_3.widthAnchor.constraint(equalToConstant: 140).isActive = true

        songNameStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        songNameStackView.leftAnchor.constraint(equalTo: seperateLine.rightAnchor, constant: 10).isActive = true
        songNameStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.55).isActive = true
        
        playButton.leftAnchor.constraint(equalTo: songNameStackView.rightAnchor, constant: 8).isActive = true
        playButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -35).isActive = true
        playButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 35).isActive = true
        playButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -35).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
