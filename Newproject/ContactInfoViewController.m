//
//  ContactInfoViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 20/06/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "ContactInfoViewController.h"

@interface ContactInfoViewController ()

@end

@implementation ContactInfoViewController

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
    _scroll.frame=CGRectMake(0, 0, 1024,708);
    [_scroll setContentSize:CGSizeMake(1024,760)];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.scroll.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _infoview.backgroundColor=[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f];
     _titlenav.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    _contactinfoTable.layer.borderWidth = 2.0;
    _contactinfoTable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;

    /*searchbar*/
    _SearchingBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _SearchingBar.delegate = (id)self;
     _SearchingBar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.contactinfoTable.tableHeaderView=_SearchingBar;
    UISearchDisplayController *searchdisplaycontroller=[[UISearchDisplayController alloc]initWithSearchBar:_SearchingBar contentsController:self];
    searchdisplaycontroller.searchResultsDataSource=(id)self;
    searchdisplaycontroller.searchResultsDelegate=(id)self;
    searchdisplaycontroller.delegate=(id)self;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    _SearchingBar.text=@"";
    _updatebtn.enabled=YES;
    [super viewWillAppear:animated];
    [self CustomercontactInfoselect];
    
    }
#pragma mark-webservice
-(void)CustomercontactInfoselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomercontactInfoselect xmlns=\"http://ios.kontract360.com/\">\n"
                    "<CustomerCode>%@</CustomerCode>\n"
                   "</CustomercontactInfoselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_custmrcode];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomercontactInfoselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CustomerContactInfoInsert{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerContactInfoInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<CustomerCode>%@</CustomerCode>\n"
                   "<ContactName>%@</ContactName>\n"
                   "<ContactEmail>%@</ContactEmail>\n"
                   "<ContactMobile>%@</ContactMobile>\n"
                   "<ContactPhone>%@</ContactPhone>\n"
                   "<ContactFax>%@</ContactFax>\n"
                   "<PositionCode>%@</PositionCode>\n"
                   "</CustomerContactInfoInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_custmrcode,_nametextfield.text,_emailtextfield.text,_mobiletextfld.text,_phonetextfield.text,_faxtxtfld.text,_pstntxtfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerContactInfoInsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CustomerContactInfoUpdate{
    recordResults = FALSE;
    NSString *soapMessage;
    
      Infomdl*infmdl=(Infomdl *)[_infoarray objectAtIndex:path];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerContactInfoUpdate xmlns=\"http://ios.kontract360.com/\">\n"
                   "<EntryId>%d</EntryId>\n"
                   "<CustomerCode>%@</CustomerCode>\n"
                   "<ContactName>%@</ContactName>\n"
                   "<ContactEmail>%@</ContactEmail>\n"
                   "<ContactMobile>%@</ContactMobile>\n"
                   "<ContactPhone>%@</ContactPhone>\n"
                   "<ContactFax>%@</ContactFax>\n"
                   "<PositionCode>%@</PositionCode>\n"
                   "</CustomerContactInfoUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[infmdl.entryid integerValue],_custmrcode,_nametextfield.text,_emailtextfield.text,_mobiletextfld.text,_phonetextfield.text,_faxtxtfld.text,_pstntxtfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerContactInfoUpdate" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CustomerContactInfodelete{
    webtype=3;
    recordResults = FALSE;
    NSString *soapMessage;
      Infomdl*infmdl=(Infomdl *)[_infoarray objectAtIndex:deletepath];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerContactInfodelete xmlns=\"http://ios.kontract360.com/\">\n"
                   "<EntryId>%d</EntryId>\n"
                   "</CustomerContactInfodelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[infmdl.entryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerContactInfodelete" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)CustomerContactInfoSearch{
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerContactInfoSearch xmlns=\"http://ios.kontract360.com/\">\n"
                    "<searchtext>%@</searchtext>\n"
                  "<CustomerCode>%@</CustomerCode>\n"
                   "</CustomerContactInfoSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring,_custmrcode];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerContactInfoSearch" forHTTPHeaderField:@"Soapaction"];
    
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],0,@"Create",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
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
-(void)UserLogmainupdate{
    
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],0,@"Edit",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
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
-(void)UserLogmaindelete{
    
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],0,@"Delete",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
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
//    if(webtype==1||webtype==2||webtype==3){
//        _SearchingBar.text=@"";
//        [self CustomercontactInfoselect];
//        webtype=0;
//    }
    
    [_contactinfoTable reloadData];
    
}
#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    
    if([elementName isEqualToString:@"CustomercontactInfoselectResponse"])
    {
        _infoarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"CustomerCode"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ContactEmail"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ContactName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ContactMobile"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ContactPhone"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ContactFax"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"PositionCode"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"result"])
    {
        {
            if(!_soapResults)
            {
                _soapResults = [[NSMutableString alloc] init];
            }
            recordResults = TRUE;
            
        }
    }
    if([elementName isEqualToString:@"CustomerContactInfoSearchResponse"])
    { _infoarray=[[NSMutableArray alloc]init];

        {
            if(!_soapResults)
            {
                _soapResults = [[NSMutableString alloc] init];
            }
            recordResults = TRUE;
            
        }
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
        recordResults = FALSE;
        _infomdl=[[Infomdl alloc]init];
        _infomdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CustomerCode"])
    {
        recordResults = FALSE;
         _infomdl.code=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ContactName"])
    {
        recordResults = FALSE;
         _infomdl.infoname=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"ContactMobile"])
    {
        recordResults = FALSE;
         _infomdl.mobile=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"ContactPhone"])
    {
        recordResults = FALSE;
         _infomdl.phone=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"ContactEmail"])
    {
        recordResults = FALSE;
        _infomdl.email=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ContactFax"])
    {
        recordResults = FALSE;
         _infomdl.fax=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"PositionCode"])
    {
        recordResults = FALSE;
         _infomdl.position=_soapResults;
        [_infoarray addObject:_infomdl];
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"result"])
    {
        recordResults = FALSE;
        msgstrg=_soapResults;
        if(webtype==1||webtype==2){
            
            
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            _SearchingBar.text=@"";
            [self CustomercontactInfoselect];
        }
        if(webtype==3){
            _SearchingBar.text=@"";
            [self CustomercontactInfoselect];
        }
        _soapResults = nil;
        
    }

}

