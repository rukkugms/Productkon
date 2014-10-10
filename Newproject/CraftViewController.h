//
//  CraftViewController.h
//  Newproject
//
//  Created by Riya on 9/10/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CraftViewController.h"
#import "Craftreqmtmdl.h"
#import "ManViewController.h"
#import "Rightscheck.h"
@interface CraftViewController : UIViewController{
     BOOL recordresults;
    NSInteger path;
    NSInteger deletepath;
    NSString *msgstrg;
    NSString *userid;
    NSInteger type;

}
@property(strong,nonatomic)Rightscheck *rights;
@property(readwrite)NSInteger moduleid;
@property(readwrite)NSInteger manpwrmoduleid;
@property(strong,nonatomic)ManViewController *manVCtrl;
@property(readwrite)NSInteger reqid;
@property(strong,nonatomic)Craftreqmtmdl*craftmdl;
@property(strong,nonatomic)NSMutableArray *brcraftarray;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


@property (strong, nonatomic) IBOutlet UITableView *crafttable;
@property (strong, nonatomic) IBOutlet UITableViewCell *craftcell;

@property (strong, nonatomic) IBOutlet UILabel *craftlbl;
@property (strong, nonatomic) IBOutlet UITextField *craftnamelbl;

- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
- (IBAction)clsebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *titleview;

@property (strong, nonatomic) IBOutlet UIView *addview;
- (IBAction)updatebtn:(id)sender;
- (IBAction)addclsebtn:(id)sender;
- (IBAction)craftbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *craftbtnlbl;


/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;



@property(strong,nonatomic)NSString *craftstring;
@property(strong,nonatomic)NSMutableArray *craftlistarray;
@property(strong,nonatomic)NSMutableDictionary *craftlistdictionary;
- (IBAction)addmanpwrbtn:(id)sender;
@property(strong,nonatomic)IBOutlet UIButton *updatebtn;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)NSString *rightresult;


@end
