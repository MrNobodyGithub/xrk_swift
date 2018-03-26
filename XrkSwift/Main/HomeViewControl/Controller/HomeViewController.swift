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
import MBProgressHUD
import MJRefresh


class HomeViewController: BaseViewController , UITableViewDelegate, UITableViewDataSource ,HomeHeaderViewDelegate{
    
  
    @IBOutlet weak var viewdown: UIView!
    
    var player_s :AVPlayer = AVPlayer.init()
    
    var dataArr = NSArray.init()
    var tableView: UITableView!
    var headerView : HomeHeaderView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
         basicConfigration()
         setupTableview()
         requestData()
         setupRefresh()
    }
    func basicConfigration()  {
         self.title = "home"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(actionRightItem))
    }
    
    func setupRefresh(){
//         self.tableView.mj_header = MJRefreshNormalHeader.
        
        
        let header = MJRefreshNormalHeader()
        // 下拉刷新
        header.setRefreshingTarget(self, refreshingAction: #selector(refreshUp))
//        header.setRefreshingTarget(self, refreshingAction: Selector("headerRefresh"))
        // 现在的版本要用mj_header
        self.tableView.mj_header = header
        
    }
    func refreshUp(){
        requestData()
        self.tableView.mj_header.endRefreshing()
    }
    
    func actionRightItem()  {
        
        
        ZShowHud.show(view: self.view)
        
//        MBProgressHUD.zshow(view: self.view)
//        MBProgressHUD.showAdded(to: self.view, animated: true)
//        MBProgressHUD.hudShowMessage(curview: self.view, message: "adsf")
        DispatchQueue.global(qos: .default).asyncAfter(deadline: DispatchTime.now() + 2) {
            DispatchQueue.main.async(execute: {
                ZShowHud.hide(view: self.view)
//                MBProgressHUD.zhide(view: self.view)
//                MBProgressHUD.hudHid(curview: self.view)
//                MBProgressHUD.hide(for: self.view, animated: true)
            })

        }
         
    }
    func requestData() {
        requestDataHeaderCategory()
        requestDataHeaderCycle()
        requestDataList()
    }
    func requestDataHeaderCycle()  {
        let param = HomeParamCycle.init(gc_id: "0")
        let json = param.toJSON()
        ZHomeTool.homeRequestCycle(params: json as AnyObject, success: { ( res) in
            let b : BaseResult = res as! BaseResult
            if b.success == true{
                self.headerView.dataArrCycle = b.array
             }else{
                
            }
            
        }) { (err) in
            MBProgressHUD.hudShowMessage(curview: self.view, message: MESSAGE_newwork_fail)
        }
    }
    func requestDataHeaderCategory()  {
        ZHomeTool.homeRequestCategory(success: { (res) in
            
            let result : BaseResult = res as! BaseResult
            if  result.success {
                self.headerView.dataArrCategory = result.array
            }else{
                MBProgressHUD.hudShowMessage(curview: self.view, message: result.error)
            }
        }) { (err) in
            MBProgressHUD.hudShowFail(curview: self.view, text: "fail")
        }
    }
    func requestDataList()  {
        
        let m = HomeParamList(areaId: "224",curp: "0",pg:"100")
        let json = m.toJSON()
        MBProgressHUD.zshow(view: self.view)
        
        
        
        ZHomeTool.homeRequestList(params: json as AnyObject, success: { ( res) in
            
            MBProgressHUD.zhide(view: self.view)
            let result: BaseResult = res as! BaseResult
            if result.success {
                self.dataArr = result.array
                self.tableView.reloadData()
            }else{
                
            }
        }) { ( err) in
            
            MBProgressHUD.zhide(view: self.view)
        }
    }
    func setupTableview()  {
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: MLScreenWidth, height: MLScreenHeight - 0 - 49))
        self.view.addSubview(tableView)
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        
        //tableHeaderView
        let headerView = HomeHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: MLScreenWidth, height:200 + MLScreenWidth/2.0 ))
         tableView.tableHeaderView = headerView
        headerView.delegate = self
        self.headerView = headerView
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
    
    
    //音频在线播放
    
    func kAudio( ) {
        let str = "http://fs.w.kugou.com/201803201552/bdf56716d06d36c70c98c6d664256d05/G129/M07/0F/1D/YZQEAFqEPxCAATmCADTDHJ21QXE192.mp3"
        let url = NSURL.init(string: str)
        let player = AVPlayer.init(url: url! as URL)
        self.player_s = player
        player.play()

    }
    // 代理方法 点击cycle 点击类别
    func clickCycle(model: HomeModelCycle) {
        print("--cycle--",model.banner_title)
    }
    func clickCategory(model: HomeModelCategory) {
        print("--%@--",model.gc_name)
    }

    
}
