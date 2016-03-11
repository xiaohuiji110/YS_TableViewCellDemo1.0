//
//  YSChildTableViewCell.h
//  YSTableViewDemo1.0
//
//  Created by youzi on 15/12/14.
//  Copyright © 2015年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSTableViewCell.h"
#import "Model.h"
typedef void (^iconClickBlock)(void);

@interface YSChildTableViewCell : YSTableViewCell

@property (weak, nonatomic  ) IBOutlet   UIButton *iconBtn;
@property (weak, nonatomic  ) IBOutlet   UILabel  *contentL;
@property (nonatomic, strong) UIViewController    *ownerViewController;
@property (nonatomic, strong) Model               *model;
@property (nonatomic, strong) iconClickBlock      ClickBlock;
- (IBAction)clickIcon:(UIButton *)sender;
@end
