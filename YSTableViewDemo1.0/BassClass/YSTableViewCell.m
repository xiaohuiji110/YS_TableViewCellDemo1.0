//
//  UWTableViewCell.m
//  Uniwa
//
//  Created by YS on 15/11/9.
//  Copyright © 2015年 com.zws. All rights reserved.
//

#import "YSTableViewCell.h"
#import "YSTools.h"


@implementation YSTableViewCell


- (void)awakeFromNib {
    
    self.contentView.bounds = [UIScreen mainScreen].bounds;
    
    
    self.contentView.backgroundColor =[UIColor orangeColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // Fix the bug in iOS7 - initial constraints warning
    self.contentView.bounds = [UIScreen mainScreen].bounds;
    self.layer.masksToBounds = YES;
    
    //    self.gradientLayer = [CAGradientLayer layer];
    //    [self.layer insertSublayer:self.gradientLayer atIndex:0];
    
    UIView *bottomLineView = [[UIView alloc] init];
    bottomLineView.backgroundColor = HexRGB(0xeeeeee);
    [self.contentView addSubview:bottomLineView];
    [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(2);
    }];

    self.layer.masksToBounds = YES;
    [YSTools dealTableViewSeparator:self];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {

    return nil;
}

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
//    self.gradientLayer.frame     = self.bounds;
//    self.gradientLayer.colors    = @[(__bridge id)HexRGB(0xffffff).CGColor,
//                                     (__bridge id)HexRGB(0xf9f9f9).CGColor];
//    self.gradientLayer.startPoint = CGPointMake(0, 0);
//    self.gradientLayer.endPoint = CGPointMake(0, 1);
}


@end
