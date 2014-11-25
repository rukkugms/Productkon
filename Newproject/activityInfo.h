//
//  activityInfo.h
//  Newproject
//
//  Created by GMSIndia 2 on 25/06/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface activityInfo : NSObject
@property(readwrite)NSInteger activityId;
@property(strong,nonatomic)NSString *LeadId;
@property(strong,nonatomic)NSString *activity;
@property(strong,nonatomic)NSString *ename;
@property(strong,nonatomic)NSString *employer;
@property(strong,nonatomic)NSString *status;
@property(strong,nonatomic)NSString *actdesion;
@property(strong,nonatomic)NSString *datest;
@property(strong,nonatomic)NSString *communicationtype;



@end
