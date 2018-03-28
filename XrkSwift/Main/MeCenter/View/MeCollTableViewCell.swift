//
//  MeCollTableViewCell.swift
//  XrkSwift
//
//  Created by jason on 2018/3/28.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import UIKit
import SDWebImage

class MeCollTableViewCell: UITableViewCell {

    typealias TestBlock = (MeModelCol)->()
    var block : TestBlock?
    
    @IBAction func btnActionQuit(_ sender: UIButton) {
        if (self.block != nil) {
            self.block!(self.model!)
        }
    }
    @IBOutlet weak var cellLab: UILabel!
    @IBOutlet weak var cellImageV: UIImageView!
   
    var model: MeModelCol!{
        didSet{
            cellLab.text = model.goods_name
            cellImageV.sd_setImage(with: URL.init(string: (model.goods_image)), placeholderImage: UIImage.init(named: "default"), options: SDWebImageOptions.retryFailed) { (image, err, type, url) in
                self.cellImageV.image = image
            }
        }
    }
    
    public class func cellWith(tableView: UITableView) -> MeCollTableViewCell {
        var  cell  = tableView.dequeueReusableCell(withIdentifier: "MeCollTableViewCellId")
        if (cell == nil)  {
            cell = (Bundle.main.loadNibNamed("MeCollTableViewCell", owner: self, options: nil)?.first as! UITableViewCell)
        }
        return cell as! MeCollTableViewCell
        
    }
    
    
    
}
