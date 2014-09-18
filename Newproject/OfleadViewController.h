//
//  TypeofleadViewController.h
//  Newproject
//
//  Created by Riya on 9/18/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Craftreqmtmdl.h"

@interface OfleadViewController : UIViewController
{
    NSInteger optionidentifier;
    UIButton *button;
    NSInteger path;
    NSInteger deletepath;
    NSInteger webtype;
    BOOL recordresults;
}
@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UITextField *leadtxtfld;
@property (strong, nonatomic) IBOutlet UITableView *leadtypetable;
@property(strong,nonatomic)IBOutlet UITableViewCell *leadcell;
@property(strong,nonatomic)Craftreqmtmdl *typemdl;
@property (strong, nonatomic) IBOutlet UINavigationItem *navitem;
@property(strong,nonatomic)IBOutlet UILabel *typelabel;
@property(strong,nonatomic)IBOutlet UIView *titleview;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property(strong,nonatomic)NSMutableArray *typearry;


- (IBAction)clsebtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
- (IBAction)addclsebtn:(id)sender;
- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
-(IBAction)Editleadtype:(id)sender;
@property(strong,nonatomic)NSString *result;

@end
