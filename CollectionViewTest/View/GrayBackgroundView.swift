//
//  GrayBackgroundView.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/20.
//  Copyright © 2018 t19960804. All rights reserved.
//

import UIKit

class GrayBackgroundView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(red: 74/255, green: 74/255, blue: 72/255, alpha: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
