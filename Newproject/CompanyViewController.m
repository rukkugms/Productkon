//
//  CompanyViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 19/06/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "CompanyViewController.h"

@interface CompanyViewController ()

@end

@implementation CompanyViewController
@synthesize popoverContent;
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
    self.scroll.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    
   
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    
    _logoimg.layer.borderWidth = 2.0;
    _logoimg.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;

 
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_statebtn setTitle:[_statearray objectAtIndex:0] forState:UIControlStateNormal];
    [_coutryBtn setTitle:[_countryarray objectAtIndex:214] forState:UIControlStateNormal];
   
    [self countryselect];
    [self Stateselect];


   [self Getbasicinfo];
  //  _logoweb.scrollView.scrollEnabled=NO;
   
   
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.view.bounds = CGRectMake(0, 0, 768, 768);
    _scroll.frame=CGRectMake(0,50,768, 768);
    [_scroll setContentSize:CGSizeMake(768,1090)];
    //[self.view addSubview:_scroll];
    //self.scroll.bounds = CGRectMake(0, 0, 768, 768);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - webservice


-(void)Getbasicinfo{
    [_activitybtn startAnimating];
    recordResults = FALSE;
    NSString *soapMessage;

    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetBasicInfo xmlns=\"http://test.kontract360.com/\">\n"
                   "</GetBasicInfo>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
   // NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
     [theRequest addValue: @"http://test.kontract360.com/GetBasicInfo" forHTTPHeaderField:@"Soapaction"];
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

-(void)SaveBasicInfo{
    recordResults = FALSE;
    NSString *soapMessage;
     NSString * letter=@"";
    NSString *stid;
    NSString *ctid;
    stid=[_statedict objectForKey:_statebtn.titleLabel.text];
    ctid=[_countrydict objectForKey:_coutryBtn.titleLabel.text];
    NSLog(@"soapmsg%@",stid);
     NSLog(@"soapmsg%@",ctid);
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SaveBasicInfo xmlns=\"http://test.kontract360.com/\">\n"
                   "<CompanyName>%@</CompanyName>\n"
                   "<Address>%@</Address>\n"
                   "<City>%@</City>\n"
                   "<State>%@</State>\n"
                   "<Zip>%@</Zip>\n"
                   "<Country>%@</Country>\n"
                   "<Phone>%@</Phone>\n"
                   "<Fax>%@</Fax>\n"
                   "<email>%@</email>\n"
                   "<WebSite>%@</WebSite>\n"
                   "<FederalEmployerId>%@</FederalEmployerId>\n"
                   "<StateEmployerId>%@</StateEmployerId>\n"
                   "<StateUnemploymentId>%@</StateUnemploymentId>\n"
                   
                   "</SaveBasicInfo>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companynametxtfld.text,_addresstxtfld.text,_citytxtfld.text,stid,_ziptextfld.text,ctid,_phonetxtfld.text,_faxtxtfld.text,_mailtxtfld.text,_webtxtfld.text,_fedraltxtfld.text,_stateempIdtxtfld.text,_stateunempidtxtfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SaveBasicInfo" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Stateselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Stateselect xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "</Stateselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Stateselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)countryselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Countryselect xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "</Countryselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Countryselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UserLogmaininsert{
    
    recordResults = FALSE;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // NSLog(@"Date %@",[formatter stringFromDate:date]);
    NSString*curntdate=[formatter stringFromDate:date];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*useridname = [defaults objectForKey:@"Userid"];
    NSString*extnalip=[defaults objectForKey:@"Externalip"];
    NSString*intrnalip=[defaults objectForKey:@"Internalip"];
    NSString*Udid=[defaults objectForKey:@"UDID"];
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserLogmaininsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<dateandtime>%@</dateandtime>\n"
                   "<userid>%d</userid>\n"
                   "<moduleid>%d</moduleid>\n"
                   "<Action>%@</Action>\n"
                   "<platform>%@</platform>\n"
                   "<externalip>%@</externalip>\n"
                   "<internalip>%@</internalip>\n"
                   "<devicenumber>%@</devicenumber>\n"
                    "<documentId>%d</documentId>\n"
                   "</UserLogmaininsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],_moduleid,@"Create",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserLogmaininsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UserLogmainview{
    
    recordResults = FALSE;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // NSLog(@"Date %@",[formatter stringFromDate:date]);
    NSString*curntdate=[formatter stringFromDate:date];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*useridname = [defaults objectForKey:@"Userid"];
    NSString*extnalip=[defaults objectForKey:@"Externalip"];
    NSString*intrnalip=[defaults objectForKey:@"Internalip"];
    NSString*Udid=[defaults objectForKey:@"UDID"];
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserLogmaininsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<dateandtime>%@</dateandtime>\n"
                   "<userid>%d</userid>\n"
                   "<moduleid>%d</moduleid>\n"
                   "<Action>%@</Action>\n"
                   "<platform>%@</platform>\n"
                   "<externalip>%@</externalip>\n"
                   "<internalip>%@</internalip>\n"
                   "<devicenumber>%@</devicenumber>\n"
                    "<documentId>%d</documentId>\n"
                   "</UserLogmaininsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],_moduleid,@"View",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserLogmaininsert" forHTTPHeaderField:@"Soapaction"];
    
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
    [_popOverTableView reloadData];
      
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"GetBasicInfoResult"])
    {
       
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

    if([elementName isEqualToString:@"CompanyName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Address"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"City"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"State_Name"])
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
    if([elementName isEqualToString:@"countryname"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Phone"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    
    if([elementName isEqualToString:@"Fax"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    
    if([elementName isEqualToString:@"email"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"WebSite"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"FederalEmployerId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"StateUnemploymentId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }



    if([elementName isEqualToString:@"StateEmployerId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"LetterHead"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"StateselectResult"])
    {
        _statearray=[[NSMutableArray alloc]init];
        _statedict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"state_id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"state_name"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CountryselectResult"])
    {
        _countryarray=[[NSMutableArray alloc]init];
        _countrydict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CountryCode"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CountryName"])
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
    if([elementName isEqualToString:@"GetBasicInfoResult"])
    {
        
        recordResults = FALSE;
                
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }



    if([elementName isEqualToString:@"CompanyName"])
    {
        
        recordResults = FALSE;
        _companynametxtfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Address"])
    {
        
        recordResults = FALSE;
        _addresstxtfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"City"])
    {
        
        recordResults = FALSE;
        _citytxtfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"State_Name"])
    {
        
        recordResults = FALSE;
        [_statebtn setTitle:_soapResults forState:UIControlStateNormal];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Zip"])
    {
        
        recordResults = FALSE;
        _ziptextfld.text=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"countryname"])
    {
        
        recordResults = FALSE;
         // NSString*abc=  [_soapResults uppercaseString];
       [_coutryBtn setTitle:_soapResults forState:UIControlStateNormal];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Phone"])
    {
        
        recordResults = FALSE;
        _phonetxtfld.text=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Fax"])
    {
        
        recordResults = FALSE;
        _faxtxtfld.text=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"email"])
    {
        
        recordResults = FALSE;
        _mailtxtfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"WebSite"])
    {
        
        recordResults = FALSE;
        _webtxtfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FederalEmployerId"])
    {
        
        recordResults = FALSE;
        _fedraltxtfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"StateEmployerId"])
    {
        
        recordResults = FALSE;
        _stateempIdtxtfld.text=_soapResults;
        
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"StateUnemploymentId"])
    {
        
        recordResults = FALSE;
        _stateunempidtxtfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"LetterHead"])
    {
        
        recordResults = FALSE;
        NSString *fullURL =[NSString stringWithFormat:@"http://test.kontract360.com/Files/Docs/BasicInfo/%@",_soapResults]  ;
       // NSURL *url = [NSURL URLWithString:fullURL];
        //NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        //[_logoweb loadRequest:requestObj];
        
        
       NSString *htmlString = @"<html><body><img src='%@' width='965%' height='518%'></body></html>";
        NSString *imageHTML  = [[NSString alloc] initWithFormat:htmlString, fullURL];
        _logoweb.scalesPageToFit = YES;
        [_logoweb loadHTMLString:imageHTML baseURL:nil];
        [_activitybtn stopAnimating];

        
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"state_id"])
    {
        recordResults = FALSE;
        stateid=_soapResults;
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"state_name"])
    {
        recordResults = FALSE;
  
        [_statearray addObject:_soapResults];
        [_statedict setObject:stateid forKey:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CountryCode"])
    {
        recordResults = FALSE;
        cuntryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CountryName"])
    {
        recordResults = FALSE;
        //  NSString*abc=  [_soapResults uppercaseString];
        [_countryarray addObject:_soapResults];
        [_countrydict setObject:cuntryid forKey:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        recordResults = FALSE;
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        _savebtn.enabled=YES;
         _soapResults = nil;
    }



}


#pragma mark - Buttons
- (IBAction)statebtn:(id)sender {
    poptype=1;
    [self createpopover];
    [self Stateselect];
    
    
}

- (IBAction)cuntrybtn:(id)sender {
    poptype=2;
    [self createpopover];
    [self countryselect];
    }

- (IBAction)savebtn:(id)sender {
    
    [self UserLogmaininsert];
       Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    
    if (rightsmodel.EditModule==0) {
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You dont have rights to edit this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else
    {
        
        

    
    Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_stateempIdtxtfld.text];
        int value2=[val isNumeric:_stateunempidtxtfld.text];
        int value3=[val isNumeric:_fedraltxtfld.text];
         int value4=[val isNumeric:_ziptextfld.text];
   int value5 = [val validEmailAddress:_mailtxtfld.text];
    int value6=[val validateUrl:_webtxtfld.text];
    
        
    if ([_companynametxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length ==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Company Name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
        
    else if ([_addresstxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length ==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Address is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
        
    else if([_citytxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length ==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"City is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if (([_statebtn.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length ==0)||[_statebtn.titleLabel.text isEqualToString:@"Select"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"State is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else  if ([_phonetxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length ==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Phone Number is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if (([_mailtxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length ==0)) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Email is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_faxtxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length ==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Fax is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_webtxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length ==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Website is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }

   else if(value5==0){
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
       }
      else    if(value6==0){
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Website" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }


       else if(value1==0)
        {
            
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid State Employer ID" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
        else if(value2==0)
        {
            
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid State Unemployment ID" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
       else if(value3==0)
        {
            
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Federal Employer ID" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
    
       else  if(value4==0)
    
       {
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Zip" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert1 show];
        
        
    }

    
    
    
         else
    {
    [self SaveBasicInfo];
    _savebtn.enabled=NO;

    }

}
    }


-(IBAction)cancel:(id)sender
{
    
}
-(IBAction)closethecompany:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    [_scroll setContentOffset:CGPointZero animated:YES];
      _updatelbl.hidden=YES;
}
#pragma mark-textfld delegates
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField==_companynametxtfld)
    {
        NSUInteger newLength = [_companynametxtfld.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    if(textField==_addresstxtfld)
    {
        NSUInteger newLength = [_addresstxtfld.text length] + [string length] - range.length;
        return (newLength > 200) ? NO : YES;
    }
    if(textField==_citytxtfld)
    {
        NSUInteger newLength = [_citytxtfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
    
    if(textField==_statetextfld)
    {
        NSUInteger newLength = [_statetextfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
    if(textField==_ziptextfld)
    {
        NSUInteger newLength = [_ziptextfld.text length] + [string length] - range.length;
        return (newLength > 10) ? NO : YES;
    }
    
    if(textField==_faxtxtfld)
    {
        NSUInteger newLength = [_faxtxtfld.text length] + [string length] - range.length;
        return (newLength > 12) ? NO : YES;
    }
    if(textField==_fedraltxtfld)
    {
        NSUInteger newLength = [_fedraltxtfld.text length] + [string length] - range.length;
        return (newLength > 30) ? NO : YES;
    }
    if(textField==_stateempIdtxtfld)
    {
        NSUInteger newLength = [_stateempIdtxtfld.text length] + [string length] - range.length;
        return (newLength > 30) ? NO : YES;
    }
    if(textField==_phonetxtfld)
    {
        NSUInteger newLength = [_phonetxtfld.text length] + [string length] - range.length;
        return (newLength > 12) ? NO : YES;
    }
    if(textField==_mailtxtfld)
    {
        NSUInteger newLength = [_mailtxtfld.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    
    if(textField==_webtxtfld)
    {
        NSUInteger newLength = [_webtxtfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
    if(textField==_stateunempidtxtfld)
    {
        NSUInteger newLength = [_stateunempidtxtfld.text length] + [string length] - range.length;
        return (newLength > 30) ? NO : YES;
    }
    
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
        if(textField==_faxtxtfld)
        {
            faxnoString=_faxtxtfld.text;
            if ([faxnoString length]<10) {
                if([faxnoString isEqualToString:@""])
                {
                    
                }
                else
                {
                    fmt=1;
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Fax Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
            }
            else
            {
                
                
                Validation*val=[[Validation alloc]init];
                int value1=[val isdataformat:_faxtxtfld.text];
                if(value1==0)
                {
                    UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Fax Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert1 show];
                    
                    
                }
                else

                {
                faxnoString=_faxtxtfld.text;

                //checking a particular charector
                // NSString *connectstring;
                NSString*new=[faxnoString substringWithRange:NSMakeRange(3, 1)];
                NSString*new1=[faxnoString substringWithRange:NSMakeRange(7, 1)];
                
                
                
                NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
                NSString *resultString = [[faxnoString componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
                NSLog (@"Result: %@", resultString);
                if ([resultString length]<=9){
                    
                    fmt=1;
                    
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Fax Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
                
                if ([faxnoString length]==12) {
                    
                    
                    
                    
                    
                    
                    if ([new  isEqualToString:@"-"]&&[new1  isEqualToString:@"-"]) {
                        _faxfmtstring=faxnoString;
                        fmt=2;
                    }
                    else
                    {
                        fmt=1;
                        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Fax Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                        
                        [alert show];
                    }
                    
                }
                
                
                
                if ([resultString length]==10){
                    
                    
                    fmt=2;
                    
                    NSString *subString = [resultString substringWithRange:NSMakeRange(0,3)];
                    NSLog(@"%@",subString);
                    NSString *substring2=[resultString  substringWithRange:NSMakeRange(3,3)];
                    NSLog(@"%@",substring2);
                    NSString *substring3=[resultString  substringWithRange:NSMakeRange(6,4)];
                    NSLog(@"%@",substring3);
                    _faxfmtstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
                    NSLog(@"%@",_faxfmtstring);
                    
                    
                    
                    
                    _faxtxtfld.text=_faxfmtstring;
                    
                }
                
                
                
                
                
                if ([resultString length]==11){
                    
                    fmt=1;
                    
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Fax Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
            }
        }
        
        }
        if(textField==_phonetxtfld)
        {
            
            phnnostring=_phonetxtfld.text;
            
            
            if ([phnnostring length]<10) {
                if([phnnostring isEqualToString:@""])
                {
                    
                }
                else
                {
                    fmt=1;
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
                
                
            }
            else
            {
               
                Validation*val=[[Validation alloc]init];
                int value1=[val isdataformat:_phonetxtfld.text];
                if(value1==0)
                {
                    UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert1 show];
                    
                    
                }
                else
                {

                 phnnostring=_phonetxtfld.text;
                //checking a particular charector
                // NSString *connectstring;
                NSString*new=[phnnostring substringWithRange:NSMakeRange(3, 1)];
                NSString*new1=[phnnostring substringWithRange:NSMakeRange(7, 1)];
                
                
                
                NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
                NSString *resultString = [[phnnostring componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
                NSLog (@"Result: %@", resultString);
                if ([resultString length]<=9){
                    
                    
                    fmt=1;
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
                
                if ([phnnostring length]==12) {
                    
                    
                    
                    
                    
                    
                    if ([new  isEqualToString:@"-"]&&[new1  isEqualToString:@"-"]) {
                        _phnnofmtstring=phnnostring;
                        fmt=2;
                    }
                    else
                    { fmt=1;
                        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                        
                        [alert show];
                    }
                    
                }
                
                
                
                if ([resultString length]==10){
                    
                    
                    fmt=2;
                    
                    NSString *subString = [resultString substringWithRange:NSMakeRange(0,3)];
                    NSLog(@"%@",subString);
                    NSString *substring2=[resultString  substringWithRange:NSMakeRange(3,3)];
                    NSLog(@"%@",substring2);
                    NSString *substring3=[resultString  substringWithRange:NSMakeRange(6,4)];
                    NSLog(@"%@",substring3);
                    _phnnofmtstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
                    NSLog(@"%@",_phnnofmtstring);
                    
                    
                    
                    
                    _phonetxtfld.text=_phnnofmtstring;
                    
                }
                
                
                
                
                
                if ([resultString length]==11){
                    
                    
                    fmt=1;
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
            }
            }
        }
    if(textField==_ziptextfld)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_ziptextfld.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Zip" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }

    }
    
    
    if(textField==_stateempIdtxtfld||textField==_stateunempidtxtfld||textField==_fedraltxtfld){
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_stateempIdtxtfld.text];
        int value2=[val isNumeric:_stateunempidtxtfld.text];
        int value3=[val isNumeric:_fedraltxtfld.text];
        if(value1==0)
        {
            
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid State Employer ID" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
         if(value2==0)
        {
            
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid State Unemployment ID" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }

        if(value3==0)
        {
            
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Federal Employer ID" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }


    }
    if(textField==_mailtxtfld){
        
        NSString *estring=_mailtxtfld.text;
        if (estring.length==0) {
            
        }
        else
        {
            Validation *val=[[Validation alloc]init];
            BOOL bEmailValid = [val validEmailAddress:[_mailtxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
            if(bEmailValid)
            {
                // email valid, other validations in the form
            }
            else
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
        }
        

    }
    
    if(textField==_webtxtfld){
        
//        NSString *urlRegEx =@"((ftp|http|https|www):|.-//)?([a-zA-Z0-9]+(.[a-zA-Z0-9]+)+.*)$";
//        NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
// if(![urlTest evaluateWithObject:self.citytxtfld.text]){
//     
//     UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid website address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//             [alert show];
// }
        
        
        Validation *val=[[Validation alloc]init];
        BOOL webval=[val validateUrl:_webtxtfld.text];
        if(webval)
        {
            // email valid, other validations in the form

        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Website" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    
      if(textField==_citytxtfld){
           Validation *val=[[Validation alloc]init];
          int value1=[val validatespecialcharacters:_citytxtfld.text];
          if(value1==0)
          {
              
              UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid City Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
              [alert1 show];
              
              
          }
          

          
      }

//
//        if(textField==_citytxtfld){
//            NSString *nameRegex = @"[A-Za-z]+";
//            NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
//            if(![nameTest evaluateWithObject:self.citytxtfld.text]){
//                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid City Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [alert show];
//                
//                           }
//        }
//        
//        
    
    
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ////NSLog(@"buttonIndex%d",buttonIndex);
    
    if ([alertView.message isEqualToString:@"Invalid Website"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _webtxtfld.text=@"";
            
            
        }
    }
    if ([alertView.message isEqualToString:@"Updated Successfully"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _savebtn.enabled=YES;
            
            
        }
    }

    if ([alertView.message isEqualToString:@"Invalid Fax Number"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _faxtxtfld.text=@"";
            
            
        }
    }
    

    
    
    if ([alertView.message isEqualToString:@"Invalid Email"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _mailtxtfld.text=@"";
            
            
        }
    }
    

    if ([alertView.message isEqualToString:@"Invalid City Name"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _citytxtfld.text=@"";

            
        }
    }

    
    if ([alertView.message isEqualToString:@"Invalid Zip"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _ziptextfld.text=@"";
            
        }
    }
    if ([alertView.message isEqualToString:@"Invalid Phone Number"])
    {
        if (buttonIndex==0) {
            
            _phonetxtfld.text=@"";
            
        }

    }
    if ([alertView.message isEqualToString:@"Invalid State Employer ID"])
    {
        if (buttonIndex==0) {
            
            _stateempIdtxtfld.text=@"";
            
        }
        
    }
    if ([alertView.message isEqualToString:@"Invalid State Unemployment ID"])
    {
        if (buttonIndex==0) {
            
            _stateunempidtxtfld.text=@"";
            
        }
        
    }
    if ([alertView.message isEqualToString:@"Invalid Federal Employer ID"])
    {
        if (buttonIndex==0) {
            
            _fedraltxtfld.text=@"";
            
        }
        
    }
   


    
}


#pragma mark-popover
-(void)createpopover{
 popoverContent = [[UIViewController alloc]init];
 
    //[self viewWillLayoutSubviews];
    
   // UIView* popoverView = [[UIView alloc]
                           //initWithFrame:CGRectMake(10, 20, 20, 10)];
    popoverContent.view.bounds=CGRectMake(10, 20, 20, 10);
    
    
    //popoverView.backgroundColor = [UIColor redColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    //[popoverView addSubview:_popOverTableView];
    popoverContent.view = _popOverTableView;
   
    //resize the popover view shown
    //in the current view to the view's size
    [popoverContent setContentSizeForViewInPopover:CGSizeMake(20, 0)];
    //popoverContent.contentSizeForViewInPopover = CGSizeMake(0, 0);
    
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
   
    
    if(poptype==1){
        
        [self.popOverController presentPopoverFromRect:_statebtn.frame
                                                inView:self.scroll permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    }
    if(poptype==2){
        [self.popOverController presentPopoverFromRect:_coutryBtn.frame
                                                inView:self.scroll permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        
    }
    
    
    
}
//-(void)viewWillLayoutSubviews{
//    [super viewWillLayoutSubviews];
//    popoverContent.view.bounds=CGRectMake(0, 0, 20, 10);
//    
//}
#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    if(tableView==_popOverTableView)
        
    {
        switch (poptype) {
            case 1:
                return [_statearray count];
                break;
            case 2:
                return [_countryarray count];
                break;
            
                
            default:
                break;
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
           }
   
    if(tableView==_popOverTableView)
    {  cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
        
        switch (poptype) {
            case 1:
                cell.textLabel.text=[_statearray objectAtIndex:indexPath.row];
                break;
            case 2:
                cell.textLabel.text=[_countryarray objectAtIndex:indexPath.row];
                
                break;
                        default:
                break;
                
                
        }
    }
    
    
    
    
    
    
    
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==_popOverTableView) {
        
        
        
        switch (poptype) {
            case 1:
                [_statebtn setTitle:[_statearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                    [_coutryBtn setTitle:[_countryarray objectAtIndex:214] forState:UIControlStateNormal];
                
                break;
            case 2:
                [_coutryBtn setTitle:[_countryarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
             
                
                break;
                
                
                
            default:
                break;
                
        }
        
        
        
    }
     [self.popOverController dismissPopoverAnimated:YES];
    
}


- (IBAction)Addadressbtn:(id)sender {
   [self UserLogmainview];
    
    if(!self.addrsVCtrl){
        self.addrsVCtrl=[[AddressViewController alloc]initWithNibName:@"AddressViewController" bundle:nil];
    }
    _addrsVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_addrsVCtrl
                       animated:YES completion:NULL];

   
}

@end
