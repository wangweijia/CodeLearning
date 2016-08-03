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

- (instancetype)init {
    self = [super init];
    if (self) {
#warning - 绑定baseVM 可以统一VM的命名规则，让后把绑定事件 放到 积累的初始化方法中
        self.baseVM = [[SecondViewControllerVM alloc] initWithViewController:self];
    }
    return self;
}

#warning - 这方法优化，使用父类的 属性名，返回正确的数据类型
- (SecondViewControllerVM *)secondViewControllerVM {
    return ((SecondViewControllerVM *)_baseVM);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (!self.preposeRequset) {
        [self requsetDoctor];
    }
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
- (void)updateTopView {
    [self.secondViewControllerVM.newDoctorData subscribeNext:^(Doctor *x) {
        self.nameLabel.text = x.name;
        self.cityLabel.text = x.cityStr;
        self.hospitalLabel.text = x.hospitalName;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
