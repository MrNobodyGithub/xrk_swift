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

 
class HomeModel {
    var banner_img: String?
    var banner_title: String?
    var banner_url: String?
      
    init(jsonData: JSON) {
        banner_url = jsonData["banner_url"].stringValue;
        banner_img = jsonData["banner_img"].stringValue
        banner_title = jsonData["banner_title"].stringValue
        
    }
}

