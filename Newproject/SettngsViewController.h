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

@interface SettngsViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIView *serviceview;
@property (strong, nonatomic) IBOutlet UIView *worktypeview;
@property (strong, nonatomic) IBOutlet UIView *workphaseview;
@property (strong, nonatomic) IBOutlet UIView *userview;

@property(strong,nonatomic)ServiceViewController *serviceVCtrl;
@property(strong,nonatomic)workPhasesViewController *workVCtrl;
@property(strong,nonatomic)WorktypeViewController *wrktypeVCtrl;
@property(strong,nonatomic)UserRightViewController *userrightsVCtrl;

-(IBAction)closethepage:(id)sender;


@end