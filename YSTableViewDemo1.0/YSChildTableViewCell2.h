//
//  YSChildTableViewCell2.h
//  YSTableViewDemo1.0
//
//  Created by 杨帅 on 16/3/10.
//  Copyright © 2016年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model2.h"

@interface YSChildTableViewCell2 : YSTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *nickNameL;
@property (weak, nonatomic) IBOutlet UILabel *contentL;
@property (weak, nonatomic) IBOutlet UILabel *timeL;
@property (nonatomic, strong) Model2 *model2;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
