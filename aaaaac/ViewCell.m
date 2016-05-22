//
//  ViewCell.m
//  aaaaac
//
//  Created by James on 16/5/22.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewCell.h"

@interface ViewCell()
@property (weak, nonatomic) IBOutlet UIView *fatherView;

@end

@implementation ViewCell

+ (instancetype)viewCellWithTableView:(UITableView *)tableView indexpath:(NSIndexPath *)indexPath {
    static NSString *ID = @"Vcell";
    ViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [self item];
        cell.dateLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    }

    return cell;
}

+ (instancetype)item {
    return  [[[NSBundle mainBundle] loadNibNamed:@"ViewCell" owner:nil options:nil] firstObject];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.fatherView.layer.cornerRadius = 5;
    self.fatherView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.fatherView.layer.borderWidth = 0.5;
}
@end
