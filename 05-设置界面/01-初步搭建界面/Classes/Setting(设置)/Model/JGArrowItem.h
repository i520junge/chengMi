//
//  JGArrowItem.h
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/24.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGRowItem.h"
typedef void(^JGArrowItemBlock)(NSIndexPath *indexPath);

/** 如果cell是有箭头，需要跳转控制器的，用这个行模型创建，显示行数据 */
@interface JGArrowItem : JGRowItem
/** 需要跳转的控制器名字 */
@property(nonatomic,assign)Class destinationControlerName;

/** 点击需要执行的代码 */
@property(nonatomic,copy)JGArrowItemBlock destTaskBlock;

@end
