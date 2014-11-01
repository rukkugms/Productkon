//
//  SubCatViewController.h
//  Newproject
//
//  Created by Riya on 10/31/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Catergrymdl.h"
#import "CategoryViewController.h"

@interface SubCatViewController : UIViewController{
    
    BOOL recordResults;
    NSString*msgstring,*catid;
    UIButton *button;
    NSInteger Optnidnfr,subtypeid,path,webtype,insrtpath;

    
}


@property(strong,nonatomic)CategoryViewController *CategryVCtrl;
@property (strong, nonatomic)Catergrymdl*categrymdl;
@property (strong, nonatomic)NSMutableArray*categryarray;
@property (strong, nonatomic)NSMutableDictionary*catagrydict;

@property(readwrite)NSInteger fleetid;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*Outlets*/
@property (strong, nonatomic) IBOutlet UITableView *categorytabe;

@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UIButton *updatebtnlbl;

@property (strong, nonatomic) IBOutlet UIButton *categorybtn;

@property (strong, nonatomic) IBOutlet UIView *titleview;

- (IBAction)clsebtn:(id)sender;
- (IBAction)viewclsebtn:(id)sender;

- (IBAction)catgrybtn:(id)sender;

- (IBAction)mastergobtn:(id)sender;

- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;

- (IBAction)updatebtn:(id)sender;

/*cell outlets*/

@property (strong, nonatomic) IBOutlet UITableViewCell *catgrycell;
@property (strong, nonatomic) IBOutlet UILabel *catgrylbl;



@end
