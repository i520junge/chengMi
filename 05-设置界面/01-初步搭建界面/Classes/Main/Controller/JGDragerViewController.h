//
//  JGDragerViewController.h
//  01-抽屉效果
//
//  Created by 刘军 on 16/9/9.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JGDragerViewController : UIViewController

@property(nonatomic,weak,readonly)UIView *leftView ;
@property(nonatomic,weak,readonly)UIView *mainView;

- (void)open ;
-(void)close ;
@end
