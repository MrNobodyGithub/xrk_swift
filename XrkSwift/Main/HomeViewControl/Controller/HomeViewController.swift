//
//  HomeViewController.swift
//  XrkSwift
//
//  Created by jason on 2017/9/8.
//  Copyright © 2017年 HuaZhengInfo. All rights reserved.
//
import UIKit

import SwiftyJSON
import HandyJSON

class HomeViewController: UIViewController {
    @IBOutlet weak var viewdown: UIView!
    
    var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.basicConfigration()
        self.setupTableview()
        requestData()
    }
    func basicConfigration()  {
         self.title = "home"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(actionRightItem))
    }
    
    func actionRightItem()  {
        
        
    }
    func requestData() {
        let url = "http://www.hisunflower.com/mobile/index.php?act=service_store&op=recommend_list"
//        let model = HomeModelOne.init(area_id: "224")
//        var json = JSON.init(model)
        
        let m = HomeParamList()
        m.area_id = "224"
        m.curpage = "0"
        m.page = "10"
        let  json = m.toJSONString()
        RequestTool.defaultTool.request(method: .get, urlString: url, parameters: json as AnyObject) { (responseObj , err ) in
            
//            print("-------")
//            print(responseObj)
//            print("++++++")
            
            let b =  BaseResult.deserialize(from: responseObj)
            if (b?.success)! {
                print("success")
            }else{
                print("fail")
            }
//            print("code:",b?.code ?? "10")
//            print("page_total",b?.page_total ?? "3")
            
            
//            print( responseObj)
//            let arr =  responseObj[0]
//            print(arr)
            
//        let jsonData = responseObj?.keys
            print("-------")
            var datas: NSDictionary = responseObj!["datas"] as! NSDictionary
            let list = datas["recommend_list"]
//            print(list)
//            print("++")
            
            var mutArr = NSMutableArray.init()
            for dic: NSDictionary in list as! Array{
                let submodel = HomeModelList.deserialize(from: dic)
                mutArr.add(submodel)
            }
            b?.array = mutArr.mutableCopy() as! NSArray
            print(b?.array, "++")
            
//            print(jsonData)
            
//            let jsonData:Data = jsonString.data(using: .utf8)!
//            
//            let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
//            if dict != nil {
//                return dict as! NSDictionary
//            }
//            return NSDictionary()
            
            
            
            
            
        }
//        NetworkTools.shardTools.request(method: .Post, urlString: urlString, parameters: params as AnyObject?) { (responseObject, error) in
//
//            if error != nil {
//                print(error!)
//                return
//            }
//            guard (responseObject as? [String : AnyObject]) != nil else{
//
//                return
//            }
//            print(responseObject!)
//        }
        

        
         
    }
    func setupTableview()  {
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 64, width: MLScreenWidth, height: MLScreenHeight - 64 - 49))
        self.view.addSubview(tableView)
        tableView.backgroundColor = UIColor.cyan
     }
}
