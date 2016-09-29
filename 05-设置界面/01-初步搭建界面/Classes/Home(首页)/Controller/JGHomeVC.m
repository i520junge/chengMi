//
//  JGHomeVC.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/19.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGHomeVC.h"
#import "JGHomeDetailVCViewController.h"
#import "JGHomeSectionItem.h"
#import "JGHomeCell.h"
#import "JGHomeCellItem.h"
#import "JGHomeSectionView.h"

@interface JGHomeVC ()
@property(nonatomic,strong)NSArray *homeDateArray;
@end

@implementation JGHomeVC
-(NSArray *)homeDateArray
{
    if (!_homeDateArray) {

        _homeDateArray = [JGHomeSectionItem getHomeSectionItemList] ;
    }
    return _homeDateArray ;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor] ;
    self.title = @"首页" ;
    
    //收到leftview通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityClick:) name:@"cityClick" object:nil] ;
}
//实现通知的方法
-(void)cityClick:(NSNotification *)notifice
{
    NSString *city = notifice.object ;
    //把选中的城市显示在首页的右上角
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:city style:0 target:nil action:nil] ;
}


#pragma mark - 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     return self.homeDateArray.count ;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    JGHomeSectionItem *sectItem = self.homeDateArray[section] ;
    return sectItem.body.count ;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JGHomeCell *cell = [JGHomeCell homeCellWithTableView:tableView] ;
    JGHomeSectionItem *secItem = self.homeDateArray[indexPath.section] ;
    JGHomeCellItem *cellItem = secItem.body[indexPath.row] ;
    cell.homeCellItem = cellItem ;
    return cell ;
}

//点击cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JGHomeDetailVCViewController *vc = [[JGHomeDetailVCViewController alloc] init] ;
    
    [self.navigationController pushViewController:vc animated:YES] ;
}
//每组的组头标题
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    JGHomeSectionView *secView = [JGHomeSectionView homeSectionView] ;
    JGHomeSectionItem *secItem = self.homeDateArray[section] ;
    secView.secItem = secItem ;
    return secView ;
}

//每行高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160 ;
}
//标题高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44 ;
}
//开启通知，一定要将其销毁
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self] ;
}

@end
