//
//  GdargViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 4/22/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "GdargViewController.h"

@interface GdargViewController ()

@end

@implementation GdargViewController
#define kCellHeight 44
#define kNavBarHeight 30

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
    // Do any additional setup after loading the view from its nib.
 
    _scroll.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _scroll.frame=CGRectMake(0, 0, 768,955);
    [_scroll setContentSize:CGSizeMake(768,1024)];
    
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanning:)];
    panGesture.delegate=self;
    [self.manpwrdragview addGestureRecognizer:panGesture];
    UIPanGestureRecognizer* panGesture1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(materialhandlePanning:)];
    panGesture1.delegate=self;
    [self.matraltouchview addGestureRecognizer:panGesture1];
   // [_generaltable setContentOffset:CGPointMake(0, 700)];
    
    _mantabletitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _genraltabletitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _matrltabletitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _resurcetabletitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];


    _manpwrtable.layer.borderWidth=2.0f;
    _manpwrtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _generaltable.layer.borderWidth=2.0f;
    _generaltable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _materialtable.layer.borderWidth=2.0f;
    _materialtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _resourcegenraltable.layer.borderWidth=2.0f;
    _resourcegenraltable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
  _editview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
      _materleditview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
      _manpowerview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _materialview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     _manpwrdragview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     _matraltouchview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];

    
   
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self Selectcrew];
    switch (_dragbtnindx) {
        case 1:
            [self setupSourceTableWithFrame:CGRectMake(0, 0, 257,742)];
            [self setupDestinationTableWithFrame:CGRectMake(0, 0, 433, 742)];
            break;
        case 2:
            [self materialsetupSourceTableWithFrame:CGRectMake(0, 0, 257,460)];
            [self materialsetupDestinationTableWithFrame:CGRectMake(0, 0, 397, 460)];
            

            break;

        default:
            break;
    }
  
    
  //  [self selectmanpowercrew];
    [self GeneralDetailselect];
    [self MatrialCrewSetupSelect];
   [self GeneralResourceMaterialDetailselect];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-web services

