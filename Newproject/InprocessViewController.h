//
//  InprocessViewController.h
//  Newproject
//
//  Created by Riya on 10/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empdetails.h"
#import "DetailproHrViewController.h"
#import "VerificationViewController.h"

@interface InprocessViewController : UIViewController<myDelegate>{
    
  BOOL   recordResults;
    NSInteger webtype,btnindex;
    UIButton *button;




}
-(void)newaction;
@property (strong, nonatomic)NSString*empskillid;
@property (strong, nonatomic)NSMutableDictionary *SkillDict;
@property (strong, nonatomic)Empdetails *empdetl;
@property (strong, nonatomic)DetailproHrViewController *DetailproVCtrl;
@property (strong, nonatomic)VerificationViewController *verifictnVCtrl;

@property (readwrite)NSInteger Applicantid;

@property (strong, nonatomic)NSMutableArray *popoverdisarray;
@property (strong, nonatomic)NSMutableArray *empnameArray;
@property (strong, nonatomic)NSMutableArray *newprocesssarray;
/*searchbar*/
@property (strong, nonatomic) IBOutlet UISearchBar * SearchingBar;
@property (strong, nonatomic) NSString *searchstring;

/*xmlparse*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
/*IBoutlets*/
@property (strong, nonatomic) IBOutlet UITableViewCell *processcell;
@property (strong, nonatomic) IBOutlet UITableView *processtable;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UIButton *secnddisbtnlbl;

@property (strong, nonatomic) IBOutlet UILabel *ssnlbl;
@property (strong, nonatomic) IBOutlet UILabel *firstnamelbl;
@property (strong, nonatomic) IBOutlet UILabel *lastnamelbl;
@property (strong, nonatomic) IBOutlet UILabel *cellphonelbl;
@property (strong, nonatomic) IBOutlet UILabel *skilllbl;
@property (strong, nonatomic) IBOutlet UILabel *jobsitelbl;

@property (strong, nonatomic) IBOutlet UILabel *craftlbl;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;

@property(strong,nonatomic)UITableView *popOverTableView;
@property (strong, nonatomic)NSMutableArray*popoverArry;

/*Actions*/
- (IBAction)clsebtn:(id)sender;
- (IBAction)firstdisclurebtn:(id)sender;
- (IBAction)seconddisclsurebtn:(id)sender;


@end
