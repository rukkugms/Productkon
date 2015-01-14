//
//  ProcesshrViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 2/10/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "ProcesshrViewController.h"

@interface ProcesshrViewController ()

@end
#define DEFAULT_ROW_HEIGHT 78
#define HEADER_HEIGHT 60


@implementation ProcesshrViewController
@synthesize imgString;

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
    _jobviews.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _view1.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
    
    /*tablewidth*/
    
    
    _processtable.layer.borderWidth = 2.0;
    _processtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    /*searchbar*/
    _SearchingBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _SearchingBar.delegate = (id)self;
    _SearchingBar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.processtable.tableHeaderView =_SearchingBar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_SearchingBar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;
    _popoverdisarray=[[NSMutableArray alloc]initWithObjects:@"verification",@"Send To Employee", nil];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self AllSkills];
}

#pragma mark - webservice


-(void)ListAllApplicants{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ListAllApplicants xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</ListAllApplicants>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ListAllApplicants" forHTTPHeaderField:@"Soapaction"];
    
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
    imgString=@"skill";
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

-(void)SearchApplicants{
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SearchApplicants xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</SearchApplicants>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SearchApplicants" forHTTPHeaderField:@"Soapaction"];
    
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
    
    if ([imgString isEqualToString:@"skill"]) {
        
        [self ListAllApplicants];
        imgString=@"";
    }
    
    
    if([imgString isEqualToString:@"Fetchapp"])
    {
        
        for (int i=0; i<[_empnameArray count]; i++) {
            Empdetails*empdetls1=(Empdetails *)[_empnameArray objectAtIndex:i];
            if ([empdetls1.Inproceesstatus isEqualToString:@"true"]) {
                [_newprocesssarray addObject:empdetls1];
                
            }
            
            
        }

        self.sectionArray=[[NSMutableArray alloc]init];
        for (int i=0; i<[_newprocesssarray count]; i++) {
            Empdetails*empdet=(Empdetails *)[_newprocesssarray objectAtIndex:i];
            Section *section=[[Section alloc]init];
            NSString*ssn=[empdet.ssn stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            NSString*firstname=[empdet.firstname stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            NSString*lastname=[empdet.lastname stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            NSString*phoneno=[empdet.Phonenumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            NSString*skill=[empdet.skillid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            
            
            
            
            
            NSString *newstr2=[NSString stringWithFormat:@"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t%@\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t%@",phoneno,skill];
            section.sectionHeader=[NSString stringWithFormat:@"%@\t\t\t\t\t%@\t\t\t\t\t%@\t\t\t\t\t%@",ssn,firstname,lastname,newstr2];
            
            //section.sectionHeader=[NSString stringWithFormat:@"%@\t\t\t\t\t%@\t\t\t\t\t%@\t\t\t\t\t\t\t\t\t\t\t\t%@\t\t\t\t\t\t\t\t\t\t\t\t%@",empdet.ssn,empdet.firstname,empdet.lastname,phoneno,empdet.skillid] ;
            //section.sectionname=[NSString stringWithFormat:@"%@",empdet.firstname];
            section.sectionRows=[[NSMutableArray alloc]init];
            
            //for (int i=0; i<=1; i++) {
            [section.sectionRows addObject:[NSString stringWithFormat:@"Details %d",1]];
            //}
            [self.sectionArray addObject:section];
        }
        self.processtable.sectionHeaderHeight = HEADER_HEIGHT;
        self.openSectionIndex = NSNotFound;
        self.openviewIndex=NSNotFound;
        
        
        
        //[_processtable reloadData];
        
        
        [_processtable reloadData];
        imgString=@"";
        
    }
    
    
   // [_popOverTableView reloadData];
    
}

#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ListAllApplicantsResult"])
    { imgString=@"Fetchapp";
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
    if([elementName isEqualToString:@"applicant_State"])
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
     if([elementName isEqualToString:@"SearchApplicantsResponse"])
    {
        imgString=@"Fetchapp";
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
    { recordResults = FALSE;
        _empdetl.skillid=[_SkillDict objectForKey:_soapResults];
        
        
        
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
        [_empnameArray addObject:_empdetl];
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

#pragma mark-Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
return [_sectionArray count];
    
    }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
Section *aSection=[_sectionArray objectAtIndex:section];
    // Return the number of rows in the section.
return aSection.open ? [aSection.sectionRows count]:0;
//return aSection.open ? 1:0;
        
// Return the number of rows in the section.
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    return cell;
}


#pragma mark-tableview section

-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
    
    Section *aSection;
    /*
     Create the section header views lazily.
     */
    
        
        aSection=[_sectionArray objectAtIndex:section];
        if (!aSection.newsectionHeaderView) {
            aSection.newsectionHeaderView = [[Processsectionheaderview alloc] initWithFrame:CGRectMake(0.0, 0.0, self.processtable.bounds.size.width, HEADER_HEIGHT) title:aSection.sectionHeader section:section delegate:self];
            NSLog(@"sectn%d",section);
            Empdetails*empdetls2=(Empdetails *)[_newprocesssarray objectAtIndex:section];
            NSLog(@"sectn%@",empdetls2.Inproceesstatus);
         
            //aSection.newsectionHeaderView.DetailButton.hidden=YES;
                //aSection.newsectionHeaderView.animatedview.userInteractionEnabled=NO;
            aSection.newsectionHeaderView.proecsslbl.text=@"Verification";
            
                CAGradientLayer *gradient = [CAGradientLayer layer];
                gradient.frame =  aSection.newsectionHeaderView.bounds;
                gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
                [ aSection.newsectionHeaderView.layer insertSublayer:gradient atIndex:0];
                
                   }
        
return aSection.newsectionHeaderView;

}
-(void)sectionHeaderView:(Processsectionheaderview *)sectionHeaderView viewopened:(NSInteger)viewopened{
    
    //Section *aSection = [self.sectionArray objectAtIndex:viewopened];
    
    selectedsectn=viewopened;
    Empdetails*empdet=(Empdetails *)[_newprocesssarray objectAtIndex:viewopened];
    _Applicantid=empdet.applicantid;

    
    NSInteger previousOpenviewIndex = self.openviewIndex;
    
    if (previousOpenviewIndex != NSNotFound) {
        Section *previousOpenSection=[_sectionArray objectAtIndex:previousOpenviewIndex];
        previousOpenSection.open=NO;
        [previousOpenSection.newsectionHeaderView showviewWithUserAction:NO];
        NSInteger countOfRowsToDelete = [previousOpenSection.sectionRows count];
        
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            previousOpenSection.newsectionHeaderView.proecsslbl.hidden=YES;
            previousOpenSection.newsectionHeaderView.proecsslbl2.hidden=YES;

            [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{   previousOpenSection.newsectionHeaderView.animatedview
                .frame =  CGRectMake(250, 5, 0, 0);} completion:nil];
            
            previousOpenSection.newsectionHeaderView.animatedview.hidden=YES;
            
            [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{   previousOpenSection.newsectionHeaderView.animatedview2
                .frame =  CGRectMake(250, 30, 0, 0);} completion:nil];
            
            previousOpenSection.newsectionHeaderView.animatedview2.hidden=YES;
            
            
        }
        
        
    }
    
    self.openviewIndex=viewopened;
    
    
    
}
-(void)sectionHeaderView:(Processsectionheaderview *)sectionHeaderView viewclosed:(NSInteger)viewclosed{
    
    Section *aSection = [self.sectionArray objectAtIndex:viewclosed];
	
    aSection.open = NO;
    
    
    self.openviewIndex = NSNotFound;
    
    
}

-(void)navigatetoVctrl:(NSInteger )s{
   
    NSLog(@"sectn%d",s);
  //  if (!_DetailproVCtrl) {
        self.DetailproVCtrl=[[DetailproHrViewController alloc]initWithNibName:@"DetailproHrViewController" bundle:nil];
  //  }
    
    _DetailproVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    _DetailproVCtrl.Applicantarray=_newprocesssarray;
    _DetailproVCtrl.path=s;

    [self presentViewController:_DetailproVCtrl
                       animated:YES completion:NULL];
}

-(void)Jobview:(NSString *)nwstrg{
    //_jobviews.hidden=NO;
    //if (!_verifictnVCtrl) {
        self.verifictnVCtrl=[[VerificationViewController alloc]initWithNibName:@"NVerificationViewController" bundle:nil];
    //}
    
    //_verifictnVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    _verifictnVCtrl.applicantid=_Applicantid;
    [self presentViewController:_verifictnVCtrl
                       animated:YES completion:NULL];

}
-(void)senttojob:(NSString *)nwstrg{
   // if (!_verifictnVCtrl) {
        self.verifictnVCtrl=[[VerificationViewController alloc]initWithNibName:@"SendEmployeeview" bundle:nil];
   // }
    
    _verifictnVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _verifictnVCtrl.applicantid=_Applicantid;
    [self presentViewController:_verifictnVCtrl
                       animated:YES completion:NULL];
}

#pragma mark-popover
-(void)commentpopover{
    
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 531, 544)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    
    
    //[popoverView addSubview:self.commentview];
    //self.commentview.hidden=NO;
    // CGRect rect = frame;
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(531, 544);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    //    UIButton *button=(UIButton *)nil;
    //
    //    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    //    UITableView *table = (UITableView *)[cell superview];
    //    NSIndexPath *IndexPath = [table indexPathForCell:cell];
    //
    
    
    
    [self.popOverController presentPopoverFromRect: CGRectMake(380, 120, 300, 500)                                        inView:self.view
                          permittedArrowDirections:nil
                                          animated:YES];
    
    
    
}
#pragma mark - SearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self SearchApplicants];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self ListAllApplicants];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([_SearchingBar.text length]==0) {
        
        [searchBar resignFirstResponder];
        [self ListAllApplicants];
        
    }
    else  if ([_SearchingBar.text length]>0) {
        
        
        
        
        _searchstring=_SearchingBar.text;
        
        
    }
    
}


#pragma mark-Button Actions

- (IBAction)prcessclsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)jobclsebtn:(id)sender {
       _jobviews.hidden=YES;
}

@end
