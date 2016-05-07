//
//  LeftViewController.m
//  侧拉抽屉
//
//  Created by ma c on 16/4/1.
//  Copyright © 2016年 Jujue. All rights reserved.
//

#import "LeftViewController.h"
#import "leftMenu.h"
#import <UIViewController+MMDrawerController.h>
@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray * dataList;

@property (nonatomic, strong) UITableView * tableView;

@end

@implementation LeftViewController

- (NSArray *)dataList {
    
    if (!_dataList) {
        _dataList = [leftMenu loadLeftMenu];
        
    }
    return _dataList;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 170, 120)];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 40, 50, 50)];
        imageView.image = [UIImage imageNamed:@"aio_validate_nomsg_icon"];
        
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 50, 300, 30)];
        nameLabel.text = @"123木头人";
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.font = [UIFont systemFontOfSize:20];
        [headerView addSubview:imageView];
        [headerView addSubview:nameLabel];
        _tableView.tableHeaderView = headerView;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    leftMenu * menu = self.dataList[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:menu.icon];
    
    cell.textLabel.text = menu.name;
    
    cell.textLabel.textColor = [UIColor whiteColor];
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    leftMenu * menu = self.dataList[indexPath.row];
    
    UIViewController * vc = [[NSClassFromString(menu.vcName) alloc] init];
    
    if (vc == nil) {
        
        NSLog(@"处理具体事情");
        
        return;
    }
    
    
    vc.title = menu.name;
    
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self.mm_drawerController setCenterViewController:nav withCloseAnimation:YES completion:nil];
}

- (void)loadView {
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = [UIImage imageNamed:@"Stars"];
    imageView.userInteractionEnabled = YES;
    self.view = imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.tableView];
    
    
}

@end
