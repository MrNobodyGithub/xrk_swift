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

class HomeViewController: BaseViewController , UITableViewDelegate, UITableViewDataSource{
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
    }
    func basicConfigration()  {
         self.title = "home"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(actionRightItem))
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
        requestDataHeader()
        requestDataList()
    }
    func  requestDataHeader()  {
        
    }
    func requestDataList()  {
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
    }
    func setupTableview()  {
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: MLScreenWidth, height: MLScreenHeight - 0 - 49))
        self.view.addSubview(tableView)
        tableView.backgroundColor = UIColor.cyan
        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        
        //tableHeaderView

        let headerView = HomeHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: MLScreenWidth, height: 200))
        headerView.dataArr = ["a","b","a","b","a","b","a","b","a","b"]
        tableView.tableHeaderView = headerView
        self.headerView = headerView
        headerView.backgroundColor = UIColor.cyan
        
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
    
    func kAudio( ) {
        let str = "http://fs.w.kugou.com/201803201552/bdf56716d06d36c70c98c6d664256d05/G129/M07/0F/1D/YZQEAFqEPxCAATmCADTDHJ21QXE192.mp3"
        let url = NSURL.init(string: str)
        let player = AVPlayer.init(url: url! as URL)
        self.player_s = player
        player.play()

    }
    
}
