//
//  JGHeaderItem.h
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/22.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JGHeaderItem : NSObject
//详情
@property (nonatomic, copy) NSString *detail;
//标题
@property (nonatomic, copy) NSString *feeltitle;
//图片
@property (nonatomic, copy) NSString *image;
//标签
@property (nonatomic, copy) NSString *tag;
//子标题
@property (nonatomic, copy) NSString *title;

@end
