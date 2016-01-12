//
//  MessageAddViewController.swift
//  message
//
//  Created by wusuchen on 2016/1/11.
//  Copyright © 2016年 ac. All rights reserved.
//

import UIKit



protocol MessageAddViewControllerDelegate {
    func messageViewController(contreller: MessageAddViewController, messageAddedmessage: Message)
}


class MessageAddViewController: UIViewController {
    
    var delegate : MessageAddViewControllerDelegate?
    
    
    @IBOutlet weak var contentTextView: UITextView!
    

    @IBOutlet weak var publish: UIButton!

    @IBAction func publishButton(sender: AnyObject) {
        
        if let messageText = self.contentTextView.text {
        let message : Message = Message()
        message.content = messageText
        message.saveInBackgroundWithBlock { (saved: Bool, error: NSError?) -> Void in
            if error == nil && saved {
                if (self.delegate != nil){
                    self.delegate?.messageViewController(self, messageAddedmessage: message)
                }
                self.navigationController?.popToRootViewControllerAnimated(true)                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//                    
//        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
         
    
    }
    
    

