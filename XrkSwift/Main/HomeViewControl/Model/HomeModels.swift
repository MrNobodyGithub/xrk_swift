//
//  HomeRecModel.swift
//  XrkSwift
//
//  Created by jason on 2017/9/8.
//  Copyright © 2017年 HuaZhengInfo. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON


//-----------------model------------------
class HomeModelList: HandyJSON  {
   
    var store_avatar_url :String = ""
    var store_avatar: String = ""
    var store_name: String = ""
    var store_area_info: String = ""
    var store_id : String = ""
    required init() {
    }
    
}

class HomeModelCategory: HandyJSON {
    var gc_id : String = ""
    var gc_name : String = ""
    var cn_pic : String = ""
    required init( ) {
    }
}
class HomeModelCycle: HandyJSON {
    var banner_title : String = ""
    var banner_img : String = ""
    var banner_url : String = ""
    required init( ) {
    }
}

//class HomeModel {
//    var banner_img: String?
//    var banner_title: String?
//    var banner_url: String?
//
//    init(jsonData: JSON) {
//        banner_url = jsonData["banner_url"].stringValue;
//        banner_img = jsonData["banner_img"].stringValue
//        banner_title = jsonData["banner_title"].stringValue
//
//    }
//}


