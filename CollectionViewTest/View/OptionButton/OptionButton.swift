//
//  OptionButton.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/21.
//  Copyright © 2018 t19960804. All rights reserved.
//

import UIKit

class OptionButton: UIButton {
    var image: UIImage!
    var content: String!
    override open var isHighlighted: Bool {
        didSet {
            let color = isHighlighted ? themeColor : UIColor.black
            self.setTitleColor(color, for: .normal)
            self.tintColor = color
        }
    }
    
    init(image: UIImage,content: String){
        self.image = image
        self.content = content
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(content, for: UIControl.State.normal)
        //.automatic 根據圖片的使用環境和所處的繪圖上下文自動調整渲染模式
        //.alwaysOriginal 始終繪製圖片原始狀態，不使用Tint Color
        //.alwaysTemplate 始終根據Tint Color繪製圖片，忽略圖片的顏色資訊
        self.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
        //預設是藍色,這邊改黑色
        self.tintColor = UIColor.black
        self.setTitleColor(UIColor.black, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        self.widthAnchor.constraint(equalToConstant: 180).isActive = true
        //偏移量
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 0)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: 0, right: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
