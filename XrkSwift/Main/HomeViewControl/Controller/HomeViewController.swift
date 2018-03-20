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
import AVKit
class HomeViewController: BaseViewController , UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var viewdown: UIView!
    
    var player_s :AVPlayer = AVPlayer.init()
    
    var dataArr = NSArray.init()
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
        
      let str = "http://fs.w.kugou.com/201803201552/bdf56716d06d36c70c98c6d664256d05/G129/M07/0F/1D/YZQEAFqEPxCAATmCADTDHJ21QXE192.mp3"
         let url = NSURL.init(string: str)
        let player = AVPlayer.init(url: url! as URL)
        self.player_s = player
        player.play()
        player.pause()
    }
    func requestData() {
        let url = URL_home_list
//        let model = HomeModelOne.init(area_id: "224")
//        var json = JSON.init(model) 
        let m = HomeParamList(areaId: "224",curp: "0",pg:"10")
        let  json = JSON.init(m)
 
        
        
        ZHomeTool.homeRequestList(params: json as AnyObject, success: { ( res) in
            let result: BaseResult = res as! BaseResult
            if result.success {
                self.dataArr = result.array
                self.tableView.reloadData()
            }else{
            
            }
        }) { ( err) in

        }
        
//        RequestTool.defaultTool.request(method: .get, urlString: url, parameters: json as AnyObject, resultBlock: { (responseObj) in
//            let b =  BaseResult.deserialize(from: responseObj)
//            if (b?.success)! {
//                print("success")
//            }else{
//                print("fail")
//            }
//
//            let datas: NSDictionary = responseObj!["datas"] as! NSDictionary
//            let list = datas["recommend_list"]
//            let mutArr = NSMutableArray.init()
//            for dic: NSDictionary in list as! Array{
//                let submodel = HomeModelList.deserialize(from: dic)
//                mutArr.add(submodel)
//            }
//            b?.array = mutArr.mutableCopy() as! NSArray
//
//            self.dataArr = (b?.array)!
//            self.tableView.reloadData()
//        }) { (err) in
//
//
//        }
//

        
         
    }
    func setupTableview()  {
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 64, width: MLScreenWidth, height: MLScreenHeight - 64 - 49))
        self.view.addSubview(tableView)
        tableView.backgroundColor = UIColor.cyan
        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
     }
    
    //代理方法
    //tableviewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.dataArr.count > 0 {
             return self.dataArr.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeListCell.cellWith(tableView: tableView)
        cell.cellWithData(model: self.dataArr[indexPath.row] as! HomeModelList)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
