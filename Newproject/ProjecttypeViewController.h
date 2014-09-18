//
//  ProjecttypeViewController.h
//  Newproject
//
//  Created by Riya on 9/18/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Craftreqmtmdl.h"

@interface ProjecttypeViewController : UIViewController
{
    BOOL recordResults;

    
}
@property (strong, nonatomic) IBOutlet UITableViewCell *projcttypecell;
@property (strong, nonatomic) IBOutlet UILabel *projecttypelbl;
@property (strong, nonatomic) Craftreqmtmdl *projctreqmdl;

/*Xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*outlets*/
@property (strong, nonatomic) IBOutlet UITextField *prjcttypetxtfld;
@property (strong, nonatomic) IBOutlet UITableView *typetable;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableViewCell *projectcell;

@property (strong, nonatomic) IBOutlet UIView *addview;

- (IBAction)addclsebtn:(id)sender;

- (IBAction)addbtn:(id)sender;
- (IBAction)deltebtn:(id)sender;
- (IBAction)updatebtn:(id)sender;

- (IBAction)clsebtn:(id)sender;


@end
