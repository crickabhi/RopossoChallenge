//
//  DetailViewController.swift
//  RopossoChallenge
//
//  Created by Abhinav Mathur on 20/11/16.
//  Copyright © 2016 Abhinav Mathur. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var userObjects = [AnyObject]()
    
    var userName        : UILabel!
    var userImage       : UIImageView!
    var storyTitle      : UILabel!
    var storyImage      : UIImageView!
    var followButton    : UIImageView!

    var userNameString     : String?
    var userImageUrlString : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let gap : CGFloat = 10
        let labelHeight: CGFloat = 80
        let labelWidth: CGFloat = UIScreen.main.bounds.width - 30
        let lineGap : CGFloat = 5
        let imageSize : CGFloat = UIScreen.main.bounds.height - 200
        for i in 0  ..< userObjects.count
        {
            if self.detailItem?.value(forKey: "db")! as! String == userObjects[i].value(forKey: "id")! as! String
            {
               userNameString = userObjects[i].value(forKey: "username")! as? String
               userImageUrlString = userObjects[i].value(forKey: "image")! as? String
            }
            
        }
        userImage = UIImageView()
        userImage.frame = CGRect(x: gap,y: 70, width: 44,height: 44)
        userImage.sd_setImage(with: NSURL(string:(userImageUrlString)!)! as URL)
        
        userImage.contentMode = .scaleAspectFit
        userImage.layer.masksToBounds = true
        userImage.layer.cornerRadius = 5

        view.addSubview(userImage)

        userName = UILabel()
        userName.frame = CGRect(x: 75 , y: 40, width: labelWidth, height: labelHeight)
        userName.textColor = UIColor.black
        userName.font = UIFont(name: "HelveticaNeue", size: 14)
        userName.text = userNameString!
        
        view.addSubview(userName)

        storyTitle = UILabel()
        storyTitle.frame = CGRect(x: gap, y: 100, width: labelWidth, height: labelHeight)
        storyTitle.textColor = UIColor.black
        storyTitle.font = UIFont(name: "HelveticaNeue", size: 16)
        storyTitle.text = self.detailItem?.value(forKey: "title") as? String
        storyTitle.numberOfLines = 0

        view.addSubview(storyTitle)
        
        storyImage = UIImageView()
        storyImage.frame = CGRect(x: gap,y: 160, width: labelWidth,height: imageSize)
        storyImage.sd_setImage(with: NSURL(string:(self.detailItem?.value(forKey: "si") as? String)!)! as URL)

        storyImage.contentMode = .scaleToFill
        view.addSubview(storyImage)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
        }
    }


}

