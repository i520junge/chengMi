//
//  JGHeaderView.h
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/22.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JGHeaderItem;
@interface JGHeaderView : UICollectionReusableView
@property(nonatomic,strong)JGHeaderItem *headerItem;
@end
