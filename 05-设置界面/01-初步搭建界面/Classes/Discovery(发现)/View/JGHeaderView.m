//
//  JGHeaderView.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/22.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGHeaderView.h"
#import "JGHeaderItem.h"

@interface JGHeaderView ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;

@end
@implementation JGHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//设置数据
-(void)setHeaderItem:(JGHeaderItem *)headerItem
{
    _headerItem = headerItem ;
    self.bgImageView.image = [UIImage imageNamed:headerItem.image];
    self.titleLabel.text = headerItem.feeltitle ;
    self.subLabel.text = headerItem.title ;

    
}
@end
