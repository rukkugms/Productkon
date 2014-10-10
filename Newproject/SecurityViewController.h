//
//  SecurityViewController.h
//  Newproject
//
//  Created by Riya on 8/20/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecurityViewController : UIViewController{
    BOOL recordResults;
    NSString*entryid;
    NSString*userid;
    NSInteger path;
    NSInteger answertype;
}

@property(readwrite)NSInteger moduleid;
@property (strong, nonatomic)NSMutableArray*qustnarray;
@property (strong, nonatomic)NSMutableDictionary*qustndict;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;

@property(strong,nonatomic)UITableView *popOverTableView;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*UIOutlets*/

@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UITextField *answertxtfld;
@property (strong, nonatomic) IBOutlet UIButton *qustnbtnlbl;



- (IBAction)qustnbtn:(id)sender;
- (IBAction)savebtn:(id)sender;
- (IBAction)removebtn:(id)sender;
- (IBAction)closebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *savebtnlbl;

@end
