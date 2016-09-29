//
//  JGPushVC.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/24.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGPushVC.h"

@interface JGPushVC ()

@end

@implementation JGPushVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"开奖" ;
    //设置分割线样式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    for (int i = 0; i < 10; i++) {
        [self setGroup1:i] ;
    }

}

-(void)setGroup1:(NSInteger)i{

    //    设置行
    JGSwicthItem *rowItem0 = [JGSwicthItem rowItemWithIconImage:[UIImage imageNamed:@"RedeemCode"] title:@"是否开奖" subTitle:@"每周二、六开奖"] ;
    JGArrowItem *rowItem1 = [JGArrowItem rowItemWithIconImage:[UIImage imageNamed:@"more_historyorder"] title:@"使用兑换码" subTitle:nil] ;
    //    一组中有多少行
    NSArray *rowArray = @[rowItem0,rowItem1] ;
    
    JGGroupItem *groupItem = [JGGroupItem groupItemWithRowArray:rowArray] ;
    groupItem.headerTitle = [NSString stringWithFormat:@"%lu:00",i+8] ;
    
    
    //block会对代码中强指针进行强引用，造成内存泄露
    __weak typeof(self) weakSelf = self ;
    //点击时自动往上走
    rowItem1.destTaskBlock = ^(NSIndexPath *indexPath){
        UITextField *textF = [[UITextField alloc] init] ;
        [textF becomeFirstResponder] ;
        
        //获取当前点击cell
        UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath] ;
        [cell addSubview:textF] ;
        
    } ;
    
    [self.groupArray addObject:groupItem] ;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20 ;
}
//拖拽的时候键盘消失
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES] ;
}

//- (void)dealloc
//{
//    NSLog(@"%s",__func__) ;
//}
@end
