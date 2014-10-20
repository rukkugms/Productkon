//
//  SitevisitViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "SitevisitViewController.h"

@interface SitevisitViewController ()

@end

@implementation SitevisitViewController

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
    _gernalview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _rateview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _docmntview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _accessview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _productionrateview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _equipmentview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _jobsiteview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _safetyview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _neweqmntview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _workschdleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _meetingview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _biddersview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _weatherview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _notesview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];

    // Do any additional setup after loading the view from its nib.
    
    [[UIToolbar appearance] setTintColor:[UIColor redColor]];
    _prdunratetble.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _prdunratetble.layer.borderWidth=3.0;
    _documenttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _documenttable.layer.borderWidth=3.0;
    [[self.equipmnttxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.equipmnttxtview layer] setBorderWidth:2];
    [[self.equipmnttxtview layer] setCornerRadius:10];
    _tabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _jobsitetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _jobsitetable.layer.borderWidth=3.0;
    _jobsitetitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _safteytitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _safetytableview.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _safetytableview.layer.borderWidth=3.0;
    _neweqmnttitile.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _newequipmenttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _newequipmenttable.layer.borderWidth=3.0;
    _worktitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _workscdletable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _workscdletable.layer.borderWidth=3.0;
    _meetingtitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _meetingtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _meetingtable.layer.borderWidth=3.0;
    _bidderstitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _bidderstable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _bidderstable.layer.borderWidth=3.0;

    _weathertitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _weathertable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _weathertable.layer.borderWidth=3.0;

    _notestitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _notestable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _notestable.layer.borderWidth=3.0;
    
    _cmpxtyofwrk=[[NSMutableArray alloc]initWithObjects:@"Easy",@"Moderate",@"Difficult", nil];
    
    _gernalbtnlbl.tintColor=[UIColor whiteColor];
    [[self.facilitytxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.facilitytxtview layer] setBorderWidth:2];
    [[self.facilitytxtview layer] setCornerRadius:10];
    [[self.scpeofwrktxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.scpeofwrktxtview layer] setBorderWidth:2];
    [[self.scpeofwrktxtview layer] setCornerRadius:10];
    [[self.accblitytxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.accblitytxtview layer] setBorderWidth:2];
    [[self.accblitytxtview layer] setCornerRadius:10];
     _esatitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _accebiltytitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _ESAtble.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _ESAtble.layer.borderWidth=3.0;
    _accebilitytable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _accebilitytable.layer.borderWidth=3.0;
    
    [[self.Accibltylblview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.Accibltylblview layer] setBorderWidth:2];
    [[self.Accibltylblview layer] setCornerRadius:10];
    
  _mtghandtitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    
}

