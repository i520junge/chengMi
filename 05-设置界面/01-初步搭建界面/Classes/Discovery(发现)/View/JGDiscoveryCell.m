//
//  JGDiscoveryCell.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/22.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGDiscoveryCell.h"
#import "JGCellItem.h"

@interface JGDiscoveryCell ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UILabel *bgTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;

@end

@implementation JGDiscoveryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//处理数据
-(void)setCellItem:(JGCellItem *)cellItem
{
    _cellItem = cellItem ;

    self.bgImage.image = [UIImage imageNamed:cellItem.img] ;
    self.bgTitleLabel.text = cellItem.title ;
    self.subLabel.text = cellItem.keywords ;
}
@end
