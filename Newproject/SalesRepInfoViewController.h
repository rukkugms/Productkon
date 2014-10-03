//
//  SalesRepInfoViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 20/06/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rsalesmdl.h"
#import "Validation.h"

@interface SalesRepInfoViewController : UIViewController
{
    NSInteger optionidentifier;
    NSInteger webtype;
    BOOL recordResults;
    NSInteger btnindex;
    UIButton *button;
    NSInteger path;
    NSString *phonenostring;
     NSString *mobilestring;
    
}

@property(strong,nonatomic)Rsalesmdl *rmodel;
@property(strong,nonatomic)Validation *val;
@property(strong,nonatomic)NSString *ccode;
@property(strong,nonatomic)NSString *resultstring;
@property(strong,nonatomic)NSString *searchstring;
@property(strong,nonatomic)NSString *phonenofmtstring;
@property(strong,nonatomic)NSString *mobilefmtstring;

@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
@property(strong,nonatomic)IBOutlet UITableView *salesRepTable;
@property(strong,nonatomic)IBOutlet UIView *addView;
@property(strong,nonatomic)IBOutlet UINavigationItem *navbar;
@property(strong,nonatomic)IBOutlet UIView *infoview;
@property(strong,nonatomic)IBOutlet UITableViewCell *salescell;


- (IBAction)closesalesreppage:(id)sender;
- (IBAction)addsalesaction:(id)sender;
- (IBAction)deletesalesaction:(id)sender;
- (IBAction)editsalesaction:(id)sender;

/*Outlets in cell*/
@property (strong, nonatomic) IBOutlet UILabel *custcodelabel;
@property (strong, nonatomic) IBOutlet UILabel *empidlabel;
@property (strong, nonatomic) IBOutlet UILabel *namelabel;
@property (strong, nonatomic) IBOutlet UILabel *phonelabel;
@property (strong, nonatomic) IBOutlet UILabel *extensionlabel;
@property (strong, nonatomic) IBOutlet UILabel *mobilelabel;
@property (strong, nonatomic) IBOutlet UILabel *email;

/*xmlparser*/
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSXMLParser *xmlparser;
@property(strong,nonatomic)NSMutableString *soapResults;
/*array*/
@property(strong,nonatomic)NSMutableArray *salesarray;
@property (strong, nonatomic) IBOutlet UIButton *cancelbtnlbl;

/*outlet in add view*/
@property (strong, nonatomic) IBOutlet UITextField *custcodetextfield;
@property (strong, nonatomic) IBOutlet UITextField *empidtextfield;
@property (strong, nonatomic) IBOutlet UITextField *nametextfield;
@property (strong, nonatomic) IBOutlet UITextField *emailtextfield;
@property (strong, nonatomic) IBOutlet UITextField *extensiontextfield;
@property (strong, nonatomic) IBOutlet UITextField *phoneofficetextfield;
@property (strong, nonatomic) IBOutlet UITextField *mobiletextfield;
- (IBAction)update:(id)sender;
- (IBAction)cancel:(id)sender;
@property(strong,nonatomic)IBOutlet UIButton *updatebtn;

@property(strong,nonatomic)IBOutlet UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;
- (IBAction)selectnameaction:(id)sender;
@property(strong,nonatomic)IBOutlet UIButton *namebtn;
@property(strong,nonatomic)NSMutableArray *namelistarray;

@end
