//
//  HomeListCellView.swift
//  XrkSwift
//
//  Created by jason on 2018/3/15.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage


class HomeListCell: UITableViewCell {
    
    
  
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellTitle: UILabel!
    
    @IBOutlet weak var cellDetail: UILabel!
    
    var itemString:String?
    
    func cellWithData(model: HomeModelList){
        
        cellTitle.text = model.store_name
        cellImage.sd_setImage(with: NSURL.init(string: model.store_avatar_url)! as? URL)
    
        
    }
    
    
   public class func cellWith(tableView: UITableView) -> HomeListCell {
        var  cell  = tableView.dequeueReusableCell(withIdentifier: "HomeListCellId")
    
        if (cell == nil)  {
            cell = Bundle.main.loadNibNamed("HomeListCell", owner: self, options: nil)?.first as! UITableViewCell
        }
        return cell as! HomeListCell
        
    }
    
}
