//
//  Validation.m
//  Expensetrack
//
//  Created by GMSIndia1 on 4/10/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "Validation.h"

@implementation Validation
-(BOOL)isBlank:(NSString *)string{
    
    if(string.length==0){
        return NO;
    }
    else{
        return YES;
    }
}
-(BOOL)isNumeric:(NSString *)input{
//    for(int i=0;i<[input length];i++){
//        char c=[input characterAtIndex:i];
//        if((c=='-' && c=='0')||((!(c>='0' && c<='9'&& c==' ')) && (!(c=='.'))&&(!(c=='$')))){
//            
//            return NO;
//        }
//        
//    }
//    return YES;
    
    NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@".$0123456789 "];
    for (int i = 0; i < [input length]; i++)
    {
        unichar c = [input characterAtIndex:i];
        if (![myCharSet characterIsMember:c])
        {
            return NO;
        }
    }
    
    return YES;

    
    
    
}
//-(BOOL)isCharcter:(NSString *)input{
//    for(int i=0;i<[input length];i++){
//        char c=[input characterAtIndex:i];
//      if((c=='-' && c=='0')||((!(c>='0' && c<='9')) && (!(c=='.'))&&(!(c=='$')))){
//            return NO;
//            
//        }
//        
//    }
//    return YES;
//
//    
//}
-(BOOL)isIntegerValue:(NSString *)input{
    
     for(int i=0;i<[input length];i++){
          char c=[input characterAtIndex:i];
         if (!(c>='0' && c<='9')) {
             return NO;
             
         }
    
    }
    return YES;
}
-(BOOL)isvalidpass:(NSString *)input{
    
    for(int i=0;i<[input length];i++){
        char c=[input characterAtIndex:i];
        if ((c>=' ')) {
            return NO;
            
        }
        
    }
    return YES;
}

-(BOOL)isdataformat:(NSString *)input{
    
    for(int i=0;i<[input length];i++){
        char c=[input characterAtIndex:i];
        if (!(c>='0' && c<='9')&& (!(c=='-'))){
            return NO;
            
        }
        
    }
    return YES;
}

-(BOOL) validEmailAddress:(NSString*) emailStr {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailValidation = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if (![emailValidation evaluateWithObject:emailStr]) {
        return FALSE;
    }
    return TRUE;
}
- (BOOL) validateUrl: (NSString *) candidate {
    
   // NSString *urlRegEx = @"((ftp|http|https):-//)?([a-zA-Z0-9]+(.[a-zA-Z0-9]+)+.*)$";
    NSString *urlRegEx =@"((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    if (![urlTest evaluateWithObject:candidate]) {
        return FALSE;
    }
return TRUE;
    
}

-(BOOL)validatespecialcharacters:(NSString *)input{
     NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "];
    for (int i = 0; i < [input length]; i++)
    {
        unichar c = [input characterAtIndex:i];
        if (![myCharSet characterIsMember:c])
        {
            return NO;
        }
    }
    
    return YES;
}


@end