-(void)toreloadatable{
    switch (_newrecordVCtrl.reloadtype) {
        case 1:
             [self SitevisitSelectproductionrate];
            break;
        case 2:
          [self SitevisitSelectjobsitereq];
            break;
        case 3:
             [self Selectsafetyrulessitevisit];
         
            break;
        case 4:
            [self SitevisitSelectequipment];
            break;
        case 5:
           [self  SitevisitSelectWorkSchedule];
            break;
        case 6:
           [self SitevisitSelectMeetingNotes];
            break;
        case 7:
           [self SitevisitSelectOtherBidders];
            break;
        case 8:
            [self SitevisitSelectWeatherOutlook];
            break;
        case 9:
           [self SitevisitSelectNotes];
            break;
        case 10:
            [self SitevisitSelectNotes];
            break;
        case 11:
            [self SitevisitSelectMeetingNotes];
            break;

        default:
            break;
    }
    
   



}
-(void)toreloaddrawings{
    switch (_drwVCtrl.tabtype) {
        case 1:
            [self EstmPlanDrawingSelect];
            break;
        case 2:
             [self PlanDrawingSelect];
            break;
     

            
        default:
            break;
    }
    
    
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     _companynametxtfld.text=_companyname;
      _navgitem.title=[NSString stringWithFormat:@"Site Visit-%@",_companyid];
    [self ListSiteVisitGeneral];
    [self SelectAllItemType];
    [self SitevisitSelectproductionrate];
    
    _gernalbtnlbl.tintColor=[UIColor whiteColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];
    

    
    
    _gernalview.hidden=NO;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark-webservice
-(void)ListSiteVisitGeneral{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ListSiteVisitGeneral xmlns=\"http://test.kontract360.com/\">\n"
                     "<planid>%@</planid>\n"
                   "</ListSiteVisitGeneral>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/ListSiteVisitGeneral" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SaveSiteVisitGeneral{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SaveSiteVisitGeneral xmlns=\"http://test.kontract360.com/\">\n"
                   "<CompanyName>%@</CompanyName>\n"
                   "<Location>%@</Location>\n"
                   "<Zip>%@</Zip>\n"
                   "<Complexity>%@</Complexity>\n"
                   "<FacilityDetails>%@</FacilityDetails>\n"
                   "<ScopeofWork>%@</ScopeofWork>\n"
                   "<Accessibility>%@</Accessibility>\n"
                   "<Equipment>%@</Equipment>\n"
                   "<PlanId>%@</PlanId>\n"
                   "</SaveSiteVisitGeneral>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companynametxtfld.text,_loctntxtfld.text,_ziptxtfld.text,_complextyofwrkbtnlbl.titleLabel.text,_facilitytxtview.text,_scpeofwrktxtview.text,_Accibltylblview.text,_equipmnttxtview.text,_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SaveSiteVisitGeneral" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SaveSiteVisitAccessibility{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SaveSiteVisitAccessibility xmlns=\"http://test.kontract360.com/\">\n"
                   "<Accessibility>%@</Accessibility>\n"
                   "<PlanId>%@</PlanId>\n"
                   "</SaveSiteVisitAccessibility>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_Accibltylblview.text,_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SaveSiteVisitAccessibility" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SaveSiteVisitEquipments{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SaveSiteVisitEquipments xmlns=\"http://test.kontract360.com/\">\n"
                   "<equipment>%@</equipment>\n"
                   "<PlanId>%@</PlanId>\n"
                   "</SaveSiteVisitEquipments>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_equipmnttxtview.text,_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SaveSiteVisitEquipments" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitSelectproductionrate{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitSelectproductionrate xmlns=\"http://ios.kontract360.com/\">\n"
                   "<PlanId>%@</PlanId>\n"
                   "</SitevisitSelectproductionrate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   // NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SitevisitSelectproductionrate" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitSelectjobsitereq{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitSelectjobsitereq xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</SitevisitSelectjobsitereq>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SitevisitSelectjobsitereq" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)Selectsafetyrulessitevisit{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Selectsafetyrulessitevisit xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</Selectsafetyrulessitevisit>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Selectsafetyrulessitevisit" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllItemType{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllItemType xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "</SelectAllItemType>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SelectAllItemType" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SitevisitSelectequipment{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitSelectequipment xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</SitevisitSelectequipment>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SitevisitSelectequipment" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitSelectWorkSchedule{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitSelectWorkSchedule xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</SitevisitSelectWorkSchedule>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SitevisitSelectWorkSchedule" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitSelectMeetingNotes{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitSelectMeetingNotes xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</SitevisitSelectMeetingNotes>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SitevisitSelectMeetingNotes" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitSelectOtherBidders{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitSelectOtherBidders xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</SitevisitSelectOtherBidders>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SitevisitSelectOtherBidders" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitSelectWeatherOutlook{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitSelectWeatherOutlook xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</SitevisitSelectWeatherOutlook>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SitevisitSelectWeatherOutlook" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitSelectNotes{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitSelectNotes xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</SitevisitSelectNotes>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SitevisitSelectNotes" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Sitevisitdeleteproductionrates{
    recordResults = FALSE;
    SitevistMdl *sitemdl1=(SitevistMdl *)[_productionratearray objectAtIndex:path];

    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Sitevisitdeleteproductionrates xmlns=\"http://ios.kontract360.com/\">\n"
                   "<PlanId>%@</PlanId>\n"
                   "<EntryId>%d</EntryId>\n"
                   "</Sitevisitdeleteproductionrates>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid,[sitemdl1.prentryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   // NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Sitevisitdeleteproductionrates" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitdeleteEquipments{
    recordResults = FALSE;
    SitevistMdl *sitemdl1=(SitevistMdl *)[_Equpmntarray objectAtIndex:path];
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitdeleteEquipments xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "<entryid>%d</entryid>\n"
                   "</SitevisitdeleteEquipments>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid,[sitemdl1.equpentryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SitevisitdeleteEquipments" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)Sitevisitdeletejobsiterequirements{
    recordResults = FALSE;
    SitevistMdl *sitemdl1=(SitevistMdl *)[_jobsiteArray objectAtIndex:path];
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Sitevisitdeletejobsiterequirements xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "<entryid>%d</entryid>\n"
                   "</Sitevisitdeletejobsiterequirements>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid,[sitemdl1.jobentryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Sitevisitdeletejobsiterequirements" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Sitevisitdeletemeetingnotes{
    recordResults = FALSE;
    SitevistMdl *sitemdl1=(SitevistMdl *)[_meetgarray objectAtIndex:path];
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Sitevisitdeletemeetingnotes xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "<entryid>%d</entryid>\n"
                   "</Sitevisitdeletemeetingnotes>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid,[sitemdl1.meetgentryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Sitevisitdeletemeetingnotes" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)Sitevisitdeletenotes{
    recordResults = FALSE;
    SitevistMdl *sitemdl1=(SitevistMdl *)[_notearray objectAtIndex:path];
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Sitevisitdeletenotes xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "<entryid>%d</entryid>\n"
                   "</Sitevisitdeletenotes>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid,[sitemdl1.notesentryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Sitevisitdeletenotes" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Sitevisitdeleteotherbidders{
    recordResults = FALSE;
    SitevistMdl *sitemdl1=(SitevistMdl *)[_bidderarray objectAtIndex:path];
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Sitevisitdeleteotherbidders xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "<entryid>%d</entryid>\n"
                   "</Sitevisitdeleteotherbidders>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid,[sitemdl1.bidderentryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Sitevisitdeleteotherbidders" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Sitevisitdeletesafetyrules{
    recordResults = FALSE;
    SitevistMdl *sitemdl1=(SitevistMdl *)[_saftyArray objectAtIndex:path];
    NSLog(@"sitem%@",sitemdl1.Saftruleentry);
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Sitevisitdeletesafetyrules xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "<entryid>%d</entryid>\n"
                   "</Sitevisitdeletesafetyrules>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid,[sitemdl1.Saftruleentry integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Sitevisitdeletesafetyrules" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)Sitevisitdeleteweatheroutlook{
    recordResults = FALSE;
    SitevistMdl *sitemdl1=(SitevistMdl *)[_weatherarray objectAtIndex:path];
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Sitevisitdeleteweatheroutlook xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "<entryid>%d</entryid>\n"
                   "</Sitevisitdeleteweatheroutlook>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid,[sitemdl1.weatherentryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Sitevisitdeleteweatheroutlook" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)Sitevisitdeleteworkschedule{
    recordResults = FALSE;
    SitevistMdl *sitemdl1=(SitevistMdl *)[_wrkschdlearray objectAtIndex:path];
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Sitevisitdeleteworkschedule xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "<entryid>%d</entryid>\n"
                   "</Sitevisitdeleteworkschedule>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid,[sitemdl1.wrkschdlentryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Sitevisitdeleteworkschedule" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)PlanDrawingSelect{
    webtype=1;
    recordResults = FALSE;
   // SitevistMdl *sitemdl1=(SitevistMdl *)[_wrkschdlearray objectAtIndex:path];
    NSString * trimmestrg=[_companyid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<PlanDrawingSelect xmlns=\"http://test.kontract360.com/\">\n"
                   "<Location>%@</Location>\n"
                   "<PlanId>%@</PlanId>\n"
                   "</PlanDrawingSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",@"Accessibility",trimmestrg];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/PlanDrawingSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EstmPlanDrawingSelect{
    webtype=2;

    recordResults = FALSE;
    // SitevistMdl *sitemdl1=(SitevistMdl *)[_wrkschdlearray objectAtIndex:path];
    NSString * trimmestrg=[_companyid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<PlanDrawingSelect xmlns=\"http://test.kontract360.com/\">\n"
                   "<Location>%@</Location>\n"
                   "<PlanId>%@</PlanId>\n"
                   "</PlanDrawingSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",@"Equipment",trimmestrg];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/PlanDrawingSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)MeetingPlanDrawingSelect{
    webtype=3;
    
    recordResults = FALSE;
    // SitevistMdl *sitemdl1=(SitevistMdl *)[_wrkschdlearray objectAtIndex:path];
    NSString * trimmestrg=[_companyid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<PlanDrawingSelect xmlns=\"http://test.kontract360.com/\">\n"
                   "<Location>%@</Location>\n"
                   "<PlanId>%@</PlanId>\n"
                   "</PlanDrawingSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",@"Meeting",trimmestrg];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/PlanDrawingSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)NotesPlanDrawingSelect{
    webtype=4;
    
    recordResults = FALSE;
    // SitevistMdl *sitemdl1=(SitevistMdl *)[_wrkschdlearray objectAtIndex:path];
    NSString * trimmestrg=[_companyid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<PlanDrawingSelect xmlns=\"http://test.kontract360.com/\">\n"
                   "<Location>%@</Location>\n"
                   "<PlanId>%@</PlanId>\n"
                   "</PlanDrawingSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",@"Notes",trimmestrg];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/PlanDrawingSelect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)FetchImage{
    recordResults = FALSE;
    // SitevistMdl *sitemdl1=(SitevistMdl *)[_wrkschdlearray objectAtIndex:path];
  //  NSString * trimmestrg=[[_filenamearray objectAtIndex:fetchindex] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *soapMessage;
    NSString * plantrimmestrg=[_companyid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

   // NSArray *newarray=[[_filenamearray objectAtIndex:fetchindex] componentsSeparatedByString:@"."];
    NSString *fullURL =[NSString stringWithFormat:@"%@-%@-%@",plantrimmestrg,@"Equipment",[_filenamearray objectAtIndex:fetchindex]];
//  NSString *fullURL =[NSString stringWithFormat:@"Folder/Root/Drawings/%@-%@-%@",plantrimmestrg,@"Equipment",[newarray objectAtIndex:0]];
    
          soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FetchImage xmlns=\"http://test.kontract360.com/\">\n"
                   "<filename>%@</filename>\n"
                    "</FetchImage>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",fullURL];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/FetchImage" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)AccessFetchImage{
    recordResults = FALSE;
  
    NSString *soapMessage;
    NSString * plantrimmestrg=[_companyid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *fullURL =[NSString stringWithFormat:@"%@-%@-%@",plantrimmestrg,@"Accessibility",[_filenamearray objectAtIndex:fetchindex]];
   
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FetchImage xmlns=\"http://test.kontract360.com/\">\n"
                   "<filename>%@</filename>\n"
                   "</FetchImage>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",fullURL];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/FetchImage" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)meetingFetchImage{
    recordResults = FALSE;
    
    NSString *soapMessage;
    NSString * plantrimmestrg=[_companyid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    SitevistMdl *sitemdl1=(SitevistMdl *)[_meetgarray objectAtIndex:fetchindex];
    
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MM-dd-yyyy"];
    NSDate *dates = [dateFormat1 dateFromString:sitemdl1.meetingdate];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    
    NSString*    dateString = [dateFormat2 stringFromDate:dates];
_passingdate=dateString;
    NSString *fullURL =[NSString stringWithFormat:@"%@-%@-%@-%@.jpg",plantrimmestrg,@"Meeting",dateString,sitemdl1.filename];
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FetchImage xmlns=\"http://test.kontract360.com/\">\n"
                   "<filename>%@</filename>\n"
                   "</FetchImage>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",fullURL];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/FetchImage" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)notesFetchImage{
    recordResults = FALSE;
    
    NSString *soapMessage;
    NSString * plantrimmestrg=[_companyid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
      SitevistMdl *sitemdl1=(SitevistMdl *)[_notearray objectAtIndex:fetchindex];
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MM-dd-yyyy"];
    NSDate *dates = [dateFormat1 dateFromString:sitemdl1.notedate];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    
    NSString*    dateString = [dateFormat2 stringFromDate:dates];
    _passingdate=dateString;
    NSString *fullURL =[NSString stringWithFormat:@"%@-%@-%@-%@.jpg",plantrimmestrg,@"Notes",dateString,sitemdl1.filename];
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FetchImage xmlns=\"http://test.kontract360.com/\">\n"
                   "<filename>%@</filename>\n"
                   "</FetchImage>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",fullURL];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/FetchImage" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please Check Your Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
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
    [_prdunratetble reloadData];
    [_jobsitetable reloadData];
    [_safetytableview reloadData];
    [_newequipmenttable reloadData];
    [_workscdletable reloadData];
    [_meetingtable reloadData];
    [_bidderstable reloadData];
    [_weathertable reloadData];
    [_notestable reloadData];
    
    if (webtype==1) {
         [_accebilitytable reloadData];
        webtype=0;

    }
    if (webtype==2) {
         [_ESAtble reloadData];
      
         webtype=0;
    }
    
  
    
    
}



#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        return [_cmpxtyofwrk count];
    }
    else{
          if (tableView==_prdunratetble) {
              return [_productionratearray count];
          }
        
        if (tableView==_jobsitetable) {
                  return [_jobsiteArray count];
              }
        if (tableView==_safetytableview) {
            return [_saftyArray count];
        }
        
        if (tableView==_newequipmenttable) {
            return [_Equpmntarray count];
        }
        
        if (tableView==_workscdletable) {
            return [_wrkschdlearray count];
        }
        
        if (tableView==_meetingtable) {
           return [_meetgarray count];
           // return 2;
        }
        if (tableView==_bidderstable) {
            return [_bidderarray count];
        }
        if (tableView==_weathertable) {
            return [_weatherarray count];
        }
        if (tableView==_notestable) {
            return [_notearray count];
        }
        if ((tableView==_accebilitytable)||(tableView=_ESAtble )) {
            return [_filenamearray count];
        }

        }
    
    return YES;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
         cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        
        if (tableView==_prdunratetble) {
             [[NSBundle mainBundle]loadNibNamed:@"Ratecellview" owner:self options:nil];
            
             cell=_ratecell;
        }
//     else   if (tableView==_documenttable) {
//                 [[NSBundle mainBundle]loadNibNamed:@"cellfordocumnt" owner:self options:nil];
//            
//            cell=_docucell;
//            
//        }

        
      else    if (tableView==_jobsitetable) {
            [[NSBundle mainBundle]loadNibNamed:@"Jobsitecellview" owner:self options:nil];
            
            cell=_jobsitecell;
            
        }
        
      else    if (tableView==_safetytableview) {
            [[NSBundle mainBundle]loadNibNamed:@"SaftyCell" owner:self options:nil];
            
            cell=_saftycell;
            
        }
        else    if (tableView==_newequipmenttable) {
              [[NSBundle mainBundle]loadNibNamed:@"siteEqupmtntcell" owner:self options:nil];
              
              cell=_equmntcell;
          }
        else  if (tableView==_workscdletable) {
            [[NSBundle mainBundle]loadNibNamed:@"Wrkschdulecell" owner:self options:nil];
            
            cell=_wrkschdlecell;

            
        }
      else    if (tableView==_meetingtable) {
        [[NSBundle mainBundle]loadNibNamed:@"Meetingnotesview" owner:self options:nil];
                
                cell=_meetgcell;

        }
      else    if (tableView==_bidderstable) {
            cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
            
        }
      else    if (tableView==_weathertable) {
            [[NSBundle mainBundle]loadNibNamed:@"Ratecellview" owner:self options:nil];
            
            cell=_ratecell;
        }
       else   if (tableView==_notestable) {
           [[NSBundle mainBundle]loadNibNamed:@"Meetingnotesview" owner:self options:nil];
           
           cell=_meetgcell;

           
        }
 else   if (tableView==_accebilitytable) {
      [[NSBundle mainBundle]loadNibNamed:@"cellfordocumnt" owner:self options:nil];
     
       cell=_docucell;
     

 }
 else  if (tableView==_ESAtble) {
     
     [[NSBundle mainBundle]loadNibNamed:@"cellfordocumnt" owner:self options:nil];
     
     cell=_docucell;
     
 }

       }
    
    
      if (tableView==_popOverTableView) {
          
           cell.textLabel.text=[_cmpxtyofwrk objectAtIndex:indexPath.row];

      }
    
     else  if (tableView==_prdunratetble) {
          
          SitevistMdl *sitemdl1=(SitevistMdl *)[_productionratearray objectAtIndex:indexPath.row];
          _ratelbl=(UILabel *)[cell viewWithTag:1];
          _ratelbl.text=[NSString stringWithFormat:@"%@",sitemdl1.PRRate];
          _ratedeslbl=(UILabel *)[cell viewWithTag:2];
          _ratedeslbl.text=sitemdl1.PRdescptn;
          _ratevaluelbl=(UILabel *)[cell viewWithTag:3];
          _ratevaluelbl.text=[NSString stringWithFormat:@"$%@",sitemdl1.PRvalue];
          
          
      }
  else   if (tableView==_jobsitetable) {
        
        SitevistMdl *sitemdl1=(SitevistMdl *)[_jobsiteArray objectAtIndex:indexPath.row];
        _jobname=(UILabel *)[cell viewWithTag:1];
        _jobname.text=sitemdl1.jobsitname;
        _jobcode=(UILabel *)[cell viewWithTag:2];
        _jobcode.text=sitemdl1.jobcode;
        _jobtype=(UILabel *)[cell viewWithTag:3];
        _jobtype.text=[_JobtypeDict objectForKey:sitemdl1.jobtypeid];
        _jobcost=(UILabel *)[cell viewWithTag:4];
      _jobcost.text=[NSString stringWithFormat:@"$%@",sitemdl1.jobcost];
       // _jobcost.text=sitemdl1.jobcost;
}
    else  if (tableView==_safetytableview) {
         
         SitevistMdl *sitemdl1=(SitevistMdl *)[_saftyArray objectAtIndex:indexPath.row];
         _rultitllbl=(UILabel *)[cell viewWithTag:1];
         _rultitllbl.text=sitemdl1.RuleTitle;
         _ruledesptn=(UILabel *)[cell viewWithTag:2];
         _ruledesptn.text=sitemdl1.Ruledesptn;

     }
    
 else   if (tableView==_newequipmenttable) {
       SitevistMdl *sitemdl1=(SitevistMdl *)[_Equpmntarray objectAtIndex:indexPath.row];
       
       _eqnamelbl=(UILabel *)[cell viewWithTag:1];
       _eqnamelbl.text=sitemdl1.EquipmentNumber;
       _eqdeslbl=(UILabel *)[cell viewWithTag:2];
       _eqdeslbl.text=sitemdl1.equpdescptn;
       _equarealbl=(UILabel *)[cell viewWithTag:3];
       _equarealbl.text=sitemdl1.equparea;
       _equunitlbl=(UILabel *)[cell viewWithTag:4];
       _equunitlbl.text=sitemdl1.equpunit;

       
       
   }
    
  else   if (tableView==_workscdletable) {
        SitevistMdl *sitemdl1=(SitevistMdl *)[_wrkschdlearray objectAtIndex:indexPath.row];
        
        _startdaelbl=(UILabel *)[cell viewWithTag:1];
        _startdaelbl.text=sitemdl1.wrkstartdate;
        _enddatelbl=(UILabel *)[cell viewWithTag:2];
        _enddatelbl.text=sitemdl1.wrkenddate;
        _wrkschdledscrptn=(UILabel *)[cell viewWithTag:3];
        _wrkschdledscrptn.text=sitemdl1.wrkshdledescptn;
      
        
        
        
    }
  else   if (tableView==_meetingtable) {
        
        SitevistMdl *sitemdl1=(SitevistMdl *)[_meetgarray objectAtIndex:indexPath.row];
        _mnamelbl=(UILabel *)[cell viewWithTag:1];
        _mnamelbl.text=sitemdl1.meetingdate;
        _mdetaillbl=(UILabel *)[cell viewWithTag:2];
        _mdetaillbl.text=sitemdl1.meetingdetails;
      _mnotelbl=(UILabel *)[cell viewWithTag:3];
      _mnotelbl.text=sitemdl1.filename;
      _typeimagview=(UIImageView*)[cell viewWithTag:5];
      if (sitemdl1.typvalue==0) {
          _typeimagview.image=[UIImage imageNamed:@"Handnotes"];
      }
      else
      {
          _typeimagview.image=[UIImage imageNamed:@"Notepad"];
      }

      
    }
  else   if (tableView==_bidderstable) {
          SitevistMdl *sitemdl1=(SitevistMdl *)[_bidderarray objectAtIndex:indexPath.row];
        
        cell.textLabel.text=[NSString stringWithFormat:@"\t\t\t\t\t\t%@",sitemdl1.biddername];
            }
    
    
  else   if (tableView==_weathertable) {
        SitevistMdl *sitemdl1=(SitevistMdl *)[_weatherarray objectAtIndex:indexPath.row];
        _ratelbl=(UILabel *)[cell viewWithTag:1];
        _ratelbl.text=sitemdl1.wethrfrm;
        _ratedeslbl=(UILabel *)[cell viewWithTag:2];
        _ratedeslbl.text=sitemdl1.weathrto;
        _ratevaluelbl=(UILabel *)[cell viewWithTag:3];
        _ratevaluelbl.text=sitemdl1.weatherdescptn;
        
    }
 else    if (tableView==_notestable) {
        SitevistMdl *sitemdl1=(SitevistMdl *)[_notearray objectAtIndex:indexPath.row];
     _mnamelbl=(UILabel *)[cell viewWithTag:1];
     _mnamelbl.text=sitemdl1.notedate;
     _mdetaillbl=(UILabel *)[cell viewWithTag:2];
     _mdetaillbl.text=sitemdl1.Notes;
     _mnotelbl=(UILabel *)[cell viewWithTag:3];
     _mnotelbl.text=sitemdl1.filename;
      NSLog(@"%d",sitemdl1.notetype);
     _typeimagview=(UIImageView*)[cell viewWithTag:5];
     if (sitemdl1.notetype==0) {
         _typeimagview.image=[UIImage imageNamed:@"Handnotes"];
     }
     else if(sitemdl1.notetype==1)
     {
         _typeimagview.image=[UIImage imageNamed:@"Notepad"];
     }
     

     
    }
  else if ((tableView==_accebilitytable)||(tableView=_ESAtble )) {
        
        
        _doculbl=(UILabel *)[cell viewWithTag:1];
        _doculbl.text=[_filenamearray objectAtIndex:indexPath.row];


    }

    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
 if(tableView==_popOverTableView)
   {
   }
 else{
        if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
        }else
        {
            //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
        }
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_popOverTableView) {
        
        [_complextyofwrkbtnlbl setTitle:[_cmpxtyofwrk objectAtIndex:indexPath.row] forState:UIControlStateNormal];
       
    }
    [self.popOverController dismissPopoverAnimated:YES];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        path=indexPath.row;
        
      if (tableView==_prdunratetble) {
        [self Sitevisitdeleteproductionrates];
        [_productionratearray removeObject:indexPath];
        
        }
        
        if (tableView==_jobsitetable) {
            [self Sitevisitdeletejobsiterequirements];
            [_jobsiteArray removeObject:indexPath];
            
            
          
        }
        if (tableView==_safetytableview) {
            [self Sitevisitdeletesafetyrules];
            [_saftyArray removeObject:indexPath];
          
            }
        
        if (tableView==_newequipmenttable) {
            [self SitevisitdeleteEquipments];
            [_Equpmntarray removeObject:indexPath];
         
            }
        
        if (tableView==_workscdletable) {
            
            [self Sitevisitdeleteworkschedule];
            [_wrkschdlearray removeObject:indexPath];
        
         }
        
        if (tableView==_meetingtable) {
            [self Sitevisitdeletemeetingnotes];
            [_meetgarray removeObject:indexPath];
          

            
            }
        if (tableView==_bidderstable) {
            [self Sitevisitdeleteotherbidders];
            [_bidderarray removeObject:indexPath];
          

           
        }
        if (tableView==_weathertable) {
            [self Sitevisitdeleteweatheroutlook];
            [_weatherarray removeObject:indexPath];
           
           
        }
        if (tableView==_notestable) {
            [self Sitevisitdeletenotes];
            [_notearray removeObject:indexPath];
         
           }

        
        }
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_popOverTableView)
        
    {
        return self.editing ;
    }
    return YES;
    
}



#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ListSiteVisitGeneralResult"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Location"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Zip"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Complexity"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FacilityDetails"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Accessibility"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Equipment"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"ScopeofWork"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SaveSiteVisitGeneralResult"])
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
    if([elementName isEqualToString:@"SitevisitSelectproductionrateResponse"])
    {
        _productionratearray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
      if([elementName isEqualToString:@"proentyId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"prodesc"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"Value"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"PlanId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ServiceId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SkillName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    
    
    if([elementName isEqualToString:@"SitevisitSelectjobsitereqResponse"])
    {
        _jobsiteArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Entryjobsite"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Name"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"code"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TypeId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Cost"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SelectAllItemTypeResponse"])
    {
        _JobtypeDict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"entry_id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"itemtypename"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"SelectsafetyrulessitevisitResponse"])
    {
        _saftyArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"entrysafety"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"RuleTitle"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"descsafety"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"SitevisitSelectequipmentResponse"])
    {
        _Equpmntarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Entryequip"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"EquipmentNumber"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Descequip"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Area"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Unit"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"SitevisitSelectWorkScheduleResponse"])
    {
        _wrkschdlearray=[[NSMutableArray alloc]init];
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
    
    if([elementName isEqualToString:@"FromDate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"EndDate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"Description"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"SitevisitSelectMeetingNotesResponse"])
    {
        _meetgarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"entrymeeting"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"DateTime"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"Details"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"UserId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"MettingFileName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Type"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"SitevisitSelectOtherBiddersResponse"])
    {
        _bidderarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"entryother"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"BidderName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"SitevisitSelectWeatherOutlookResponse"])
    {
        _weatherarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"weatherentry"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"WeatherFrom"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"WeatherTo"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"WeatherDescription"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"SitevisitSelectNotesResponse"])
    {
        _notearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"entrynotes"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"NoteDate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"Notes"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"UserId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FileName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"noteType"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"PlanDrawingSelectResponse"])
    {
        _filenamearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"drawingid"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"filename"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FetchImageResponse"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"url"])
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
  
    if([elementName isEqualToString:@"Location"])
    {
        recordResults = FALSE;
        
        _loctntxtfld.text=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Zip"])
    {  recordResults = FALSE;
        
        _ziptxtfld.text=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Complexity"])
    {
        recordResults = FALSE;
        [_complextyofwrkbtnlbl setTitle:_soapResults forState:UIControlStateNormal];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FacilityDetails"])
    {
        recordResults = FALSE;
        _facilitytxtview.text=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Accessibility"])
    {
        recordResults = FALSE;
        _Accibltylblview.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Equipment"])
    {
        recordResults = FALSE;
        _equipmnttxtview.text=_soapResults;
        
        _soapResults = nil;
    }


    if([elementName isEqualToString:@"ScopeofWork"])
    {
        recordResults = FALSE;
        _scpeofwrktxtview.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
       recordResults = FALSE;
        if ([_soapResults isEqualToString:@"deletedweatheroutlook"]) {
            
            [self SitevisitSelectWeatherOutlook];
           }
      else  if ([_soapResults isEqualToString:@"deletedjobsitereq"]) {
            
            [self SitevisitSelectjobsitereq];
        }
        
        else  if ([_soapResults isEqualToString:@"deletedsafetyrules"]) {
            
            [self Selectsafetyrulessitevisit];
        }
       else   if ([_soapResults isEqualToString:@"deletedequipmentsitevisit"]) {
            
            [self SitevisitSelectequipment];
        }
       else   if ([_soapResults isEqualToString:@"deletedworkschedule"]) {
            
            [self SitevisitSelectWorkSchedule];
        }
       else   if ([_soapResults isEqualToString:@"deletedmeetingnotes"]) {
            
            [self SitevisitSelectMeetingNotes];
        }
       else   if ([_soapResults isEqualToString:@"deletedotherbidder"]) {
            
            [self SitevisitSelectOtherBidders];
        }
       else   if ([_soapResults isEqualToString:@"deletednotes"]) {
            
            [self SitevisitSelectNotes];
        }
       else   if ([_soapResults isEqualToString:@"deletedproductionrates"]) {
            
            [self SitevisitSelectproductionrate];
        }

        else{
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertview show];
              _genralbtnlbl.enabled=YES;
            _accebilitybtnlbl.enabled=YES;
            _equpdatebtnlbl.enabled=YES;
            
        }
     _soapResults = nil;
    }
    if([elementName isEqualToString:@"proentyId"])
    {
        _sitevistmdl=[[SitevistMdl alloc]init];
        recordResults = FALSE;
        _sitevistmdl.prentryid=_soapResults;
        
        
       _soapResults = nil;
    }

    
    if([elementName isEqualToString:@"prodesc"])
    {
        recordResults = FALSE;
        _sitevistmdl.PRdescptn=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Value"])
    {
        recordResults = FALSE;
        _sitevistmdl.PRvalue=_soapResults;
       
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PlanId"])
    {
        recordResults = FALSE;
       
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ServiceId"])
    {
        recordResults = FALSE;
          _sitevistmdl.servcid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SkillName"])
    {
        recordResults = FALSE;
         _sitevistmdl.PRRate=_soapResults;
         [_productionratearray addObject:_sitevistmdl];
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Entryjobsite"])
    {
           _sitevistmdl=[[SitevistMdl alloc]init];
        recordResults = FALSE;
        _sitevistmdl.jobentryid=_soapResults;
      
        
        _soapResults = nil;
    }

    
    if([elementName isEqualToString:@"Name"])
    {
     
        recordResults = FALSE;
        _sitevistmdl.jobsitname=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"code"])
    {
        recordResults = FALSE;
          _sitevistmdl.jobcode=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TypeId"])
    {
        recordResults = FALSE;
          _sitevistmdl.jobtypeid=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Cost"])
    {
        recordResults = FALSE;
          _sitevistmdl.jobcost=_soapResults;
        [_jobsiteArray addObject:_sitevistmdl];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"entry_id"])
    {
        
        recordResults = FALSE;
        itemid=_soapResults;
        
        _soapResults = nil;
    
    }
    if([elementName isEqualToString:@"itemtypename"])
    {
        recordResults = FALSE;
        [_JobtypeDict setObject:_soapResults forKey:itemid];
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"entrysafety"])
    {
        _sitevistmdl=[[SitevistMdl alloc]init];
        recordResults = FALSE;
        _sitevistmdl.Saftruleentry=_soapResults;
         NSLog(@"sitem%@",_sitevistmdl.Saftruleentry);
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"RuleTitle"])
    {
       
        recordResults = FALSE;
        _sitevistmdl.RuleTitle=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"descsafety"])
    {
        recordResults = FALSE;
        _sitevistmdl.Ruledesptn=_soapResults;
        [_saftyArray addObject:_sitevistmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Entryequip"])
    {
        _sitevistmdl=[[SitevistMdl alloc]init];
        recordResults = FALSE;
        _sitevistmdl.equpentryid=_soapResults;
        _soapResults = nil;


    }
    if([elementName isEqualToString:@"EquipmentNumber"])
    {
        recordResults = FALSE;
        _sitevistmdl.EquipmentNumber=_soapResults;
        _soapResults = nil;
    
    
    }
    if([elementName isEqualToString:@"Descequip"])
    {
        recordResults = FALSE;
        _sitevistmdl.equpdescptn=_soapResults;

        _soapResults = nil;
    
    }
    if([elementName isEqualToString:@"Area"])
    {
        recordResults = FALSE;
        _sitevistmdl.equparea=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"Unit"])
    {
        recordResults = FALSE;
        _sitevistmdl.equpunit=_soapResults;
        [_Equpmntarray addObject:_sitevistmdl];
        
        
        _soapResults = nil;
    
    }
    if([elementName isEqualToString:@"EntryId"])
    {
        _sitevistmdl=[[SitevistMdl alloc]init];

        recordResults = FALSE;
        
       
        
        _sitevistmdl.wrkschdlentryid=_soapResults;
        
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"FromDate"])
    {
        recordResults = FALSE;
        NSArray *newarray=[_soapResults componentsSeparatedByString:@"T"];
        NSString *date1=[newarray objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];

        _sitevistmdl.wrkstartdate=myFormattedDate;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"EndDate"])
    {
        recordResults = FALSE;
        NSArray *newarray=[_soapResults componentsSeparatedByString:@"T"];
        NSString *date1=[newarray objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];

        _sitevistmdl.wrkenddate=myFormattedDate;
        
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"Description"])
    {
        recordResults = FALSE;
        _sitevistmdl.wrkshdledescptn=_soapResults;
        [_wrkschdlearray addObject:_sitevistmdl];
        
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"entrymeeting"])
    {
        _sitevistmdl=[[SitevistMdl alloc]init];
        
        recordResults = FALSE;
        _sitevistmdl.meetgentryid=_soapResults;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"DateTime"])
    {
        recordResults = FALSE;
        NSArray *newarray=[_soapResults componentsSeparatedByString:@"T"];
        NSString *date1=[newarray objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];

        _sitevistmdl.meetingdate=myFormattedDate;
        
        _soapResults = nil;    }
    
    if([elementName isEqualToString:@"Details"])
    {
        recordResults = FALSE;
        _sitevistmdl.meetingdetails=_soapResults;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"UserId"])
    {
        recordResults = FALSE;
        _sitevistmdl.meetguserid=_soapResults;
      
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"MettingFileName"])
    {
        recordResults = FALSE;
        _sitevistmdl.filename=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Type"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"false"]) {
            _sitevistmdl.typvalue=0;
        }
        else
        {
             _sitevistmdl.typvalue=1;
        }
        [_meetgarray addObject:_sitevistmdl];
        _soapResults = nil;
    }


    if([elementName isEqualToString:@"entryother"])
    {
        _sitevistmdl=[[SitevistMdl alloc]init];
        
        recordResults = FALSE;
        _sitevistmdl.bidderentryid=_soapResults;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"BidderName"])
    {  recordResults = FALSE;
        _sitevistmdl.biddername=_soapResults;
        [_bidderarray addObject:_sitevistmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"entrynotes"])
    {
        _sitevistmdl=[[SitevistMdl alloc]init];
        
        recordResults = FALSE;
        _sitevistmdl.notesentryid=_soapResults;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"NoteDate"])
    {
        recordResults = FALSE;
        NSArray *newarray=[_soapResults componentsSeparatedByString:@"T"];
        NSString *date1=[newarray objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];

        _sitevistmdl.notedate=myFormattedDate;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Notes"])
    {
        recordResults = FALSE;
        _sitevistmdl.Notes=_soapResults;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"UserId"])
    {
        recordResults = FALSE;
        _sitevistmdl.notesuserid=_soapResults;
       
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FileName"])
    {
        recordResults = FALSE;
        _sitevistmdl.filename=_soapResults;
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"noteType"])
    {
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"false"]) {
            _sitevistmdl.notetype=0;
        }
        else
        {
            _sitevistmdl.notetype=1;
        }

        [_notearray addObject:_sitevistmdl];
        
        _soapResults = nil;
    }


    if([elementName isEqualToString:@"weatherentry"])
    {
        _sitevistmdl=[[SitevistMdl alloc]init];
        
        recordResults = FALSE;
        _sitevistmdl.weatherentryid=_soapResults;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"WeatherFrom"])
    {
        recordResults = FALSE;
        NSArray *newarray=[_soapResults componentsSeparatedByString:@"T"];
        NSString *date1=[newarray objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];
        _sitevistmdl.wethrfrm=myFormattedDate;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"WeatherTo"])
    {
        recordResults = FALSE;
        NSArray *newarray=[_soapResults componentsSeparatedByString:@"T"];
        NSString *date1=[newarray objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];

        _sitevistmdl.weathrto=myFormattedDate;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"WeatherDescription"])
    {
        recordResults = FALSE;
        _sitevistmdl.weatherdescptn=_soapResults;
        [_weatherarray addObject:_sitevistmdl];
        
        
        _soapResults = nil;    }
    
    if([elementName isEqualToString:@"drawingid"])
    {
         recordResults = FALSE;
        
         _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"filename"])
    {
        recordResults = FALSE;
        [_filenamearray addObject:_soapResults];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"url"])
    {
       recordResults = FALSE;
        
        NSData *data1=[_soapResults base64DecodedData];
        
        _Editedimage=  [[UIImage alloc]initWithData:data1];
        
        //[NSData dataWithData:UIImagePNGRepresentation(image.image)];
        
        //  [_mainimgeview setImage:[UIImage imageNamed:@"width"]];
        self.drwVCtrl=[[DrawingViewController alloc]initWithNibName:@"DrawingViewController" bundle:nil];
        
        
        _drwVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
        _drwVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
        _drwVCtrl.planid=_companyid;
        _drwVCtrl.tabtype=tabtype;
        _drwVCtrl.editedimage=_Editedimage;
        _drwVCtrl.viewclck=viewclck;
        _drwVCtrl.datestrg=_passingdate;
       _drwVCtrl.delegate=self;

        
        [self presentViewController:_drwVCtrl
                           animated:YES completion:NULL];
        
   _soapResults = nil;
    }



   }

#pragma mark-popovers
-(void)createpopover{
    
    
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 200);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_complextyofwrkbtnlbl.frame
                                            inView:self.gernalview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];

    
}
#pragma mark-textfld delegates
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField==_ziptxtfld)
    {
        NSUInteger newLength = [_ziptxtfld.text length] + [string length] - range.length;
        return (newLength > 10) ? NO : YES;
    }
    return YES;

}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField==_ziptxtfld)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_ziptxtfld.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Zip" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }

    
}
#pragma mark-Alertview Delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if ([alertView.message isEqualToString:@"Invalid Zip"]) {
        _ziptxtfld.text=@"";
        
        
    }
    
    
}
#pragma mark-Barbuttonitems


