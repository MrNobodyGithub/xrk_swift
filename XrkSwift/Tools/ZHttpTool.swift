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
import HandyJSON
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
     
    class func requestData (_ type:MethodType, urlString:String ,params: [String : Any], success:@escaping(_ result : [String : Any]) -> (), fail:@escaping(_ result : Error) -> (),isHiddenHud: Bool? = false) {
        self .requestDataAll(type, urlString: urlString, params: params , success: success, fail: fail, isHiddenHud: isHiddenHud ?? false)
    }
    class func requestDataNOParam (_ type:MethodType, urlString:String , success:@escaping(_ result : [String : Any]) -> (), fail:@escaping(_ result : Error) -> (),isHiddenHud: Bool? = false) {
        
        self.requestDataAll(type, urlString: urlString, params: BaseParam.init().toJSON() , success: success, fail: fail, isHiddenHud: isHiddenHud ?? false)
    }
    
    
    class func requestDataAll(_ type:MethodType, urlString:String ,params: [String : Any]? = nil, success:@escaping(_ result : [String : Any]) -> (), fail:@escaping(_ result : Error) -> (),isHiddenHud: Bool? = false) {
        
        let window = UIApplication.shared.keyWindow
         if isHiddenHud ?? false{
        }else{
             MBProgressHUD.zshow(view: window)
        }
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
    
        
        Alamofire.request(urlString, method: method, parameters: params).responseJSON { (response) in
            
            if isHiddenHud ?? false{
            }else{ 
                 MBProgressHUD.zhide(view: window)
            }
            let result = response.result.value
            if response.result.isSuccess{
                  success(result as! [String : Any])
            }else{
                fail(response.result.error!)
            }
        }
    }
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
    
    //下载 上传
    
    func downloadAnduploadMethod(host_img_url: String) {
        //下载文件
        Alamofire.download(host_img_url).responseJSON { (returnResult) in
            if let data = returnResult.result.value {
                let image = UIImage(data : data as! Data)
                print("\(image)")
            }else {
                print("download is fail")
            }
        }
        
        //还可以看下载进度
        Alamofire.download(host_img_url).downloadProgress { (progress) in
            print("download progress = \(progress.fractionCompleted)")
            }.responseJSON { (returnResult) in
                if let data = returnResult.result.value {
                    let image = UIImage(data : data as! Data)
                    print("\(image)")
                }else {
                    print("download is fail")
                }
        }
        
    }
    
   
}

