//
//  ServiceViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Servicemdl.h"
#import "Validation.h"
#import "SerialViewController.h"
#import "Rightscheck.h"

@interface ServiceViewController : UIViewController<UITextFieldDelegate>

{
    NSInteger optionidentifier;
    BOOL recordResults;
    NSInteger path;
    NSInteger webtype;
    UIButton *button;
     NSInteger btnindex;
    NSString *msgstr;
    UIButton *disbtn;
    NSInteger selectedcell;

    
}
@property(strong,nonatomic)SerialViewController *jobseqctrl;
@property(strong,nonatomic)Servicemdl *servmdl;
@property(strong,nonatomic)Validation *val;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UITableView *servicesTable;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UITableViewCell *servicecell;
@property(strong,nonatomic)IBOutlet UIView *addserview;
@property(strong,nonatomic)IBOutlet UINavigationItem *navabar;
@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;
@property (strong, nonatomic)NSString*searchstring;
/*cell outlets*/
@property (strong, nonatomic) IBOutlet UILabel *servicelabel;
@property (strong, nonatomic) IBOutlet UIButton *editbtn;
@property (strong, nonatomic) IBOutlet UIButton *cancelbtn;
@property(strong,nonatomic)IBOutlet UILabel *abbrvtnlabel;
@property(strong,nonatomic)IBOutlet UILabel *resultdispalylabel;

/*IBActions*/
-(IBAction)closetheservicesview:(id)sender;
-(IBAction)Addservices:(id)sender;
-(IBAction)editservices:(id)sender;
-(IBAction)closeaddview:(id)sender;
-(IBAction)deleteservices:(id)sender;

/*actions in addview*/
-(IBAction)updateservice:(id)sender;
-(IBAction)cancelservice:(id)sender;

/*outlets in addview*/
@property(strong,nonatomic)IBOutlet UITextField *servicetextfld;
@property(strong,nonatomic)IBOutlet UITextField *abbreviatintextfld;

/*arrays*/
@property(strong,nonatomic)NSMutableArray *servicelistarray;

@property(readwrite)NSInteger openviewindex;
@property(readwrite)NSInteger previousopenviewindex;
@property(strong,nonatomic)IBOutlet UIView *animatedview;
@property(strong,nonatomic)IBOutlet UILabel *commentlabel;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;

@property(strong,nonatomic)UIPopoverController *popovercontroller;
@property(strong,nonatomic)IBOutlet UITableView *popovertableview;
@property(strong,nonatomic)IBOutlet UIButton *disclosurebtn;
-(IBAction)selectdisclosure:(id)sender;
@property(strong,nonatomic)NSMutableArray *disclosurearray;
@property(strong,nonatomic)IBOutlet UIButton *updatebtn;


@end
