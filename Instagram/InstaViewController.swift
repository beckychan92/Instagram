//
//  InstaViewController.swift
//  Instagram
//
//  Created by Becky Chan on 3/10/17.
//  Copyright © 2017 Becky Chan. All rights reserved.
//

import UIKit

class InstaViewController: UIViewController {
    
    

    
    
    
    
    
    
    
    
    
    @IBAction func onLogout(_ sender: Any) {
        self.performSegue(withIdentifier: "homeSegue", sender: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
