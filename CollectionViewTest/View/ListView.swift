//
//  File.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/20.
//  Copyright © 2018 t19960804. All rights reserved.
//

import Foundation
import UIKit

class ListView: UIView {
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "user")
        imageView.layer.cornerRadius = 32
        imageView.layer.masksToBounds = true
        return imageView
    }()
    let userNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "DJ_0000251397"
        return label
    }()
    
    
    let optionButton_StackView = OptionButton_StackView()

    override init(frame: CGRect) {
        super.init(frame: frame)


        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        
        self.addSubview(topView)
        self.addSubview(userImageView)
        self.addSubview(userNumber)
        self.addSubview(optionButton_StackView)
        setUpUserInfo()
    }
    func setUpUserInfo(){
        
        
        topView.topAnchor.constraint(equalTo: self.topAnchor, constant: safeAreaHeight_Top + 44).isActive = true
        topView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        topView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        topView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1 / 8).isActive = true
        
        userImageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true

        userImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true

        
        userNumber.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        userNumber.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 12).isActive = true
        userNumber.heightAnchor.constraint(equalToConstant: 20).isActive = true
        userNumber.widthAnchor.constraint(equalToConstant: 200).isActive = true
        

        optionButton_StackView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 40).isActive = true
        optionButton_StackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        optionButton_StackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.65).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