#pragma mark-Button
- (IBAction)addbtn:(id)sender {
    _updatebtn.enabled=YES;
      _cancelbtnlbl.enabled=YES;
    optionidentifier=1;
     _cancelbtnlbl.titleLabel.textColor=[UIColor colorWithRed:70/255.0f green:130.0/255.0f blue:180.0/255.0f alpha:1.0f];
    _navitem.title=@"Create";
    webtype=1;
    _addview.hidden=NO;
    _nametextfield.text=@"";
    _emailtextfield.text=@"";
    _phonetextfield.text=@"";
    _mobiletextfld.text=@"";
    _faxtxtfld.text=@"";
    _pstntxtfld.text=@"";
    _contactinfoTable.userInteractionEnabled=NO;
  //  [_contactinfoTable setEditing:NO animated:NO];

}


-(IBAction)closetheView:(id)sender
{
    _updatebtn.enabled=YES;
    self.addview.hidden=YES;
    _contactinfoTable.userInteractionEnabled=YES;
}

- (IBAction)updatebtn:(id)sender {
    
    if (webtype==1)
    {
        [self UserLogmaininsert];
          }
    else{
        
        [self UserLogmainupdate];
    }

    if([_nametextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];

    }
   else if([_emailtextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Email is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else if ([_phonetextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Phone Number is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        
    }

    else if ([_mobiletextfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Mobile Number is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];

        
    }
//    else if(![_emailtextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
//    {
//        Validation *val=[[Validation alloc]init];
//        int value2 = [val validEmailAddress:[_emailtextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
//        if(value2==0)
//        {
//            
//            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//            [alert1 show];
//        }
//        else
//        {
//            if (webtype==1)
//            {
//                _updatebtn.enabled=NO;
//                [self CustomerContactInfoInsert];
//            }
//            else
//            {
//                _updatebtn.enabled=NO;
//                [self CustomerContactInfoUpdate];
//            }
//        }
//        
//    }
    else
    {
        if (webtype==1)
        {
            _updatebtn.enabled=NO;
            [self CustomerContactInfoInsert];
        }
        else
        {
            _updatebtn.enabled=NO;
            [self CustomerContactInfoUpdate];
        }
        
    }



    
}

- (IBAction)cancelbtn:(id)sender {
    _nametextfield.text=@"";
    _emailtextfield.text=@"";
    _phonetextfield.text=@"";
    _mobiletextfld.text=@"";
    _faxtxtfld.text=@"";
    _pstntxtfld.text=@"";
}

- (IBAction)editbtn:(id)sender {
    _updatebtn.enabled=YES;
    optionidentifier=2;
    _contactinfoTable.userInteractionEnabled=NO;
   // [_contactinfoTable setEditing:NO animated:NO];

    _cancelbtnlbl.enabled=NO;
  [_cancelbtnlbl setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    webtype=2;
     _navitem.title=@"Edit";
    _addview.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.contactinfoTable];
    NSIndexPath *textFieldIndexPath = [self.contactinfoTable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    path=textFieldIndexPath.row;
    Infomdl*infmdl=(Infomdl *)[_infoarray objectAtIndex:textFieldIndexPath.row];

   _nametextfield.text=infmdl.infoname;
   _emailtextfield.text=infmdl.email;
   _phonetextfield.text=infmdl.phone;
   _mobiletextfld.text=infmdl.mobile;
  _faxtxtfld.text=infmdl.fax;
    _pstntxtfld.text=infmdl.position;

    }


- (IBAction)deletbtn:(id)sender {
    webtype=3;
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_contactinfoTable setEditing:NO animated:NO];
        [_contactinfoTable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_contactinfoTable setEditing:YES animated:YES];
        [_contactinfoTable reloadData];
        
        
        
        
    }
    

}
- (IBAction)clsebtn:(id)sender {
    _updatebtn.enabled=YES;
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark-Tableview Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_infoarray count];
    // Return the number of rows in the section.
   }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"Cinfocell" owner:self options:nil];
        cell=_cntactcell;
    
    }
    Infomdl*infmdl=(Infomdl *)[_infoarray objectAtIndex:indexPath.row];
    _namelbl=(UILabel *)[cell viewWithTag:1];
    _namelbl.text=infmdl.infoname;
    _emaillbl= (UILabel *)[cell viewWithTag:2];
    _emaillbl.text=infmdl.email;
    _phnelbl=(UILabel *)[cell viewWithTag:3];
    _phnelbl.text=infmdl.phone;
    _mblelbl=(UILabel *)[cell viewWithTag:4];
    _mblelbl.text=infmdl.mobile;
    _faxlbl=(UILabel *)[cell viewWithTag:5];
    _faxlbl.text=infmdl.position;
    

    
    return cell;
    
    
}

