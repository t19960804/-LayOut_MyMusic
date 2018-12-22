//
//  CustomLabel.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/22.
//  Copyright © 2018 t19960804. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    init(content: String,fontSize: CGFloat){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.text = content
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
