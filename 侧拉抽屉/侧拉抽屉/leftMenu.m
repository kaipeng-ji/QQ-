//
//  leftMenu.m
//  侧拉抽屉
//
//  Created by ma c on 16/4/1.
//  Copyright © 2016年 Jujue. All rights reserved.
//

#import "leftMenu.h"

@implementation leftMenu

+ (NSArray *)loadLeftMenu {
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"leftMenu" ofType:@"plist"];
    
    NSArray * dataList = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray * array = [NSMutableArray array];
    
    for (NSDictionary * dict in dataList) {
        
        leftMenu * menu = [[leftMenu alloc] init];
        [menu setValuesForKeysWithDictionary:dict];
        
        [array addObject:menu];
    }
    return array;
}


@end