#pragma mark-Tableview datasources
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        
    }else
    {
        [cell setBackgroundColor:[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f]];
    }
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [self UserLogmaindelete];
        deletepath=indexPath.row;
        
       [self CustomerContactInfodelete];
        [_infoarray removeObject:indexPath];
        
        
        
        
        
    }
    
}

#pragma mark-Alertview
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ////NSLog(@"buttonIndex%d",buttonIndex);
    
    if ([alertView.message isEqualToString:msgstrg]) {
        
        
        
        if (buttonIndex==0) {
            if (optionidentifier==2) {
                _contactinfoTable.userInteractionEnabled=YES;
                _addview.hidden=YES;
                _updatebtn.enabled=YES;
                _SearchingBar.text=@"";
            }
            
            _nametextfield.text=@"";
              _emailtextfield.text=@"";
              _phonetextfield.text=@"";
              _mobiletextfld.text=@"";
              _faxtxtfld.text=@"";
              _pstntxtfld.text=@"";
            _updatebtn.enabled=YES;
            _SearchingBar.text=@"";
            
        }
    }
    
    if ([alertView.message isEqualToString:@"Invalid Fax Number"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _faxtxtfld.text=@"";
            
            
        }
    }
    
    
    
    
    if ([alertView.message isEqualToString:@"Invalid Email"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _emailtextfield.text=@"";
            
            
        }
    }
    
    
    
    
       if ([alertView.message isEqualToString:@"Invalid Phone Number"])
    {
        if (buttonIndex==0) {
            
            _phonetextfield.text=@"";
            
        }
        
    }
    if ([alertView.message isEqualToString:@"Invalid Mobile Number"])
    {
        if (buttonIndex==0) {
            
            _mobiletextfld.text=@"";
            
        }
        
    }
    if ([alertView.message isEqualToString:@"Invalid Company Name"])
    {
        if (buttonIndex==0) {
            
            _nametextfield.text=@"";
            
        }
        
    }


    
}
#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_SearchingBar.text;
    //NSLog(@"search%@",searchstring);
   [self CustomerContactInfoSearch];
    [searchBar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    // [self Allmanpwrarry];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_SearchingBar.text length]==0) {
        
        [self CustomercontactInfoselect];
        // [searchBar resignFirstResponder];
        
        
    }
    // [searchBar resignFirstResponder];
    
    
}

