//
//  JGLeftView.h
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/19.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JGLeftView,JGButton ;

@protocol JGLeftViewDelegate <NSObject>

-(void)lefeView:(JGLeftView *)leftView preSelBtnIndex:(NSInteger)preSelBtnIndex toClickMenuBtnIndex:(NSInteger)btnIndex;
-(void)leftViewDidClickCityToCloseDrag:(JGLeftView*)leftView;

@end


@interface JGLeftView : UIView

+(instancetype)leftView ;
@property(nonatomic,weak)id<JGLeftViewDelegate> delegate;
@end
