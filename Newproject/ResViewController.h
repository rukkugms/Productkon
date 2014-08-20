//
//  ResViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ManViewController.h"
#import "EqpmViewController.h"
#import "MaterialsViewController.h"
#import "FleetsViewController.h"
#import "SmalltoolsViewController.h"
#import "ThirdPartyViewController.h"
#import "ConsumbleViewController.h"
#import "AssetsViewController.h"
//#import "CrewsetupViewController.h"
#import "GPSetupTileViewController.h"


@interface ResViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIView *manpwrview;
@property(strong,nonatomic)IBOutlet UIView *eqpView;
@property(strong,nonatomic)IBOutlet UIView *materialView;
@property (strong, nonatomic) IBOutlet UIView *fleetview;
@property (strong, nonatomic) IBOutlet UIView *smalltoolview;
@property (strong, nonatomic) IBOutlet UIView *thirdpartyview;
@property (strong, nonatomic) IBOutlet UIView *consumbleview;
@property (strong, nonatomic) IBOutlet UIView *cmpanyassetview;
@property (strong, nonatomic) IBOutlet UIView *crewview;

//ViewControllers

@property(strong,nonatomic)ManViewController *manVCtrl;
@property(strong,nonatomic)EqpmViewController *equipVCtrl;
@property(strong,nonatomic)MaterialsViewController *materialVCtrl;
@property(strong,nonatomic)FleetsViewController *fleetVCtrl;
@property(strong,nonatomic)SmalltoolsViewController *smalltoolVCtrl;
@property(strong,nonatomic)ThirdPartyViewController*ThirdVCtrl;
@property(strong,nonatomic)ConsumbleViewController*ConsuVCtrl;
@property(strong,nonatomic)AssetsViewController*AssetVCtrl;
@property(strong,nonatomic)GPSetupTileViewController*gpctrl;

- (IBAction)closebtnActn:(id)sender;


//NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//
//[defaults setObject:_soapResults forKey:@"Userid"];
//[defaults synchronize];

@end
