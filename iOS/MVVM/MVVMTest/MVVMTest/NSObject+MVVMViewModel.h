//
//  NSObject+MVVMViewModel.h
//  MVVMTest
//
//  Created by apple on 31/10/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "MVVMViewControllerVMProtocol.h"

@interface NSObject (MVVMViewModel) <MVVMViewControllerVMProtocol>

/**
 初始化 控制器对应的 ViewMode

 @param controller 对应的控制器
 @return ViewMode
 */
- (instancetype)initMVVM_viewModelWithViewController:(UIViewController *)controller;

/**
 vm 中直接推出控制器

 @param viewController 需要推出的控制器
 @param animated 是否有动画
 */
- (void)vmPushViewController:(UIViewController *)viewController animated:(BOOL)animated;

#pragma - mark MVVMViewControllerVMProtocol

/**
 targetVC set方法

 @param targetVC 指向的ViewController
 */
- (void)setTargetVC:(UIViewController *)targetVC;

/**
 targetVC get方法

 @return 指向的ViewController
 */
- (UIViewController *)targetVC;

@end
