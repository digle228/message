//
//  Message.swift
//  message
//
//  Created by wusuchen on 2016/1/11.
//  Copyright © 2016年 ac. All rights reserved.
//  擴充功能

import Parse

public class Message: PFObject, PFSubclassing {
    
    @NSManaged var content : String
    
    /**
     To initialize for the Parse object.
     */
    override public class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    /**
     Refrence class name to Parse
     
     - returns: The class name on Parse
     */
    public static func parseClassName() -> String {
        return "Message"
    }
}