- (IBAction)generalbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor whiteColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=NO;
     _rateview.hidden=YES;
    _docmntview.hidden=YES;
     _accessview.hidden=YES;
    _equipmentview.hidden=YES;
      _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
   _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;
}

- (IBAction)prductnbtn:(id)sender {
    
    [self SitevisitSelectproductionrate];
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor whiteColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];
    
     _gernalview.hidden=YES;
    _rateview.hidden=NO;
    _docmntview.hidden=YES;
     _accessview.hidden=YES;
    _equipmentview.hidden=YES;
      _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
   _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


}

//- (IBAction)documntbtn:(id)sender {
//    _gernalbtnlbl.tintColor=[UIColor blackColor];
//    _pratebtnlbl.tintColor=[UIColor blackColor];
//    _documntbtnlbl.tintColor=[UIColor whiteColor];
//    _accesbltybtnlbl.tintColor=[UIColor blackColor];
//    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
//    _jobsitebtnlbl.tintColor=[UIColor blackColor];
//    _saftybtnlbl.tintColor=[UIColor blackColor];
//    _equpmntslbl.tintColor=[UIColor blackColor];
//    _workbtnlbl.tintColor=[UIColor blackColor];
//    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
//    _biddersbtnlbl.tintColor=[UIColor blackColor];
//    _weatherbtnlbl.tintColor=[UIColor blackColor];
//    _notesbtnlbl.tintColor=[UIColor blackColor];
//
//    
//    
//    _gernalview.hidden=YES;
//    _rateview.hidden=YES;
//    _docmntview.hidden=NO;
//    _accessview.hidden=YES;
//    _equipmentview.hidden=YES;
//      _jobsiteview.hidden=YES;
//    _safetyview.hidden=YES;
//       _neweqmntview.hidden=YES;
//    _workschdleview.hidden=YES;
//    _meetingview.hidden=YES;
//    _biddersview.hidden=YES;
//    _weatherview.hidden=YES;
//    _notesview.hidden=YES;
//
//
//}

