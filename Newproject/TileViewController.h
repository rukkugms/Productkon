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

@interface TileViewController : UIViewController


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

@end
