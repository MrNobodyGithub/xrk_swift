//
//  ZMeTool.swift
//  XrkSwift
//
//  Created by jason on 2018/1/24.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit

class ZMETool :NSObject{
    
    //收藏 取消
    
    static func meRequestColCancle(params: Any, success:@escaping (_ result: Any) -> (),fail:@escaping(_ error: NSError) -> ())  {
        RequestTool.defaultTool.request(method: .post, urlString: URL_me_coll_cancle, parameters: params as AnyObject, resultBlock: { (res) in
            
            let b = BaseResult.deserialize(from: res)
            success(b as Any)
        }) { (err) in
//            fail(err as! NSError)
            fail(err!)
        }
        
        
        
    }
    
    //收藏
    static func meRequestCol(params: Any, success:@escaping (_ result: Any) -> (),fail:@escaping(_ error: NSError) -> ())  {
        RequestTool.defaultTool.request(method: .get, urlString: URL_me_coll, parameters: params as AnyObject, resultBlock: { (res) in
            
            let b = BaseResult.deserialize(from: res)
  
            if res!["datas"] is NSDictionary{
                let list  = res!["datas"] as! NSDictionary
                let arra: NSArray = list["favorites_list"] as! NSArray
 
                let mutArr = NSMutableArray.init()
                for dict : NSDictionary in arra as! [NSDictionary]{
                    let model : MeModelCol = MeModelCol.deserialize(from: dict)!
                    mutArr.add(model)
                }
                b?.array = mutArr.copy() as! NSArray
            }
            
            
            success(b ?? BaseResult.init())
            
        }) { (err) in
            fail(err!)
        }
        
        //request(method: .get, urlString: URL_home_cycle, parameters: params, resultBlock:
    
    }
    
    
    //test
    static func meRequest(params:[String: Any]? = nil, success:@escaping(_ result : Any) -> ()) {
        ZHTTPTool.requestData(.post, urlString: URL_me, params: params, success: { (res) in
             
        }) { ( res) in
            
        } 
    }
}
