//
//  BranchViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/24/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cbranch.h"
#import "Validation.h"
#import "Rightscheck.h"

@interface BranchViewController : UIViewController
{
    NSInteger path;
    NSInteger optionidentifier;
    BOOL recordResults;
    NSInteger webtype;
    UIButton *button;
    NSInteger btnindex;
    NSString *faxnostring;
    NSString *phonenostring;
}

@property(strong,nonatomic)Cbranch *branchmodel;
@property(strong,nonatomic)Validation *val;
@property(strong,nonatomic)NSString *phonenofmtstring;
@property(strong,nonatomic)NSString *faxnofmtstring;
@property(strong,nonatomic)NSString *displaystring;




/*IBActions*/
- (IBAction)Closebranchpage:(id)sender;
-(IBAction)addbranchaction:(id)sender;
-(IBAction)deletebranchAction:(id)sender;
-(IBAction)editbranchaction:(id)sender;
-(IBAction)closebranch:(id)sender;
-(IBAction)savebranch:(id)sender;
-(IBAction)cancel:(id)sender;


/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UIButton *cancelbtn;
@property(strong,nonatomic)IBOutlet UITableViewCell *branchcell;
@property (strong, nonatomic) IBOutlet UITableView *branchtable;
@property (strong, nonatomic) IBOutlet UIView *tabletitleview;
@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;
@property(strong,nonatomic)IBOutlet UINavigationItem *navbar;
@property(strong,nonatomic)IBOutlet UIView *branchview;

@property(strong,nonatomic)NSString *searchstring;


/*array*/
@property(strong,nonatomic)NSMutableArray *brancharray;

/*xmlparser*/
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSXMLParser *xmlparser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property (strong, nonatomic) IBOutlet UILabel *branchnamelabel;
@property (strong, nonatomic) IBOutlet UILabel *branchaddresslabel;
@property (strong, nonatomic) IBOutlet UILabel *phonelabel;
@property (strong, nonatomic) IBOutlet UILabel *faxlabel;
@property (strong, nonatomic) IBOutlet UILabel *emaillabel;

@property (strong, nonatomic) IBOutlet UITextField *branchnametextfld;
@property (strong, nonatomic) IBOutlet UITextField *phonetextfield;
@property (strong, nonatomic) IBOutlet UITextField *emailtextfield;
@property (strong, nonatomic) IBOutlet UITextView *addresstextview;
@property (strong, nonatomic) IBOutlet UITextField *faxtextfield;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;

@end
