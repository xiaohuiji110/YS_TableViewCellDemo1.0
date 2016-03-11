//
//  YSChildTableViewCell2.m
//  YSTableViewDemo1.0
//
//  Created by 杨帅 on 16/3/10.
//  Copyright © 2016年 YS. All rights reserved.
//

#import "YSChildTableViewCell2.h"

@implementation YSChildTableViewCell2

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"YSChildTableViewCell2";
    YSChildTableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"YSChildTableViewCell2" owner:self options:nil].lastObject;
    }
    return cell;
}

- (void)setModel2:(Model2 *)model2
{
      _model2 = model2;
    
    self.headImg.image  =[UIImage imageNamed:model2.iconImage_url];
    self.contentL.text  = model2.content;
    self.nickNameL.text = model2.title;
    self.timeL.text = model2.time;
    
}

@end
