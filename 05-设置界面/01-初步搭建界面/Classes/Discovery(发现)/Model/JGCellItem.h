//
//  JGCellItem.h
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/22.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JGCellItem : NSObject
//开始时间
@property (nonatomic, copy) NSString *begin_time;
//图片
@property (nonatomic, copy) NSString *img;
//关键字
@property (nonatomic, copy) NSString *keywords;
//描述
@property (nonatomic, copy) NSString *text;
//分享地址
@property (nonatomic, copy) NSString *themeurl;
//标题
@property (nonatomic, copy) NSString *title;

@end
