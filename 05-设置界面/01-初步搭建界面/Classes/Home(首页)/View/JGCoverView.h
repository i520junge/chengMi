//
//  JGCoverView.h
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/20.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^JGCoverViewBlock)() ;

@interface JGCoverView : UIView
+(instancetype)showCover ;
@property(nonatomic,strong)JGCoverViewBlock block;
@end
