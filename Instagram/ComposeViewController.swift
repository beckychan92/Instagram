//
//  ComposeViewController.swift
//  Instagram
//
//  Created by Becky Chan on 3/10/17.
//  Copyright © 2017 Becky Chan. All rights reserved.
//

import UIKit
import MBProgressHUD

class ComposeViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var instaImage: UIImageView!
    @IBOutlet weak var instaCaption: UITextField!
    
    
    //instantiate a UIImagePickController
    let vc = UIImagePickerController()
//    vc.delegate = self
//    vc.allowsEditing = true
//    vc.sourceType = UIImagePickerControllerSourceType.camera
//    self.present(vc, animated: true, completion: nil)
    
    
    
    @IBAction func onImageTap(_ sender: Any) {
        
        print("image tapped!")
        MBProgressHUD.showAdded(to: self.view, animated: true)
        Post.postUserImage(image: self.instaImage?.image, withCaption: self.instaCaption?.text) { (success: Bool, error: Error?) in
            if success {
                print("image works")
                MBProgressHUD.hide(for: self.view, animated: true)
                self.dismiss(animated: true, completion: nil)
            } else {
                print(error?.localizedDescription)
                }
            }
        print("worked?")
    }
    
    
    @IBAction func uploadButton(_ sender: Any) {
        vc.allowsEditing = true
        vc.sourceType = .photoLibrary
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("cancel complete")
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]){

        
        if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            print("picture selected")
            instaImage.contentMode = .scaleAspectFit
            instaImage.image = originalImage
            self.instaImage.isHidden = false
        }
        
//        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage

        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.instaImage.isHidden = true
        
        vc.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
