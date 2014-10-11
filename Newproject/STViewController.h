//
//  StatusViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 18/09/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Craftreqmtmdl.h"

@interface STViewController : UIViewController
{
    NSInteger optionidentifier;
    UIButton *button;
    NSInteger path;
    NSInteger deletepath;
    NSInteger webtype;
    BOOL recordresults;
}
@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UITextField *statustxtfld;
@property (strong, nonatomic) IBOutlet UITableView *statustable;
@property(strong,nonatomic)IBOutlet UITableViewCell *statuscell;
@property(strong,nonatomic)Craftreqmtmdl *statusmdl;
@property (strong, nonatomic) IBOutlet UINavigationItem *navitem;
@property(strong,nonatomic)IBOutlet UILabel *statuslabel;
@property(strong,nonatomic)IBOutlet UIView *titleview;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property(strong,nonatomic)NSMutableArray *statusarry;


- (IBAction)clsebtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
- (IBAction)addclsebtn:(id)sender;
- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
-(IBAction)Editleadstatus:(id)sender;
@property(strong,nonatomic)NSString *result;
@property(strong,nonatomic)IBOutlet UIButton *updatebtn;
@property(readwrite)NSInteger moduleid;

@end
