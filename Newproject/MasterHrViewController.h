//
//  MasterHrViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 09/10/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterHrViewController : UIViewController

/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UITableView *hrtable;
@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;
@property(strong,nonatomic)IBOutlet UITableViewCell *hrtblecell;


@property (strong, nonatomic) IBOutlet UILabel *ssnlabel;
@property (strong, nonatomic) IBOutlet UILabel *firstnamelbl;
@property (strong, nonatomic) IBOutlet UILabel *lastnamelabel;
@property (strong, nonatomic) IBOutlet UILabel *cellphnlbl;
@property (strong, nonatomic) IBOutlet UILabel *skilllbl;
@property (strong, nonatomic) IBOutlet UILabel *craftlbl;

/*IBActions*/
-(IBAction)CloseThisPAge:(id)sender;


@end
