//
//  InprocessViewController.m
//  Newproject
//
//  Created by Riya on 10/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "InprocessViewController.h"

@interface InprocessViewController ()

@end

@implementation InprocessViewController

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
    //[self AllSkills];
 

    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _processtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _processtable.layer.borderWidth=3.0f;
    
    /*searchbar*/
    _SearchingBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _SearchingBar.delegate = (id)self;
    _SearchingBar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.processtable.tableHeaderView =_SearchingBar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_SearchingBar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;
    _popoverdisarray=[[NSMutableArray alloc]initWithObjects:@"Verification",@"Send To Employee", nil];


}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self ListAllApplicants];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)newaction
{
    _SearchingBar.text=@"";
    [self ListAllApplicants];
}


#pragma mark - webservice


-(void)ListAllApplicants{
    webtype=2;
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<HRProcessselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</HRProcessselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/HRProcessselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)AllSkills{
     webtype=1;
    //imgString=@"skill";
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<AllSkills xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</AllSkills>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/AllSkills" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)HREmployeeProcessSearch{
    webtype=2;
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<HREmployeeProcessSearch xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</HREmployeeProcessSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/HREmployeeProcessSearch" forHTTPHeaderField:@"Soapaction"];
    
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
   
//    if (webtype==1) {
//        [self ListAllApplicants];
//    }
    if(webtype==2){
    
//    for (int i=0; i<[_empnameArray count]; i++) {
//        Empdetails*empdetls1=(Empdetails *)[_empnameArray objectAtIndex:i];
//        if ([empdetls1.Inproceesstatus isEqualToString:@"true"]) {
//            [_newprocesssarray addObject:empdetls1];
//            
//        }
//        
//        
//    }
        webtype=0;
          [_processtable reloadData];
    }
    else if(webtype==3){
         [_processtable reloadData];
    }
    
}
#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"HRProcessselectResponse"])
    { //imgString=@"Fetchapp";
        _empnameArray=[[NSMutableArray alloc]init];
        _newprocesssarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"applicant_Id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_FirstName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_LastName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_SSN"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"applicant_CellPhone"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    
    if([elementName isEqualToString:@"applicant_Skill"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"applicant_EmergencyContactNo"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_DOB"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_Zip"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_Address"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_City"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_DrivingLicense"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_NameinLicense"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    
    
    
    if([elementName isEqualToString:@"applicant_EmergencyContact"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"applicant_Gender"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"applicant_AlternateNo"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"BasicPlusExpiry"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_TWIC"])
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
    if([elementName isEqualToString:@"applicant_State"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"jobsitename"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    
    if([elementName isEqualToString:@"BasicPlus"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_Email"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"applicant_phone"])
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

    if([elementName isEqualToString:@"applicant_LicenseState"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"country_name"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"InProcess"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BGStatus"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"SSNStatus"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"I9Status"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    
    if([elementName isEqualToString:@"applicant_photo"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"AllSkillsResult"])
    {
        _SkillDict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"SkillId"])
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
    if([elementName isEqualToString:@"HREmployeeProcessSearchResponse"])
    {
        //imgString=@"Fetchapp";
        _empnameArray=[[NSMutableArray alloc]init];
        _newprocesssarray=[[NSMutableArray alloc]init];
        
        
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
    if([elementName isEqualToString:@"applicant_Id"])
    {
        _empdetl=[[Empdetails alloc]init];
        recordResults = FALSE;
        _empdetl.applicantid=[_soapResults integerValue];
        
        //[self FetchImage];
        /*fetchapplicant*/
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_FirstName"])
    {
        recordResults = FALSE;
        _empdetl.firstname=_soapResults;
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_LastName"])
    {
        recordResults = FALSE;
        //  [_empnameArray addObject:[NSString stringWithFormat:@"%@ %@",_teststrng,_soapResults]];
        _empdetl.lastname=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_SSN"])
    {
        recordResults = FALSE;
        _empdetl.ssn=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"applicant_CellPhone"])
    { recordResults = FALSE;
        _empdetl.Phonenumber=_soapResults;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"applicant_Skill"])
    {
        recordResults = FALSE;
        //_empdetl.skillid=[_SkillDict objectForKey:_soapResults];
        
        
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"SkillName"])
    {
        recordResults = FALSE;
        _empdetl.skillid=_soapResults;
        
        
        
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"EmployeeStatus"])
    {
        recordResults = FALSE;
        _empdetl.empstatus=_soapResults;
        if ([_empdetl.empstatus isEqualToString:@"true"]) {
            _empdetl.emp=1;
            
        }
        else{
            _empdetl.emp=0;
        }
        _soapResults = nil;
        
    }
    
    
    if([elementName isEqualToString:@"applicant_EmergencyContactNo"])
    {
        recordResults = FALSE;
        _empdetl.emergencycontact=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"applicant_DOB"])
    {
        recordResults = FALSE;
        _empdetl.dob=_soapResults;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"applicant_Zip"])
    {
        recordResults = FALSE;
        _empdetl.zip=_soapResults;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"applicant_State"])
    {
        recordResults = FALSE;
        _empdetl.state=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"applicant_Address"])
    {
        recordResults = FALSE;
        _empdetl.address=_soapResults;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"applicant_City"])
    {
        recordResults = FALSE;
        _empdetl.city=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"applicant_DrivingLicense"])
    {
        recordResults = FALSE;
        _empdetl.drivinglicenceno=_soapResults;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"applicant_NameinLicense"])
    {
        recordResults = FALSE;
        _empdetl.nameinlicence=_soapResults;
        _soapResults = nil;
    }
    
    
    
    
    if([elementName isEqualToString:@"applicant_EmergencyContact"])
    {
        recordResults = FALSE;
        _empdetl.emergencycontactname=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"applicant_Gender"])
    {
        recordResults = FALSE;
        _empdetl.gender=_soapResults;
        _soapResults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"applicant_AlternateNo"])
    {
        recordResults = FALSE;
        _empdetl.alternativeno=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"BasicPlusExpiry"])
    {
        recordResults = FALSE;
        _empdetl.basicplusexp=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_TWIC"])
    {
        recordResults = FALSE;
        _empdetl.twiccardno=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"BasicPlus"])
    {
        recordResults = FALSE;
        _empdetl.basicplus=_soapResults;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"applicant_Email"])
    {
        recordResults = FALSE;
        _empdetl.email=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"applicant_phone"])
    {
        recordResults = FALSE;
        _empdetl.phone=_soapResults;
        _soapResults = nil;
        
    }
    
    
    if([elementName isEqualToString:@"applicant_LicenseState"])
    {
        recordResults = FALSE;
        _empdetl.stateissuinglicence=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"country_name"])
    {
        recordResults = FALSE;
        _empdetl.country=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"applicant_photo"])
    {
        recordResults = FALSE;
        _empdetl.photo=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"InProcess"])
    {
        recordResults = FALSE;
        _empdetl.Inproceesstatus=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"Description"])
    {
        recordResults = FALSE;
        _empdetl.othercraft=_soapResults;
      
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"jobsitename"])
    {
        recordResults = FALSE;
        _empdetl.jobsitename=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"BGStatus"])
    {
        recordResults = FALSE;
        _empdetl.bgstatus=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SSNStatus"])
    {
        recordResults = FALSE;
        _empdetl.ssnstatus=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"I9Status"])
    {
        recordResults = FALSE;
        _empdetl.i9status=_soapResults;
        
        [_newprocesssarray addObject:_empdetl];
        _soapResults = nil;
        
    }


    if([elementName isEqualToString:@"SkillId"])
    {
        recordResults = FALSE;
        _empskillid=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SkillName"])
    {        recordResults =FALSE;
        [_SkillDict setObject:_soapResults forKey:_empskillid];
        _soapResults = nil;
        
        
    }

}
#pragma mark-tableview datasources
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        return  [_popoverdisarray count];
    }
    else{
    return [_newprocesssarray count];
    //return 1;
    }
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if (tableView==_processtable) {
        [[NSBundle mainBundle]loadNibNamed:@"Inprocesscell" owner:self options:nil];
        //cell=_mgmtcell;
        cell=_processcell;
        }
         cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    }
     if (tableView==_processtable) {
    Empdetails*empmdl=(Empdetails *)[_newprocesssarray objectAtIndex:indexPath.row];
    _ssnlbl=(UILabel *)[cell viewWithTag:1];
   _ssnlbl.text=empmdl.ssn;
    _firstnamelbl=(UILabel *)[cell viewWithTag:2];
   _firstnamelbl.text=empmdl.firstname;
   _lastnamelbl=(UILabel *)[cell viewWithTag:3];
   _lastnamelbl.text=empmdl.lastname;
    _cellphonelbl=(UILabel *)[cell viewWithTag:4];
    _cellphonelbl.text=empmdl.Phonenumber;
    _skilllbl=(UILabel *)[cell viewWithTag:5];
   _skilllbl.text=empmdl.skillid;
    _craftlbl=(UILabel *)[cell viewWithTag:6];
    _craftlbl.text=empmdl.othercraft;
    _jobsitelbl=(UILabel *)[cell viewWithTag:7];
    _jobsitelbl.text=empmdl.jobsitename;

     }
     if (tableView==_popOverTableView) {
         
         cell.textLabel.text=[_popoverdisarray objectAtIndex:indexPath.row];
     }
    
   
    
    return cell;
}


