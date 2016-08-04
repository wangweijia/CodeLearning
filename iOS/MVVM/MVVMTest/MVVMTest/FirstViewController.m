//
//  FirstViewController.m
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstViewControllerVM.h"
#import <RACEXTScope.h>

@interface FirstViewController ()<UITableViewDelegate>

/**
 *  返回到头部 刷新数据
 */
@property (weak, nonatomic) IBOutlet UIButton *backTopAndRequest;

/**
 *  tableView
 */
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation FirstViewController

- (FirstViewControllerVM *)baseVM {
    return ((FirstViewControllerVM *)_baseVM);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _myTableView.dataSource = self.baseVM;
    _myTableView.delegate = self;
    
    if (!self.preposeRequset) {
        [self requsetDoctor];
    }
    
    [self bindBackTopAndRequest];
}

/**
 *  请求医生数据
 */
- (void)requsetDoctor {
    [[self.baseVM.requestDoctors execute:nil] subscribeNext:^(id x) {
        [self.myTableView reloadData];
    }];
}

/**
 *  绑定 backTopAndRequest 事件
 */
- (void)bindBackTopAndRequest {
    [[_backTopAndRequest rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self.myTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
        [self requsetDoctor];
    }];
}

#pragma - mark UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.baseVM.dataSourceCellsArray[indexPath.row].cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[self.baseVM.cellSelected execute:indexPath] subscribeNext:^(id x) {
        //可以对选中的cell 做一些ui上的处理
        
        NSLog(@"选中的cell对应的doctor是：%@", x);
    }];
}

@end
