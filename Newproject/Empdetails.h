//
//  Empdetails.h
//  Newproject
//
//  Created by GMSIndia1 on 9/27/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Empdetails : NSObject
@property(strong,nonatomic)NSString*firstname;
@property(strong,nonatomic)NSString*lastname;
@property(strong,nonatomic)NSString*ssn;
@property(strong,nonatomic)NSString*Phonenumber;

@property(readwrite)NSInteger applicantid;
@property(readwrite)NSInteger emp;
@property(strong,nonatomic)NSString* skillid;
@property(strong,nonatomic)NSString*empstatus;
@property(strong,nonatomic)NSString* emergencycontact;
@property(strong,nonatomic)NSString*gender;
@property(strong,nonatomic)NSString*email;
@property(strong,nonatomic)NSString*basicplus;
@property(strong,nonatomic)NSString*basicplusexp;
@property(strong,nonatomic)NSString*address;
@property(strong,nonatomic)NSString*city;
@property(strong,nonatomic)NSString*state;
@property(strong,nonatomic)NSString*country;
@property(strong,nonatomic)NSString*zip;
@property(strong,nonatomic)NSString*dob;
@property(strong,nonatomic)NSString*phone;
@property(strong,nonatomic)NSString*alternativeno;
@property(strong,nonatomic)NSString*emergencycontactname;
@property(strong,nonatomic)NSString*drivinglicenceno;
@property(strong,nonatomic)NSString*nameinlicence;
@property(strong,nonatomic)NSString*stateissuinglicence;
@property(strong,nonatomic)NSString*twiccardno;
@property(strong,nonatomic)NSString*Inproceesstatus;
@property(strong,nonatomic)NSString*photo;
@property(strong,nonatomic)NSString*othercraft;




@end