-(void)Selectcrew{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<PlanCrewSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</PlanCrewSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
   //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/PlanCrewSelect" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}


-(void)selectmanpowercrew{
        
        recordResults = FALSE;
        NSString *soapMessage;
        
        
        soapMessage = [NSString stringWithFormat:
                       
                       @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                       "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                       
                       
                       "<soap:Body>\n"
                       
                       "<CrewSetUpSelect xmlns=\"http://ios.kontract360.com/\">\n"
                       
                       "</CrewSetUpSelect>\n"
                       "</soap:Body>\n"
                       "</soap:Envelope>\n"];
        NSLog(@"soapmsg%@",soapMessage);
        
        
        // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
          NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
        
        NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
        
        NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
        
        [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
        [theRequest addValue: @"http://ios.kontract360.com/CrewSetUpSelect" forHTTPHeaderField:@"Soapaction"];
        
        [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
        [theRequest setHTTPMethod:@"POST"];
        [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        if( theConnection )
        {
            _webData = [NSMutableData data];
        }
        else
        {
            ////NSLog(@"theConnection is NULL");
        }
        
    }

-(void)GeneralDetailselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralDetailselect xmlns=\"http://ios.kontract360.com/\">\n"
                    "<MainGeneralId>%d</MainGeneralId>\n"
                   "</GeneralDetailselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_generalid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralDetailselect" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)ManHoursSelect
{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ManHoursSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainGeneralId>%d</MainGeneralId>\n"
                   "</ManHoursSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_generalid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ManHoursSelect" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)GeneralDetailInsert{
    hourtype=1;
    recordResults = FALSE;
       NSString *houres=@"1";
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralDetailInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainGeneralId>%d</MainGeneralId>\n"
                   "<SubGeneralId>%d</SubGeneralId>\n"
                   "<Number>%d</Number>\n"
                   "<Houres>%f</Houres>\n"
                   "</GeneralDetailInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_generalid,[[_crewdict objectForKey:[_manpowerarray objectAtIndex:path]] integerValue],1,[houres floatValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralDetailInsert" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)GeneralDetailDelete{
    hourtype=1;
     Gmandrgmdl *gendtdlmdl=(Gmandrgmdl *)[_generaldetailarray objectAtIndex:deletepath];
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralDetailDelete xmlns=\"http://ios.kontract360.com/\">\n"
                   "<Id>%d</Id>\n"
                   "</GeneralDetailDelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[gendtdlmdl.manid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralDetailDelete" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)GeneralDetailUpdate{
    hourtype=1;
    recordResults = FALSE;
  //  Manpwr*manmdl1=(Manpwr *)[_manpowerarray objectAtIndex:path];
       NSString *soapMessage;
       Gmandrgmdl *gendtdlmdl=(Gmandrgmdl *)[_generaldetailarray objectAtIndex:editpath];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralDetailUpdate xmlns=\"http://ios.kontract360.com/\">\n"
                   "<Id>%d</Id>\n"
                   "<MainGeneralId>%d</MainGeneralId>\n"
                   "<SubGeneralId>%d</SubGeneralId>\n"
                   "<Number>%d</Number>\n"
                   "<Houres>%f</Houres>\n"
                   "</GeneralDetailUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[gendtdlmdl.manid integerValue],_generalid,[gendtdlmdl.itemdescptn integerValue],[_numbertxtfld.text integerValue],[_hourstxtfld.text floatValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralDetailUpdate" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)MatrialCrewSetupSelect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<planMaterailCrewSetUpSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</planMaterailCrewSetUpSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/planMaterailCrewSetUpSelect" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)GeneralResourceMaterialDetailselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralResourceMaterialDetailselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainGeneralId>%d</MainGeneralId>\n"
                   "</GeneralResourceMaterialDetailselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_generalid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralResourceMaterialDetailselect" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)GeneralResourceDetailInsert{
    
    recordResults = FALSE;
    NSString *soapMessage;
   // NSString*rate=@"0";
    NSString*hours=@"0";

    
   // Manpwr*manmdl1=(Manpwr *)[_materialarray objectAtIndex:materialpath];
   // Metgenmdl *matmdl=(Metgenmdl*)[_resourcearray ob]
    _matrlmdl=[[Metgenmdl alloc]init];

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralResourceDetailInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainGeneralId>%d</MainGeneralId>\n"
                   "<SubGeneralCrewId>%d</SubGeneralCrewId>\n"
                   "<GroupDescription>%@</GroupDescription>\n"
                   "<Houres>%f</Houres>\n"
                   "<Rate>%@</Rate>\n"
                   "<Quantity>%d</Quantity>\n"
                   "</GeneralResourceDetailInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_generalid,[[_matrlcrewdict objectForKey:[_materialarray objectAtIndex:materialpath]]integerValue],@"Material Group",[hours floatValue],@"Hourly Rate",1];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralResourceDetailInsert" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}

-(void)GeneralResourceDetailUpdate{
    
    recordResults = FALSE;
    NSString *soapMessage;

    NSString*hours=@"0";

    //Manpwr*manmdl1=(Manpwr *)[_materialarray objectAtIndex:materialpath];
       Metgenmdl * matmdl2=(Metgenmdl *)[_resourcearray objectAtIndex:meteditpath];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralResourceDetailUpdate xmlns=\"http://ios.kontract360.com/\">\n"
                    "<Id>%d</Id>\n"
                   "<MainGeneralId>%d</MainGeneralId>\n"
                   "<SubGeneralCrewId>%d</SubGeneralCrewId>\n"
                   "<GroupDescription>%@</GroupDescription>\n"
                   "<Houres>%f</Houres>\n"
                   "<Rate>%@</Rate>\n"
                   "<Quantity>%d</Quantity>\n"
                    "</GeneralResourceDetailUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[matmdl2.matgenid integerValue],_generalid,[matmdl2.SubGeneralResourceId integerValue],@"Material Group",[hours floatValue],@"Hourly Rate",[_quantitytxtfld.text integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralResourceDetailUpdate" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)GeneralGroupDetailDelete{
    Metgenmdl * matmdl2=(Metgenmdl *)[_resourcearray objectAtIndex:metdeletepath];

    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralGroupDetailDelete xmlns=\"http://ios.kontract360.com/\">\n"
                   "<Id>%d</Id>\n"
                   "</GeneralGroupDetailDelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[matmdl2.matgenid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralGroupDetailDelete" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)GeneralQuantityUpdate{
  //  Metgenmdl * matmdl2=(Metgenmdl *)[_resourcearray objectAtIndex:metdeletepath];
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralQuantityUpdate xmlns=\"http://ios.kontract360.com/\">\n"
                    "<mainId>%d</mainId>\n"
                   "</GeneralQuantityUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_generalid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralQuantityUpdate" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}

#pragma mark - Connection
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[_webData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   	[_webData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Check Your Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [Alert show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %d", [_webData length]);
	NSString *theXML = [[NSString alloc] initWithBytes: [_webData mutableBytes] length:[_webData length] encoding:NSUTF8StringEncoding];
	NSLog(@"xml===== %@",theXML);
	
	
	if( _xmlParser )
	{
		
	}
	
	_xmlParser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlParser setDelegate:(id)self];
	[_xmlParser setShouldResolveExternalEntities: YES];
	[_xmlParser parse];
    
    
  
    switch (_dragbtnindx) {
        case 1:
            [_manpwrtable reloadData];
            
            [_generaltable reloadData];
            break;
        case 2:
           
            
            [_materialtable reloadData];
            [_resourcegenraltable reloadData];
            
            break;
            
        default:
            break;
    }

    

}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"SelectGeneralManpowerResponse"])
    {
      
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"EntryId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"PlanItemCode"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"PlanDescription"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"GeneralDetailselectResponse"])
    {_generaldetailarray=[[NSMutableArray alloc]init];
             if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"CrewName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"SubgeneralId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Number"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"Houres"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"result"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"GeneralResourceMaterialDetailselectResponse"])
    {
        _resourcearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"MaterialId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SubGeneralCrewId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ResourceMaterialCrewName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DetailGroupDescription"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    if([elementName isEqualToString:@"MatQuantity"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"PlanCrewSelectResponse"])
    {  _manpowerarray=[[NSMutableArray alloc]init];
        _crewdict=[[NSMutableDictionary alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"crewid"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"crewname"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"CrewSetUpSelectResponse"])
    { _crewnamearray=[[NSMutableArray alloc]init];
        _crewdict=[[NSMutableDictionary alloc]init];
        _revcrewdict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CrewId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Crewname"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"planMaterailCrewSetUpSelectResponse"])
    {  _materialarray=[[NSMutableArray alloc]init];
        _matrlcrewdict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"MaterialCrewId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"MaterialCrewName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
   


}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults )
        
	{
        [_soapResults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"EntryId"])
    {
        
        _manpwr1=[[Manpwr alloc]init];
        recordResults = FALSE;
        _manpwr1.entryid=[_soapResults integerValue];
        
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"PlanItemCode"])
    {
     
        recordResults = FALSE;
        _manpwr1.itemcode=_soapResults;
     
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PlanDescription"])
    {
        recordResults = FALSE;
         _manpwr1.itemdescptn=_soapResults;
      //  [_manpowerarray addObject:_manpwr1];
       
        _soapResults = nil;
        
        }
    if([elementName isEqualToString:@"Id"])
    {

        _gmdl=[[Gmandrgmdl alloc]init];
        recordResults = FALSE;
        
        _gmdl.manid=_soapResults;
        _soapResults = nil;
        
    }

    if([elementName isEqualToString:@"CrewName"])
    {
        
         recordResults = FALSE;
        _gmdl.itemcode=_soapResults;

        _soapResults = nil;

        
    }
        if([elementName isEqualToString:@"SubgeneralId"])
    {
        
        recordResults = FALSE;
          _gmdl.itemdescptn=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"Number"])
    {
        
        recordResults = FALSE;
        _gmdl.numbers=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Houres"])
    {
        
        recordResults = FALSE;
         _gmdl.hours=_soapResults;
        [_generaldetailarray addObject:_gmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        
        recordResults = FALSE;
         _MPdgUpdate.enabled=YES;
        _MTdgupdate.enabled=YES;
        
         if ([_soapResults isEqualToString:@"Successfully Inserted"]||[_soapResults isEqualToString:@"delete"]) {
             
          
                 [self GeneralQuantityUpdate];
                 [self ManHoursSelect];

             
               [self GeneralDetailselect];
             
         }
        else if ([_soapResults isEqualToString:@"Sucessfully Updated"]) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Updated Successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
           
            _manpwrtxtfld.text=@"";
            _descptntxtfld.text=@"";
            _numbertxtfld.text=@"";
            _hourstxtfld.text=@"";
              [self GeneralQuantityUpdate];
             [self GeneralDetailselect];
            
            
        }
       else if ([_soapResults isEqualToString:@"Inserted Successfully"]||[_soapResults isEqualToString:@"deleted"]) {
            [self GeneralResourceMaterialDetailselect];
            
        }
       else if ([_soapResults isEqualToString:@"Cannot Edit as Man Hours are used in Equipment"]){
           UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
           [alert show];
           [self GeneralDetailselect];
           
       }
       else if ([_soapResults isEqualToString:@"Cannot Delete as Man Hours are used in Equipment"]){
           UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
           [alert show];
           [self GeneralDetailselect];
           
       }

       else if ([_soapResults isEqualToString:@"Updated Successfully"]) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
          
            _codetxtfld.text=@"";
            _matrldesctxtfld.text=@"";
            _quantitytxtfld.text=@"";
             [self GeneralResourceMaterialDetailselect];
            
        }
        else if ([_soapResults isEqualToString:@"Crew Already Exists in this work. Change the Quantity or hours of existing Crew"]) {
            _existstring=@"Crew Already Exists in this work. Change the Quantity or hours of existing Crew";
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
             [self GeneralDetailselect];
            
        }
        else if ([_soapResults isEqualToString:@"Group Already Exists in this work. Change the Quantity  of existing Group"]) {
            _existstring=@"Group Already Exists in this work. Change the Quantity  of existing Group";
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            [self GeneralResourceMaterialDetailselect];
            
        }


       
        
              _soapResults = nil;
    }
    
        if([elementName isEqualToString:@"MaterialId"])
    {
        
        recordResults = FALSE;
             _matrlmdl=[[Metgenmdl alloc]init];
        _matrlmdl.matgenid=_soapResults;
       
             _soapResults = nil;
    }
    if([elementName isEqualToString:@"SubGeneralCrewId"])
    {
        
      recordResults = FALSE;
         _matrlmdl.SubGeneralResourceId=_soapResults;
         _soapResults = nil;
    }

    if([elementName isEqualToString:@"ResourceMaterialCrewName"])
    {
        
        recordResults = FALSE;
   
        _matrlmdl.itemcode=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"DetailGroupDescription"])
    {
        
        recordResults = FALSE;
        _matrlmdl.itemdesc=_soapResults;

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Name"])
    {
        
        recordResults = FALSE;
        _soapResults = nil;
    }

    
    
    if([elementName isEqualToString:@"MatQuantity"])
    {
        
        recordResults = FALSE;
        _matrlmdl.itmqunty=_soapResults;
        [_resourcearray addObject:_matrlmdl];

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"crewid"])
    {
        recordResults = FALSE;
        crewid=_soapResults;
        
        _soapResults = nil;}

    if([elementName isEqualToString:@"crewname"])
    {
        recordResults = FALSE;

       [_manpowerarray addObject:_soapResults];
      [_crewdict setObject:crewid forKey:_soapResults];
     _soapResults = nil;}

    if([elementName isEqualToString:@"CrewId"])
    {
        recordResults =FALSE;
        crewid=_soapResults;
        _soapResults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"Crewname"])
    {
        
        recordResults = FALSE;
        [_crewnamearray addObject:_soapResults];
        [_crewdict setObject:crewid forKey:_soapResults];
        [_revcrewdict setObject:_soapResults forKey:crewid];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"MaterialCrewId"])
    {
        recordResults =FALSE;
        crewid=_soapResults;
        _soapResults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"MaterialCrewName"])
    {
        
        recordResults = FALSE;
        [_materialarray addObject:_soapResults];
        [_matrlcrewdict setObject:crewid forKey:_soapResults];
   
        _soapResults = nil;
    }


}

