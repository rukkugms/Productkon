//
//  SubtypViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 12/09/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Craftreqmtmdl.h"
#import "ServiceViewController.h"
#import "Rightscheck.h"

@interface RSTViewController: UIViewController
{
    NSInteger deletepath;
    NSInteger path;
    BOOL recordResults;
    NSString *msgstring;
    NSInteger webtype;
    NSString *userid;
    NSInteger checkws;
   }


@property(readwrite)NSInteger moduleid;
-(IBAction)closesubtype:(id)sender;
@property(strong,nonatomic)Rightscheck *rights;
@property(strong,nonatomic)ServiceViewController *servicectrl;
@property(strong,nonatomic)Craftreqmtmdl *subtypemdl;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


@property (strong, nonatomic) IBOutlet UITableView *subtypetable;
@property(strong,nonatomic)IBOutlet UITableViewCell *subcell;
@property (strong, nonatomic) IBOutlet UIView *titleview;

@property (strong, nonatomic) IBOutlet UIView *addview;
- (IBAction)updatebtn:(id)sender;
- (IBAction)addclsebtn:(id)sender;
- (IBAction)subtpebtn:(id)sender;
- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
-(IBAction)toservice:(id)sender;

@property(strong,nonatomic)NSMutableArray *Subtypelistarray;
@property(strong,nonatomic)NSMutableArray *selectedsubtypearray;

@property(strong,nonatomic)IBOutlet UIButton *subtypebutton;
@property(strong,nonatomic)IBOutlet UILabel *subtypelabel;
@property(readwrite)NSInteger equipmainid;
@property(strong,nonatomic)NSString *skillstring;
@property(strong,nonatomic)NSMutableDictionary *subtypelistdictionary;


//Materials
@property(readwrite)NSInteger materialmainid;
@property(strong,nonatomic)IBOutlet UIButton *updatebtn;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)NSString *result;



@end
