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
    var followButton    : UIButton!

    var userNameString     : String?
    var userImageUrlString : String?
    var followStatus       : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let gap : CGFloat = 10
        let labelHeight: CGFloat = 80
        let labelWidth: CGFloat = UIScreen.main.bounds.width - 20
        let imageSize : CGFloat = UIScreen.main.bounds.height - 180
        //view.backgroundColor = UIColor.brown
        
        for i in 0  ..< userObjects.count
        {
            if self.detailItem?.value(forKey: "db")! as! String == userObjects[i].value(forKey: "id")! as! String
            {
                userNameString = userObjects[i].value(forKey: "username")! as? String
                userImageUrlString = userObjects[i].value(forKey: "image")! as? String
                let userDefaultsInfo = UserDefaults.standard

                if userDefaultsInfo.value(forKey: "followedGroups") != nil
                {
                    if (userDefaultsInfo.value(forKey: "followedGroups") as! Array<String>).contains(self.detailItem?.value(forKey: "db")! as! String)
                    {
                      followStatus = true
                    }
                    else
                    {
                        followStatus = false
                    }
                }
                else
                {
                    followStatus = userObjects[i].value(forKey: "is_following")! as? Bool
                }
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
        userName.font = UIFont(name: "HelveticaNeue", size: 16)
        userName.text = userNameString!
        
        view.addSubview(userName)

        if followStatus == false
        {
            setupFollowButton()
        }
        else
        {
            setupFollowingButton()
        }

        storyTitle = UILabel()
        storyTitle.frame = CGRect(x: gap, y: 100, width: labelWidth, height: labelHeight)
        storyTitle.textColor = UIColor.black
        storyTitle.numberOfLines = 3
        storyTitle.lineBreakMode = NSLineBreakMode.byWordWrapping
        if #available(iOS 8.2, *) {
            storyTitle.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightSemibold)
        } else {
            storyTitle.font = UIFont(name: "HelveticaNeue", size: 14)
        }
        storyTitle.text = self.detailItem?.value(forKey: "title") as? String
        storyTitle.numberOfLines = 0

        view.addSubview(storyTitle)
        
        storyImage = UIImageView()
        storyImage.frame = CGRect(x: gap,y: 160, width: labelWidth,height: imageSize)
        storyImage.sd_setImage(with: NSURL(string:(self.detailItem?.value(forKey: "si") as? String)!)! as URL)

        storyImage.contentMode = .scaleToFill
        view.addSubview(storyImage)
    }

    func setupFollowButton()
    {
        followButton = UIButton()
        followButton.frame = CGRect(x:80,y: userName.frame.height + 12, width: 75,height: 30)
        followButton.setTitle("Follow", for: .normal)
        followButton.setTitleColor(UIColor.white, for: .normal)
        followButton.isHidden = false
        followButton.backgroundColor = UIColor.gray
        followButton.layer.masksToBounds = true
        followButton.layer.cornerRadius = 5
        view.addSubview(followButton)
        followButton.addTarget(self, action: #selector(DetailViewController.buttonAction(_:)), for: UIControlEvents.touchUpInside)
    }
    
    func setupFollowingButton()
    {
        followButton = UIButton()
        followButton.frame = CGRect(x:80,y: userName.frame.height + 12, width: 100,height: 30)
        followButton.setTitle("Following", for: .normal)
        followButton.setTitleColor(UIColor.white, for: .normal)
        followButton.isHidden = false
        followButton.backgroundColor = UIColor.gray
        followButton.layer.masksToBounds = true
        followButton.layer.cornerRadius = 5
        view.addSubview(followButton)
    }
    
    func buttonAction(_ sender: UIButton) {
        
        followButton.setTitleColor(UIColor.blue, for: .normal)
        let userDefaultsInfo = UserDefaults.standard
        if userDefaultsInfo.value(forKey: "followedGroups") != nil
        {
            var followedGroups = userDefaultsInfo.value(forKey: "followedGroups") as! Array<String>
            if followedGroups.contains(self.detailItem?.value(forKey: "db")! as! String)
            {
                
            }
            else
            {
                followedGroups.append(self.detailItem?.value(forKey: "db")! as! String)
                userDefaultsInfo.removeObject(forKey: "followedGroups")
                userDefaultsInfo.set(followedGroups, forKey: "followedGroups")
            }
        }
        else
        {
            userDefaultsInfo.set([self.detailItem?.value(forKey: "db")! as! String], forKey: "followedGroups")
        }
        setupFollowingButton()
        
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

