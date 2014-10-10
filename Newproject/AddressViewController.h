//
//  AddressViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/24/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Mdladdress.h"
@interface AddressViewController : UIViewController{
     BOOL recordResults;
    NSInteger webtype;
    NSInteger path;
    UIButton *button;
    NSInteger deletepath;
    NSString * msgstrg;
     NSInteger optionidentifier;
}
@property(readwrite)NSInteger moduleid;
@property (strong, nonatomic)Mdladdress *addressmdl;
@property (strong, nonatomic)NSMutableArray *addesslistarray;
@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;
@property (strong, nonatomic) IBOutlet UITableView *addresstable;
@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UITextField *headrtxtfld;
@property (strong, nonatomic) IBOutlet UITextView *adrsstxtview;
@property (strong, nonatomic) IBOutlet UIView *titileview;
@property (strong, nonatomic) IBOutlet UITableViewCell *addrscell;
@property (strong, nonatomic) IBOutlet UILabel *headerlbl;
@property (strong, nonatomic) IBOutlet UILabel *addresslbl;
@property (strong, nonatomic) IBOutlet UINavigationItem *addnavitem;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
@property (strong, nonatomic) IBOutlet UIButton *cancelbtn;
@property (strong, nonatomic) IBOutlet UIButton *updatebtn;


/*IBaction*/
- (IBAction)clsebtn:(id)sender;
- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
- (IBAction)addclsebtn:(id)sender;
- (IBAction)editbtn:(id)sender;

@end