- (IBAction)acceblitybtn:(id)sender {
    [self PlanDrawingSelect];
 tabtype=2;
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor whiteColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=NO;
      _equipmentview.hidden=YES;
      _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


}

- (IBAction)Equmntstgareabtn:(id)sender {
     tabtype=1;
    [self EstmPlanDrawingSelect];
       _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor whiteColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    
    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=NO;
     _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;

    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


}

- (IBAction)jobsitebtn:(id)sender {
    [self SitevisitSelectjobsitereq];
    
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor whiteColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=NO;
     _safetyview.hidden=YES;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;

    
}

- (IBAction)safetybtn:(id)sender {
    [self Selectsafetyrulessitevisit];
      _saftybtnlbl.tintColor=[UIColor whiteColor];
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
  
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=NO;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;

    
}

- (IBAction)newequipmentbtn:(id)sender {
    [self SitevisitSelectequipment];
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor whiteColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    
    _neweqmntview.hidden=NO;
      _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


    
}

- (IBAction)workschedulebtn:(id)sender {
    [self SitevisitSelectWorkSchedule];
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor whiteColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=NO;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;

    

    
}

- (IBAction)meetingnotesbtn:(id)sender {
    tabtype=3;
    [self SitevisitSelectMeetingNotes];
    [self MeetingPlanDrawingSelect];
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor whiteColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=NO;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;
    


}

