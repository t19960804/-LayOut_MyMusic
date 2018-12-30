//
//  TestController2.swift
//  CollectionViewTest
//
//  Created by t19960804 on 2018/12/21.
//  Copyright © 2018 t19960804. All rights reserved.
//

import UIKit

class TestController2: UITableViewController {
    let cellID = "Cell"
    let albumArray_HotRank = ["新歌專輯","國語專輯","西洋專輯","日語專輯","韓語專輯","台語專輯","電視專輯","粵語專輯","電影專輯","爵士專輯","古典專輯"]
    let category_HotRank = ["新歌","國語","西洋","日語","韓語","台語","電視","粵語","電影","爵士","古典"]
    let songName_1 = ["怪美的","怪美的","Shape of You","First Love","The Day We Met","查某因仔","The Day We Met","岩石裡的花","有一種悲傷(電影[比悲傷更悲傷的故事])","Prelude1","Burnt Deet<累不累,腳知道>"]
    let songName_2 = ["備胎(feat. Eetu Kalavainen)","備胎(feat. Eetu Kalavainen)","First Love","Differnt World(feat.CORSAK)","Burnt Deet<累不累,腳知道>","沙漠駱駝","查某因仔","岩石裡的花","每一次想你","One and Only","The Day We Met"]
    let songName_3 = ["查某因仔","有一種悲傷(電影[比悲傷更悲傷的故事])","The Specture","Love Shot","The Day We Met","幸福不滅","怪美的","有一種悲傷(電影[比悲傷更悲傷的故事])","I'll Never Love Again","Burnt Deet<累不累,腳知道>","有一種悲傷(電影[比悲傷更悲傷的故事])"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(HotRankCell.self, forCellReuseIdentifier: cellID)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! HotRankCell
        cell.albumImageView.image = UIImage(named: albumArray_HotRank[indexPath.row])
        cell.categoryLabel.text = category_HotRank[indexPath.row]
        cell.songNameLabel_1.text = songName_1[indexPath.row]
        cell.songNameLabel_2.text = songName_2[indexPath.row]
        cell.songNameLabel_3.text = songName_3[indexPath.row]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

}
