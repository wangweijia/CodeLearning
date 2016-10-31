//
//  NSObject+MVVMViewModel.m
//  MVVMTest
//
//  Created by apple on 31/10/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObject+MVVMViewModel.h"

static NSString *MVVM_targetVC = @"_MVVM_targetVC";

@implementation NSObject (MVVMViewModel)

- (instancetype)initMVVM_viewModelWithViewController:(UIViewController *)controller {
    self = [self init];
    if (self) {
        self.targetVC = controller;
        
        [self initialBind];
    }
    return self;
}

- (void)vmPushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self.targetVC.navigationController pushViewController:viewController animated:animated];
}

- (void)setTargetVC:(UIViewController *)targetVC {
    objc_setAssociatedObject(self, &MVVM_targetVC, targetVC, OBJC_ASSOCIATION_COPY);
    
    [self targetVC];
}

- (UIViewController *)targetVC {
//    NSAssert(NO, @"这个方法子类一定要重写，h文件中声明，m文件中实现");
//    return _targetVC;
    return objc_getAssociatedObject(self, &MVVM_targetVC);
}

- (void)initialBind {
    NSAssert(NO, @"这个方法子类一定要重写，m文件中实现");
}

@end
