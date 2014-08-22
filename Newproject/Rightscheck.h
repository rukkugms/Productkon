//
//  Rightscheck.h
//  Newproject
//
//  Created by GMSIndia 2 on 21/08/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rightscheck : NSObject

@property(readwrite)NSInteger entryid;
@property(readwrite)NSInteger userid;
@property(readwrite)NSInteger moduleid;
@property(readwrite)NSInteger ViewModule;
@property(readwrite)NSInteger EditModule;
@property(readwrite)NSInteger DeleteModule;
@property(readwrite)NSInteger PrintModule;

@end