#pragma mark-textfld delegates
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField==_nametextfield)
    {
        NSUInteger newLength = [_nametextfield.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    
    if(textField==_faxtxtfld)
    {
        NSUInteger newLength = [_faxtxtfld.text length] + [string length] - range.length;
        return (newLength > 12) ? NO : YES;
    }
       if(textField==_phonetextfield)
    {
        NSUInteger newLength = [_phonetextfield.text length] + [string length] - range.length;
        return (newLength > 12) ? NO : YES;
    }
    if(textField==_mobiletextfld)
    {
        NSUInteger newLength = [_mobiletextfld.text length] + [string length] - range.length;
        return (newLength > 12) ? NO : YES;
    }

    if(textField==_emailtextfield)
    {
        NSUInteger newLength = [_emailtextfield.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    
    
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField==_nametextfield){
        
        
        
        Validation *val=[[Validation alloc]init];
        int value1=[val validatespecialcharacters:_nametextfield.text];
        if(value1==0)
        {
            
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Company Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }

    if(textField==_faxtxtfld)
    {
        faxnoString=_faxtxtfld.text;
        if ([faxnoString length]<10) {
            if([faxnoString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
            {
                
            }
            else
            {
                fmt=1;
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Fax Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                
                [alert show];
                
            }
            
        }
        else
        {
            
            
            Validation*val=[[Validation alloc]init];
            int value1=[val isdataformat:_faxtxtfld.text];
            if(value1==0)
            {
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Fax Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
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
                if ([resultString length]==9){
                    
                    fmt=1;
                    
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Fax Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
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
                        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Fax Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                        
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
                    
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Fax Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
            }
        }
        
    }
    if(textField==_phonetextfield)
    {
        
        phnnostring=_phonetextfield.text;
        
        
        if ([phnnostring length]<10) {
            if([phnnostring stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
            {
                
            }
            else
            {
                fmt=1;
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                
                [alert show];
                
            }
            
            
            
        }
        else
        {
            
            Validation*val=[[Validation alloc]init];
            int value1=[val isdataformat:_phonetextfield.text];
            if(value1==0)
            {
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert1 show];
                
                
            }
            else
            {
                
                phnnostring=_phonetextfield.text;
                //checking a particular charector
                // NSString *connectstring;
                NSString*new=[phnnostring substringWithRange:NSMakeRange(3, 1)];
                NSString*new1=[phnnostring substringWithRange:NSMakeRange(7, 1)];
                
                
                
                NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
                NSString *resultString = [[phnnostring componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
                NSLog (@"Result: %@", resultString);
                if ([resultString length]==9){
                    
                    
                    fmt=1;
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
                
                if ([phnnostring length]==12) {
                    
                    
                    
                    
                    
                    
                    if ([new  isEqualToString:@"-"]&&[new1  isEqualToString:@"-"]) {
                        _phnnofmtstring=phnnostring;
                        fmt=2;
                    }
                    else
                    { fmt=1;
                        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                        
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
                    
                    
                    
                    
                    _phonetextfield.text=_phnnofmtstring;
                    
                }
                
                
                
                
                
                if ([resultString length]==11){
                    
                    
                    fmt=1;
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
            }
        }
    }
    
    if(textField==_mobiletextfld)
    {
        
        mobilestrg=_mobiletextfld.text;
        
        
        if ([mobilestrg length]<10) {
            if([mobilestrg stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
            {
                
            }
            else
            {
                fmt=1;
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                
                [alert show];
                
            }
            
            
            
        }
        else
        {
            
            Validation*val=[[Validation alloc]init];
            int value1=[val isdataformat:_mobiletextfld.text];
            if(value1==0)
            {
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert1 show];
                
                
            }
            else
            {
                
                mobilestrg=_mobiletextfld.text;
                //checking a particular charector
                // NSString *connectstring;
                NSString*new=[mobilestrg substringWithRange:NSMakeRange(3, 1)];
                NSString*new1=[mobilestrg substringWithRange:NSMakeRange(7, 1)];
                
                
                
                NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
                NSString *resultString = [[mobilestrg componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
                NSLog (@"Result: %@", resultString);
                if ([resultString length]==9){
                    
                    
                    fmt=1;
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
                
                if ([mobilestrg length]==12) {
                    
                    
                    
                    
                    
                    
                    if ([new  isEqualToString:@"-"]&&[new1  isEqualToString:@"-"]) {
                        _mblenofmtstring=mobilestrg;
                        fmt=2;
                    }
                    else
                    { fmt=1;
                        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                        
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
                    _mblenofmtstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
                    NSLog(@"%@",_mblenofmtstring);
                    
                    
                    
                    
                    _mobiletextfld.text=_mblenofmtstring;
                    
                }
                
                
                
                
                
                if ([resultString length]==11){
                    
                    
                    fmt=1;
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
            }
        }
    }

        if(textField==_emailtextfield){
            if(![_emailtextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0){
                
            
        
        Validation *val=[[Validation alloc]init];
        BOOL bEmailValid = [val validEmailAddress:[_emailtextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
        if(bEmailValid)
        {
            // email valid, other validations in the form
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
        
    }
        }
    
    
    
    
}

@end