#pragma mark-tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_manpwrtable){
        return [_manpowerarray count];
    }
    if (tableView==_generaltable){
        return [_generaldetailarray count];
    }
    if (tableView==_materialtable){
        return [_materialarray count];
    }
    if (tableView==_resourcegenraltable){
        return [_resourcearray count];
        //return 2;
    }

    return YES;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_manpwrtable) {
            [[NSBundle mainBundle]loadNibNamed:@"FirstMdragcell" owner:self options:nil];
            cell=_firstcell;
            
        }
        if (tableView==_generaltable) {
            [[NSBundle mainBundle]loadNibNamed:@"SecondMdragcell" owner:self options:nil];
            
            cell=_secondcell;
        }
        if (tableView==_materialtable) {
//            [[NSBundle mainBundle]loadNibNamed:@"Gnmatlfirstcell" owner:self options:nil];
//            
//            cell=_materialcell;
            [[NSBundle mainBundle]loadNibNamed:@"FirstMdragcell" owner:self options:nil];
            cell=_firstcell;

        }
        if (tableView==_resourcegenraltable) {
            [[NSBundle mainBundle]loadNibNamed:@"MatrlGnsecondcell" owner:self options:nil];
            
            cell=_resurcecell;
        }


        
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        
    }
    
    if (tableView==_manpwrtable) {
        _manpwr1lbl=(UILabel *)[cell viewWithTag:1];
             _manpwr1lbl.text=[_manpowerarray objectAtIndex:indexPath.row]     ;
        
//        Manpwr *manpwr=(Manpwr *)[_manpowerarray objectAtIndex:indexPath.row];
//        _manpwr1lbl=(UILabel *)[cell viewWithTag:1];
//        _manpwr1lbl.text=manpwr.itemcode;
//        _mandesc1lbl=(UILabel *)[cell viewWithTag:2];
//        _mandesc1lbl.text=manpwr.itemdescptn;
        
    }
    
    if (tableView==_generaltable) {
        
        Gmandrgmdl *gendtdlmdl=(Gmandrgmdl *)[_generaldetailarray objectAtIndex:indexPath.row];
       
        _manpwr2lbl=(UILabel *)[cell viewWithTag:1];
        _manpwr2lbl.text=gendtdlmdl.itemcode;
        _mandesptn2lbl=(UILabel *)[cell viewWithTag:2];
        _mandesptn2lbl.text=gendtdlmdl.itemdescptn;
        _numberlbl=(UILabel *)[cell viewWithTag:3];
        _numberlbl.text=gendtdlmdl.numbers;
        _hurslbl=(UILabel *)[cell viewWithTag:4];
        _hurslbl.text=[NSString stringWithFormat:@"%.2f",[gendtdlmdl.hours doubleValue]];

        }
    if (tableView==_materialtable){
        
         //  Manpwr *manpwr1=(Manpwr *)[_materialarray objectAtIndex:indexPath.row];
//        _codelbl1=(UILabel *)[cell viewWithTag:1];
//        _codelbl1.text=manpwr1.itemcode;
//        _matrldesc1lbl=(UILabel *)[cell viewWithTag:2];
//        _matrldesc1lbl.text=manpwr1.itemdescptn;
        
        _manpwr1lbl=(UILabel *)[cell viewWithTag:1];
        _manpwr1lbl.text=[_materialarray objectAtIndex:indexPath.row]     ;


        
        
    }
    if (tableView==_resourcegenraltable){
        
        Metgenmdl *matmdl1=(Metgenmdl *)[_resourcearray objectAtIndex:indexPath.row];
        _code2lbl2=(UILabel *)[cell viewWithTag:1];
        _code2lbl2.text=matmdl1.itemcode;
        _matrldesc1lbl=(UILabel *)[cell viewWithTag:2];
        _matrldesc1lbl.text=matmdl1.itemdesc;
        _quantylbl=(UILabel *)[cell viewWithTag:3];
        _quantylbl.text=matmdl1.itmqunty;

        
        
    }

    return cell;
}