- (IBAction)otherbiddersbtn:(id)sender {
    [self SitevisitSelectOtherBidders];
     [self NotesPlanDrawingSelect];
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor whiteColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
      _biddersview.hidden=NO;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;

}

- (IBAction)weatheroutlookbtn:(id)sender {
    [self SitevisitSelectWeatherOutlook];
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor whiteColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;

    _weatherview.hidden=NO;
    _notesview.hidden=YES;

}

- (IBAction)notesbtn:(id)sender {
    tabtype=4;

    [self SitevisitSelectNotes];
    [self NotesPlanDrawingSelect];
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor whiteColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=NO;
    _biddersview.hidden=YES;



}



#pragma mark-button Actions
- (IBAction)equpdraw:(id)sender {
    viewclck=0;
    tabtype=1;
    self.drwVCtrl=[[DrawingViewController alloc]initWithNibName:@"DrawingViewController" bundle:nil];
    
    
    _drwVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    _drwVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    _drwVCtrl.planid=_companyid;
    _drwVCtrl.tabtype=tabtype;
    _drwVCtrl.delegate=self;
    [self presentViewController:_drwVCtrl
                       animated:YES completion:NULL];
}

- (IBAction)accebiltydraw:(id)sender {
      viewclck=0;
    tabtype=2;
    self.drwVCtrl=[[DrawingViewController alloc]initWithNibName:@"DrawingViewController" bundle:nil];
    
    
    _drwVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    _drwVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
     _drwVCtrl.planid=_companyid;
       _drwVCtrl.tabtype=tabtype;
     _drwVCtrl.delegate=self;
    [self presentViewController:_drwVCtrl
                       animated:YES completion:NULL];
//    self.blezierview=[[BlezierViewController alloc]initWithNibName:@"BlezierViewController" bundle:nil];
//    
//    
//    _blezierview.modalPresentationStyle=UIModalPresentationPageSheet;
//    _blezierview.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
//    //_drwVCtrl.planid=_companyid;
//    //_drwVCtrl.tabtype=tabtype;
//    //_drwVCtrl.delegate=self;
//    [self presentViewController:_blezierview
//                       animated:YES completion:NULL];
    
    
}

