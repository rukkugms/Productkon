//
//  planmodel.h
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface planmodel : NSObject

@property(strong,nonatomic)NSString *planid;
@property(strong,nonatomic)NSString *customername;
@property(readwrite)NSInteger leadid;
@property(readwrite)NSInteger customerid;
@property(readwrite)NSInteger idvalue;
@property(strong,nonatomic)NSString *worktypeid;
@property(strong,nonatomic)NSString *worktype;
@property(strong,nonatomic)NSString *sitefactor;
@property(strong,nonatomic)NSString *location;
@property(strong,nonatomic)NSString *zip;
@property(strong,nonatomic)NSString *masterplan;
@property(strong,nonatomic)NSString *complexity;
@property(strong,nonatomic)NSString *manhrs;
@property(strong,nonatomic)NSString *equphrs;
@property(strong,nonatomic)NSString *mathrs;


@end
