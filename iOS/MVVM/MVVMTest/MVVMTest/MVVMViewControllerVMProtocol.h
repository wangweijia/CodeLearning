//
//  MVVMViewControllerVMProtocol.h
//  MVVMTest
//
//  Created by apple on 31/10/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#ifndef MVVMViewControllerVMProtocol_h
#define MVVMViewControllerVMProtocol_h


#endif /* MVVMViewControllerVMProtocol_h */

@protocol MVVMViewControllerVMProtocol <NSObject>

/**
 指向自己对应的 控制器
 */
@property (nonatomic, weak) id<MVVMViewControllerProtocol> targetVC;

/**
 用于绑定事件
 */
- (void)initialBind；

@end
