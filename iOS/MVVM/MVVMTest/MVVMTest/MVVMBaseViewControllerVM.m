//
//  MVVMBaseViewControllerVM.m
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "MVVMBaseViewControllerVM.h"


@interface MVVMBaseViewControllerVM ()

@end

@implementation MVVMBaseViewControllerVM

- (instancetype)initWithViewController:(UIViewController *)vc {
    self = [super init];
    if (self) {
        self.targetVC = vc;
        
        [self initialBind];
    }
    return self;
}

- (void)vmPushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self.targetVC.navigationController pushViewController:viewController animated:animated];
}

- (void)setTargetVC:(UIViewController *)targetVC {
    _targetVC = targetVC;
    
    [self targetVC];
}

- (UIViewController *)targetVC {
    NSAssert(NO, @"这个方法子类一定要重写，h文件中声明，m文件中实现");
    return _targetVC;
}

- (void)initialBind {
    NSAssert(NO, @"这个方法子类一定要重写，m文件中实现");
}

@end
