//
//  TestOcViewController.m
//  XrkSwift
//
//  Created by CityMedia on 2018/4/19.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

#import "TestOcViewController.h"
#import "XrkSwift-Swift.h"
@interface TestOcViewController ()

@end

@implementation TestOcViewController
- (IBAction)btnAction:(id)sender {
    
//    HomeViewController
    HomeViewController * vc = [[HomeViewController alloc] init];
    [vc testA];
//    HomeListCell * cell = [[HomeListCell alloc] init];
//    cell.itemString
//    vc.dataArr
//    [vc testA];
     
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
