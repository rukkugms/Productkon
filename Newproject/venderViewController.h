//
//  venderViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 05/03/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "vendermodel.h"
#import "Validation.h"

@protocol myDelegate <NSObject>

-(void)newaction;

@end

@interface venderViewController : UIViewController
{
    NSInteger path;
    BOOL recordResults;
    NSInteger webtype;
    NSInteger optionidentifier;
    UIButton *button;
    NSInteger btnindex;
    NSString *phnnostring;
    //id<myDelegate>delegate;
}
@property(strong,nonatomic)NSString *searchstring;
@property(readwrite)NSInteger moduleid;
@property(nonatomic,weak)id<myDelegate>delegate;
@property(strong,nonatomic)NSString *soapstring;
@property(strong,nonatomic)Validation *val;
@property(strong,nonatomic)NSString *phnnofmtstring;
@property(readwrite)NSInteger itemid;
@property(strong,nonatomic)vendermodel *vmodel;

@property(strong,nonatomic)IBOutlet UITableView *vendelisttable;
@property(strong,nonatomic)IBOutlet UITableViewCell *vendercell;
@property(strong,nonatomic)IBOutlet UIView *tabletitleview;
@property(strong,nonatomic)IBOutlet UIView *venderaddview;
@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;


/*array*/
@property(strong,nonatomic)NSMutableArray *venderlistarray;

/*outlets in cell*/
@property(strong,nonatomic)IBOutlet UILabel *namelabel;
@property(strong,nonatomic)IBOutlet UILabel *addresslabel;
@property(strong,nonatomic)IBOutlet UILabel *phonelabel;;
@property(strong,nonatomic)IBOutlet UILabel *ratelabel;

/*xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlparser;
@property(strong,nonatomic)NSMutableData *webdata;
@property(strong,nonatomic)NSMutableString *soapresults;

/*IBActions*/
-(IBAction)closevendorpage:(id)sender;
-(IBAction)deletevendors:(id)sender;
-(IBAction)addvender:(id)sender;
-(IBAction)closeaddview:(id)sender;
-(IBAction)updatevender:(id)sender;
-(IBAction)editvender:(id)sender;
-(IBAction)cancelvendor:(id)sender;

@property(strong,nonatomic)IBOutlet UITextField *nametextfld;
@property(strong,nonatomic)IBOutlet UITextField *addresstextfld;
@property(strong,nonatomic)IBOutlet UITextField *phonetextfld;;
@property(strong,nonatomic)IBOutlet UITextField *ratetextfld;
@property(strong,nonatomic)IBOutlet UILabel *resultdispaylabel;

@property (strong, nonatomic) IBOutlet UIButton *cancelbtn;

@property(strong,nonatomic)UISearchBar *searchbar;
@end
