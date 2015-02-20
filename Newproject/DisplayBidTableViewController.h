//
//  DisplayBidTableViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 25/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reviebidmdl.h"


@interface DisplayBidTableViewController : UIViewController
{
    NSInteger tooltype;
    BOOL recordResults;
     double sum;
     NSInteger totqty;
    NSInteger TotST;
    NSInteger TotOT;
    NSInteger webtype;
    NSInteger btnclick;
}

/*IBActions*/
- (IBAction)colsethispage:(id)sender;
- (IBAction)manpoweraction:(id)sender;
- (IBAction)equipmentaction:(id)sender;
- (IBAction)materialaction:(id)sender;
- (IBAction)otheraction:(id)sender;
- (IBAction)summaryaction:(id)sender;
@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;
@property(strong,nonatomic)NSString *bidid;
@property(strong,nonatomic)NSString *searchstring;
@property(strong,nonatomic)Reviebidmdl *reviewmdl;
/*xmlParser*/
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSXMLParser *xmlparser;
@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;

@property (strong, nonatomic) IBOutlet UILabel *sumdisplaylabel;
@property(strong,nonatomic)IBOutlet UITableView *manpowertable;
@property(strong,nonatomic)IBOutlet UIView *manpowertitle;
@property(strong,nonatomic)IBOutlet UITableViewCell *manpowercell;
@property (strong, nonatomic) IBOutlet UITableView *Othertable;
@property (strong, nonatomic) IBOutlet UIView *Othertitle;
@property(strong,nonatomic)IBOutlet UITableViewCell *othercell;
@property (strong, nonatomic) IBOutlet UITableView *SummaryTable;
@property (strong, nonatomic) IBOutlet UIView *summarytitle;
@property(strong,nonatomic)IBOutlet UITableViewCell *sumcell;
@property (strong, nonatomic) IBOutlet UILabel *qtylabel;
@property (strong, nonatomic) IBOutlet UILabel *stlabel;
@property (strong, nonatomic) IBOutlet UILabel *otlabel;
@property (strong, nonatomic) IBOutlet UILabel *ST;
@property (strong, nonatomic) IBOutlet UILabel *OT;
@property (strong, nonatomic) IBOutlet UILabel *totqtylabel;


@property(strong,nonatomic)IBOutlet UIBarButtonItem *manpwrbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *eqpmntbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *materialbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *otherbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *summarybtn;

/*Labels in Manpowercell*/
@property(strong,nonatomic)IBOutlet UILabel *Mestilabel;
@property(strong,nonatomic)IBOutlet UILabel *Mitemcodelabel;
@property(strong,nonatomic)IBOutlet UILabel *Mdesclabel;
@property(strong,nonatomic)IBOutlet UILabel *Mqtylabel;
@property(strong,nonatomic)IBOutlet UILabel *Mstlabel;
@property(strong,nonatomic)IBOutlet UILabel *Motlabel;
@property(strong,nonatomic)IBOutlet UILabel *Mstratelabel;
@property(strong,nonatomic)IBOutlet UILabel *Motratelabel;
@property(strong,nonatomic)IBOutlet UILabel *Mtotlabel;
@property(strong,nonatomic)IBOutlet UILabel *Mtypelabel;



/*Labels in Othercell*/
@property(strong,nonatomic)IBOutlet UILabel *Oestilabel;
@property(strong,nonatomic)IBOutlet UILabel *Oitemcodelabel;
@property(strong,nonatomic)IBOutlet UILabel *Odesclabel;
@property(strong,nonatomic)IBOutlet UILabel *Oqtylabel;
@property(strong,nonatomic)IBOutlet UILabel *Ototallabel;
@property(strong,nonatomic)IBOutlet UILabel *Otypelabel;

/*Labels in summarycell*/
@property(strong,nonatomic)IBOutlet UILabel *namelabel;
@property(strong,nonatomic)IBOutlet UILabel *costlabel;




/*array & dict */
@property(strong,nonatomic)NSMutableArray *manpowerarray;
@property(strong,nonatomic)NSMutableArray *Equipmentarray;
@property(strong,nonatomic)NSMutableArray *materialarray;
@property(strong,nonatomic)NSMutableArray *Otherarray;
@property(strong,nonatomic)NSMutableArray *summaryarray;
@property(strong,nonatomic)NSMutableArray *totalarray;
@property(strong,nonatomic)NSMutableArray *quantityarray;
@property(strong,nonatomic)NSMutableArray *starray;
@property(strong,nonatomic)NSMutableArray *otarray;


@property(strong,nonatomic)IBOutlet UILabel *otherqtlabel;
@property(strong,nonatomic)IBOutlet UILabel *othertotqtylbl;
@property(strong,nonatomic)IBOutlet UILabel *othercostlabel;
@property(strong,nonatomic)IBOutlet UILabel *othertotcostlabl;
@property(strong,nonatomic)IBOutlet UILabel *sumlabl;

@end
