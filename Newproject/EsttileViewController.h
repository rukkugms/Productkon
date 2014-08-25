//
//  EsttileViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 5/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EstimationViewController.h"
#import "BidViewController.h"
#import "Rightscheck.h"

@interface EsttileViewController : UIViewController
{
    BOOL recordResults;
    NSString *userid;
}

@property(strong,nonatomic)EstimationViewController * EHVctrl;
@property(strong,nonatomic)BidViewController * bidVctrl;


@property (strong, nonatomic) IBOutlet UIView *estimteview;

@property (strong, nonatomic) IBOutlet UIView *bidsview;

- (IBAction)clsebtn:(id)sender;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property(strong,nonatomic)Rightscheck *rights;
@property(readwrite)NSInteger Moduleid;
@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)NSString *result;


@end
