//
//  SubtypViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 12/09/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubtypViewController : UIViewController
{
    NSInteger deletepath;
    NSInteger path;
}
-(IBAction)closesubtype:(id)sender;


/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


@property (strong, nonatomic) IBOutlet UITableView *subtypetable;
@property(strong,nonatomic)IBOutlet UITableViewCell *subcell;
@property (strong, nonatomic) IBOutlet UIView *titleview;

@property (strong, nonatomic) IBOutlet UIView *addview;
- (IBAction)updatebtn:(id)sender;
- (IBAction)addclsebtn:(id)sender;
- (IBAction)subtpebtn:(id)sender;
- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;

@property(strong,nonatomic)NSMutableArray *Subtypelistarray;
@property(strong,nonatomic)NSMutableArray *selectedsubtypearray;

@property(strong,nonatomic)IBOutlet UIButton *subtypebutton;
@property(strong,nonatomic)IBOutlet UILabel *subtypelabel;
@end
