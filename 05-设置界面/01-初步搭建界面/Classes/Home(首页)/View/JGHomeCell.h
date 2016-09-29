//
//  JGHomeCell.h
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/21.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JGHomeCellItem ;
@interface JGHomeCell : UITableViewCell
+(instancetype)homeCellWithTableView:(UITableView *)tableView ;
@property(nonatomic,strong)JGHomeCellItem *homeCellItem;
@end
