//
//  JGSetingCell.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/24.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGSetingCell.h"


@interface JGSetingCell()


@end

@implementation JGSetingCell
+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style
{
    static NSString *setID = @"setting" ;
    JGSetingCell *cell = [tableView dequeueReusableCellWithIdentifier:setID];
    if (!cell) {
        cell = [[JGSetingCell alloc] initWithStyle:style reuseIdentifier:setID] ;
        cell.layer.cornerRadius = 10 ;
    }
    return cell ;
}



-(void)setRowItem:(JGRowItem *)rowItem
{
    _rowItem = rowItem ;
//    设置数据
    [self setUpData:rowItem] ;
//    设置辅助视图
    [self setUpAccessoryView:rowItem] ;
}


//    设置数据
-(void)setUpData:(JGRowItem *)rowItem{
    self.imageView.image = rowItem.iconImage ;
    self.textLabel.text = rowItem.title ;
    self.detailTextLabel.text = rowItem.subTitle ;
}

//    设置辅助视图
-(void)setUpAccessoryView:(JGRowItem *)rowItem{
    if ([rowItem isKindOfClass:[JGArrowItem class]]) {
        //箭头
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]] ;
    }else if ([rowItem isKindOfClass:[JGSwicthItem class]]){
        //选择按钮
        self.accessoryView = [[UISwitch alloc] init] ;
    }else{
        self.accessoryView = nil ;
    }
}

//设置每个cell之间间隔10，和左边右边间隔10
- (void)setFrame:(CGRect)frame {
//    NSLog(@"setFrame") ;
    CGFloat margin = 10;
    
    frame.origin.x = margin;
    frame.size.width -= 2 * margin;
    frame.size.height -= 5;
    
    [super setFrame:frame];
}
@end
