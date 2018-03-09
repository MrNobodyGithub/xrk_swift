//
//  ZHomeTool.swift
//  XrkSwift
//
//  Created by jason on 2017/9/8.
//  Copyright © 2017年 HuaZhengInfo. All rights reserved.
//

import UIKit
import SwiftyJSON
class ZHomeTool: NSObject {
 
   static func homeRequest(_ type:MethodType, urlString:String ,params: [String : Any]? = nil, success:@escaping(_ result : Any) -> () ){
        ZHTTPTool.requestData(.get, urlString: urlString, params: nil, success: { ( res) in
            let aa  = res as! JSON;
            let dic =  aa["datas"]["banner_position_list"][0][0]
            let model = HomeModel.init(jsonData: dic )
            success(model)
        }) { (res) in
            
        }
    }
  
   
    func homeRequestList(params:[ String: Any]? = nil, success:@escaping (_ result: Any) -> ())  {
        ZHTTPTool.requestData(.get, urlString: URLHomeList, params: nil, success: { ( res) in
            let result = BaseResult.init(json: res as! JSON)
            if result.success {
                let aa = res as! JSON
                let arr = aa["datas"]["recommend_list"]
                let mutarr : NSMutableArray = []
                for i in 0...arr.count-1{
                    let model = HomeModelList.init(json: arr[i] )
                    mutarr.add(model)
                    result.datas = model
                }
                result.array = mutarr.mutableCopy() as! NSArray
                
            }
            success(result)
        }) { (res) in
            
        }
        
    }
    
    
}
