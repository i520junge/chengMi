//
//  UIImage+JGImage.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/19.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "UIImage+JGImage.h"

@implementation UIImage (JGImage)
+(UIImage *)imageRenderWithImageName:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name] ;
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    return  image ;
}
@end
