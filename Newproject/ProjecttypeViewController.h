//
//  ProjecttypeViewController.h
//  Newproject
//
//  Created by Riya on 9/18/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjecttypeViewController : UIViewController
- (IBAction)addclsebtn:(id)sender;

- (IBAction)addbtn:(id)sender;
- (IBAction)deltebtn:(id)sender;
- (IBAction)updatebtn:(id)sender;

- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *prjcttypetxtfld;
@property (strong, nonatomic) IBOutlet UITableView *typetable;
@property (strong, nonatomic) IBOutlet UIView *titleview;

@end
