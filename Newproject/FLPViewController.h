//
//  FLPViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 19/09/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Craftreqmtmdl.h"

@interface FLPViewController : UIViewController

{
    BOOL recordresults;
    NSInteger optionidentifier;
    UIButton *button;
    NSInteger path;
    NSInteger deletepath;
    NSInteger webtype;
}


@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UITextField *followtxtfld;
@property (strong, nonatomic) IBOutlet UITableView *followtypetable;
@property(strong,nonatomic)IBOutlet UITableViewCell *followcell;
@property(strong,nonatomic)Craftreqmtmdl *followmdl;
@property (strong, nonatomic) IBOutlet UINavigationItem *navitem;
@property(strong,nonatomic)IBOutlet UILabel *followlabel;
@property(strong,nonatomic)IBOutlet UIView *titleview;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property(strong,nonatomic)NSMutableArray *followarry;


- (IBAction)clsebtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
- (IBAction)addclsebtn:(id)sender;
- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
-(IBAction)Edit:(id)sender;
@property(strong,nonatomic)NSString *result;

@end
