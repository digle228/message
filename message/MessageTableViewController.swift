//
//  MessageTableViewController.swift
//  message
//
//  Created by wusuchen on 2016/1/11.
//  Copyright © 2016年 ac. All rights reserved.
//

import UIKit
import Parse

class MessageTableViewController: UITableViewController, MessageAddViewControllerDelegate{
    
    var message = [Message]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100
        refreshControl = UIRefreshControl ()
        refreshControl?.addTarget(self, action: "reload:", forControlEvents: .ValueChanged)
        self.title = "Peter Pan 專用"
        
        
        
        self.reload(self.refreshControl!)
        
        
    }
    //reload func
    func reload(sender: AnyObject) {
        self.refreshControl?.beginRefreshing()
        
        let messageQuary : PFQuery = Message.query()!
        messageQuary.orderByDescending("createdAt")
        // 接收訊息
        messageQuary.findObjectsInBackgroundWithBlock { (objects : [PFObject]?, error: NSError?) -> Void in
            
            self.refreshControl?.endRefreshing()
            
            if (error == nil && objects != nil && objects?.count > 0) {
                self.message.removeAll()
                // 轉型 to message Array
                objects?.forEach({ (element) -> () in
                    self.message.append(element as! Message)
                })
                self.tableView.reloadData()
            }
            
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.message.count
    }

    
    
    
    
    
  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath)

        // Configure the cell...
        
        let eachMessage = self.message[indexPath.row]
        
        let messageCellin: MessageTableViewCell = cell as! MessageTableViewCell
        
        messageCellin.content.text = eachMessage.content
        
        //Date format String
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-DD HH:mm" //時間格式
        
        messageCellin.dateAndTime.text = dateFormatter.stringFromDate(eachMessage.createdAt!)
        
        
                
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Addmessage" {
            let messageViewController = segue.destinationViewController as! MessageAddViewController
            messageViewController.delegate = self
        }

        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
   
    // Mark : - MessageAddViewControllerDelegate
    func messageViewController(contreller: MessageAddViewController, messageAddedmessage: Message) {
        contreller.dismissViewControllerAnimated(true) { () -> Void in
            self.reload(self.refreshControl!)
        }
    }
}
