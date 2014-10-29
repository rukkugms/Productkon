//
//  MasterHrViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 09/10/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empdetails.h"
#import "InDetailhrviewViewController.h"

@interface MasterHrViewController : UIViewController
{
    UIButton *button;
    NSInteger btnindex;
    BOOL recordResults;
    NSString *webstring;
    NSInteger btntouch;
    NSInteger chektouch;
    NSString *jobstring;
    NSInteger poptype;
}

@property(strong,nonatomic)Empdetails *empdetl;
@property(strong,nonatomic)InDetailhrviewViewController *indetailctrl;

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
@property (strong, nonatomic) IBOutlet UILabel *jobsitelbl;
@property(strong,nonatomic)IBOutlet UIButton *disclosurebtn;
@property (strong, nonatomic) IBOutlet UIView *applicantprocessview;
@property (strong, nonatomic) IBOutlet UIButton *officechecklbl;
@property (strong, nonatomic) IBOutlet UIButton *jobsitebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *sitechecklbl;

/*IBActions*/
-(IBAction)CloseThisPAge:(id)sender;
-(IBAction)selectdisclosure:(id)sender;
- (IBAction)clsebtnactn:(id)sender;
- (IBAction)sitecheckactn:(id)sender;
- (IBAction)officecheckactn:(id)sender;
- (IBAction)jobsitebtn:(id)sender;
- (IBAction)processbtn:(id)sender;
-(IBAction)indetailviewselection:(id)sender;



@property(strong,nonatomic)NSMutableArray *disclosurearray;
@property(strong,nonatomic)NSMutableArray *hrlistarray;
@property(strong,nonatomic)NSMutableDictionary *skilldict;
@property(strong,nonatomic)NSString *skillstring;
@property (nonatomic, strong) NSMutableArray *JobsiteArray;
@property (nonatomic, strong)NSMutableDictionary *jobsitedict;
@property(strong,nonatomic)NSString *searchstring;

/*xmlparse*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


@end
