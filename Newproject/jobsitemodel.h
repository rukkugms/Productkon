//
//  jobsitemodel.h
//  Newproject
//
//  Created by GMSIndia 2 on 03/01/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface jobsitemodel : NSObject
@property(readwrite)NSInteger jobid;
@property(strong,nonatomic)NSString *jobname;
@property(strong,nonatomic)NSString *jobno;
@property(strong,nonatomic)NSString *skill;

@end
