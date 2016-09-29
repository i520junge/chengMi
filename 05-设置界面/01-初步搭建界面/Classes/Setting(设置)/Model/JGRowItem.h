//
//  JGRowItem.h
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/24.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JGRowItem : NSObject
/** 图标 */
@property(nonatomic,strong)UIImage *iconImage;
/** 描述 */
@property(nonatomic,copy)NSString *title;
/** 详情 */
@property(nonatomic,copy)NSString *subTitle;

/** 提供类方法 */
+(instancetype)rowItemWithIconImage:(UIImage *)iconImage title:(NSString *)title subTitle:(NSString *)subTitle ;
@end
