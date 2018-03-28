//
//  PreFix.swift
//  XrkSwift
//
//  Created by jason on 2017/9/8.
//  Copyright © 2017年 HuaZhengInfo. All rights reserved.
//
import UIKit 
//hiaddress
let ADDRESS = "http://test.hisunflower.com/mobile/index.php?"
//let ADDRESS = "http://www.hisunflower.com/mobile/index.php?"
//let ADDRESS = "http://ys.hisunflower.com/mobile/index.php?"


//首页列表
let URL_home_list = ADDRESS+"act=service_store&op=recommend_list"
//个人中心
let URL_me = ADDRESS+"act=member_account&op=getMemberInfo"
//首页分类
let URL_home_category = ADDRESS+"act=service_goods_class&op=get_best_child"

//首页轮播
let URL_home_cycle = ADDRESS+"act=banner&op=get20171116"

//个人收藏
let URL_me_coll = ADDRESS+"act=member_favorites&op=favorites_list"
//个人收藏_取消收藏
let URL_me_coll_cancle = ADDRESS+"act=member_favorites&op=favorites_del"
 
