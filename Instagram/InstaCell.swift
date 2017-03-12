//
//  InstaCell.swift
//  Instagram
//
//  Created by Becky Chan on 3/11/17.
//  Copyright © 2017 Becky Chan. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import MBProgressHUD

class InstaCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var instaImage: PFImageView!
    

    
    var post: Post!{
        didSet{
            userNameLabel.text = post.user?.username
            captionLabel.text = post.caption
            
            // Add the image
//            self.instaImage.image = post.image
            self.instaImage.loadInBackground()
            
            
        }
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
