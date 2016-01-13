//
//  FBLoginViewController.swift
//  
//
//  Created by wusuchen on 2016/1/12.
//
//

import UIKit
import FBSDKLoginKit




class FBLoginViewController: UIViewController  {
    
    @IBOutlet weak var fbLoginBu: FBSDKLoginButton!
    
    
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