#pragma mark-tableview Delegate
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        if (tableView==_generaltable) {
            
        deletepath=indexPath.row;
        
        [self GeneralDetailDelete];
        [_generaldetailarray removeObject:indexPath];
        }
        
        
        if (tableView==_resourcegenraltable) {
            
            metdeletepath=indexPath.row;
            
            [self GeneralGroupDetailDelete];
            [_resourcearray removeObject:indexPath];
        }

        
        
    }
    
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
           if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
        }else
        {
            
            //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
            
            
        }
    }


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_manpwrtable)
        
    {
        return self.editing ;
    }
    if(tableView==_materialtable)
        
    {
        return self.editing ;
    }
    
    return YES;
    
}

#pragma mark -MANPOWER DRAG &DROP
#pragma mark UIGestureRecognizer

- (void)handlePanning:(UIPanGestureRecognizer *)gestureRecognizer
{
    switch ([gestureRecognizer state]) {
        case UIGestureRecognizerStateBegan:
            [self startDragging:gestureRecognizer];
            break;
        case UIGestureRecognizerStateChanged:
            [self doDrag:gestureRecognizer];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
            [self stopDragging:gestureRecognizer];
            break;
        default:
            break;
    }
}
#pragma mark -
#pragma mark Helper methods for initialization

- (void)setupSourceTableWithFrame:(CGRect)frame
{
    
    [self.manpwrdragview addSubview:_manpwrtable];
}

- (void)setupDestinationTableWithFrame:(CGRect)frame
{
    
    CGRect dropAreaFrame = frame;
    dropAreaFrame.origin.y = kNavBarHeight;
    dropAreaFrame.size.height -= kNavBarHeight;
    
    mandropArea = [[UIView alloc] initWithFrame:CGRectMake(315, 40, 448, 742)];
    [mandropArea setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f]];
    // [mandropArea setBackgroundColor:[UIColor redColor]];
    [self.manpwrdragview addSubview:mandropArea];
    
    CGRect contentFrame = dropAreaFrame;
    contentFrame.origin = CGPointMake(0, 0);
    
    UILabel* dropAreaLabel = [[UILabel alloc] initWithFrame:contentFrame];
    dropAreaLabel.backgroundColor = [UIColor clearColor];
    dropAreaLabel.font = [UIFont boldSystemFontOfSize:12];
    dropAreaLabel.textAlignment = NSTextAlignmentCenter;
    dropAreaLabel.textColor = [UIColor whiteColor];
    // dropAreaLabel.text = @"Drop items here...";
    [mandropArea addSubview:dropAreaLabel];
    
    [mandropArea addSubview:_generaltable
     ];
}

