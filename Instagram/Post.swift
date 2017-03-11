//
//  Post.swift
//  Instagram
//
//  Created by Becky Chan on 3/10/17.
//  Copyright © 2017 Becky Chan. All rights reserved.
//

import UIKit
import Parse

class Post: NSObject {
    var image: PFFile?
    var user: PFUser?
    var caption: String?
    var likeCount: Int?
    var CommentCount: Int?
    
    
    //Add user post to Parse (upload image file)
    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?){
        let post = PFObject(className: "Post")
//        post["media"] = PFFile.FromImage(image)
        post["media"] = getPFFromImage(image: image)
        post["author"] = PFUser.current()
        post["caption"] = caption
        post["likeCount"] = 0
        post["commentsCounts"] = 0
        post.saveInBackground(block: completion)
    }
    
    
    //convert UIImage to PFFile
    class func getPFFromImage(image: UIImage?) -> PFFile? {
        if let image = image {
            if let imageData = UIImagePNGRepresentation(image){
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil

    }

}
