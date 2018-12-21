//
//  CustomNavController.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/20.
//  Copyright © 2018 t19960804. All rights reserved.
//

import UIKit

let themeColor = UIColor(red: 163/255, green: 63/255, blue: 162/255, alpha: 1)
class CustomNavController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = themeColor
        
        //title顏色
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
    }
   


}
