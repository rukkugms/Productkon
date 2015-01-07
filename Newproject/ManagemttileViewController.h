//
//  ManagemttileViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovementtileViewController.h"
#import "IssuesViewController.h"
#import "TimeSheetViewController.h"
#import "LbrMgmtViewController.h"
#import "PSitereqmntViewController.h"
#import "AbsentViewController.h"
#import "Rightscheck.h"
#import "PMJobViewController.h"
//ghfgh
@interface ManagemttileViewController : UIViewController

{
    BOOL recordResults;
    NSString *userid;

}
@property (strong, nonatomic) IBOutlet UIView *resurceview;
@property (strong, nonatomic) IBOutlet UIView *issueview;
@property (strong, nonatomic) IBOutlet UIView *timesheetview;
@property (strong, nonatomic) IBOutlet UIView *labrview;

@property (strong, nonatomic) IBOutlet UIView *jobview;
@property (strong, nonatomic)MovementtileViewController*movemtVCtrl;
@property (strong, nonatomic)TimeSheetViewController*timesheetVCtrl;
@property (strong, nonatomic)IssuesViewController *issueVCtrl;
@property (strong, nonatomic)LbrMgmtViewController *lbrmgmtvctrl;
@property (strong, nonatomic)PSitereqmntViewController*SitereqVCtrl;
@property (strong, nonatomic)AbsentViewController*absentVCtrl;
@property (strong, nonatomic)PMJobViewController *jobVCtrl;

- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *siteview;
@property (strong, nonatomic) IBOutlet UIView *absntview;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property(strong,nonatomic)Rightscheck *rights;
@property(readwrite)NSInteger Moduleid;
@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)NSString *result;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *iactivitybtn;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *resurceactivitybtn;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *siteactivitybtn;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *laboractivitybtn;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *absentactivitybtn;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *timeactivitybtn;

@end
