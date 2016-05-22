//
//  ViewController.m
//  aaaaac
//
//  Created by James on 16/5/22.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "ViewCell.h"
#import "SecondController.h"
#import "PingTransition.h"

@interface ViewController ()<UITableViewDelegate,UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - UITableVieDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ViewCell *cell = [ViewCell viewCellWithTableView:tableView indexpath:indexPath];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SecondController *svc = [[SecondController alloc]init];
    svc.titles = [NSString stringWithFormat:@"%zd",indexPath.row];
    [self.navigationController pushViewController:svc animated:YES];
}

#pragma mark - NavigationDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        PingTransition *p = [PingTransition new];
        return p;
    }else {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
@end