- (void)initDraggedCellWithCell:(UITableViewCell*)cell AtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_manpwrtable indexPathForRowAtPoint:point];
    NSLog(@"ind%d",indexPath.row);
    //UITableViewCell* cell = [_subtypetable cellForRowAtIndexPath:indexPath];
    // get rid of old cell, if it wasn't disposed already
    if(mandraggedCell != nil)
    {
        [mandraggedCell removeFromSuperview];
        // [draggedCell release];
        mandraggedCell = nil;
    }
    CGRect frame;
    if(point.y>=489){
        
        frame= CGRectMake(point.x, 250, cell.frame.size.width-5, cell.frame.size.height-10);
    }
    else{
        frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
    }

   // CGRect frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
   
    mandraggedCell = [[UITableViewCell alloc] init];
    mandraggedCell.selectionStyle = UITableViewCellSelectionStyleGray;
   // Manpwr*manmdl1=(Manpwr *)[_manpowerarray objectAtIndex:indexPath.row];
    //mandraggedCell.textLabel.text =manmdl1.itemcode;
     mandraggedCell.textLabel.text=[_manpowerarray objectAtIndex:indexPath.row];
    mandraggedCell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    mandraggedCell.textLabel.textColor = cell.textLabel.textColor;
    mandraggedCell.highlighted = YES;
    mandraggedCell.frame = frame;
    mandraggedCell.alpha = 0.8;
    
    [self.manpwrdragview addSubview:mandraggedCell];
}


#pragma mark Helper methods for dragging

- (void)startDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    
        CGPoint pointInSrc = [gestureRecognizer locationInView:_manpwrtable];
        CGPoint pointInDst = [gestureRecognizer locationInView:_generaltable];
        
        if([_manpwrtable pointInside:pointInSrc withEvent:nil])
        {
            [self startDraggingFromSrcAtPoint:pointInSrc];
            mandragFromSource = YES;
        }
        else if([_generaltable pointInside:pointInDst withEvent:nil])
        {
            //[self startDraggingFromDstAtPoint:pointInDst];
            mandragFromSource = NO;
        }
    }



- (void)startDraggingFromSrcAtPoint:(CGPoint)point
{
      _MPdgUpdate.enabled=YES;
    
    NSIndexPath* indexPath = [_manpwrtable indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_manpwrtable cellForRowAtIndexPath:indexPath];
    
    if(cell != nil)
    {
        CGPoint origin = cell.frame.origin;
        origin.x += _manpwrtable.frame.origin.x;
        origin.y += _manpwrtable.frame.origin.y;
        
        [self initDraggedCellWithCell:cell AtPoint:origin];
        cell.highlighted = NO;
        
        if(mandraggedData != nil)
        {
            //[draggedData release];
           mandraggedData = nil;
        }
        
       path=indexPath.row;
        
//        Manpwr*manmdl1=(Manpwr *)[_manpowerarray objectAtIndex:indexPath.row];
//        
//        mandraggedData = manmdl1.itemcode;
        
        mandraggedData = [_manpowerarray objectAtIndex:indexPath.row];
    }
    
}

- (void)startDraggingFromDstAtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_generaltable indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_generaltable cellForRowAtIndexPath:indexPath];
    if(cell != nil)
    {
        CGPoint origin = cell.frame.origin;
        origin.x += mandropArea.frame.origin.x;
        origin.y += mandropArea.frame.origin.y;
        
        [self initDraggedCellWithCell:cell AtPoint:origin];
        cell.highlighted = NO;
        
        if(mandraggedData != nil)
        {
            //[draggedData release];
            mandraggedData = nil;
        }
        Manpwr*manmdl1=(Manpwr *)[_manpowerarray objectAtIndex:indexPath.row];
        mandraggedData = manmdl1.itemcode;
        
        // remove old cell
        [_generaldetailarray removeObjectAtIndex:indexPath.row];
        [_generaltable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        manpathFromDstTable = indexPath;
        
        [UIView animateWithDuration:0.2 animations:^
         {
             CGRect frame = _generaltable.frame;
             //frame.size.height = kCellHeight * [dstData count];
             _generaltable
             
             .frame = frame;
         }];
        
    }
}

