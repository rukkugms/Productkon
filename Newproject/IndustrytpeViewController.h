//
//  IndustrytpeViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 18/09/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Craftreqmtmdl.h"

@interface IndustrytpeViewController : UIViewController
{
    BOOL recordresults;
    NSInteger optionidentifier;
    UIButton *button;
    NSInteger path;
    NSInteger deletepath;
    NSInteger webtype;
}

@property(strong,nonatomic)Craftreqmtmdl *typemdl;
@property (strong, nonatomic) IBOutlet UINavigationItem *navitem;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


@property (strong, nonatomic) IBOutlet UITableView *industrytypetable;
@property(strong,nonatomic)IBOutlet UITableViewCell *industrycell;
@property (strong, nonatomic) IBOutlet UIView *titleview;

@property (strong, nonatomic) IBOutlet UIView *addview;
- (IBAction)updatebtn:(id)sender;
- (IBAction)addclsebtn:(id)sender;

- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
-(IBAction)closethispage:(id)sender;


@property(strong,nonatomic)NSMutableArray *selectedindustryarray;

@property(strong,nonatomic)IBOutlet UITextField *industrytextfld;
@property(strong,nonatomic)IBOutlet UILabel *industrylabel;
@property(readwrite)NSInteger leadmainid;
@property(strong,nonatomic)NSString *industrystring;
@property(strong,nonatomic)NSMutableDictionary *industrylistdictionary;
-(IBAction)Editindustrytype:(id)sender;
@property(strong,nonatomic)NSString *result;

@end
