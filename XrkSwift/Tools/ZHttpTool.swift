//
//  ZHttpTool.swift
//  XrkSwift
//
//  Created by jason on 2017/9/8.
//  Copyright © 2017年 HuaZhengInfo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD
enum MethodType {
    case get
    case post
}

enum ZNetworkReachabilityStatus {
    case StatusUnknown,
    StatusNotReachable,
     StatusReachableViaWWAN,
      StatusReachableViaWiFi
}
class ZHTTPTool{
    
    public func netWorkReachability(){
        
        var manager: NetworkReachabilityManager
        manager = NetworkReachabilityManager.init(host: ADDRESS)!
        
        manager.listener = { status in
            
            print(status)
            
            var enumStatus : ZNetworkReachabilityStatus = ZNetworkReachabilityStatus.StatusUnknown
            
            let sta = NetworkReachabilityManager.NetworkReachabilityStatus.self
            
            if  status == sta.unknown {
                enumStatus = ZNetworkReachabilityStatus.StatusUnknown
                ZCommonTool.alertWithDetail(detail: "当前未知网络")
            }else if status == sta.notReachable{
                ZCommonTool.alertWithDetail(detail: "当前网络未连接")
                enumStatus = ZNetworkReachabilityStatus.StatusNotReachable
                
            }else if status == sta.reachable(NetworkReachabilityManager.ConnectionType.wwan){
                
                enumStatus = ZNetworkReachabilityStatus.StatusReachableViaWWAN
                
            }else if status == sta.reachable(NetworkReachabilityManager.ConnectionType.ethernetOrWiFi){
                enumStatus = ZNetworkReachabilityStatus.StatusReachableViaWiFi
                
            }
            let str = ZtoString(&enumStatus) 
            UserDefaults.standard.set(str, forKey: Key_AFNetworkStatus)
        }
        manager.startListening()
    }
    
    class func requestData(_ type:MethodType, urlString:String ,params: [String : Any]? = nil, success:@escaping(_ result : Any) -> (), fail:@escaping(_ result : Any) -> ()) {
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(urlString, method: method, parameters: params).responseJSON { (response) in
            print(response)
            let result = response.result.value 
            let json = JSON(result ?? [])
            JSON.init(rawValue: result)
             success(json)
//            success(JSON.init(result ?? "a"))
        }
    }
}

