//
//  LbrMgmtViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 30/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LbmgModel.h"
#import "Rightscheck.h"

@interface LbrMgmtViewController : UIViewController
{
    NSInteger btnindex;
    BOOL recordResults;
    NSString *f;
    NSString *fname;
    NSInteger check;
    UIButton *button;
    NSInteger webtype;
    NSInteger btnclick;
    
}
@property(strong,nonatomic)LbmgModel *lbmdl;

@property (strong, nonatomic) IBOutlet UITableView *mgmttable;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UITableView *popovertable;
@property(strong,nonatomic)IBOutlet UITableViewCell *mgmtcell;
@property(strong,nonatomic)UIPopoverController *popover;
@property(strong,nonatomic)IBOutlet UIButton *jobbtn;
@property(strong,nonatomic)IBOutlet UIButton *formanbtn;
- (IBAction)Selectjobsite:(id)sender;
- (IBAction)Selectforman:(id)sender;
- (IBAction)closethepage:(id)sender;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableArray *jobarray;
@property(strong,nonatomic)NSMutableArray *formanarray;
@property(strong,nonatomic)NSString  *jobnumber;
@property(strong,nonatomic)NSString  *jobid;
@property(strong,nonatomic)NSMutableDictionary  *jobiddict;
@property(strong,nonatomic)NSMutableDictionary  *jobsitedict;
@property(strong,nonatomic)NSMutableDictionary  *formandict;
@property(strong,nonatomic)NSString  *forman;
@property(strong,nonatomic)NSMutableArray *lbrmgmtarray;

/*uilabel in cell*/
@property(strong,nonatomic)IBOutlet UILabel *emplabel;
@property(strong,nonatomic)IBOutlet UILabel *formanlabel;
@property(strong,nonatomic)IBOutlet UIButton *checkbtn;

@property(strong,nonatomic)NSString *checkstring;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;
@end
