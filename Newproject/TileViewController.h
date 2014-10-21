//
//  TileViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyViewController.h"
#import "DocmntViewController.h"
#import "ServiceViewController.h"
#import "folderrightsViewController.h"
#import "UsersViewController.h"
#import "jobsitereqViewController.h"
#import "BasicReqViewController.h"
#import "workPhasesViewController.h"
#import "CrewsetupViewController.h"
#import "CmpnydocsViewController.h"
#import "TypeViewController.h"
#import "BranchViewController.h"
#import "SerialViewController.h"
#import "WorktypeViewController.h"
#import "SettngsViewController.h"
#import "SecurityViewController.h"
#import "Rightscheck.h"
#import "FtileViewController.h"

@interface TileViewController : UIViewController
{
    BOOL recordResults;
    NSString *userid;
     NSInteger checkWS;
}


//tiles
@property (strong, nonatomic) IBOutlet UIView *companyinfoview;
@property (strong, nonatomic) IBOutlet UIView *Documentsview;
@property (strong, nonatomic) IBOutlet UIView *servicesview;
@property (strong, nonatomic) IBOutlet UIView *foldersview;
@property (strong, nonatomic) IBOutlet UIView *usersview;
@property (strong, nonatomic) IBOutlet UIView *workprocedureview;
@property (strong, nonatomic) IBOutlet UIView *workphaseview;
@property(strong,nonatomic)IBOutlet UIView *jobsitereqview;
@property(strong,nonatomic)IBOutlet UIView *basicreqview;
@property (strong, nonatomic) IBOutlet UIView *serialview;
@property (strong, nonatomic) IBOutlet UIView *worktypeview;
@property (strong, nonatomic) IBOutlet UIView *wrksetngview;
@property (strong, nonatomic) IBOutlet UIView *securityview;


//close Actions
-(IBAction)closethetile:(id)sender;




//viewcontroller
@property(strong,nonatomic)CompanyViewController *compVCtrl;
@property(strong,nonatomic)DocmntViewController *docVCtrl;
@property(strong,nonatomic)ServiceViewController *serviceVCtrl;
@property(strong,nonatomic)folderrightsViewController *folderVCtrl;
@property(strong,nonatomic)UsersViewController *usersVctrl;
@property(strong,nonatomic)jobsitereqViewController *jobsitereqVctrl;
@property(strong,nonatomic)BasicReqViewController *basicreqVctrl;
@property(strong,nonatomic)workPhasesViewController *workVCtrl;
@property(strong,nonatomic)CrewsetupViewController *crewsetupVctrl;

@property(strong,nonatomic)CmpnydocsViewController *cmpnyVCtrl;

@property(strong,nonatomic)TypeViewController *typeVCtrl;
@property(strong,nonatomic)BranchViewController *branchVCtrl;
@property(strong,nonatomic)SerialViewController *SerialVCtrl;
@property(strong,nonatomic)WorktypeViewController *wrktypeVCtrl;
@property(strong,nonatomic)SettngsViewController *wrkstngVCtrlr;
@property(strong,nonatomic)SecurityViewController*securityVCtrl;
@property(strong,nonatomic)FtileViewController *ftileVCtrl;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property(strong,nonatomic)Rightscheck *rights;
@property(readwrite)NSInteger Moduleid;
@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)NSString *result;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *compinfoindictr;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *branchindictr;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *docindictr;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *setngindictr;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *typeindicator;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *usersindicator;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *basicindicatr;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *rightsindictr;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *secindictr;

@end
