//
//  InDetailhrviewViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 28/10/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empdetails.h"

@interface InDetailhrviewViewController : UIViewController



@property(strong,nonatomic)Empdetails *empmdl;
@property(strong,nonatomic)NSMutableArray *detailarray;
@property(strong,nonatomic)NSMutableArray *montharray;
@property(strong,nonatomic)NSMutableArray *remontharray;
@property(strong,nonatomic)NSMutableDictionary *remonthdict;
- (IBAction)closedetail:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *adresslbl;
@property (strong, nonatomic) IBOutlet UILabel *citylbl;
@property (strong, nonatomic) IBOutlet UILabel *statelbl;
@property (strong, nonatomic) IBOutlet UILabel *countrylbl;
@property (strong, nonatomic) IBOutlet UILabel *ziplbl;
@property (strong, nonatomic) IBOutlet UILabel *doblbl;
@property (strong, nonatomic) IBOutlet UILabel *phonelbl;
@property (strong, nonatomic) IBOutlet UILabel *emergencylbl;
@property (strong, nonatomic) IBOutlet UILabel *EmrgcyName;
@property (strong, nonatomic) IBOutlet UILabel *maillbl;
@property (strong, nonatomic) IBOutlet UILabel *alternatvelbl;
@property (strong, nonatomic) IBOutlet UIButton *basicchecklbl;
@property (strong, nonatomic) IBOutlet UILabel *basicexpry;
@property (strong, nonatomic) IBOutlet UILabel *licenceno;
@property (strong, nonatomic) IBOutlet UILabel *licencename;
@property (strong, nonatomic) IBOutlet UILabel *licencestate;
@property (strong, nonatomic) IBOutlet UINavigationItem *navitem;
@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property (strong, nonatomic) IBOutlet UILabel *firstlbl;
@property (strong, nonatomic) IBOutlet UILabel *lastlbl;
@property (strong, nonatomic) IBOutlet UILabel *ssnlbl;
@property (strong, nonatomic) IBOutlet UILabel *twicnolbl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *gendersegment;


@end
