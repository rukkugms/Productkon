//
//  PSitereqmntViewController.h
//  Newproject
//
//  Created by Riya on 7/2/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manpwr.h"
#import "jobsitemodel.h"
#import "Rightscheck.h"
@interface PSitereqmntViewController : UIViewController{
    BOOL recordResults;
    UITableViewCell*    draggedCell;
    UIView*             dropArea;
    id                  draggedData;
    
    BOOL            dragFromSource;     // used for reodering
    NSIndexPath*    pathFromDstTable;
    //NSInteger path;
    NSInteger Deletepath;
      NSInteger Selectedpath;
    NSInteger reqpath;
    NSString*jobnumber;
    NSString*jobid;
    NSInteger webpath;

}
@property(strong,nonatomic)NSString *existstring;
@property(strong,nonatomic)Manpwr *requmdl;
@property(strong,nonatomic)NSMutableArray*requarray;
@property(strong,nonatomic)jobsitemodel*jobmdl;
@property(strong,nonatomic)NSMutableArray*jobarray;
@property(strong,nonatomic)NSMutableArray*jobmdlarray;
@property(strong,nonatomic)NSMutableArray*newjobarray;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;



/*Outlets*/
@property (strong, nonatomic) IBOutlet UIView *dropview;

@property (strong, nonatomic) IBOutlet UITableViewCell *sitecell;
@property (strong, nonatomic) IBOutlet UILabel *codelbl;
@property (strong, nonatomic) IBOutlet UILabel *deslbl;

@property (strong, nonatomic) IBOutlet UIButton *jobsitebtnlbl;

@property (strong, nonatomic) IBOutlet UITableView *requmnttable;
@property (strong, nonatomic) IBOutlet UITableView *jobtble;

@property (strong, nonatomic) IBOutlet UIView *reqtitle;
@property (strong, nonatomic) IBOutlet UIView *jobtitle;
@property (strong, nonatomic) IBOutlet UILabel *jobcodelbl;
@property (strong, nonatomic) IBOutlet UILabel *jobdesclbl;
@property (strong, nonatomic) IBOutlet UILabel *jobdisplaylabel;
@property (strong, nonatomic) IBOutlet UITableViewCell *jobcell;

- (IBAction)deletebtn:(id)sender;
- (IBAction)jobsitebtn:(id)sender;
- (IBAction)clsebtn:(id)sender;
@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;

@end
