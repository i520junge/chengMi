//
//  JGSettingVC.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/19.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGSettingVC.h"
#import "JGPushVC.h"
#import "JGChooseVC.h"

@interface JGSettingVC ()

@end

@implementation JGSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor] ;
    self.title = @"设置" ;
    self.tableView.separatorColor = [UIColor grayColor] ;
    
    [self setGroup0] ;
    [self setGroup1] ;
    
    //设置分割线样式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //设置底部退出登录按钮
    UIView *footV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.x = 10;
    btn.width = screenW - 2 * btn.x;
    btn.height = 44;
    btn.layer.cornerRadius = 8;
    [footV addSubview:btn];
    
    self.tableView.tableFooterView = footV;
}
//设置第一组
-(void)setGroup0{
//    设置行
    JGArrowItem *rowItem1 = [JGArrowItem rowItemWithIconImage:[UIImage imageNamed:@"handShake"] title:@"个人中心" subTitle:nil] ;
    rowItem1.destinationControlerName = [JGPushVC class] ;
    
    JGSwicthItem *rowItem2 = [JGSwicthItem rowItemWithIconImage:[UIImage imageNamed:@"lamp"] title:@"显示" subTitle:nil] ;
    
    JGArrowItem *rowItem3 = [JGArrowItem rowItemWithIconImage:[UIImage imageNamed:@"more_homeshake"] title:@"点我有惊喜" subTitle:nil] ;
    rowItem3.destinationControlerName = [JGChooseVC class] ;
//    一组中有多少行
    NSArray *rowArray = @[rowItem1,rowItem2,rowItem3] ;
    
    JGGroupItem *groupItem = [JGGroupItem groupItemWithRowArray:rowArray] ;
    groupItem.headerTitle = @"第0组头部" ;
    [self.groupArray addObject:groupItem] ;
}

-(void)setGroup1{
    //    设置行
    JGArrowItem *rowItem1 = [JGArrowItem rowItemWithIconImage:[UIImage imageNamed:@"handShake"] title:@"个人中心" subTitle:@"哈哈哈哈"] ;
    rowItem1.destinationControlerName = [JGPushVC class] ;
    
    JGSwicthItem *rowItem2 = [JGSwicthItem rowItemWithIconImage:[UIImage imageNamed:@"lamp"] title:@"显示" subTitle:nil] ;
    
    JGArrowItem *rowItem3 = [JGArrowItem rowItemWithIconImage:nil title:@"系统" subTitle:nil] ;
    
    JGArrowItem *rowItem4 = [JGArrowItem rowItemWithIconImage:[UIImage imageNamed:@"RedeemCode"] title:@"开奖" subTitle:nil] ;
    rowItem4.destinationControlerName = [JGPushVC class] ;
    
    //    一组中有多少行
    NSArray *rowArray = @[rowItem1,rowItem2,rowItem3,rowItem4] ;
    
    JGGroupItem *groupItem = [JGGroupItem groupItemWithRowArray:rowArray] ;
    groupItem.headerTitle = @"第1组头部" ;
    groupItem.footerTitle = @"第1组尾部" ;
    [self.groupArray addObject:groupItem] ;
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
