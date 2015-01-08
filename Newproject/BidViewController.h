//
//  BidViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 25/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bidmodel.h"
#import "DisplayBidTableViewController.h"
#import "LeadsViewController.h"
#import "NewCustmrViewController.h"


@interface BidViewController : UIViewController
{
    BOOL recordResults;
    UIButton *bidtablebtn;
    UIButton *button;
    NSInteger btnindex;
     NSInteger selectedcell;
}
@property(readwrite)NSInteger frmplan;
@property(strong,nonatomic)NSString *bidnumbr;
@property(strong,nonatomic)NewCustmrViewController *customerctrl;
@property(strong,nonatomic)LeadsViewController *leadctrl;
@property(strong,nonatomic)Bidmodel *bidmdl;
@property(strong,nonatomic)NSString *searchstring;
@property(strong,nonatomic)DisplayBidTableViewController *Displayctrlr;
@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;
/*IBActions*/
-(IBAction)closebidpage:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *bidtable;
@property (strong, nonatomic) IBOutlet UIView *bidtitleview;
@property (strong, nonatomic) IBOutlet UITableViewCell *bidcell;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
@property (strong, nonatomic)NSMutableArray *bidlistarray;

@property(readwrite)NSInteger openviewindex;
@property(readwrite)NSInteger previousopenviewindex;
@property(strong,nonatomic)IBOutlet UIView *animatedview;
@property(strong,nonatomic)IBOutlet UILabel *bidlabel;

/*labels i cell*/
@property(strong,nonatomic)IBOutlet UILabel *namelabel;
@property(strong,nonatomic)IBOutlet UILabel *statuslabel;
@property(strong,nonatomic)IBOutlet UILabel *amountlabel;
@property(strong,nonatomic)IBOutlet UILabel *bididlabel;
@property (strong, nonatomic) IBOutlet UIButton *disclsebtn;
-(IBAction)selectdisclosure:(id)sender;
@property(strong,nonatomic)IBOutlet UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popOvercontroller;
@property(strong,nonatomic)NSMutableArray *disclosurearray;


@end
