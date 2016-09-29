//
//  UIView+JGFrame.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/21.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "UIView+JGFrame.h"

@implementation UIView (JGFrame)
- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
    
}


- (CGFloat)height {
    return self.frame.size.height;
    
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y {
    
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}




@end
