//
//  FirstViewController.m
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "FirstViewController.h"
#import "FirstViewControllerVM.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation FirstViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.baseVM = [[FirstViewControllerVM alloc] initWithViewController:self];
    }
    return self;
}

- (FirstViewControllerVM *)firstViewControllerVM {
    return ((FirstViewControllerVM *)_baseVM);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _myTableView.dataSource = self.firstViewControllerVM;
    
    [self requsetDoctor];
}

/**
 *  请求医生数据
 */
- (void)requsetDoctor {
    [[[self firstViewControllerVM].requestDoctors execute:nil] subscribeNext:^(id x) {
        [self.myTableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
