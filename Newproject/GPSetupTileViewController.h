//
//  GPSetupTileViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 23/05/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CrewsetupViewController.h"
#import "GroupEqupViewController.h"
#import "GpMaterViewController.h"
#import "GpFleetViewController.h"
#import "Rightscheck.h"
#import "TPGPViewController.h"
#import "GPConusumViewController.h"
#import "GSmallViewController.h"
#import "AstGpViewController.h"
#import "SDPViewController.h"

@interface GPSetupTileViewController : UIViewController
{
    
    NSString*userid;
    BOOL recordResults;
    NSInteger checkws;
}


-(IBAction)closethegroup:(id)sender;

@property(strong,nonatomic)IBOutlet UIView *manview;
@property(strong,nonatomic)IBOutlet UIView *equipview;
@property(strong,nonatomic)IBOutlet UIView *materview;
@property (strong, nonatomic) IBOutlet UIView *fleetview;
@property (strong, nonatomic) IBOutlet UIView *Thirdpartyview;
@property (strong, nonatomic) IBOutlet UIView *consumview;
@property (strong, nonatomic) IBOutlet UIView *smalltoolview;
@property (strong, nonatomic) IBOutlet UIView *Astview;
@property (strong, nonatomic) IBOutlet UIView *safetyview;



@property(strong,nonatomic)CrewsetupViewController *crewctrl;
@property(strong,nonatomic)GroupEqupViewController *equipVCtrl;
@property(strong,nonatomic)GpMaterViewController *materialVCtrl;
@property(strong,nonatomic)GpFleetViewController*fleetVCtrl;
@property(strong,nonatomic)TPGPViewController*thirdpartyVCtrl;
@property(strong,nonatomic)GPConusumViewController*consumVCtrl;
@property(strong,nonatomic)GSmallViewController*smallVCtrl;
@property(strong,nonatomic)AstGpViewController*assetVCtrl;
@property(strong,nonatomic)SDPViewController *safeVCtrl;

@property(strong,nonatomic)Rightscheck *rights;

@property(readwrite)NSInteger ModuleID;
@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)NSString *result;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *gpmanactivity;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *gpequactivity;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *gpmateractivity;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *gpfleetactivity;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *gpthirdactivity;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *gpconsumactivity;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *gpsmallactivity;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *gpassetactivity;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *safetyactivity;


@end
