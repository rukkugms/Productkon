//
//  Infoleads.h
//  Newproject
//
//  Created by GMSIndia1 on 6/20/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Infoleads : NSObject
@property(readwrite)NSInteger leadid;
@property(strong,nonatomic)NSString*companyname;
@property(strong,nonatomic)NSString*location;
@property(strong,nonatomic)NSString*contactName;
@property(strong,nonatomic)NSString*contacttitle;
@property(strong,nonatomic)NSString*phone;
@property(strong,nonatomic)NSString*emailid;
@property(strong,nonatomic)NSString*city;
@property(strong,nonatomic)NSString*state;
@property(strong,nonatomic)NSString*Typeoflead;
@property(strong,nonatomic)NSString*Industrytype;
@property(strong,nonatomic)NSString*projecttype;
@property(strong,nonatomic)NSString*projectdescription;
@property(strong,nonatomic)NSString*projectexecution;
@property(strong,nonatomic)NSString*projectexecutionyear;
@property(strong,nonatomic)NSString*bidstatus;
@property(strong,nonatomic)NSString *idvalue;
@property(strong,nonatomic)NSString *leadassignto;
@property(strong,nonatomic)NSString *assigntoname;
@property(strong,nonatomic)NSString *leadstatus;



@end
