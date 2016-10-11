//
//  Goal.swift
//  DreamComeTrue
//
//  Created by Unite-iMac on 16/10/11.
//  Copyright © 2016年 水蒸气很快乐. All rights reserved.
//

import Foundation
import CoreData
extension User {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User");
    }
    public var address: String?
     public var email: String?
     public var headImg: NSData?
     public var isLeave: Bool
    public var name: String?
     public var tel: String?
     public var birthDay: String?
}

