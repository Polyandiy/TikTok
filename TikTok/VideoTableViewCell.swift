//
//  VideoTableViewCell.swift
//  TikTok
//
//  Created by Поляндий on 09.08.2022.
//

import BMPlayer
import SnapKit
import UIKit

class VideoTableViewCell: UITableViewCell {
    var link: String
    var player = BMPlayer()
    
    init(link: String){
        self.link = link
        super.init(style: .default, reuseIdentifier: "cell")
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize(){
        player.isUserInteractionEnabled = false
        BMPlayerConf.enableVolumeGestures = false
        BMPlayerConf.enableBrightnessGestures = false
        BMPlayerConf.enablePlaytimeGestures = false
        BMPlayerConf.shouldAutoPlay = true
        
        let resource = BMPlayerResource(url: URL(string: link)!)
        player.setVideo(resource: resource)
        self.contentView.addSubview(player)
        player.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
}
