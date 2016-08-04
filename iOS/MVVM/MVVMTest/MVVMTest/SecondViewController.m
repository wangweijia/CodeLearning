//
//  SecondViewController.m
//  MVVMTest
//
//  Created by apple on 03/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondViewControllerVM.h"
#import "Doctor.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@property (weak, nonatomic) IBOutlet UILabel *hospitalLabel;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (weak, nonatomic) IBOutlet UIButton *faceToFaceButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomViewConstraintBottom;

@end

@implementation SecondViewController

#warning - 这方法优化，使用父类的 属性名，返回正确的数据类型
- (SecondViewControllerVM *)secondViewControllerVM {
    return ((SecondViewControllerVM *)_baseVM);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.preposeRequset) {
        [self requsetDoctor];
    }
    
    [self bindUpdateTopView];
}

/**
 *  请求医生数据
 */
- (void)requsetDoctor {
    [[[self secondViewControllerVM].requestDoctors execute:nil] subscribeNext:^(id x) {
        [self.myTableView reloadData];
    }];
}

/**
 *  更新上部viewUI
 */
- (void)bindUpdateTopView {
    [self.secondViewControllerVM.doctorData subscribeNext:^(Doctor *x) {
        self.nameLabel.text = x.name;
        self.cityLabel.text = x.cityStr;
        self.hospitalLabel.text = x.hospitalName;
    }];
}

@end
