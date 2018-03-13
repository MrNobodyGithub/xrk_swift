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
//--------------param ---------------
class HomeParamList: HandyJSON {
    //    &area_id=224&curpage=0&page=10
    var area_id :String = ""
    var curpage: String = ""
    var page : String = ""
    
    required init() {
    }
}

//-----------------model------------------
class HomeModelList: HandyJSON {
    //    &area_id=224&curpage=0&page=10
    var store_avatar_url :String = ""
    var store_avatar: String = ""
    var store_name: String = ""
    var store_area_info: String = ""
    var store_id : String = ""
    required init() {
    }
    
}



class HomeModelOne: NSObject {
    //    &area_id=224&curpage=0&page=10
    var area_id :String
    var curpage: String
    var page : String
    
    required init(area_id:String) {
        self.area_id = area_id
        self.curpage = "0"
        self.page = "10"
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
//class HomeModelList {
//    var store_id: String
//    var store_name: String
//    init(json:JSON) {
//        store_id = json["store_id"].stringValue
//        store_name = json["store_name"].stringValue
//    }
//}

