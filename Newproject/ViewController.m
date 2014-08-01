//
//  ViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/14/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString*newstring=@"newname";
      NSString*astring=@"kontract360.com/service.asmx";


   NSString*one=[NSString stringWithFormat:@"%@.%@", newstring , astring];
    NSLog(@"%@",one);
    
    [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    [self prefersStatusBarHidden];
    [self setNeedsStatusBarAppearanceUpdate];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    // self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    _scroll.frame=CGRectMake(0,0,1024, 724);
    [_scroll setContentSize:CGSizeMake(1024,800)];
    
    
    
    /*UDID*/
      NSString*newid=[[[UIDevice currentDevice]identifierForVendor]UUIDString];
       NSLog(@"UDID%@",newid);
    _logindevice=newid;
    
      UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:newid delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
      [alert show];
    
    // NSUUID *deviceId;
    #if TARGET_IPHONE_SIMULATOR
    //deviceId = [NSUUID initWithUUIDString:@"UUID-STRING-VALUE"];
    #else
    //deviceId = [[UIDevice currentDevice].identifierForVendor];
     #endif
    NSUUID *myDevice = [NSUUID UUID];
    NSString *deviceUDID = myDevice.UUIDString;
    UIAlertView*alert1=[[UIAlertView alloc]initWithTitle:nil message:deviceUDID delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert1 show];

    
    }



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _usernametxt.text=@"";
    _passwrdtxt.text=@"";
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
#pragma mark- WebService
-(void)Loginselect{
       recordResults = FALSE;
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
   // NSLog(@"Date %@",[formatter stringFromDate:date]);
    NSString*curntdate=[formatter stringFromDate:date];

    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Loginselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserName>%@</UserName>\n"
                   "<Password>%@</Password>\n"
                   "<LTime>%@</LTime>\n"
                   "<DeviceNumber>%@</DeviceNumber>\n"
                   "</Loginselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_usernametxt.text,_passwrdtxt.text,curntdate,_logindevice];
    NSLog(@"soapmsg%@",soapMessage);
    
    
   NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
  //  NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Loginselect" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:nil message:@"ERROR with the Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
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
    //NSDictionary *dictionary=[_xmlParser dictionaryWithValuesForKeys:[[NSArray alloc]initWithObjects:@"JobNumber", nil]];
    
    //  NSLog(@"dictioanry is %@",dictionary);
    
    
	[_xmlParser parse];
     
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"LoginselectResponse"])
    {
       
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"records"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"logintime"]){
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"device"]){
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DeviceNumber"]){
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
    if([elementName isEqualToString:@"records"]){
       
        recordResults = FALSE;
        if([_soapResults isEqualToString:@"0"]){
            
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Username or Password" delegate:self
        cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([_soapResults isEqualToString:@"-1"]){
            
            NSString*msg=[NSString stringWithFormat:@"You are already login from %@(%@) at %@ ",devicename,devicenumber,logintime];
          UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:msg delegate:self
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
           
        }
        else {
            if (!self.hmeVCtrl) {
                self.hmeVCtrl=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
            }
           self.hmeVCtrl.username=_usernametxt.text;
            [self.navigationController pushViewController:_hmeVCtrl animated:YES];

        }
        _soapResults = nil;
        devicename=@"";
        devicenumber=@"";
        logintime=@"";
        
    }
    
     if([elementName isEqualToString:@"logintime"]){
          recordResults = FALSE;
         NSArray*array=[_soapResults componentsSeparatedByString:@"+"];
         NSArray*array1=[[array objectAtIndex:0]componentsSeparatedByString:@"T"];
         logintime=[NSString stringWithFormat:@"%@ %@",[array1 objectAtIndex:1],[array1 objectAtIndex:0]];
          _soapResults = nil;
         
     }
    if([elementName isEqualToString:@"device"]){
        recordResults = FALSE;
        devicename=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"DeviceNumber"]){
        recordResults = FALSE;
        devicenumber=_soapResults;
        _soapResults = nil;
        
    }

}
- (IBAction)loginbtn:(id)sender {
    
    
    if((_usernametxt.text.length==0)||(_passwrdtxt.text.length==0)){
        
        if(_usernametxt.text.length==0){
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter Username" delegate:self
                                          cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        }
       else if(_passwrdtxt.text.length==0){
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter Password" delegate:self
                                          cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        }

        
    }
    else{
    [self Loginselect];
    }
  }
-(IBAction)toforgetaction:(id)sender
{
    if (!self.forgetVCtrl) {
        self.forgetVCtrl=[[forgetViewController alloc]initWithNibName:@"forgetViewController" bundle:nil];
    }
   // self.hmeVCtrl.username=_usernametxt.text;
    [self.navigationController pushViewController:_forgetVCtrl animated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    _usernametxt.text=@"";
    _passwrdtxt.text=@"";
    
}
@end
