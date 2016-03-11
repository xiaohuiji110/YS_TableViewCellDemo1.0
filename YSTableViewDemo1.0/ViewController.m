//
//  ViewController.m
//  YSTableViewDemo1.0
//
//  Created by YS on 15/12/14.
//  Copyright © 2015年 YS. All rights reserved.
//

#import "ViewController.h"
#import "YSChildTableViewCell.h"
#import "YSChildTableViewCell2.h"
#import <Masonry.h>
#import <UITableView+FDTemplateLayoutCell.h>


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ViewController

/**
 *  首先 建议常用cocoapod管理你的类库不用建立大量复杂文件夹，跟逻辑无关的东西单独放一边。代码过程中方便快捷， 还有让自己养成良好的代码封装简化习惯
 *  1. 此demo 注重实用性，表格的简单封装，方法使用！接口不尽雷同，暂时先写的死数据。更多解释 下有简单注释，
    2. block 最最基础的运用，理解了代码把疯掉的解开 相应的疯掉换另一种cell。可以看到。
    3. 然后简单的使用UITableView+FDTemplateLayoutCell.h的方法 用xib自定义单元格  达到cell内容自适应简单布局！
    4. MJRefresh的结合tableview的刷新设置
    5. Masonry的自动布局挺简单的 ，更多frame设置我不多写 一查便知。
 *  这个demo多位自己练习所用，比较粗糙，望广大iOS大神多多指点。
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTableView];
    [self prepareData];
    [self configureRefresh];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
#pragma ----如果没有有刷新功能，此处用afn调用数据 ，如果有刷新功能 下面刷新设置里面调用 此方法作废。
- (void)prepareData
{
    
    self.dataArray = @[].mutableCopy;
    
    for (int i= 0;i<20;i++) {
        _model = [[Model alloc]init];
        _model2 =[[Model2 alloc]init];
        
        NSString *titleStr = [[NSString alloc]initWithFormat:@"小灰灰是个大傻逼这个不能点"];
        NSString *contentStr = [[NSString alloc]initWithFormat:@"假如生活欺骗了你，不要悲伤不要心急 忧郁的日期将会过去，相信吧快乐的日子将过来临。啦啦啦德玛西亚啦啦啦撸啊撸啊"];
         NSString *iconImage_url = @"faxian_ddj";
         NSString *time = @"2016-3-10";
        /**
         *  @return model
         */
//        _model.title = [titleStr substringFromIndex:arc4random()%titleStr.length];
//        NSLog(@"标题%@", _model.title);
//        _model.content = [contentStr substringFromIndex:arc4random()%contentStr.length];
//        _model.iconImage_url = iconImage_url;
//        [self.dataArray addObject:_model];
//        
        /**
         *  @return model2
         */
        
        _model2.iconImage_url = iconImage_url;
        _model2.title   = [titleStr substringFromIndex:arc4random()%titleStr.length];
        _model2.time    = time;
        _model2.content = [contentStr substringFromIndex:arc4random()%contentStr.length];
         [self.dataArray addObject:_model2];
        
    }
    NSLog(@"打印数组%@",self.dataArray);
    [self.tableView reloadData];
    
}

#pragma mark - 刷新设置  －－－TAbleView常伴随着刷新列表功能的出现 ，刷新逻辑不是很简单的！看后台返回数据是分页，还是分时间等等刷新接受数据了。

- (void)configureRefresh {
    
    //设置下拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{

    //此处数据接口请求 列表刷新判断 建议封装的afn方法 保持代码的简洁性
        [self.tableView.header beginRefreshing];
        [self.tableView.header endRefreshing];


        }];
    self.tableView.header = header;
    //设置上拉加载更多
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{

        if (self.dataArray.count == 0) return;

    // 此处数据接口请求 建议封装的afn方法 保持代码的简洁性
        [self.tableView.footer endRefreshingWithNoMoreData];


           }];
    self.tableView.footer = footer;
}

- (void)configureTableView
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"YSChildTableViewCell" bundle:nil]
//         forCellReuseIdentifier:@"YSChildTableViewCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"YSChildTableViewCell2" bundle:nil]
         forCellReuseIdentifier:@"YSChildTableViewCell2"];
    
    [self.view addSubview:self.tableView];
    [self.view sendSubviewToBack:self.tableView];
    
    self.dataArray = @[].mutableCopy;

}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return [tableView fd_heightForCellWithIdentifier:@"YSChildTableViewCell2" configuration:^(YSChildTableViewCell2 *cell) {
          cell.model2 = self.dataArray[indexPath.row];
    }];
    
   // return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    YSChildTableViewCell *cell = [YSChildTableViewCell cellWithTableView:tableView];
//    
//    cell.model =self.dataArray[indexPath.row];
//    
//    cell.ClickBlock=^(void){
//        [self blockMethods:indexPath.row];
//     
//    };
//    cell.ownerViewController = self;
//    
//    
//    return cell;
    
    
    YSChildTableViewCell2 *cell = [YSChildTableViewCell2 cellWithTableView:tableView];
    
    cell.model2 =self.dataArray[indexPath.row];
    
    return cell;
    
}

#pragma  tableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


#pragma mark -----cell里面想要调用的控制器方法事件
-(void)blockMethods:(NSInteger)sender{
    
    NSString *clickStr = [[NSString alloc]initWithFormat:@"点击的第%ld行",sender];
    UIAlertView *alertview =[[UIAlertView alloc]initWithTitle:@"cell点击事件" message:clickStr delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alertview show];
}

//表格能否编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//表格编辑模式
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle) editingStyle forRowAtIndexPath:(NSIndexPath *) indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
}
    
}

//设置编辑模式删除按钮的title
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return @"删除";
}




@end
