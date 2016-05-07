//
//  leftMenu.h
//  侧拉抽屉
//
//  Created by ma c on 16/4/1.
//  Copyright © 2016年 Jujue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface leftMenu : NSObject

/** 图片名字 */
@property (nonatomic,copy) NSString * icon;

/** 名字 */
@property (nonatomic,copy) NSString * name;

/** vc的名字 */
@property (nonatomic,copy) NSString * vcName;


+ (NSArray *)loadLeftMenu;

@end
