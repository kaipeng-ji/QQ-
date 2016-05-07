//
//  UIBarButtonItem+JKPExtension.h
//  百思不得姐
//
//  Created by ma c on 16/3/24.
//  Copyright © 2016年 姬凯鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (JKPExtension)

+ (instancetype)itemWithImageName:(NSString *)image highImageName:(NSString *)highName
                           target:(id)target action:(SEL)action;

@end
