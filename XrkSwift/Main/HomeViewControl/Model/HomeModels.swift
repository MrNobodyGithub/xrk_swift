//
//  HomeRecModel.swift
//  XrkSwift
//
//  Created by jason on 2017/9/8.
//  Copyright © 2017年 HuaZhengInfo. All rights reserved.
//

import UIKit
import SwiftyJSON
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
class HomeModelList {
    var store_id: String
    var store_name: String
    init(json:JSON) {
        store_id = json["store_id"].stringValue
        store_name = json["store_name"].stringValue
    }
}

