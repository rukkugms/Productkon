//
//  PMJobViewController.h
//  Newproject
//
//  Created by Riya on 1/7/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMJobViewController : UIViewController{
    UIButton *button;
}

@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *jobtable;
@property (strong, nonatomic) IBOutlet UITableViewCell *jobcell;
@property (strong, nonatomic)NSMutableArray *disclurearray;
@property(strong,nonatomic)UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;

- (IBAction)clsebtn:(id)sender;

/*cell outlets */

@property (strong, nonatomic) IBOutlet UILabel *numbrcell;
@property (strong, nonatomic) IBOutlet UILabel *bidlbl;
@property (strong, nonatomic) IBOutlet UILabel *datelbl;
@property (strong, nonatomic) IBOutlet UILabel *custmrlbl;

@property (strong, nonatomic) IBOutlet UILabel *cntrctlbl;
@property (strong, nonatomic) IBOutlet UILabel *Amtlbl;
@property (strong, nonatomic) IBOutlet UILabel *manhrlbl;
@property (strong, nonatomic) IBOutlet UILabel *eqhrlbl;
@property (strong, nonatomic) IBOutlet UILabel *manpwrlbl;
@property (strong, nonatomic) IBOutlet UILabel *equlbl;
@property (strong, nonatomic) IBOutlet UILabel *matlbl;
@property (strong, nonatomic) IBOutlet UILabel *othrlbl;
@property (strong, nonatomic) IBOutlet UIButton *disclsurbtnlbl;
- (IBAction)disclurebtn:(id)sender;

 
@end
