//
//  JGSettingBaseVC.h
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/24.
//  Copyright © 2016年 JunGe. All rights reserved.
//设置界面的模型

#import <UIKit/UIKit.h>
#import "JGGroupItem.h"
#import "JGSetingCell.h"

@interface JGSettingBaseVC : UITableViewController
/** 存放所有数据的数组 */
@property(nonatomic,strong)NSMutableArray *groupArray;
@end
