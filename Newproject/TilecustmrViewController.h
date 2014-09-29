//
//  TilecustmrViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/11/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewCustmrViewController.h"
#import "ContractViewController.h"
#import "MarkupViewController.h"
#import "BillingViewController.h"
#import "Rightscheck.h"

@interface TilecustmrViewController : UIViewController
{
    BOOL recordResults;
    NSString *userid;
}

- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UINavigationBar *navgtnbar;
@property (strong, nonatomic) NewCustmrViewController *custmrVCtrl;
@property (strong, nonatomic)ContractViewController *cntrctVCtrl;
@property (strong, nonatomic)MarkupViewController *markVCtrl;
@property (strong, nonatomic)BillingViewController *billgVCtrl;
@property (strong, nonatomic) IBOutlet UIView *custmrview;
@property (strong, nonatomic) IBOutlet UIView *cntrctview;
@property (strong, nonatomic) IBOutlet UIView *markupview;
@property (strong, nonatomic) IBOutlet UIView *billingview;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property(strong,nonatomic)Rightscheck *rights;
@property(readwrite)NSInteger Moduleid;
@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)NSString *result;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *Custmgmtindictr;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *Contmgmtindictr;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *mrkupindictr;


@end
