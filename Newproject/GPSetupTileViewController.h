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
#import "Rightscheck.h"

@interface GPSetupTileViewController : UIViewController
{
    
    NSString*userid;
    BOOL recordResults;
}


-(IBAction)closethegroup:(id)sender;

@property(strong,nonatomic)IBOutlet UIView *manview;
@property(strong,nonatomic)IBOutlet UIView *equipview;
@property(strong,nonatomic)IBOutlet UIView *materview;

@property(strong,nonatomic)CrewsetupViewController *crewctrl;
@property(strong,nonatomic)GroupEqupViewController *equipVCtrl;
@property(strong,nonatomic)GpMaterViewController *materialVCtrl;
@property(strong,nonatomic)Rightscheck *rights;

@property(readwrite)NSInteger ModuleID;
@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)NSString *result;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;



@end
