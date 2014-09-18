//
//  TypeofleadViewController.h
//  Newproject
//
//  Created by Riya on 9/18/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TypeofleadViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UITextField *leadtxtfld;
@property (strong, nonatomic) IBOutlet UITableView *leadtypetable;

- (IBAction)clsebtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
- (IBAction)addclsebtn:(id)sender;
- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;

@end
