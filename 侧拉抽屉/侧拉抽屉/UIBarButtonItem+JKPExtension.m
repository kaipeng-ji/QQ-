//
//  UIBarButtonItem+JKPExtension.m
//  百思不得姐
//
//  Created by ma c on 16/3/24.
//  Copyright © 2016年 姬凯鹏. All rights reserved.
//

#import "UIBarButtonItem+JKPExtension.h"

@implementation UIBarButtonItem (JKPExtension)


+ (instancetype)itemWithImageName:(NSString *)image highImageName:(NSString *)highName
                           target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(0, 0, 30, 30);
    
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageNamed:highName] forState:UIControlStateHighlighted];
    
    [button layoutIfNeeded];
    
    
//    button.size = button.currentBackgroundImage.size;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc]initWithCustomView:button];
}

@end
