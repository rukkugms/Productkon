//
//  forgetViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 01/08/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface forgetViewController : UIViewController<UITextFieldDelegate>
{
    BOOL recordResults;
    NSString *msgstrg;
}
-(IBAction)closeforgetpage:(id)sender;
-(IBAction)Passwordaction:(id)sender;
-(IBAction)logoutaction:(id)sender;
@property(strong,nonatomic)IBOutlet UIView *passwordview;
@property(strong,nonatomic)IBOutlet UIView *logoutview;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *paswordbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *logoutbtn;
@property(readwrite)NSInteger btnindex;
@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;

-(IBAction)questionpopup:(id)sender;
@property(strong,nonatomic)IBOutlet UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*logoutfromall*/

@property(strong,nonatomic)IBOutlet UITextField *usernametextfield;
@property(strong,nonatomic)IBOutlet UITextField *passwordtextfield;
-(IBAction)logoutfromall:(id)sender;



/*password reset page*/
@property(strong,nonatomic)IBOutlet UITextField *userText;
@property(strong,nonatomic)IBOutlet UITextField *newpswdText;
@property(strong,nonatomic)IBOutlet UITextField *confirmpswdText;
@property(strong,nonatomic)IBOutlet UIButton *qstnbtn;
@property (strong,nonatomic)IBOutlet UITextField *answrText;
-(IBAction)changePassword:(id)sender;
-(IBAction)cancelaction:(id)sender;
@property(strong,nonatomic)NSMutableArray *questionsarray;
@property(strong,nonatomic)NSString *questionstring;
@property(strong,nonatomic)NSMutableDictionary *questionDict;

@end
