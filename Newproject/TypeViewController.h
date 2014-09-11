//
//  TypeViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/24/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rightscheck.h"

@interface TypeViewController : UIViewController{
    BOOL recordResults;
    NSString *entryid;
    NSInteger webtype;
    UIButton *button;
    NSInteger path;
    NSString *msgstrg;
    NSInteger deletepath;
    NSInteger optionidentifier;

}



/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;



@property (strong, nonatomic) NSMutableArray *typelistarray;
@property (strong, nonatomic) NSMutableDictionary *typelistdict;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;

@property (strong, nonatomic) IBOutlet UITableView *typetable;

@property (strong, nonatomic) IBOutlet UIView *addview;

@property (strong, nonatomic) IBOutlet UITextField *typetxtfld;
@property (strong, nonatomic) IBOutlet UIButton *cancelbtn;
@property (strong, nonatomic) IBOutlet UINavigationItem *navitem;

@property (strong, nonatomic) IBOutlet UITableViewCell *typecell;

@property (strong, nonatomic) IBOutlet UILabel *typelbl;

- (IBAction)deltebtn:(id)sender;
- (IBAction)addclsebtn:(id)sender;
- (IBAction)editbtn:(id)sender;

- (IBAction)addbtn:(id)sender;
- (IBAction)clsebtn:(id)sender;

- (IBAction)updatebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;

@end