- (void)doDrag:(UIPanGestureRecognizer *)gestureRecognizer
{
    if(mandraggedCell != nil && mandraggedData != nil)
    {
        CGPoint translation = [gestureRecognizer translationInView:[mandraggedCell superview]];
        [mandraggedCell setCenter:CGPointMake([mandraggedCell center].x + translation.x,
                                           [mandraggedCell center].y + translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:[mandraggedCell superview]];
    }
}

- (void)stopDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    if(mandraggedCell != nil && mandraggedData != nil)
    {
        
        //NSLog(@"%d",[gestureRecognizer state]);
        //NSLog(@"%hhd",[dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil]);
        
        
        if([gestureRecognizer state] == UIGestureRecognizerStateEnded
           && [mandropArea pointInside:[gestureRecognizer locationInView:mandropArea] withEvent:nil])
        {
            NSIndexPath* indexPath = [_generaltable indexPathForRowAtPoint:[gestureRecognizer locationInView:_generaltable]];
            if(indexPath != nil)
            {
                Gmandrgmdl *gendtdlmdl=(Gmandrgmdl *)[_generaldetailarray objectAtIndex:indexPath.row];
                gendtdlmdl.itemcode=mandraggedData;
               [_generaldetailarray addObject:gendtdlmdl];
               
                
               

                //[_generaldetailarray insertObject:mandraggedData atIndex:indexPath.row];
                [_generaltable insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
                [self GeneralDetailInsert];
           
            }
            else
            {
                if ([_generaldetailarray count]==0) {
                    Gmandrgmdl *gendtdlmdl=[[Gmandrgmdl alloc]init];
                    gendtdlmdl.itemcode=mandraggedData;
                    [_generaldetailarray addObject:gendtdlmdl];
                    
                }
                else{

                NSLog(@"index%d",indexPath.row);
                Gmandrgmdl *gendtdlmdl=(Gmandrgmdl *)[_generaldetailarray objectAtIndex:indexPath.row];
                gendtdlmdl.itemcode=mandraggedData;
                [_generaldetailarray addObject:gendtdlmdl];
                }
                
                
                [self GeneralDetailInsert];
                
            }
        }
        else if(!mandragFromSource && manpathFromDstTable != nil)
        {
            // insert cell back where it came from
            [_generaldetailarray insertObject:mandraggedData atIndex:manpathFromDstTable.row];
            [_generaltable insertRowsAtIndexPaths:[NSArray arrayWithObject:manpathFromDstTable] withRowAnimation:UITableViewRowAnimationMiddle];
            
            //[pathFromDstTable release];
            manpathFromDstTable = nil;
        }
        if ([_existstring isEqualToString:@"Crew Already Exists in this work. Change the Quantity or hours of existing Crew"]) {
            
            [mandraggedCell removeFromSuperview];
            //[draggedCell release];
            mandraggedCell = nil;
            
            //[draggedData release];
            mandraggedData = nil;
        }
        else
        {
            
        
        
        [UIView animateWithDuration:0.3 animations:^
         {
             CGRect frame = _generaltable.frame;
             //frame.size.height = kCellHeight * [_Maintablescflddetailsarray count];
             _generaltable.frame = frame;
         }];
        
        [mandraggedCell removeFromSuperview];
        //[draggedCell release];
        mandraggedCell = nil;
        
        //[draggedData release];
        mandraggedData = nil;
        }
    }
}

#pragma mark -MATERIAL DRAG &DROP
#pragma mark UIGestureRecognizer

- (void)materialhandlePanning:(UIPanGestureRecognizer *)gestureRecognizer
{
    switch ([gestureRecognizer state]) {
        case UIGestureRecognizerStateBegan:
            [self materialstartDragging:gestureRecognizer];
            break;
        case UIGestureRecognizerStateChanged:
            [self materialdoDrag:gestureRecognizer];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
            [self materialstopDragging:gestureRecognizer];
            break;
        default:
            break;
    }
}
#pragma mark -
#pragma mark Helper methods for initialization

- (void)materialsetupSourceTableWithFrame:(CGRect)frame
{
    
    [self.matraltouchview addSubview:_materialtable];
}

- (void)materialsetupDestinationTableWithFrame:(CGRect)frame
{
    
    CGRect matraldropAreaFrame = frame;
    matraldropAreaFrame.origin.y = kNavBarHeight;
    matraldropAreaFrame.size.height -= kNavBarHeight;
    
    materldropArea = [[UIView alloc] initWithFrame:CGRectMake(340, 50, 397, 700)];
      // materldropArea = [[UIView alloc] initWithFrame:CGRectMake(315, 40, 448, 742)];
   [materldropArea setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f]];
    
    [self.matraltouchview addSubview:materldropArea];
    
    CGRect contentFrame = matraldropAreaFrame;
    contentFrame.origin = CGPointMake(0, 0);
    
    UILabel* dropAreaLabel = [[UILabel alloc] initWithFrame:contentFrame];
    dropAreaLabel.backgroundColor = [UIColor clearColor];
    dropAreaLabel.font = [UIFont boldSystemFontOfSize:12];
    dropAreaLabel.textAlignment = NSTextAlignmentCenter;
    dropAreaLabel.textColor = [UIColor whiteColor];
    // dropAreaLabel.text = @"Drop items here...";
    [materldropArea addSubview:dropAreaLabel];
    
    [materldropArea addSubview:_resourcegenraltable];
}

- (void)materialinitDraggedCellWithCell:(UITableViewCell*)cell AtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_materialtable indexPathForRowAtPoint:point];
    NSLog(@"ind%d",indexPath.row);
    //UITableViewCell* cell = [_subtypetable cellForRowAtIndexPath:indexPath];
    // get rid of old cell, if it wasn't disposed already
    if(materldraggedCell != nil)
    {
        [materldraggedCell removeFromSuperview];
        // [draggedCell release];
        materldraggedCell = nil;
    }
    CGRect frame;
    if(point.y>=489){
        
        frame= CGRectMake(point.x, 250, cell.frame.size.width-5, cell.frame.size.height-10);
    }
    else{
        frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
    }

    //CGRect frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
    
    materldraggedCell = [[UITableViewCell alloc] init];
    materldraggedCell.selectionStyle = UITableViewCellSelectionStyleGray;
    //Manpwr*manmdl1=(Manpwr *)[_materialarray objectAtIndex:indexPath.row];
    materldraggedCell.textLabel.text =[_materialarray objectAtIndex:indexPath.row];
    materldraggedCell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    materldraggedCell.textLabel.textColor = cell.textLabel.textColor;
    materldraggedCell.highlighted = YES;
    materldraggedCell.frame = frame;
    materldraggedCell.alpha = 0.8;
    
    [self.matraltouchview addSubview:materldraggedCell];
}


