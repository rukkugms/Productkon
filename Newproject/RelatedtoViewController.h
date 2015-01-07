//
//  RelatedtoViewController.h
//  Newproject
//
//  Created by Riya on 6/26/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RelatedtoMdl.h"
@interface RelatedtoViewController : UIViewController{
      BOOL  recordResults;
   NSString* empname;
     NSString* othrid;
    NSInteger path;
}
@property (strong, nonatomic)NSString*issueid;
@property (strong, nonatomic)NSString*newid;
@property (strong, nonatomic)NSString*itemcode;
@property (strong, nonatomic)NSString*jobnumber;
@property (strong, nonatomic)NSString*type;
@property (strong, nonatomic)NSString*status;
@property (strong, nonatomic)RelatedtoMdl*relatedmdl;
@property (strong, nonatomic)NSMutableArray*relatedarray;
@property (strong, nonatomic)NSMutableArray*Addarray;
@property (strong, nonatomic)NSMutableDictionary*manpwrdict;
@property(strong,nonatomic)NSMutableDictionary*Othersdict;
/* Outlets*/
@property (strong, nonatomic) IBOutlet UITableView *relatdtotable;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableViewCell *relatedcell;
@property (strong, nonatomic) IBOutlet UILabel *namelbl;
@property (strong, nonatomic) IBOutlet UINavigationItem *addnavitem;
@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UIButton *namebtnlbl;
@property (strong, nonatomic) IBOutlet UILabel *labeltitle;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;
@property (strong, nonatomic) IBOutlet UIButton *updatebtnlbl;



/*Button*/
- (IBAction)editbtn:(id)sender;
- (IBAction)addbtn:(id)sender;
- (IBAction)savebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
- (IBAction)namebtn:(id)sender;
- (IBAction)addclsebtn:(id)sender;
- (IBAction)clsebtn:(id)sender;
- (IBAction)deletebtn:(id)sender;


@end
