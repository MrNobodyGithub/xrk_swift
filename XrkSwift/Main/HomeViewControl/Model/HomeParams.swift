//
//  HomeParams.swift
//  XrkSwift
//
//  Created by jason on 2018/3/26.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
//--------------param ---------------
class HomeParamList: BaseParam {
    //    &area_id=224&curpage=0&page=10
    var area_id :String = ""
    var curpage: String = ""
    var page : String = ""
    
    
    required init( areaId : String, curp: String, pg:String) {
        //        area_id = areaId
        //        curpage = curp
        //        page = pg
        self.area_id = areaId
        self.curpage = curp
        self.page = pg
        
        //        area_id=224&gc_id=0
    }
}
class HomeParamCycle: BaseParam {
    var area_id :String = "224"
    var gc_id : String = ""
    required init(gc_id : String) {
         self.gc_id = gc_id
    }
}
