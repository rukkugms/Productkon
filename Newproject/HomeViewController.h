//
//  HomeViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/14/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRViewController.h"
#import "TileViewController.h"
#import "ResViewController.h"
#import "TilehrViewController.h"
#import "TilecustmrViewController.h"
#import "EsttileViewController.h"
#import "ManagemttileViewController.h"
#import "Rightscheck.h"
#import "TLLeadsViewController.h"
#import "PlngTileViewController.h"
#import "AppDelegate.h"

@interface HomeViewController : UIViewController<mynewDelegate>{
    
NSString*userid;
BOOL recordResults;
   

}
-(void)inactivelogoutaction;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property (strong, nonatomic)NSString*username;
@property (strong, nonatomic)NSString*welcmeuser;
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

@property(strong,nonatomic)TileViewController*tileVCtrl;
@property(strong,nonatomic)ResViewController*ReVCtrl;
@property(strong,nonatomic)TilehrViewController*TilehrVCtrl;

@property(strong,nonatomic)EsttileViewController *EstmVCtrl;
@property(strong,nonatomic)ManagemttileViewController*mangVCtrl;
@property(strong,nonatomic)TLLeadsViewController*LCtrl;
@property(strong,nonatomic)PlngTileViewController*PlnCtrl;


@property(strong,nonatomic)Rightscheck *rights;
@property(readwrite)NSInteger ModuleID;
@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)NSString *result;
-(IBAction)logout:(id)sender;


@property (strong, nonatomic) IBOutlet UILabel *wlcmelbl;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *compactivityindctr;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *resactivtyindictr;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *estactvityindicator;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *planactivityindctr;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *ledactvtyindctr;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *custindictr;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *hrindicator;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *promgmtindicatr;

@end
