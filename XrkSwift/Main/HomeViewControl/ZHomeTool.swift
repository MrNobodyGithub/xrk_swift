//
//  ZHomeTool.swift
//  XrkSwift
//
//  Created by jason on 2017/9/8.
//  Copyright © 2017年 HuaZhengInfo. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON

class ZHomeTool: NSObject {
  
    static func homeRequestCycle(params: [String : Any], success:@escaping (_ result: Any) -> (),fail:@escaping(_ error: Error) -> ())  {
    
        ZHTTPTool.requestDataNOParam(.get, urlString: URL_home_cycle, success: { (res) in
            let b = BaseResult.deserialize(from: res)
            let list : NSDictionary = res["datas"] as! NSDictionary
            let bannerList: NSArray = list["banner_position_list"] as! NSArray
            let arra:NSArray = bannerList[0] as! NSArray
            
            let mutArr = NSMutableArray.init()
            for dict : NSDictionary in arra as! [NSDictionary]{
                let model : HomeModelCycle = HomeModelCycle.deserialize(from: dict)!
                mutArr.add(model)
            }
            b?.array = mutArr.copy() as! NSArray
            success(b ?? BaseResult.init())
        }, fail: { (err) in
            fail(err )
        })
         
    }
    static func homeRequestCategory( success:@escaping (_ result: Any) -> (),fail:@escaping(_ error: Error) -> ())  {
        
        ZHTTPTool.requestDataNOParam(.get, urlString: URL_home_category, success: { (res) in
            let b = BaseResult.deserialize(from: res)
            let list: NSArray  = res["datas"] as! NSArray
            let mutArr = NSMutableArray.init()
            for dic : NSDictionary in list as! [NSDictionary]  {
                let model = HomeModelCategory.deserialize(from: dic)
                mutArr.add(model ?? HomeModelCategory.init())
            }
            b?.array = mutArr.copy() as! NSArray
            success(b ?? BaseResult.init())
            
        }, fail: { (err) in
            
            fail(err)
        })
       
       }
    
    static func homeRequestList(params: [String : Any], success:@escaping (_ result: Any) -> (),fail:@escaping(_ error: Error) -> ())  {
    
        ZHTTPTool.requestData(.get, urlString: URL_home_list, params: params, success: { (res) in
            
            
            let b =  BaseResult.deserialize(from: res)
//            let datas: NSDictionary = res["datas"] as! NSDictionary
//            let list = datas["recommend_list"]
            
            let json = JSON.init(res)
            let newArr = json["datas"]["recommend_list"].arrayValue
            let mutArr = NSMutableArray.init()
            for js: JSON in newArr {
                 let submodel = HomeModelList.deserialize(from: js.dictionaryValue)
                mutArr.add(submodel ?? HomeModelList())
            }
            b?.array = mutArr.mutableCopy() as! NSArray
            success(b!)
        }, fail: { (err) in
            fail(err)
        })
        
    }
    
}
