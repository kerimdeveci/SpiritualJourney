//
//  SearchResultCell.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/11.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    
    /// imageView
    @IBOutlet weak var artworkImageView: UIImageView!
    
    /// name
    @IBOutlet weak var nameLabel: UILabel!
    
    /// artistName
    @IBOutlet weak var artistNameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 设置cell被选中时的颜色
        let selectedView = UIView(frame: .zero)
        selectedView.backgroundColor = UIColor(red: 20/255.0, green: 160/255.0, blue: 160/255.0, alpha: 0.5)
        selectedBackgroundView = selectedView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}