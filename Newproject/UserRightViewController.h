//
//  UserRightViewController.h
//  Newproject
//
//  Created by Riya on 8/21/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserRightViewController : UIViewController



@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *usertable;
@property (strong, nonatomic) IBOutlet UITableViewCell *usercell;

- (IBAction)clsebtn:(id)sender;

@end
