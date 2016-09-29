//
//  JGDragerViewController.m
//  01-抽屉效果
//
//  Created by 刘军 on 16/9/9.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGDragerViewController.h"

@interface JGDragerViewController ()<UIGestureRecognizerDelegate>

@end

@implementation JGDragerViewController

#define screenW [UIScreen mainScreen].bounds.size.width
#define target screenW*0.8

- (void)viewDidLoad {
    [super viewDidLoad];
//    1、搭建界面
    [self addChildView] ;
    
//    2、添加手势，进行平移
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)] ;
//    将手势添加到mainView中
    [_mainView addGestureRecognizer:pan] ;
    
//    5、添加点按手势
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)] ;
    tapGes.delegate = self ;
    [_leftView addGestureRecognizer:tapGes] ;
    
}

//点按手势代理
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO ;
    }
    return YES ;
}

/** 平移 */
-(void)pan:(UIPanGestureRecognizer *)pan
{
//    获取手势的偏移量
    CGPoint transP = [pan translationInView:self.mainView] ;
//    根据手势的偏移量计算mainView的偏移位置
    [self positionWithOffset:transP.x] ;
    
//    4、当手势快结束的时候，判断其位置，根据位置屏幕一半时弹回去
    if (pan.state == UIGestureRecognizerStateEnded) {
    if (_mainView.frame.origin.x > screenW * 0.5) {
        //计算此时距离想要达到位置的偏移量
        CGFloat offset = target - self.mainView.frame.origin.x ;
        [UIView animateWithDuration:0.5 animations:^{
            [self positionWithOffset:offset] ;
        }] ;
        
    }else{
        
        [self close] ;
    }
    }
    
//    清零
    [pan setTranslation:CGPointZero inView:self.mainView] ;
    
}

/**
 *  打开抽屉
 */
- (void)open {
    
    [UIView animateWithDuration:0.25 animations:^{
        [self positionWithOffset:target];
        CGRect frame = self.mainView.frame;
        frame.origin.x = target;
        self.mainView.frame = frame;

    }];
    
}


/** 回到最初效果 */
-(void)close{
    [UIView animateWithDuration:0.2 animations:^{
        //偏移位置也要回到原位
        self.mainView.transform = CGAffineTransformIdentity ;
        _mainView.frame = self.view.bounds ;
    }] ;
}

/** 计算mainView的偏移位置 */
-(void)positionWithOffset:(CGFloat)offset
{
//    mainView在x上平移
    CGRect frame = self.mainView.frame ;
    frame.origin.x += offset ;
    if (frame.origin.x > target) {
        frame.origin.x = target;
    }
    self.mainView.frame = frame ;
//    限制X不超出最左边
    if (self.mainView.frame.origin.x <= 0) {
        self.mainView.frame = self.view.bounds ;
    }
    
//    3、平移同时进行缩放
//    高度最小缩放至scaleMin
//    CGFloat scale = self.mainView.frame.origin.x *0.3/screenW ;
//    scale = 1- scale ;
////    X/Y同时缩放
//    self.mainView.transform = CGAffineTransformMakeScale(scale, scale) ;
    
}

/** 搭建界面 */
-(void)addChildView
{
    UIView *leftView = [[UIView alloc] initWithFrame:self.view.bounds] ;
    leftView.backgroundColor = [UIColor greenColor] ;
    [self.view addSubview:leftView] ;
    _leftView = leftView ;
    
    UIView *mainView = [[UIView alloc] initWithFrame:self.view.bounds] ;
    mainView.backgroundColor = [UIColor whiteColor] ;
    [self.view addSubview:mainView] ;
    _mainView = mainView ;
}


@end
