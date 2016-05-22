//
//  ViewCell.h
//  aaaaac
//
//  Created by James on 16/5/22.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
+ (instancetype)viewCellWithTableView:(UITableView *)tableView indexpath:(NSIndexPath *)indexPath;
+ (instancetype)item;
@end
