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
  
    static func homeRequestCycle(params: AnyObject? = nil, success:@escaping (_ result: Any) -> (),fail:@escaping(_ error: NSError) -> ())  {
        RequestTool.defaultTool.request(method: .get, urlString: URL_home_cycle, parameters: params, resultBlock: { (res) in
            
            let b = BaseResult.deserialize(from: res)
            let list : NSDictionary = res!["datas"] as! NSDictionary
            let bannerList: NSArray = list["banner_position_list"] as! NSArray
            let arra:NSArray = bannerList[0] as! NSArray
            let arrB : NSArray = arra[0] as! NSArray
            
//            ["banner_position_list"][0][0]
            let mutArr = NSMutableArray.init()
            for dict : NSDictionary in arrB as! [NSDictionary]{
                let model = HomeModelCycle.deserialize(from: dict)
                mutArr.add(model ?? HomeModelCycle.init())
            }
            b?.array = mutArr.copy() as! NSArray
            success(b ?? BaseResult.init())
            
        }) { (err) in
            fail(err!)
        }
    }
    static func homeRequestCategory(params: AnyObject? = nil, success:@escaping (_ result: Any) -> (),fail:@escaping(_ error: NSError) -> ())  {
        RequestTool.defaultTool.request(method: .get, urlString: URL_home_category, parameters: params, resultBlock: { (res) in
            
            let b = BaseResult.deserialize(from: res)
            let list: NSArray  = res!["datas"] as! NSArray
            let mutArr = NSMutableArray.init()
            for dic : NSDictionary in list as! [NSDictionary]  {
                let model = HomeModelCategory.deserialize(from: dic)
                mutArr.add(model ?? HomeModelCategory.init())
            }
            b?.array = mutArr.copy() as! NSArray
            success(b ?? BaseResult.init())
            
        }) { (err) in
            fail(err!)
        }
    }
    
    static func homeRequestList(params: AnyObject? = nil, success:@escaping (_ result: Any) -> (),fail:@escaping(_ error: NSError) -> ())  {
    
        RequestTool.defaultTool.request(method: .get, urlString: URL_home_list, parameters: params, resultBlock: { ( responseObj) in
            let b =  BaseResult.deserialize(from: responseObj)
            let datas: NSDictionary = responseObj!["datas"] as! NSDictionary
            let list = datas["recommend_list"]
            let mutArr = NSMutableArray.init()
            for dic: NSDictionary in list as! Array{
                let submodel = HomeModelList.deserialize(from: dic)
                mutArr.add(submodel ?? HomeModelList())
            }
            b?.array = mutArr.mutableCopy() as! NSArray
            success(b ?? BaseResult())
        }) { (err) in
            fail(err!)
        }
    }
    
}
