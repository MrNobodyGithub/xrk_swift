//
//  BaseModel.swift
//  XrkSwift
//
//  Created by jason on 2018/1/23.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import UIKit

import SwiftyJSON

class BaseResult {
    var code: Int = 0
    var datas: (Any)? = nil
    var array: NSArray = []
    var dict = Dictionary<String, Any>()
    
    var success:Bool{
        get{
 
            if code == 200 {
                return true
            }
            return false
        }
    }
    init(json:JSON) {
         code = json["code"].intValue
        
    }
}
class BaseParam: NSObject {
    var key : String?
    
    
//    var key : String{
//        get{
//            return "0d70d08abff704369a461b1f4f852e80"
//        }
//    }
    
    
}

 


