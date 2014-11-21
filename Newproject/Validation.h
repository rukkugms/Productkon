//
//  Validation.h
//  Expensetrack
//
//  Created by GMSIndia1 on 4/10/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validation : NSObject
-(BOOL)isBlank:(NSString *)string;
-(BOOL)isNumeric:(NSString *)input;
-(BOOL)isIntegerValue:(NSString *)input;
-(BOOL)isdataformat:(NSString *)input;
-(BOOL) validEmailAddress:(NSString*) emailStr;
- (BOOL) validateUrl: (NSString *) candidate;
-(BOOL)validatespecialcharacters:(NSString *)input;
-(BOOL)isvalidpass:(NSString *)input;
@end
