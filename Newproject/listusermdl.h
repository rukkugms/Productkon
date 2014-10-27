//
//  listusermdl.h
//  Newproject
//
//  Created by GMSIndia 2 on 02/01/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface listusermdl : NSObject
@property(readwrite)NSInteger userid;
@property(strong,nonatomic)NSString *username;
@property(strong,nonatomic)NSString *pwd;
@property(strong,nonatomic)NSString *empname;
@property(strong,nonatomic)NSString *customername;
@property(strong,nonatomic)NSString *UserTypeId;
@property(strong,nonatomic)NSString *UserTypeName;
@property(strong,nonatomic)NSString *DeviceType;
@property(strong,nonatomic)NSString *Activate;

@end
