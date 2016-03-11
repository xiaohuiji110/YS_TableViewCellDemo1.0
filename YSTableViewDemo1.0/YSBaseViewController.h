//
//  YSBaseViewController.h
//  YSTableViewDemo1.0
//
//  Created by youzi on 15/12/14.
//  Copyright © 2015年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSBaseViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong)YSTableView *tableView;
@end
