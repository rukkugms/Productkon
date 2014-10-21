//
//  InprocessViewController.h
//  Newproject
//
//  Created by Riya on 10/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InprocessViewController : UIViewController{
    
  BOOL   recordResults;




}
/*xmlparse*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
/*IBoutlets*/
@property (strong, nonatomic) IBOutlet UITableViewCell *processcell;
@property (strong, nonatomic) IBOutlet UITableView *processtable;
@property (strong, nonatomic) IBOutlet UIView *titleview;

/*Actions*/
- (IBAction)clsebtn:(id)sender;

@end
