//
//  JGCityCell.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/21.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGCityCell.h"

@implementation JGCityCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
//向外界提供类方法 创建cell
+(instancetype)cityCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"city" ;
    JGCityCell *cell = [tableView dequeueReusableCellWithIdentifier:ID] ;
    if (!cell) {
        cell = [[JGCityCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID] ;
        cell.backgroundColor = [UIColor clearColor] ;
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 15) ;
        cell.textLabel.textColor = [UIColor whiteColor] ;
    }
    
    return cell ;
}
-(void)layoutSubviews
{
    [super layoutSubviews] ;
    self.textLabel.x = (self.width - self.textLabel.width)*0.5 - 15;
    
}
@end
