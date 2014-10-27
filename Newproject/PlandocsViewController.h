//
//  PlandocsViewController.h
//  Newproject
//
//  Created by Riya on 10/27/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlandocsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;

- (IBAction)clsebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UITableViewCell *doccell;
@property (strong, nonatomic) IBOutlet UILabel *docnamelbl;
@property (strong, nonatomic) IBOutlet UIButton *viewbtn;

@property (strong, nonatomic) IBOutlet UITableView *documnttable;
@property (strong, nonatomic)NSMutableArray *documntarray;


@end
