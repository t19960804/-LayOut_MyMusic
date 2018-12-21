//
//  File.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/20.
//  Copyright © 2018 t19960804. All rights reserved.
//

import Foundation
import UIKit

class OptionButton_StackView: UIStackView {
    
    let optionButton_Search = OptionButton(image: UIImage(named: "search_Black")!, content: "音樂搜尋")
    let optionButton_Info = OptionButton(image: UIImage(named: "lighten")!, content: "音樂情報")
    let optionButton_Radio = OptionButton(image: UIImage(named: "radio")!, content: "情境電台")
    let optionButton_Recognize = OptionButton(image: UIImage(named: "mic")!, content: "音樂辨識")
    let optionButton_OnlyMember = OptionButton(image: UIImage(named: "heart")!, content: "會員專屬")
    let optionButton_MyMusic = OptionButton(image: UIImage(named: "cd")!, content: "我的音樂")
    let optionButton_Settings = OptionButton(image: UIImage(named: "settings")!, content: "前往設定")
    
    
    init() {
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.distribution = .fillEqually
        self.alignment = .center
        self.spacing = 15
        self.addArrangedSubview(optionButton_Search)
        self.addArrangedSubview(optionButton_Info)
        self.addArrangedSubview(optionButton_Radio)
        self.addArrangedSubview(optionButton_Recognize)
        self.addArrangedSubview(optionButton_OnlyMember)
        self.addArrangedSubview(optionButton_MyMusic)
        self.addArrangedSubview(optionButton_Settings)
        
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
