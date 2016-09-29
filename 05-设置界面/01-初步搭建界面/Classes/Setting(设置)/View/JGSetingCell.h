//
//  JGSetingCell.h
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/24.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGRowItem.h"
#import "JGArrowItem.h"
#import "JGSwicthItem.h"

@interface JGSetingCell : UITableViewCell
/** 设置数据 */
@property(nonatomic,strong)JGRowItem *rowItem;

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style ;
@end
