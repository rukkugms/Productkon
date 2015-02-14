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
#import "Rightscheck.h"
#import "HRViewController.h"
#import "TilehrViewController.h"
#import "SafetyViewController.h"


@interface ResViewController : UIViewController
{
    NSString*userid;
    BOOL recordResults;
    NSInteger checkWS;
}

@property(strong,nonatomic)TilehrViewController*TilehrVCtrl;
@property(strong,nonatomic)SafetyViewController *SafetyVCtrl;

@property (strong, nonatomic) IBOutlet UIView *manpwrview;
@property(strong,nonatomic)IBOutlet UIView *eqpView;
@property(strong,nonatomic)IBOutlet UIView *materialView;
@property (strong, nonatomic) IBOutlet UIView *fleetview;
@property (strong, nonatomic) IBOutlet UIView *smalltoolview;
@property (strong, nonatomic) IBOutlet UIView *thirdpartyview;
@property (strong, nonatomic) IBOutlet UIView *consumbleview;
@property (strong, nonatomic) IBOutlet UIView *cmpanyassetview;
@property (strong, nonatomic) IBOutlet UIView *crewview;
@property (strong, nonatomic) IBOutlet UIView *hrview;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *hrindicator;

//ViewControllers
////neww

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

@property(strong,nonatomic)Rightscheck *rights;
@property(readwrite)NSInteger ModuleID;
@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)NSString *result;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
@property (strong, nonatomic) IBOutlet UIView *saftyview;


/*activity*/

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *manactivity;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *eqactivity;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *matactivity;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *fleetactivity;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *gpactivity;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *tpactivity;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *conactivity;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *stactivity;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *assetactivity;

@end
