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
    _montharray=[[NSMutableArray alloc]initWithObjects:@"JAN",@"FEB",@"MAR",@"APR",@"MAY",@"JUN",@"JUL",@"AUG",@"SEP",@"OCT",@"NOV",@"DEC",nil];
    _remontharray=[[NSMutableArray alloc]initWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12", nil];
    _remonthdict=[[NSMutableDictionary alloc]initWithObjects:_montharray forKeys:_remontharray];

     self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     _empmdl=(Empdetails *)[_detailarray objectAtIndex:0];
    _navitem.title=[NSString stringWithFormat:@"%@ %@-Details",_empmdl.firstname,_empmdl.lastname];
    _adresslbl.text=_empmdl.address;
    _citylbl.text=_empmdl.city;
    _statelbl.text=_empmdl.state;
    _countrylbl.text=_empmdl.country;
    
    
    
    NSArray*ary=[_empmdl.dob componentsSeparatedByString:@"T"];
    NSString*news=[ary objectAtIndex:0];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *dates = [dateFormat dateFromString:news];
    [dateFormat setDateFormat:@"MM-dd-yyy"];
    NSString *myFormattedDate = [dateFormat stringFromDate:dates];
    _doblbl.text=myFormattedDate;

    //_doblbl.text=[d2 objectAtIndex:0];
    _phonelbl.text=_empmdl.phone;
    NSString *fullURL =[NSString stringWithFormat:@"https://testUSA.kontract360.com/files/docs/hr/%@",_empmdl.photo]  ;
   
    
    
    NSString *htmlString = @"<html><body><img src='%@' width='577%' height='582%'></body></html>";
    NSString *imageHTML  = [[NSString alloc] initWithFormat:htmlString, fullURL];
    _webview.scalesPageToFit = YES;
    [_webview loadHTMLString:imageHTML baseURL:nil];
    if ([_empmdl.basicplus isEqualToString:@"true"]) {
        
        
        [_basicchecklbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        
    }
    else{
        [_basicchecklbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    }
    if ([_empmdl.gender isEqualToString:@"true"]) {
        
        
       
     _gendersegment.selectedSegmentIndex=0;
    }
    else{
         _gendersegment.selectedSegmentIndex=1;
    }

    _EmrgcyName.text=_empmdl.emergencycontactname;
    _emergencylbl.text=_empmdl.emergencycontact;
    _licencename.text=_empmdl.nameinlicence;
    _licenceno.text=_empmdl.drivinglicenceno;
    _maillbl.text=_empmdl.email;
    _alternatvelbl.text=_empmdl.alternativeno;
  
    NSArray*Array=[[NSArray alloc]init];
    Array=[_empmdl.basicplusexp componentsSeparatedByString:@"T"];
    
    NSArray*arry1=[[NSArray alloc]init];
    arry1=[[Array objectAtIndex:0]componentsSeparatedByString:@"-" ];
    NSString *yr=[arry1 objectAtIndex:0];
    
    NSString *mon=[_remonthdict objectForKey:[arry1 objectAtIndex:1]];
    _basicexpry.text=[NSString stringWithFormat:@"%@ %@",mon,yr];
    _licencestate.text=_empmdl.stateissuinglicence;
    _firstlbl.text=_empmdl.firstname;
    _lastlbl.text=_empmdl.gender;
    _ssnlbl.text=_empmdl.ssn;
    _ziplbl.text=_empmdl.zip;
    _twicnolbl.text=_empmdl.twiccardno;
    NSLog(@"%@",_empmdl.twiccardno);
    
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
