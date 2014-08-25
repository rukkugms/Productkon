//
//  folderrightsViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 17/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "allfolderrights.h"
#import "Rightscheck.h"

@interface folderrightsViewController : UIViewController
{
     BOOL recordResults;
     NSInteger createcheck;
    NSInteger uploadcheck;
    NSInteger dwnlodcheck;
    UIButton *button;
    NSInteger btnindex;
    NSInteger webtype;
    NSString *createstring;
    NSString *upldstring;
    NSString *dwnldstring;

}

@property(strong,nonatomic)allfolderrights *fldrrights;
@property(strong,nonatomic)NSString *soapstring;
@property(strong,nonatomic)IBOutlet UITableViewCell *folderrightscell;
@property(strong,nonatomic)IBOutlet UITableView *folderrighttable;
@property(strong,nonatomic)IBOutlet UIView *titleview;

@property(strong,nonatomic)IBOutlet UIView *editview;

/*outlets in cell*/
@property(strong,nonatomic)IBOutlet UILabel *namelabel;
@property(strong,nonatomic)IBOutlet UIButton *createcheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *upldcheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *dwnldcheckbtn;

-(IBAction)closefolderrightsview:(id)sender;
-(IBAction)editfolderrights:(id)sender;
-(IBAction)closeeditview:(id)sender;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*arrays*/
@property(strong,nonatomic)NSMutableArray *allfolderrightsarray;

/*outlets in editview*/
@property(strong,nonatomic)IBOutlet UILabel *editnamelabel;
@property(strong,nonatomic)IBOutlet UIButton *editcreatecheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *editupldcheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *editdwnldcheckbtn;

-(IBAction)createaction:(id)sender;
-(IBAction)upldaction:(id)sender;
-(IBAction)dwnldaction:(id)sender;
-(IBAction)updatefolderrights:(id)sender;
-(IBAction)cancel:(id)sender;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;


@end
