//
//  AddserviceViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddserviceViewController : UIViewController

{
    NSInteger path;
    BOOL recordResults;
    NSInteger webtype;
}

@property(strong,nonatomic)NSString *planID;

/*IBAction*/
-(IBAction)closeservices:(id)sender;
-(IBAction)deleteservices:(id)sender;
-(IBAction)selectservices:(id)sender;
-(IBAction)addservicetotable:(id)sender;

/*outlets*/
@property(strong,nonatomic)IBOutlet UINavigationItem *navabar;
@property(strong,nonatomic)IBOutlet UITableView *servicelisttable;
@property(strong,nonatomic)IBOutlet UIView *tabletitleview;
@property(strong,nonatomic)UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;
@property(strong,nonatomic)IBOutlet UIButton *servicebtn;


/*array*/
@property(strong,nonatomic)NSMutableArray *allservicearray;
@property(strong,nonatomic)NSMutableArray *serviceaddedarray;
@property(strong,nonatomic)NSMutableDictionary *servicedict;
@property(strong,nonatomic)NSMutableDictionary *serviceadddict;
@property(strong,nonatomic)NSString *servicestring;
@property(strong,nonatomic)NSMutableArray *itemcodearray;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSString *resultstring;
@property(strong,nonatomic)IBOutlet UIButton *addbtn;

@end
