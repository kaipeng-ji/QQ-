//
//  centerViewController.m
//  侧拉抽屉
//
//  Created by ma c on 16/4/1.
//  Copyright © 2016年 Jujue. All rights reserved.
//

#import "centerViewController.h"
#import "UIBarButtonItem+JKPExtension.h"
#import <UIViewController+MMDrawerController.h>
@interface centerViewController ()

@end

@implementation centerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    [self setupNavItem];
    
    UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    [doubleTap setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubleTap];
}

- (void)setupNavItem {
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"aio_search_add_contact_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(leftDrawerButtonPress)];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem * rigthItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(rightDrawerButtonPress)];
    self.navigationItem.rightBarButtonItem = rigthItem;
}

- (void)leftDrawerButtonPress {
    
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)rightDrawerButtonPress {
    
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
    
}

-(void)doubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideLeft completion:nil];
}

@end