#pragma mark Helper methods for dragging

- (void)materialstartDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    
    CGPoint pointInSrc = [gestureRecognizer locationInView:_materialtable];
    CGPoint pointInDst = [gestureRecognizer locationInView:_resourcegenraltable];
    
    if([_materialtable pointInside:pointInSrc withEvent:nil])
    {
        [self materialstartDraggingFromSrcAtPoint:pointInSrc];
        materldragFromSource = YES;
    }
    else if([_resourcegenraltable pointInside:pointInDst withEvent:nil])
    {
        //[self materialstartDraggingFromDstAtPoint:pointInDst];
        materldragFromSource = NO;
    }
}



- (void)materialstartDraggingFromSrcAtPoint:(CGPoint)point
{
    
  
    _MTdgupdate.enabled=YES;
    NSIndexPath* indexPath = [_materialtable indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_materialtable cellForRowAtIndexPath:indexPath];
    
    if(cell != nil)
    {
        CGPoint origin = cell.frame.origin;
        origin.x += _materialtable.frame.origin.x;
        origin.y += _materialtable.frame.origin.y;
        
        [self materialinitDraggedCellWithCell:cell AtPoint:origin];
        cell.highlighted = NO;
        
        if(materldraggedData != nil)
        {
            //[draggedData release];
            materldraggedData = nil;
        }
        
        materialpath=indexPath.row;
        
       // Manpwr*manmdl1=(Manpwr *)[_materialarray objectAtIndex:indexPath.row];
        
        materldraggedData = [_materialarray objectAtIndex:materialpath];
    }
    
}

- (void)materialstartDraggingFromDstAtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_resourcegenraltable indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_resourcegenraltable cellForRowAtIndexPath:indexPath];
    if(cell != nil)
    {
        CGPoint origin = cell.frame.origin;
        origin.x += materldropArea.frame.origin.x;
        origin.y += materldropArea.frame.origin.y;
        
        [self materialinitDraggedCellWithCell:cell AtPoint:origin];
        cell.highlighted = NO;
        
        if(materldraggedData != nil)
        {
            //[draggedData release];
            materldraggedData = nil;
        }
        //Manpwr*manmdl1=(Manpwr *)[_materialarray objectAtIndex:indexPath.row];
        materldraggedData = [_materialarray objectAtIndex:indexPath.row];

        
        // remove old cell
        [_resourcearray removeObjectAtIndex:indexPath.row];
        [_resourcegenraltable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        materlpathFromDstTable = indexPath;
        
        [UIView animateWithDuration:0.2 animations:^
         {
             CGRect frame = _generaltable.frame;
             //frame.size.height = kCellHeight * [dstData count];
             _generaltable
             
             .frame = frame;
         }];
        
    }
}

- (void)materialdoDrag:(UIPanGestureRecognizer *)gestureRecognizer
{
    if(materldraggedCell != nil && materldraggedData != nil)
    {
        CGPoint translation = [gestureRecognizer translationInView:[materldraggedCell superview]];
        [materldraggedCell setCenter:CGPointMake([materldraggedCell center].x + translation.x,
                                              [materldraggedCell center].y + translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:[materldraggedCell superview]];
    }
}

- (void)materialstopDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    _existstring=@"";
    if(materldraggedCell != nil && materldraggedData != nil)
    {
        
        //NSLog(@"%d",[gestureRecognizer state]);
        //NSLog(@"%hhd",[dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil]);
        
        
        if([gestureRecognizer state] == UIGestureRecognizerStateEnded
           && [materldropArea pointInside:[gestureRecognizer locationInView:materldropArea] withEvent:nil])
        {
            NSIndexPath* indexPath = [_resourcegenraltable indexPathForRowAtPoint:[gestureRecognizer locationInView:_resourcegenraltable]];
            if(indexPath != nil)
            {
                Metgenmdl *matmdl1=(Metgenmdl *)[_resourcearray objectAtIndex:indexPath.row];
                matmdl1.itemcode=materldraggedData;
                [_resourcearray addObject:matmdl1];
                //[_resourcearray insertObject:mandraggedData atIndex:indexPath.row];
                [_resourcegenraltable insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
                [self GeneralResourceDetailInsert];
            }
            else
            {
                NSLog(@"index%d",indexPath.row);
              //  Gmandrgmdl *gendtdlmdl=(Gmandrgmdl *)[_generaldetailarray objectAtIndex:indexPath.row];
                //gendtdlmdl.itemcode=materldraggedData;
                //[_generaldetailarray addObject:gendtdlmdl];
                
                // Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:indexPath.row];
                // crewmdl1.manpower=draggedData;
                //   [_crewmembersarray addObject:crewmdl1];
                
                if ([_resourcearray count]==0) {
                    Metgenmdl *matmdl1=[[Metgenmdl alloc]init];
                    matmdl1.itemcode=materldraggedData;
                    [_resourcearray addObject:matmdl1];
                    
                }
                else{
                
                Metgenmdl *matmdl1=(Metgenmdl *)[_resourcearray objectAtIndex:indexPath.row];
                matmdl1.itemcode=materldraggedData;
                [_resourcearray addObject:matmdl1];
                }
                [self GeneralResourceDetailInsert];
            }
        }
        else if(!materldragFromSource && materlpathFromDstTable != nil)
        {
            // insert cell back where it came from
            [_resourcearray insertObject:materldraggedData atIndex:materlpathFromDstTable.row];
            [_resourcegenraltable insertRowsAtIndexPaths:[NSArray arrayWithObject:materlpathFromDstTable] withRowAnimation:UITableViewRowAnimationMiddle];
            
            //[pathFromDstTable release];
            materlpathFromDstTable = nil;
        }
         if ([_existstring isEqualToString:@"Group Already Exists in this work. Change the Quantity  of existing Group"]) {
             [materldraggedCell removeFromSuperview];
             //[draggedCell release];
             materldraggedCell = nil;
             
             //[draggedData release];
             materldraggedData = nil;
         }
        else
        {
        
        [UIView animateWithDuration:0.3 animations:^
         {
             CGRect frame = _resourcegenraltable.frame;
             //frame.size.height = kCellHeight * [_Maintablescflddetailsarray count];
             _resourcegenraltable.frame = frame;
         }];
        
        [materldraggedCell removeFromSuperview];
        //[draggedCell release];
        materldraggedCell = nil;
        
        //[draggedData release];
        materldraggedData = nil;
        }
    }
}

#pragma mark-Button
- (IBAction)clsbtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)deletebtn:(id)sender {

    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_generaltable setEditing:NO animated:NO];
        [_generaltable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_generaltable setEditing:YES animated:YES];
        [_generaltable reloadData];
        
        
        
        
    }

}

