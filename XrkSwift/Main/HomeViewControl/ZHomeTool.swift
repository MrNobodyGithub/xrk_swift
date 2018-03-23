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
  
    static func homeRequestCategory(params: AnyObject? = nil, success:@escaping (_ result: Any) -> (),fail:@escaping(_ error: NSError) -> ())  {
        RequestTool.defaultTool.request(method: .get, urlString: URL_home_category, parameters: params, resultBlock: { (res) in
            
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