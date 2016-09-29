//
//  JGHomeSectionView.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/22.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGHomeSectionView.h"
#import "JGHomeSectionItem.h"
#import "UIColor+XQColor.h"

@interface JGHomeSectionView()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;

@end


@implementation JGHomeSectionView
//提供方法加载XIB
+(instancetype)homeSectionView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject] ;
}

//处理数据
-(void)setSecItem:(JGHomeSectionItem *)secItem
{
    _secItem = secItem ;
    self.titleLabel.text = secItem.tag_name ;
    self.subLabel.text = secItem.section_count ;
    
    //将plist文件中给的16进制颜色转为颜色
    UIColor *color = [UIColor colorWithHexString:secItem.color alpha:1];
    self.backgroundColor = color;
}


@end
