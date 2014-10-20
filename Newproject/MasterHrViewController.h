//
//  MasterHrViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 09/10/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empdetails.h"

@interface MasterHrViewController : UIViewController
{
    UIButton *button;
    NSInteger btnindex;
    BOOL recordResults;
    NSString *webstring;
}

@property(strong,nonatomic)Empdetails *empdetl;

/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UITableView *hrtable;
@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;
@property(strong,nonatomic)IBOutlet UITableViewCell *hrtblecell;
@property(strong,nonatomic)IBOutlet UITableView *poovertableview;
@property(strong,nonatomic)UIPopoverController *poovercontroller;


@property (strong, nonatomic) IBOutlet UILabel *ssnlabel;
@property (strong, nonatomic) IBOutlet UILabel *firstnamelbl;
@property (strong, nonatomic) IBOutlet UILabel *lastnamelabel;
@property (strong, nonatomic) IBOutlet UILabel *cellphnlbl;
@property (strong, nonatomic) IBOutlet UILabel *skilllbl;
@property (strong, nonatomic) IBOutlet UILabel *craftlbl;
@property(strong,nonatomic)IBOutlet UIButton *disclosurebtn;

/*IBActions*/
-(IBAction)CloseThisPAge:(id)sender;
-(IBAction)selectdisclosure:(id)sender;


@property(strong,nonatomic)NSMutableArray *disclosurearray;
@property(strong,nonatomic)NSMutableArray *hrlistarray;
@property(strong,nonatomic)NSMutableDictionary *skilldict;
@property(strong,nonatomic)NSString *skillstring;

/*xmlparse*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


@end
