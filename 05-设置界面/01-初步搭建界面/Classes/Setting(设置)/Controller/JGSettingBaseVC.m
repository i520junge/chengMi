//
//  JGSettingBaseVC.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/24.
//  Copyright © 2016年 JunGe. All rights reserved.
//设置界面的模型

#import "JGSettingBaseVC.h"

@interface JGSettingBaseVC ()

@end

@implementation JGSettingBaseVC
//懒加载数据
-(NSMutableArray *)groupArray
{
    if (!_groupArray) {
        _groupArray = [NSMutableArray array] ;
    }
    return _groupArray ;
}


-(instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped] ;
}



#pragma mark - Table view数据源
/** 有多少组 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupArray.count;
}
/** 每组多少行 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    JGGroupItem *groupItem = self.groupArray[section];
    
    return groupItem.rowArray.count;
}

/** 设置cell */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    创建cell
    JGSetingCell *cell = [JGSetingCell cellWithTableView:tableView style:UITableViewCellStyleSubtitle] ;
    
//    取出模型数据
    JGGroupItem *groupItem = self.groupArray[indexPath.section];
    JGRowItem *rowItem = groupItem.rowArray[indexPath.row] ;
    
//    把模型数据展示在cell
    cell.rowItem = rowItem ;
    
    return cell;
}

//返回每一组的头部标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    JGGroupItem *groupItem = self.groupArray[section] ;
    return groupItem.headerTitle ;
}
//返回每一组的尾部标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    JGGroupItem *groupItem = self.groupArray[section] ;
    return groupItem.footerTitle ;
}

//点击cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    获取行模型
    JGGroupItem *groupItem = self.groupArray[indexPath.section];
    JGRowItem *rowItem = groupItem.rowArray[indexPath.row] ;
    if ([rowItem isKindOfClass:[JGArrowItem class]]) {
        JGArrowItem *item = (JGArrowItem *)rowItem ;
//    判断有没有要执行的代码
        if (item.destTaskBlock) {
            item.destTaskBlock(indexPath);
        }
//    判断有没有要跳转的控制器
        if (item.destinationControlerName) {
            //创建控制器
            UIViewController *vc = [[item.destinationControlerName alloc] init] ;
            //跳转控制器
            [self.navigationController pushViewController:vc animated:YES] ;
        }
        }
}


@end
