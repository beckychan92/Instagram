//
//  InstaViewController.swift
//  Instagram
//
//  Created by Becky Chan on 3/10/17.
//  Copyright © 2017 Becky Chan. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import MBProgressHUD

class InstaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TableView: UITableView!
    var posts: [Post] = []
    

    
    
    
    
    
    
    @IBAction func onLogout(_ sender: Any) {
        self.performSegue(withIdentifier: "homeSegue", sender: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        // Do any additional setup after loading the view.
        self.getPosts()
    }
    
    func getPosts(){
        // construct query
        let query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        query.limit = 20
        MBProgressHUD.showAdded(to: self.view, animated: true)
        // fetch data asynchronously
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if let posts = posts{
                print("Today is \(Date())")
                for post in posts{
                    self.posts.append(Post())
                }
                self.TableView.reloadData()
                
            }else{
                print(error?.localizedDescription)
            }
        }
        
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("work")
        let cell = TableView.dequeueReusableCell(withIdentifier: "InstaCell", for: indexPath) as! InstaCell
        let post = self.posts[indexPath.row]
        print("work2")
        cell.post = post
        print("work4")
        return cell
        print("work5")
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }

}
