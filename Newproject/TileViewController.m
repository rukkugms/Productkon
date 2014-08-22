//
//  TileViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "TileViewController.h"

@interface TileViewController ()

@end

@implementation TileViewController

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
   
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(companyPage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.companyinfoview addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(branchpage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.Documentsview addGestureRecognizer:doubleTap1];
//    UITapGestureRecognizer *doubleTap2 = [[UITapGestureRecognizer alloc]
//                                          initWithTarget:self
//                                          action:@selector(servicesPage)];
//    doubleTap2.numberOfTapsRequired=1;
//    doubleTap2.delegate=(id)self;
//    [self.servicesview addGestureRecognizer:doubleTap2];
    
    
    UITapGestureRecognizer *doubleTap3 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(foldersPage)];
    doubleTap3.numberOfTapsRequired=1;
    doubleTap3.delegate=(id)self;
    [self.foldersview addGestureRecognizer:doubleTap3];
    
    UITapGestureRecognizer *doubleTap4 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(usersPage)];
    doubleTap4.numberOfTapsRequired=1;
    doubleTap4.delegate=(id)self;
    [self.usersview addGestureRecognizer:doubleTap4];
    
    UITapGestureRecognizer *doubleTap5 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(workProcedurePage)];
    doubleTap5.numberOfTapsRequired=1;
    doubleTap5.delegate=(id)self;
    [self.workprocedureview addGestureRecognizer:doubleTap5];

//    UITapGestureRecognizer *doubleTap6 = [[UITapGestureRecognizer alloc]
//                                          initWithTarget:self
//                                          action:@selector(workphasePage)];
//    doubleTap6.numberOfTapsRequired=1;
//    doubleTap6.delegate=(id)self;
//    [self.workphaseview addGestureRecognizer:doubleTap6];
    
    UITapGestureRecognizer *doubleTap7= [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(jobsitereqPage)];
    doubleTap7.numberOfTapsRequired=1;
    doubleTap7.delegate=(id)self;
    [self.jobsitereqview addGestureRecognizer:doubleTap7];
    UITapGestureRecognizer *doubleTap8 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(basicReqPage)];
    doubleTap8.numberOfTapsRequired=1;
    doubleTap8.delegate=(id)self;
    [self.basicreqview addGestureRecognizer:doubleTap8];

    UITapGestureRecognizer *doubleTap9 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(serailnumpage)];
    doubleTap9.numberOfTapsRequired=1;
    doubleTap9.delegate=(id)self;
    [self.serialview addGestureRecognizer:doubleTap9];
