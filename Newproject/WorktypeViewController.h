//
//  WorktypeViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 4/8/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rightscheck.h"

@interface WorktypeViewController : UIViewController{
      BOOL recordResults;
    NSInteger deletepath;
    NSInteger webtype;
    NSString *entryid;
    NSInteger path;
    UIButton *button;
    NSString *msgstrg;
    NSInteger optionidentifier;
    
}




@property(strong,nonatomic)NSMutableArray *worktypearray;
@property(strong,nonatomic)NSMutableDictionary*worktypedict;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;



@property (strong, nonatomic) IBOutlet UITableViewCell *wrktypecell;
@property (strong, nonatomic) IBOutlet UILabel *typelbl;
- (IBAction)editbtn:(id)sender;



@property (strong, nonatomic) IBOutlet UINavigationItem *navtitle;

@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *typetable;
@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UITextField *typetxtfld;

- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;

- (IBAction)updatebtn:(id)sender;

- (IBAction)clsebtn:(id)sender;
- (IBAction)addclsebtn:(id)sender;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;
@property(strong,nonatomic)IBOutlet UIButton *updatebtn;

@end
