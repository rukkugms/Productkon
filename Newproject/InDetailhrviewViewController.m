//
//  InDetailhrviewViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 28/10/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "InDetailhrviewViewController.h"


@interface InDetailhrviewViewController ()

@end

@implementation InDetailhrviewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     _empmdl=(Empdetails *)[_detailarray objectAtIndex:0];
    _navitem.title=[NSString stringWithFormat:@"%@ %@-Details",_empmdl.firstname,_empmdl.lastname];
    _adresslbl.text=_empmdl.address;
    _citylbl.text=_empmdl.city;
    _statelbl.text=_empmdl.state;
    _countrylbl.text=_empmdl.country;
    _doblbl.text=_empmdl.dob;
    _phonelbl.text=_empmdl.phone;
    NSString *fullURL =[NSString stringWithFormat:@"http://test.kontract360.com/files/docs/hr/%@",_empmdl.photo]  ;
   
    
    
    NSString *htmlString = @"<html><body><img src='%@' width='965%' height='518%'></body></html>";
    NSString *imageHTML  = [[NSString alloc] initWithFormat:htmlString, fullURL];
    _webview.scalesPageToFit = YES;
    [_webview loadHTMLString:imageHTML baseURL:nil];
    if ([_empmdl.basicplus isEqualToString:@"true"]) {
        
        
        [_basicchecklbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        
    }
    else{
        [_basicchecklbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    }
    _EmrgcyName.text=_empmdl.emergencycontactname;
    _emergencylbl.text=_empmdl.emergencycontact;
    _licencename.text=_empmdl.nameinlicence;
    _licenceno.text=_empmdl.drivinglicenceno;
    _maillbl.text=_empmdl.email;
    _alternatvelbl.text=_empmdl.alternativeno;
    _basicexpry.text=_empmdl.basicplusexp;

    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closedetail:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end