//    UITapGestureRecognizer *doubleTap10 = [[UITapGestureRecognizer alloc]
//                                          initWithTarget:self
//                                          action:@selector(worktypepage)];
//    doubleTap10.numberOfTapsRequired=1;
//    doubleTap10.delegate=(id)self;
//    [self.worktypeview addGestureRecognizer:doubleTap10];
    UITapGestureRecognizer *doubleTap11 = [[UITapGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(wrksetngpage)];
    doubleTap11.numberOfTapsRequired=1;
    doubleTap11.delegate=(id)self;
    [self.wrksetngview addGestureRecognizer:doubleTap11];
    
    UITapGestureRecognizer *doubleTap12 = [[UITapGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(securitypage)];
    doubleTap12.numberOfTapsRequired=1;
    doubleTap12.delegate=(id)self;
    [self.securityview addGestureRecognizer:doubleTap12];

}
-(void)checkRights
{
    NSString *module=[NSString stringWithFormat:@"Company->Company Info"];
}

-(void)companyPage
{
    _Moduleid=13;
    [self UserRightsforparticularmoduleselect];
   
}
-(void)branchpage
{
    _Moduleid=14;
    [self UserRightsforparticularmoduleselect];
   

}
//-(void)servicesPage
//{
//    if (!self.serviceVCtrl) {
//        self.serviceVCtrl=[[ServiceViewController alloc]initWithNibName:@"ServiceViewController" bundle:nil];
//    }
//    _serviceVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
//    [self presentViewController:_serviceVCtrl
//                       animated:YES completion:NULL];
//}
-(void)foldersPage
{_Moduleid=22;
    [self UserRightsforparticularmoduleselect];
    }
-(void)usersPage
{_Moduleid=21;
    [self UserRightsforparticularmoduleselect];
    }
-(void)workProcedurePage
{
    _Moduleid=15;
[self UserRightsforparticularmoduleselect];
    

    
}
//-(void)workphasePage
//{
//    if (!self.workVCtrl) {
//        self.workVCtrl=[[workPhasesViewController alloc]initWithNibName:@"workPhasesViewController" bundle:nil];
//    }
//    _workVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
//    [self presentViewController:_workVCtrl
//                       animated:YES completion:NULL];
//
//}
-(void)jobsitereqPage
{_Moduleid=20;
    [self UserRightsforparticularmoduleselect];
    
}
-(void)basicReqPage
{_Moduleid=23;
    [self UserRightsforparticularmoduleselect];
    }

-(void)serailnumpage{
    if (!self.SerialVCtrl) {
        self.SerialVCtrl=[[SerialViewController alloc]initWithNibName:@"SerialViewController" bundle:nil];
    }
     _SerialVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_SerialVCtrl
                       animated:YES completion:NULL];
}

    
//-(void)worktypepage{
//    
//    if (!self.wrktypeVCtrl) {
//        self.wrktypeVCtrl=[[WorktypeViewController alloc]initWithNibName:@"WorktypeViewController" bundle:nil];
//    }
//    _wrktypeVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
//    [self presentViewController:_wrktypeVCtrl animated:YES completion:nil];
//}
-(void)wrksetngpage{
    _Moduleid=16;
     [self UserRightsforparticularmoduleselect];
    
}
-(void)securitypage{
  //  if (!self.securityVCtrl) {
        self.securityVCtrl=[[SecurityViewController alloc]initWithNibName:@"SecurityViewController" bundle:nil];
    //}
    _securityVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_securityVCtrl animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closethetile:(id)sender
{
    _Moduleid=0;
    [self dismissViewControllerAnimated:YES completion:nil];
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
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
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
    if (_Moduleid==13) {
        

        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            
            
            if (!self.compVCtrl) {
                self.compVCtrl=[[CompanyViewController alloc]initWithNibName:@"CompanyViewController" bundle:nil];
            }
            _compVCtrl.modalPresentationStyle = UIModalPresentationCustom;
            _compVCtrl.userrightsarray=_userrightsarray;
            [self presentViewController:_compVCtrl
                               animated:YES completion:NULL];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            //You don’t have right to view this form
        }
        
        
    }
    if (_Moduleid==14) {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            
            
            if (!self.branchVCtrl) {
                self.branchVCtrl=[[BranchViewController alloc]initWithNibName:@"BranchViewController" bundle:nil];
            }
            //_branchVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
            [self presentViewController:_branchVCtrl
                               animated:YES completion:NULL];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }
    if (_Moduleid==15)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            if (!self.cmpnyVCtrl) {
                self.cmpnyVCtrl=[[CmpnydocsViewController alloc]initWithNibName:@"CmpnydocsViewController" bundle:nil];
            }
            _cmpnyVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
            [self presentViewController:_cmpnyVCtrl
                               animated:YES completion:NULL];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }
    if (_Moduleid==16)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            if (!self.wrkstngVCtrlr) {
                self.wrkstngVCtrlr=[[SettngsViewController alloc]initWithNibName:@"SettngsViewController" bundle:nil];
            }
            _wrkstngVCtrlr.modalPresentationStyle=UIModalPresentationFormSheet;
            [self presentViewController:_wrkstngVCtrlr animated:YES completion:nil];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }
    if (_Moduleid==20)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            if (!self.typeVCtrl) {
                self.typeVCtrl=[[TypeViewController alloc]initWithNibName:@"TypeViewController" bundle:nil];
            }
            _typeVCtrl.modalPresentationStyle = UIModalPresentationFormSheet;
            [self presentViewController:_typeVCtrl
                               animated:YES completion:NULL];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    if (_Moduleid==21)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            if (!self.usersVctrl) {
                self.usersVctrl=[[UsersViewController alloc]initWithNibName:@"UsersViewController" bundle:nil];
            }
            _usersVctrl.modalPresentationStyle = UIModalPresentationPageSheet;
            [self presentViewController:_usersVctrl
                               animated:YES completion:NULL];

            
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    if (_Moduleid==22)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            if (!self.folderVCtrl) {
                self.folderVCtrl=[[folderrightsViewController alloc]initWithNibName:@"folderrightsViewController" bundle:nil];
            }
            _folderVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
            [self presentViewController:_folderVCtrl
                               animated:YES completion:NULL];

        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    if (_Moduleid==23)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            if (!self.basicreqVctrl) {
                self.basicreqVctrl=[[BasicReqViewController alloc]initWithNibName:@"BasicReqViewController" bundle:nil];
            }
            // _basicreqVctrl.modalPresentationStyle = UIModalPresentationPageSheet;
            [self presentViewController:_basicreqVctrl
                               animated:YES completion:NULL];

            
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    

}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
       if([elementName isEqualToString:@"UserRightsforparticularmoduleselectResponse"])
    {
        _userrightsarray=[[NSMutableArray alloc]init];
        
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
