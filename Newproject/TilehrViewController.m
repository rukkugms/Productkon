//
//  TilehrViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 2/4/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "TilehrViewController.h"
@interface TilehrViewController ()

@end

@implementation TilehrViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _hrindictr.hidden=YES;
    [_hrindictr stopAnimating];
    _masterview.userInteractionEnabled=YES;
    _mgmtindictr.hidden=YES;
    [_mgmtindictr stopAnimating];
    _mangmntview.userInteractionEnabled=YES;
    _processhrindictr.hidden=YES;
    [_processhrindictr stopAnimating];
    _processview.userInteractionEnabled=YES;
    _result=@"";
    _Moduleid=0;
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(masterpage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.masterview addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(processpage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.processview addGestureRecognizer:doubleTap1];
    UITapGestureRecognizer *doubleTap2 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(managmntPage)];
    doubleTap2.numberOfTapsRequired=1;
    doubleTap2.delegate=(id)self;
    [self.mangmntview addGestureRecognizer:doubleTap2];
    
//    UITapGestureRecognizer *doubleTap3 = [[UITapGestureRecognizer alloc]
//                                          initWithTarget:self
//                                          action:@selector(JobPage)];
//    doubleTap3.numberOfTapsRequired=1;
//    doubleTap3.delegate=(id)self;
//    [self.jobview addGestureRecognizer:doubleTap3];
    
    }
-(void)masterpage{
    _hrindictr.hidden=NO;
    [_hrindictr startAnimating];
    _masterview.userInteractionEnabled=NO;
    _Moduleid=63;
    [self UserRightsforparticularmoduleselect];
   

    
}