- (IBAction)editclsebtn:(id)sender {
    
    
    _editview.hidden=YES;
    
   }

- (IBAction)updatebtn:(id)sender {
    Validation *val=[[Validation alloc]init];
    int value2=[val isNumeric:_numbertxtfld.text];
    int value1=[val isNumeric:_hourstxtfld.text];
    if (value2==0) {
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert1 show];
        
    }
   else if (value1==0) {
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Hours" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert1 show];
        
    }


    else
    {
        _MPdgUpdate.enabled=NO;
    [self GeneralDetailUpdate];
    }
    
}

- (IBAction)editbtn:(id)sender {
    
     _MPdgUpdate.enabled=YES;
      _editview.hidden=NO;
       button = (UIButton *)sender;
       CGPoint center= button.center;
        CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.generaltable];
        NSIndexPath *textFieldIndexPath = [self.generaltable indexPathForRowAtPoint:rootViewPoint];
       NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
       editpath=textFieldIndexPath.row;
        Gmandrgmdl *gendtdlmdl=(Gmandrgmdl *)[_generaldetailarray objectAtIndex:textFieldIndexPath.row];
       _manpwrtxtfld.text=gendtdlmdl.itemcode;
        _descptntxtfld.text=gendtdlmdl.itemdescptn;
       _numbertxtfld.text=gendtdlmdl.numbers;
       _hourstxtfld.text=[NSString stringWithFormat:@"%.2f",[gendtdlmdl.hours doubleValue]];;
    
    
    
}

- (IBAction)matrlupdatebtn:(id)sender {
    Validation *val=[[Validation alloc]init];
    int value2=[val isNumeric:_quantitytxtfld.text];
    if (value2==0) {
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Quantity" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert1 show];
        
    }
    else
    {
        _MTdgupdate.enabled=NO;
    [self GeneralResourceDetailUpdate];
    }
}

- (IBAction)editmatrlbtn:(id)sender {
    _MTdgupdate.enabled=YES;
    _materleditview.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.resourcegenraltable];
    NSIndexPath *textFieldIndexPath = [self.resourcegenraltable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    meteditpath=textFieldIndexPath.row;
    Metgenmdl *matmdl1=(Metgenmdl *)[_resourcearray objectAtIndex:textFieldIndexPath.row];

    _codetxtfld.text=matmdl1.itemcode;
    _matrldesctxtfld.text=matmdl1.itemdesc;
    _quantitytxtfld.text=matmdl1.itmqunty;
  

}

- (IBAction)mateditbtn:(id)sender {
    _materleditview.hidden=YES;

}

- (IBAction)metdeltebtn:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_resourcegenraltable setEditing:NO animated:NO];
        [_resourcegenraltable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_resourcegenraltable setEditing:YES animated:YES];
        [_resourcegenraltable reloadData];
        
        
        
        
    }

}
#pragma mark-Textfield Delegate


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    Validation*val=[[Validation alloc]init];
    if (textField==_numbertxtfld) {
        int value2=[val isNumeric:_numbertxtfld.text];
        if (value2==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }
    if (textField==_quantitytxtfld) {
        int value2=[val isNumeric:_quantitytxtfld.text];
        if (value2==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Quantity" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }

    if (textField==_hourstxtfld) {
        int value2=[val isNumeric:_hourstxtfld.text];
        if (value2==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Hours" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }
    return YES;
}
#pragma mark-AlertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([alertView.message isEqualToString:@"Invalid Number"]) {
        
        Gmandrgmdl *gendtdlmdl=(Gmandrgmdl *)[_generaldetailarray objectAtIndex:editpath];
        
        _numbertxtfld.text=gendtdlmdl.numbers;
       
        
        
    }
    if ([alertView.message isEqualToString:@"Invalid Hours"]) {
        
        Gmandrgmdl *gendtdlmdl=(Gmandrgmdl *)[_generaldetailarray objectAtIndex:editpath];
        
        
        _hourstxtfld.text=gendtdlmdl.hours;
        
    }
    if ([alertView.message isEqualToString:@"Invalid Quantity"]) {
        Metgenmdl *matmdl1=(Metgenmdl *)[_resourcearray objectAtIndex:meteditpath];
        
        
        _quantitytxtfld.text=matmdl1.itmqunty;
        
    }
    if ([alertView.message isEqualToString:@"Updated Successfully"])
    {
        _materleditview.hidden=YES;
        _editview.hidden=YES;

    }

    if ([alertView.message isEqualToString:@"Sucessfully Updated"])
        
    {
        _editview.hidden=YES;
    }

}

@end
