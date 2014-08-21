//
//  HomeViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/14/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeadsViewController.h"
#import "HRViewController.h"
#import "TileViewController.h"
#import "ResViewController.h"
#import "TilehrViewController.h"
#import "PlanningViewController.h"
#import "TilecustmrViewController.h"
#import "EsttileViewController.h"
#import "ManagemttileViewController.h"
#import "Rightscheck.h"

@interface HomeViewController : UIViewController{
    
NSString*userid;
BOOL recordResults;

}
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property (strong, nonatomic)NSString*username;

/*Views*/
@property (strong, nonatomic) IBOutlet UIView *customerview;
@property (strong, nonatomic) IBOutlet UIView *leadView;
@property (strong, nonatomic) IBOutlet UIView *companyView;
@property (strong, nonatomic) IBOutlet UIView *hrview;
@property (strong, nonatomic) IBOutlet UIView *planngview;
@property (strong, nonatomic) IBOutlet UIView *reurceview;
@property (strong, nonatomic) IBOutlet UIView *estimtnview;
@property (strong, nonatomic) IBOutlet UIView *projectview;


/*controllers*/

@property (strong, nonatomic)TilecustmrViewController*custmrVCtrl;
@property(strong,nonatomic)LeadsViewController *leadVCtrl;
@property(strong,nonatomic)TileViewController*tileVCtrl;
@property(strong,nonatomic)ResViewController*ReVCtrl;
@property(strong,nonatomic)TilehrViewController*TilehrVCtrl;
@property(strong,nonatomic)PlanningViewController *PlangVCtrl;
@property(strong,nonatomic)EsttileViewController *EstmVCtrl;
@property(strong,nonatomic)ManagemttileViewController*mangVCtrl;


@property(strong,nonatomic)Rightscheck *rights;
@property(readwrite)NSInteger ModuleID;
@property(strong,nonatomic)NSMutableArray *userrightsarray;

-(IBAction)logout:(id)sender;



@end
