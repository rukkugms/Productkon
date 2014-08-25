//
//  TilehrViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 2/4/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRViewController.h"
#import "ProcesshrViewController.h"
#import "EmplyhrmgntViewController.h"
#import "EmpJobViewController.h"
#import "Rightscheck.h"

@interface TilehrViewController : UIViewController
{
    BOOL recordResults;
    NSString *userid;
}
@property (strong, nonatomic) IBOutlet UIView *masterview;
@property (strong, nonatomic) IBOutlet UIView *processview;
@property (strong, nonatomic) IBOutlet UIView *mangmntview;
@property (strong, nonatomic)HRViewController *hrVCtrl;
@property (strong, nonatomic)ProcesshrViewController *prcsVCtrl;
@property(strong,nonatomic)EmplyhrmgntViewController *mgmtVCtrl;
@property(strong,nonatomic)EmpJobViewController*EmpVCtrl;
@property (strong, nonatomic) IBOutlet UIView *jobview;

- (IBAction)closebtnactn:(id)sender;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property(strong,nonatomic)Rightscheck *rights;
@property(readwrite)NSInteger Moduleid;
@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)NSString *result;

@end
