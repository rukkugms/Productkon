//
//  SettngsViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 06/05/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceViewController.h"
#import "workPhasesViewController.h"
#import "WorktypeViewController.h"
#import "UserRightViewController.h"
#import "Rightscheck.h"

@interface SettngsViewController : UIViewController
{
    BOOL recordResults;
    NSString *userid;

}


@property (strong, nonatomic) IBOutlet UIView *serviceview;
@property (strong, nonatomic) IBOutlet UIView *worktypeview;
@property (strong, nonatomic) IBOutlet UIView *workphaseview;
@property (strong, nonatomic) IBOutlet UIView *userview;

@property(strong,nonatomic)ServiceViewController *serviceVCtrl;
@property(strong,nonatomic)workPhasesViewController *workVCtrl;
@property(strong,nonatomic)WorktypeViewController *wrktypeVCtrl;
@property(strong,nonatomic)UserRightViewController *userrightsVCtrl;

-(IBAction)closethepage:(id)sender;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property(strong,nonatomic)Rightscheck *rights;
@property(readwrite)NSInteger Moduleid;
@property(strong,nonatomic)NSString *result;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *servcindicator;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *wrktypeindicator;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *phaseindicator;

@end