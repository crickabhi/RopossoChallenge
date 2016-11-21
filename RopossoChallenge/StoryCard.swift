//
//  StoryCard.swift
//  RopossoChallenge
//
//  Created by Abhinav Mathur on 20/11/16.
//  Copyright © 2016 Abhinav Mathur. All rights reserved.
//

import UIKit

class StoryCard: UITableViewCell {

    var storyTitle: UILabel!
    var storyImage : UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let gap : CGFloat = 10
        let labelHeight: CGFloat = 30
        let labelWidth: CGFloat = UIScreen.main.bounds.width - 20
        let lineGap : CGFloat = 5
        let label2Y : CGFloat = gap + labelHeight + lineGap
        let imageSize : CGFloat = 175
        
        storyTitle = UILabel()
        storyTitle.frame = CGRect(x: gap, y: gap, width: labelWidth, height: labelHeight)
        storyTitle.textColor = UIColor.black
        storyTitle.numberOfLines = 3
        storyTitle.lineBreakMode = NSLineBreakMode.byWordWrapping
        if #available(iOS 8.2, *) {
            storyTitle.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightSemibold)
        } else {
            storyTitle.font = UIFont(name: "HelveticaNeue", size: 14)
        }
        contentView.addSubview(storyTitle)
        
        storyImage = UIImageView()
        storyImage.frame = CGRect(x: gap,y: label2Y, width: labelWidth,height: imageSize)
        storyImage.contentMode = .scaleAspectFit
        contentView.addSubview(storyImage)
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