- (IBAction)cmpxtyofwrkbtn:(id)sender {
    
    [self createpopover];
    [_popOverTableView reloadData];
    
}

- (IBAction)updatebtn:(id)sender {
    if ([_facilitytxtview.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Facility Details is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
     else if ([_scpeofwrktxtview.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Scope of work is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {

    _genralbtnlbl.enabled=NO;
    [self SaveSiteVisitGeneral];
    }
    
 
    
}
- (IBAction)ratedeletebtn:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_prdunratetble setEditing:NO animated:NO];
        [_prdunratetble reloadData];
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_prdunratetble setEditing:YES animated:YES];
        [_prdunratetble reloadData];
        
    }
    
    
}


- (IBAction)Rateaddbtn:(id)sender {
    self.newrecordVCtrl=[[NewrecordViewController alloc]initWithNibName:@"NewrecordViewController" bundle:nil];
    self.newrecordVCtrl.companyid=_companyid;
    self.newrecordVCtrl.delegate=self;
    self.newrecordVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_newrecordVCtrl
                       animated:YES completion:NULL];
}

- (IBAction)celleditbtn:(id)sender {
    
    
}
- (IBAction)takepicturebtn:(id)sender {
    
    
}

- (IBAction)upadtepicturebtn:(id)sender {
    
    
}

