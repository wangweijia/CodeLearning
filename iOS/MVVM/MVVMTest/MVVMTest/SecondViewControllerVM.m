//
//  SecondViewControllerVM.m
//  MVVMTest
//
//  Created by apple on 03/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "SecondViewControllerVM.h"
#import "SecondViewController.h"

@interface SecondViewControllerVM ()

@end

@implementation SecondViewControllerVM

#warning - 这方法优化，使用父类的 属性名，返回正确的数据类型
- (SecondViewController *)secondViewController {
    return (SecondViewController *)_targetVC;
}

#pragma - mark bind active
- (void)initialBind {
    [self bindRequest];
    [self bindNewDoctorData];
}

#pragma - mark netWork
/**
 *  绑定 网络请求
 *  http://www.921cha.com/apps-server/doctor/info.json?k=BM4CROnYwBC6f8&t=1&_c=1&_sdk=8.000000&v=41700&_n=2&udid=5269fb0c27870287e9fe4dd57d246f0b33f5b01c&_ct=1470226986000&id=334
 */
- (void)bindRequest {
    _requestDoctors = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(Doctor *input) {
        if (input) {
            self.doctor = input;
        }
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            NSString *urlStr = [NSString stringWithFormat:@"http://www.921cha.com/apps-server/doctor/info.json?k=BM4CROnYwBC6f8&t=1&_c=1&_sdk=8.000000&v=41700&_n=2&udid=5269fb0c27870287e9fe4dd57d246f0b33f5b01c&_ct=1470226986000&id=%@",@(self.doctor.doctorId)];
            NSURL *url = [NSURL URLWithString:urlStr];
            
            NSURLRequest *requst = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
            [NSURLConnection sendAsynchronousRequest:requst queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                Doctor *newDoctor = [[Doctor alloc] initWithDic:dic[@"info"]];
                self.doctor = newDoctor;
                
                [subscriber sendNext:@"医生详细信息请求完成"];
                [subscriber sendCompleted];
            }];
            
            return nil;
        }];
    }];
}

/**
 *  监听 doctor 属性
 */
- (void)bindNewDoctorData {
    _doctorData = RACObserve(self, doctor);
    NSLog(@"aaaa");
}

@end
