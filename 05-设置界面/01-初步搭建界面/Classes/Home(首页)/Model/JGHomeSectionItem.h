//
//  JGHomeSectionItem.h
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/21.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JGHomeSectionItem : NSObject
/**
 *  headView的颜色
 */
@property (nonatomic, copy) NSString *color;
/**
 *  headView的标题
 */
@property (nonatomic, copy) NSString *tag_name;
/**
 *  headView的子标题
 */
@property (nonatomic, copy) NSString *section_count;
/**
 *  cell模型
 */
@property (nonatomic, strong) NSArray *body;

+(NSArray *)getHomeSectionItemList ;
@end
