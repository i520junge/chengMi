//
//  JGGroupItem.h
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/24.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JGGroupItem : NSObject
/** 组头部标题 */
@property(nonatomic,copy)NSString *headerTitle;
/** 组尾部标题 */
@property(nonatomic,copy)NSString *footerTitle;

/** 每组的行数据 */
@property(nonatomic,strong)NSArray *rowArray;

/** 提供类方法创建 */
+(instancetype)groupItemWithRowArray:(NSArray *)rowArray ;

@end
