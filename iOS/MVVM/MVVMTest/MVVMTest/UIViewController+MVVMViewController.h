//
//  UIViewController+MVVMViewController.h
//  MVVMTest
//
//  Created by apple on 31/10/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVVMViewControllerProtocol.h"

@interface UIViewController (MVVMViewController) <MVVMBaseViewControllerProtocol>

/**
 初始化方法

 @return 生成ViewController 与对应的 ViewModel
 */
- (instancetype)initMVVM_ViewController;

#pragma - mark MVVMBaseViewControllerProtocol

/**
 baseVM get方法

 @return 控制器对应的 model
 */
- (id)baseVM;

/**
 baseVM set方法

 @param baseVM 控制器对应的 model
 */
- (void)setBaseVM:(id)baseVM;

@end