#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"sectn%d",indexPath.section);
    if (tableView==_popOverTableView) {
        
        if (indexPath.row==0) {
            
            self.verifictnVCtrl=[[VerificationViewController alloc]initWithNibName:@"NVerificationViewController" bundle:nil];
            
            
            //_verifictnVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
            _verifictnVCtrl.applicantid=_Applicantid;
             _verifictnVCtrl.delegate=self;
            [self dismissViewControllerAnimated:YES completion:^{   [self presentViewController:_verifictnVCtrl
                                                                                       animated:YES completion:NULL];
                
            }];

        }
        if (indexPath.row==1) {
              Empdetails*empmdl=(Empdetails *)[_newprocesssarray objectAtIndex:btnindex];
            if ([empmdl.ssnstatus isEqualToString:@"true"]&&[empmdl.bgstatus isEqualToString:@"true"]&&[empmdl.i9status isEqualToString:@"true"]) {
              
                
            

            
            self.verifictnVCtrl=[[VerificationViewController alloc]initWithNibName:@"SendEmployeeview" bundle:nil];
            // }
            
            _verifictnVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
            _verifictnVCtrl.delegate=self;
            _verifictnVCtrl.applicantid=_Applicantid;
                [self dismissViewControllerAnimated:YES completion:^{   [self presentViewController:_verifictnVCtrl
                                                                                           animated:YES completion:NULL];
                    
                }];
            }
            else{
                
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Verification not completed/Verification Failed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                
            }

        }

        
        
    }
           [self.popOverController dismissPopoverAnimated:YES];
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color)
    if (tableView==_processtable) {
        
    
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
    }else
    {
        
        //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
        [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
        
        
        
    }
    }
}
#pragma mark - SearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
      _searchstring=_SearchingBar.text;
    [self HREmployeeProcessSearch];
    [searchBar resignFirstResponder];
    
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self ListAllApplicants];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([_SearchingBar.text length]==0) {
        
        
        [self ListAllApplicants];
        [searchBar resignFirstResponder];
        
    }