- (IBAction)docutypebtn:(id)sender {
    
    
}
- (IBAction)accebilityupdate:(id)sender {
    if ([_Accibltylblview.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Description is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        
        _accebilitybtnlbl.enabled=NO;
    [self SaveSiteVisitAccessibility];
    }
    
    
}
- (IBAction)equpmntupdatebtn:(id)sender {
    if ([_equipmnttxtview.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Description is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {

    _equpdatebtnlbl.enabled=YES;
    [self SaveSiteVisitEquipments];
    }
    
    
}
- (IBAction)addnewjobsite:(id)sender {
    
   
        self.newrecordVCtrl=[[NewrecordViewController alloc]initWithNibName:@"Jobsiterecord" bundle:nil];
     self.newrecordVCtrl.delegate=self;
      self.newrecordVCtrl.companyid=_companyid;
    self.newrecordVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_newrecordVCtrl
                       animated:YES completion:NULL];

}
- (IBAction)addsafetyrules:(id)sender {
  
        self.newrecordVCtrl=[[NewrecordViewController alloc]initWithNibName:@"Roolsrecordaddview" bundle:nil];
     self.newrecordVCtrl.delegate=self;
    self.newrecordVCtrl.companyid=_companyid;
    self.newrecordVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_newrecordVCtrl
                       animated:YES completion:NULL];

    
    
}
- (IBAction)addnewequipment:(id)sender {
   
        self.newrecordVCtrl=[[NewrecordViewController alloc]initWithNibName:@"EqaddRecordview" bundle:nil];
     self.newrecordVCtrl.delegate=self;
    self.newrecordVCtrl.companyid=_companyid;
    self.newrecordVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_newrecordVCtrl
                       animated:YES completion:NULL];

}
- (IBAction)addworkscdle:(id)sender {
    
        self.newrecordVCtrl=[[NewrecordViewController alloc]initWithNibName:@"addworkscheduleview" bundle:nil];
     self.newrecordVCtrl.delegate=self;
    self.newrecordVCtrl.companyid=_companyid;
    self.newrecordVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_newrecordVCtrl
                       animated:YES completion:NULL];

}
- (IBAction)mviewbtn:(id)sender {
    
    
    
    
}

