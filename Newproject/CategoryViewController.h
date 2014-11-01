//
//  CategoryViewController.h
//  Newproject
//
//  Created by Riya on 10/31/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Catergrymdl.h"

@interface CategoryViewController : UIViewController{
    
     BOOL recordResults;
    NSString*msgstring;
    UIButton *button;
    NSInteger Optnidnfr,subtypeid,path,webtype;
    
}


@property (strong, nonatomic)Catergrymdl*categrymdl;
@property (strong, nonatomic)NSMutableArray*categryarray;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


/*outlets*/
@property (strong, nonatomic) IBOutlet UIButton *addclsebtn;
@property (strong, nonatomic) IBOutlet UIButton *catgrypopbtn;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *categrytable;
@property (strong, nonatomic) IBOutlet UIView *addview;

/*Actions*/
- (IBAction)addclsebt:(id)sender;

- (IBAction)clsebtn:(id)sender;
- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
- (IBAction)updatebtn:(id)sender;


- (IBAction)catgrybtn:(id)sender;


@property (strong, nonatomic) IBOutlet UITextField *categrytxtfld;

/* Cell outlets*/
@property (strong, nonatomic) IBOutlet UITableViewCell *catgrycell;
@property (strong, nonatomic) IBOutlet UILabel *catgrylbl;
- (IBAction)editbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *updatebtnlbl;



@end
