//
//  HomeViewController.swift
//  XrkSwift
//
//  Created by jason on 2017/9/8.
//  Copyright © 2017年 HuaZhengInfo. All rights reserved.
//
import UIKit

import SwiftyJSON
//import SwiftyJSON

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
        let vc = TestViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        let nav = UINavigationController.init(rootViewController: TestViewController())
        
        self.present(nav, animated: true) {
            
        }
        
    }
    func requestData() {
        
        //        http://www.hisunflower.com/mobile/index.php?act=service_store&op=recommend_list&area_id=224&curpage=0&page=10
        
        let url = "http://www.hisunflower.com/mobile/index.php?act=service_store&op=recommend_list"
//        let param = "act=service_store&op=recommend_list&area_id=224&curpage=0&page=10"
//        &area_id=224&curpage=0&page=10
        let model = HomeModelOne.init(area_id: "224")
        let json = JSON.init(model)
        
        print(json)
        RequestTool.defaultTool.request(method: .get, urlString: url, parameters: json as AnyObject) { (responseObj , err ) in
            
            print("-------")
            print(responseObj)
            print("++++++")
            let jsona = JSON.init(responseObj)
            print(jsona)
            let result = BaseResult.init()
            result.code = jsona["code"].int!
//            result.array = jsona["recommend_list"].array! as NSArray
//            BaseResult.object
//            User.objectWithKeyValues(dict
//            let resultafs =  BaseResult.setValuesForKeys(jsona)
//            let mutarr = NSMutableArray.init()
            
            
            
            
            
            
            
            
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