//    else  if ([_SearchingBar.text length]>0) {
//        
//        
//        
//        
//        _searchstring=_SearchingBar.text;
//        
//        
//    }
    
}
#pragma mark - Actions

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)firstdisclurebtn:(id)sender {
    
    button = (UIButton *)sender;
  
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.processtable];
    NSIndexPath *textFieldIndexPath = [self.processtable indexPathForRowAtPoint:rootViewPoint];
    self.DetailproVCtrl=[[DetailproHrViewController alloc]initWithNibName:@"DetailproHrViewController" bundle:nil];
    
    
    _DetailproVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    _DetailproVCtrl.Applicantarray=_newprocesssarray;
    _DetailproVCtrl.path=textFieldIndexPath.row;
    NSLog(@"path%d",textFieldIndexPath.row);
    
[self presentViewController:_DetailproVCtrl
                       animated:YES completion:NULL];
}

- (IBAction)seconddisclsurebtn:(id)sender {
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 150, 70)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 150, 70)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 36;
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(150, 70);
    
    //create a popover controller
    
    button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.processtable];
    NSIndexPath *textFieldIndexPath = [self.processtable indexPathForRowAtPoint:rootViewPoint];
    btnindex=textFieldIndexPath.row;
    Empdetails*empdet=(Empdetails *)[_newprocesssarray objectAtIndex:textFieldIndexPath.row];
    _Applicantid=empdet.applicantid;
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popOverController.popoverContentSize=CGSizeMake(150.0f, 70.0f);
    self.popOverController=_popOverController;
    [self.popOverController presentPopoverFromRect:_secnddisbtnlbl.frame
                                            inView:cell
                          permittedArrowDirections:UIPopoverArrowDirectionLeft
                                          animated:YES];

}
@end
