//
//  SerialViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/27/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumbrSerMdl.h"
#import "Validation.h"

@interface SerialViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    UIButton *button;
      BOOL recordResults;
    NSInteger optionidentifier;
    NSInteger btnindex;
    NSInteger webtype;
    NSInteger path;
}
@property(readwrite)NSInteger moduleid;
@property(strong,nonatomic)Validation *val;
@property(strong,nonatomic)NumbrSerMdl *seqmdl;
@property(readwrite)NSInteger skillid;
@property(strong,nonatomic)NSString *displaystring;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
/*Arrays&models*/
@property(strong ,nonatomic)NSMutableArray *sequencearray;

@property(strong,nonatomic)NSString *searchstring;
@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;


/*Outlets*/
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *sequencetable;

@property (strong, nonatomic) IBOutlet UITableViewCell *resurcecell;
@property (strong, nonatomic) IBOutlet UILabel *seqnolabel;
@property (strong, nonatomic) IBOutlet UILabel *jobtask;
@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UITextField *seqnotextfld;
@property (strong, nonatomic) IBOutlet UITextField *jobtasktextfld;
@property (strong, nonatomic) IBOutlet UINavigationItem *navbar;

-(IBAction)addsequence:(id)sender;
- (IBAction)addclsebtn:(id)sender;
- (IBAction)editbtn:(id)sender;
- (IBAction)cancel:(id)sender;

- (IBAction)clsebtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
-(IBAction)deleteAction:(id)sender;

@property(strong,nonatomic)IBOutlet UIButton *updatebtn;
@property(strong,nonatomic)IBOutlet UIButton *cancelbtn;
@end
