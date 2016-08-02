//
//  MVVMBaseViewController.m
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "MVVMBaseViewController.h"

@interface MVVMBaseViewController ()

@end

@implementation MVVMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MVVMBaseViewControllerVM *)baseVM {
    return _baseVM;
}

- (void)setBaseVM:(MVVMBaseViewControllerVM *)baseVM {
    _baseVM = baseVM;
}

@end