- (IBAction)addmeetgnots:(id)sender {
           self.newrecordVCtrl=[[NewrecordViewController alloc]initWithNibName:@"meetingnoterecordaddview" bundle:nil];
     self.newrecordVCtrl.delegate=self;
    self.newrecordVCtrl.companyid=_companyid;
    self.newrecordVCtrl.tabtype=tabtype;

    
    self.newrecordVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_newrecordVCtrl
                       animated:YES completion:NULL];

}

- (IBAction)deltemeetng:(id)sender {
    
    if (self.editing) {
        [super setEditing:NO animated:NO];
         [_meetingtable setEditing:NO animated:NO];
        [_meetingtable reloadData];
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_meetingtable setEditing:YES animated:YES];
        [_meetingtable reloadData];
        
        
    }

     }
- (IBAction)addbidder:(id)sender {
   
        self.newrecordVCtrl=[[NewrecordViewController alloc]initWithNibName:@"otherbiddrecordaddview" bundle:nil];
     self.newrecordVCtrl.delegate=self;
    self.newrecordVCtrl.companyid=_companyid;
    self.newrecordVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_newrecordVCtrl
                       animated:YES completion:NULL];

}
- (IBAction)addweather:(id)sender {
  
    self.newrecordVCtrl=[[NewrecordViewController alloc]initWithNibName:@"Outlookrecordaddview" bundle:nil];
     self.newrecordVCtrl.delegate=self;
    self.newrecordVCtrl.companyid=_companyid;
    self.newrecordVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_newrecordVCtrl
                       animated:YES completion:NULL];

}

- (IBAction)deleteweather:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_weathertable setEditing:NO animated:NO];
        [_weathertable reloadData];
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_weathertable setEditing:YES animated:YES];
        [_weathertable reloadData];
        
    }

}
- (IBAction)addnotesbtn:(id)sender {
 
        self.newrecordVCtrl=[[NewrecordViewController alloc]initWithNibName:@"Addnoterecordview" bundle:nil];
     self.newrecordVCtrl.delegate=self;
    self.newrecordVCtrl.companyid=_companyid;
     self.newrecordVCtrl.tabtype=tabtype;
    self.newrecordVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_newrecordVCtrl
                       animated:YES completion:NULL];

}

- (IBAction)deletenotes:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
             [_notestable setEditing:NO animated:NO];
        [_notestable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
         [_notestable setEditing:YES animated:YES];
        [_notestable reloadData];
        
        
    }

}
-(IBAction)closesitevisit:(id)sender
{
    _companynametxtfld.text=@"";
    _loctntxtfld.text=@"";
    _ziptxtfld.text=@"";
    [_complextyofwrkbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    _facilitytxtview.text=@"";
    _scpeofwrktxtview.text=@"";
    _Accibltylblview.text=@"";
    _equipmnttxtview.text=@"";
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)deletebidd:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
        
        [_bidderstable setEditing:NO animated:NO];
        [_bidderstable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_bidderstable setEditing:YES animated:YES];
        [_bidderstable reloadData];
        
        
    }
}
- (IBAction)deletewrkschdle:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
 
        [_workscdletable setEditing:NO animated:NO];
        [_workscdletable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
           [_workscdletable setEditing:YES animated:YES];
        [_workscdletable reloadData];
        //[_meetingtable setEditing:YES animated:YES];
        
    }

}
- (IBAction)deleteequmnt:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_newequipmenttable setEditing:NO animated:NO];
        [_newequipmenttable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
         [_newequipmenttable setEditing:YES animated:YES];
        [_newequipmenttable reloadData];
        
    }

}
- (IBAction)deletesfty:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
            [_safetytableview setEditing:NO animated:NO];
        [_safetytableview reloadData];
        
        
        
    }
    
    else{
         [super setEditing:YES animated:YES];
        [_safetytableview setEditing:YES animated:YES];
        [_safetytableview reloadData];
        
        
    }

}
- (IBAction)deletejobsite:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
 
        [_jobsitetable setEditing:NO animated:NO];
        [_jobsitetable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
            [_jobsitetable setEditing:YES animated:YES];
        [_jobsitetable reloadData];
        
    }
}
- (IBAction)viewbtn:(id)sender {
    viewclck=1;
    
    if (tabtype==2) {
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.accebilitytable];
    NSIndexPath *textFieldIndexPath = [self.accebilitytable indexPathForRowAtPoint:rootViewPoint];
    fetchindex=textFieldIndexPath.row;
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
   [self AccessFetchImage];
    
    }
 else   if (tabtype==1) {
        
        
        button = (UIButton *)sender;
        CGPoint center= button.center;
        CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.ESAtble];
        NSIndexPath *textFieldIndexPath = [self.ESAtble indexPathForRowAtPoint:rootViewPoint];
        
        NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
        fetchindex=textFieldIndexPath.row;
        [self FetchImage];
     
        
        }

   else if (tabtype==3) {
       
        button = (UIButton *)sender;
        CGPoint center= button.center;
        CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.meetingtable];
        NSIndexPath *textFieldIndexPath = [self.meetingtable indexPathForRowAtPoint:rootViewPoint];
        fetchindex=textFieldIndexPath.row;
        NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
       
        SitevistMdl *sitemdl1=(SitevistMdl *)[_meetgarray objectAtIndex:fetchindex];
       if (sitemdl1.typvalue==0) {
            [self meetingFetchImage];
       }
       else
       {
           self.newrecordVCtrl=[[NewrecordViewController alloc]initWithNibName:@"meetingnoterecordaddview" bundle:nil];
           self.newrecordVCtrl.delegate=self;
           self.newrecordVCtrl.datendtime=sitemdl1.meetingdate;
           self.newrecordVCtrl.details=sitemdl1.meetingdetails;
            self.newrecordVCtrl.viewtype=4;
//           self.newrecordVCtrl.companyid=_companyid;
//           self.newrecordVCtrl.tabtype=tabtype;
           self.newrecordVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
           [self presentViewController:_newrecordVCtrl
                              animated:YES completion:NULL];
       }
       
    }
    else   if (tabtype==4) {
        
        
        button = (UIButton *)sender;
        CGPoint center= button.center;
        CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.notestable];
        NSIndexPath *textFieldIndexPath = [self.notestable indexPathForRowAtPoint:rootViewPoint];
        
        NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
        fetchindex=textFieldIndexPath.row;
        SitevistMdl *sitemdl1=(SitevistMdl *)[_notearray objectAtIndex:fetchindex];
        if (sitemdl1.notetype==0) {
            [self notesFetchImage];
        }
        else
        {
            self.newrecordVCtrl=[[NewrecordViewController alloc]initWithNibName:@"Addnoterecordview" bundle:nil];
                       self.newrecordVCtrl.delegate=self;
            self.newrecordVCtrl.displaydate=sitemdl1.notedate;
            self.newrecordVCtrl.displaynote=sitemdl1.Notes;
            self.newrecordVCtrl.viewtype=4;
            //           self.newrecordVCtrl.companyid=_companyid;
            //           self.newrecordVCtrl.tabtype=tabtype;
            self.newrecordVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
            [self presentViewController:_newrecordVCtrl
                               animated:YES completion:NULL];
        }
        
        
        
    }

}
@end
