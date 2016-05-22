//
//  PingTransition.m
//  aaaaac
//
//  Created by James on 16/5/22.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "PingTransition.h"
#import "ViewController.h"
#import "SecondController.h"
#import "ViewCell.h"

@implementation PingTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

     ViewController *fromVC = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    SecondController *toVC = (SecondController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //----将要做动画效果的视图容器
    UIView *contView = [transitionContext containerView];
    //----选中cell
    NSIndexPath *indexPath = [fromVC.tableView indexPathForSelectedRow];
    ViewCell *cell = [fromVC.tableView cellForRowAtIndexPath:indexPath];
    CGFloat cellY = cell.frame.origin.y;
    
    //----找出可视cell中的第一个
    ViewCell *firstCell = [fromVC.tableView visibleCells][0];
    CGFloat firstCellY = firstCell.frame.origin.y;
    CGFloat diff = cellY - firstCellY;

    //----必须将要做动画的视图添加到容器中
    [contView addSubview:fromVC.view];
    [contView addSubview:toVC.view];
    toVC.view.alpha = 0;

    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.98 initialSpringVelocity:0.9 options:UIViewAnimationOptionCurveLinear animations:^{
        
        //打开push过去的控制器的透明度
        toVC.view.alpha = 1;
        
        //用于找到分界点,分别做动画
        for (ViewCell *afterCell in fromVC.tableView.visibleCells) {
            if ([fromVC.tableView indexPathForCell:afterCell].row <= indexPath.row) {
                afterCell.transform = CGAffineTransformTranslate(cell.transform, 0, -diff);
            }else {
                afterCell.transform = CGAffineTransformTranslate(cell.transform, 0, [UIScreen mainScreen].bounds.size.height);
            }
        afterCell.alpha = 0;
        }
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        for (ViewCell * backCell in fromVC.tableView.visibleCells) {
            
            backCell.transform = CGAffineTransformIdentity;
            backCell.alpha = 1;
        }


    }];
    
}
@end