-(void)processpage{
    _processhrindictr.hidden=NO;
    [_processhrindictr startAnimating];
    _processview.userInteractionEnabled=NO;
    _Moduleid=64;
    [self UserRightsforparticularmoduleselect];
   
    
    
    


    
}
-(void)managmntPage{
    _mgmtindictr.hidden=NO;
    [_mgmtindictr startAnimating];
    _mangmntview.userInteractionEnabled=NO;
    _Moduleid=65;
    [self UserRightsforparticularmoduleselect];
    
   
    
    
    
}
//-(void)JobPage{
//    
//    if (!self.EmpVCtrl ) {
//        self.EmpVCtrl=[[EmpJobViewController alloc]initWithNibName:@"EmpJobViewController" bundle:nil];
//    }
//    
//   // self.EmpVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
//    
//    [self presentViewController:self.EmpVCtrl
//                       animated:YES completion:NULL];
//    
//    
//    
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closebtnactn:(id)sender {
    _result=@"";
    _Moduleid=0;
    [self dismissViewControllerAnimated:YES completion:NULL];

}
#pragma mark- WebService
-(void)UserRightsforparticularmoduleselect{
    recordResults = FALSE;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    userid = [defaults objectForKey:@"Userid"];
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserRightsforparticularmoduleselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "<ModuleId>%d</ModuleId>\n"
                   "</UserRightsforparticularmoduleselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[userid integerValue],_Moduleid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserRightsforparticularmoduleselect" forHTTPHeaderField:@"Soapaction"];
    
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
    //NSDictionary *dictionary=[_xmlParser dictionaryWithValuesForKeys:[[NSArray alloc]initWithObjects:@"JobNumber", nil]];
    
    //  NSLog(@"dictioanry is %@",dictionary);
    
    
	[_xmlParser parse];
    if ([_result isEqualToString:@"Not yet set"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Your rights are not yet set" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        _hrindictr.hidden=YES;
        [_hrindictr stopAnimating];
        _masterview.userInteractionEnabled=YES;
        _mgmtindictr.hidden=YES;
        [_mgmtindictr stopAnimating];
        _mangmntview.userInteractionEnabled=YES;
        _processhrindictr.hidden=YES;
        [_processhrindictr stopAnimating];
        _processview.userInteractionEnabled=YES;
    _result=@"";}
    
    
    else
    {
        
        if (_Moduleid==63) {
            
            
            Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
            if (rightsmodel.ViewModule==1) {
                _hrindictr.hidden=YES;
                [_hrindictr stopAnimating];
                _masterview.userInteractionEnabled=YES;
                _mgmtindictr.hidden=YES;
                [_mgmtindictr stopAnimating];
                _mangmntview.userInteractionEnabled=YES;
                _processhrindictr.hidden=YES;
                [_processhrindictr stopAnimating];
                _processview.userInteractionEnabled=YES;
                
               
//                    self.hrVCtrl=[[HRViewController alloc]initWithNibName:@"HRViewController" bundle:nil];
//                
//                
//                _hrVCtrl.modalPresentationStyle=UIModalPresentationFullScreen;
//                
//                [self presentViewController:_hrVCtrl
//                                   animated:YES completion:NULL];
                self.masterctl=[[MasterHrViewController alloc]initWithNibName:@"MasterHrViewController" bundle:nil];
                
                
                _masterctl.modalPresentationStyle=UIModalPresentationFullScreen;
                
                [self presentViewController:_masterctl
                                   animated:YES completion:NULL];
               
            }
            else
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _hrindictr.hidden=YES;
                [_hrindictr stopAnimating];
                _masterview.userInteractionEnabled=YES;
                _hrindictr.hidden=YES;
                [_hrindictr stopAnimating];
                _masterview.userInteractionEnabled=YES;
                _mgmtindictr.hidden=YES;
                [_mgmtindictr stopAnimating];
                _mangmntview.userInteractionEnabled=YES;
                _processhrindictr.hidden=YES;
                [_processhrindictr stopAnimating];
                _processview.userInteractionEnabled=YES;
                //You don’t have right to view this form
            }
            
            
        }
        if (_Moduleid==64) {
            Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
            if (rightsmodel.ViewModule==1) {
                
                _processhrindictr.hidden=YES;
                [_processhrindictr stopAnimating];
                _processview.userInteractionEnabled=YES;
                _hrindictr.hidden=YES;
                [_hrindictr stopAnimating];
                _masterview.userInteractionEnabled=YES;
                _mgmtindictr.hidden=YES;
                [_mgmtindictr stopAnimating];
                _mangmntview.userInteractionEnabled=YES;
                _processhrindictr.hidden=YES;
                [_processhrindictr stopAnimating];
                _processview.userInteractionEnabled=YES;
                
//                if (!self.prcsVCtrl ) {
//                    self.prcsVCtrl=[[ProcesshrViewController alloc]initWithNibName:@"ProcesshrViewController" bundle:nil];
//                }
//                
//                self.prcsVCtrl.modalPresentationStyle=UIModalPresentationFullScreen;
//                
//                [self presentViewController:self.prcsVCtrl
//                                   animated:YES completion:NULL];
               // if (!self.inprcsVCtrl ) {
                    self.inprcsVCtrl=[[InprocessViewController alloc]initWithNibName:@"InprocessViewController" bundle:nil];
                //}
                
                self.inprcsVCtrl.modalPresentationStyle=UIModalPresentationFullScreen;
                
                [self presentViewController:self.inprcsVCtrl
                                   animated:YES completion:NULL];

                
                
                
            }
            else
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _processhrindictr.hidden=YES;
                [_processhrindictr stopAnimating];
                _processview.userInteractionEnabled=YES;
                _hrindictr.hidden=YES;
                [_hrindictr stopAnimating];
                _masterview.userInteractionEnabled=YES;
                _mgmtindictr.hidden=YES;
                [_mgmtindictr stopAnimating];
                _mangmntview.userInteractionEnabled=YES;
                _processhrindictr.hidden=YES;
                [_processhrindictr stopAnimating];
                _processview.userInteractionEnabled=YES;
            }
            
        }
        if (_Moduleid==65)
        {
            Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
            if (rightsmodel.ViewModule==1) {
                _mgmtindictr.hidden=YES;
                [_mgmtindictr stopAnimating];
                _mangmntview.userInteractionEnabled=YES;
                _hrindictr.hidden=YES;
                [_hrindictr stopAnimating];
                _masterview.userInteractionEnabled=YES;
                _mgmtindictr.hidden=YES;
                [_mgmtindictr stopAnimating];
                _mangmntview.userInteractionEnabled=YES;
                _processhrindictr.hidden=YES;
                [_processhrindictr stopAnimating];
                _processview.userInteractionEnabled=YES;
               // if (!self.mgmtVCtrl ) {
                    self.mgmtVCtrl=[[EmplyhrmgntViewController alloc]initWithNibName:@"EmplyhrmgntViewController" bundle:nil];
               // }
                
               // self.mgmtVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
                
                [self presentViewController:self.mgmtVCtrl
                                   animated:YES completion:NULL];
                
            }
            else
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _mgmtindictr.hidden=YES;
                [_mgmtindictr stopAnimating];
                _mangmntview.userInteractionEnabled=YES;
                _hrindictr.hidden=YES;
                [_hrindictr stopAnimating];
                _masterview.userInteractionEnabled=YES;
                _mgmtindictr.hidden=YES;
                [_mgmtindictr stopAnimating];
                _mangmntview.userInteractionEnabled=YES;
                _processhrindictr.hidden=YES;
                [_processhrindictr stopAnimating];
                _processview.userInteractionEnabled=YES;
            }
            
        }
           }
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"UserRightsforparticularmoduleselectResponse"])
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
    
    if([elementName isEqualToString:@"EntryId"])
    {
        _userrightsarray=[[NSMutableArray alloc]init];
        
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
    if([elementName isEqualToString:@"ModuleId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ViewModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EditModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DeleteModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PrintModule"])
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
    if([elementName isEqualToString:@"result"])
    {
        
        
        recordResults = FALSE;
        
        _result=@"Not yet set";
        //        if ([_soapResults isEqualToString:@"0"]) {
        //            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //            [alert show];
        //        }
        
        _soapResults=nil;
    }
    
    if([elementName isEqualToString:@"EntryId"])
    {
        
        
        recordResults = FALSE;
        _rights=[[Rightscheck alloc]init];
        _rights.entryid=[_soapResults integerValue];
        
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"UserId"])
    {
        
        
        recordResults = FALSE;
        
        _rights.userid=[_soapResults integerValue];
        
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"ModuleId"])
    {
        
        
        recordResults = FALSE;
        
        _rights.moduleid=[_soapResults integerValue];
        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"ViewModule"])
    {
        
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.ViewModule=1;
            
            
        }
        else{
            _rights.ViewModule=0;
            
        }
        
        
        
        _soapResults=nil;
        
        
    }
    if([elementName isEqualToString:@"EditModule"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.EditModule=1;
            
            
        }
        else{
            _rights.EditModule=0;
            
        }
        _soapResults=nil;
        
        
    }
    if([elementName isEqualToString:@"DeleteModule"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.DeleteModule=1;
            
            
        }
        else{
            _rights.DeleteModule=0;
            
        }
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"PrintModule"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.PrintModule=1;
            
            
        }
        else{
            _rights.PrintModule=0;
            
        }
        
        
        
        [_userrightsarray addObject:_rights];
        _soapResults=nil;
        
    }
    
}

@end
