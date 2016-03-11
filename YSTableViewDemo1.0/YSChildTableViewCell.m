//
//  YSChildTableViewCell.m
//  YSTableViewDemo1.0
//
//  Created by youzi on 15/12/14.
//  Copyright © 2015年 YS. All rights reserved.
//

#import "YSChildTableViewCell.h"

@implementation YSChildTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"YSChildTableViewCell";
    YSChildTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"YSChildTableViewCell" owner:self options:nil].lastObject;
    }
    return cell;
}

- (void)setModel:(Model *)model
{
    _model = model;
    /*
    *   用Model设置cell属性
    */
    
    [self.iconBtn setImage:[UIImage imageNamed:_model.iconImage_url] forState:UIControlStateNormal];
    
    [self.iconBtn setTitle:_model.title forState:UIControlStateNormal];
    self.contentL.text = _model.content;

}

- (IBAction)clickIcon:(UIButton *)sender {
 
   self.ClickBlock();
 //   self.ownerViewController.navigationController pushViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#>
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    totalHeight += [self.iconBtn sizeThatFits:size].height;
    totalHeight += [self.contentL sizeThatFits:size].height;
    totalHeight += 40; // margins
    return CGSizeMake(size.width, totalHeight);
}



@end
