//
//  GeneralViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 4/21/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Generalmodel.h"
#import "GdargViewController.h"
#import "DequipViewController.h"
#import "Validation.h"
#import <sqlite3.h>


@protocol newgenralDelgate <NSObject>


-(void)updatedata;

@end

@interface GeneralViewController : UIViewController{
     BOOL recordResults;
     NSInteger txtfldtype;
     NSString *phasestrg;
     NSInteger poptype;
     NSString *jobsequnce;
    NSInteger dragbutnindx;
    NSString *p;
    NSString *msgstrg;
    }
@property(strong,nonatomic)NSString*psitemcode;
@property(nonatomic, weak)id<newgenralDelgate> delegate;
@property (strong, nonatomic) IBOutlet UINavigationItem *navitm;
@property(strong,nonatomic) DequipViewController *deqctrl;
@property(strong,nonatomic) GdargViewController *gdVCtrl;
/*variables*/
@property(strong,nonatomic)Generalmodel *generalmdl;
@property(readwrite) NSInteger  optionidentfr;
@property(strong,nonatomic)NSString *genralid;
@property(strong,nonatomic)NSString *Planid;
@property(strong,nonatomic)NSString *insertedgeneralid;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser     *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData   * webData;


/*popover*/
@property(strong,nonatomic)UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;


/*Arrays*/
@property(strong,nonatomic)NSMutableArray * projectheaderarray;
@property(strong,nonatomic)NSMutableArray * unitarray;
@property(strong,nonatomic)NSMutableArray * autocompletearray;
@property(strong,nonatomic)NSMutableArray * subunitarray;
@property(strong,nonatomic)NSMutableArray * equipmentarray;
@property(strong,nonatomic)NSMutableArray * phasearray;
@property(strong,nonatomic)NSMutableArray * sequencearray;
@property(strong,nonatomic)NSMutableArray * generalarray;

/*dicts*/
@property(strong,nonatomic)NSMutableDictionary * phasedict;
@property(strong,nonatomic)NSMutableDictionary * sequncedict;

/*Outlets*/
@property(strong,nonatomic)UITableView * autotable;
@property(strong,nonatomic)UITableView * autotable1;
@property(strong,nonatomic)UITableView * autotable2;
@property(strong,nonatomic)UITableView * autotable3;
@property(strong,nonatomic)IBOutlet UIScrollView   * scroll;
@property(strong,nonatomic)IBOutlet UITextView     * destextview;
@property (strong, nonatomic) IBOutlet UITextField * unittxtfld;
@property (strong, nonatomic) IBOutlet UITextField * subunittxtfld;
@property (strong, nonatomic) IBOutlet UITextField * equipmnttxtfld;
@property (strong, nonatomic) IBOutlet UITextField * prjcthdrtxtfld;
//@property (strong, nonatomic) IBOutlet UITextField * quantytxtfld;
@property (strong, nonatomic) IBOutlet UIButton    * phasebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton    * projectheaderbtnlbl;

@property (strong, nonatomic) IBOutlet UIButton    * manbtn;
@property (strong, nonatomic) IBOutlet UIButton    * eqmntbtn;
@property (strong, nonatomic) IBOutlet UIButton    * matbtn;

/*Actions*/
- (IBAction)phasebtn:(id)sender;
- (IBAction)projcthdrbtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
- (IBAction)closegeneralpage:(id)sender;
- (IBAction)manpowerbtn:(id)sender;
- (IBAction)equpmntbtn:(id)sender;
- (IBAction)matreialbtn:(id)sender;
/*sqlite*/
@property(strong,nonatomic) NSString *docsDir;
@property(strong,nonatomic) NSArray *dirPaths;
@property(nonatomic,readwrite) sqlite3*newGenarallistDb;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSString *databasePath1;
@property (strong, nonatomic) NSString *databasePath2;
@property (strong, nonatomic) NSString *Availablityresult;
@property(nonatomic,readwrite) sqlite3*phasedb;
@property(nonatomic,readwrite) sqlite3*sequenceDB;
@property(strong,nonatomic)NSString *phaseid;
@property(strong,nonatomic)NSString *phasename;
@property(strong,nonatomic)NSString *sequenceid;
@property(strong,nonatomic)NSString *sequencename;
@property(strong,nonatomic)NSMutableArray *phasesqlitearray;
@property(strong,nonatomic)NSMutableDictionary *sqlitephasedict;
@end
