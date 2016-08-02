//
//  Doctor.h
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Doctor : NSObject

//http://www.921cha.com/apps-server/doctor/search_doctor.json?_sdk=8.000000&_c=1&placeCode=310100&_ct=1470108968000&departmentId=-1&k=1AHMWBThBMXqxU&_n=2&timeInterval=&t=1&subDepartmentId=-1&pageNo=1&v=41700&udid=5269fb0c27870287e9fe4dd57d246f0b33f5b01c

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *hospitalName;

@property (nonatomic, assign) NSInteger doctorId;

@property (nonatomic, copy) NSString *cityStr;

@property (nonatomic, copy) NSString *info;

- (instancetype)initWithDic:(NSDictionary *)dic;

+ (NSArray<Doctor *> *)initWithArray:(NSArray *)array;

@end
