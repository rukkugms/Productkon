//
//  commentmdl.h
//  Newproject
//
//  Created by GMSIndia1 on 6/26/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface commentmdl : NSObject
@property(strong,nonatomic)NSString*comments;
@property(strong,nonatomic)NSString*commentdate;
@property(readwrite)NSInteger userid;
@property(readwrite)NSInteger commentId;
@property(readwrite)NSInteger activityid;
@property(readwrite)NSInteger leadid;

@property(strong,nonatomic)NSString*commentcode;



@end
