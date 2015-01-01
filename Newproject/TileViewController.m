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
-(void)viewWillDisappear:(BOOL)animated
{
     _secindictr.hidden=YES;
    [_secindictr stopAnimating];
    _securityview.userInteractionEnabled=YES;
    [_compinfoindictr stopAnimating];
    [_branchindictr stopAnimating];
    
    _compinfoindictr.hidden=YES;
    _branchindictr.hidden=YES;
    
    _basicindicatr.hidden=YES;
  
_companyinfoview.userInteractionEnabled=YES;
    _basicreqview.userInteractionEnabled=YES;
      _Documentsview.userInteractionEnabled=YES;

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _compinfoindictr.hidden=YES;
    _branchindictr.hidden=YES;
    _docindictr.hidden=YES;
    _setngindictr.hidden=YES;
    _typeindicator.hidden=YES;
    _usersindicator.hidden=YES;
    _rightsindictr.hidden=YES;
    _basicindicatr.hidden=YES;
    _secindictr.hidden=YES;
    [_compinfoindictr stopAnimating];
    [_branchindictr stopAnimating];
    [_docindictr stopAnimating];
    [_setngindictr stopAnimating];
    [_typeindicator stopAnimating];
    [_usersindicator stopAnimating];
    [_rightsindictr stopAnimating];
    [_basicindicatr stopAnimating];
    [_secindictr stopAnimating];

    _companyinfoview.userInteractionEnabled=YES;
    _Documentsview.userInteractionEnabled=YES;
    _foldersview.userInteractionEnabled=YES;
    _usersview.userInteractionEnabled=YES;
    _wrksetngview.userInteractionEnabled=YES;
    _securityview.userInteractionEnabled=YES;
    _basicreqview.userInteractionEnabled=YES;
    _jobsitereqview.userInteractionEnabled=YES;
    _workprocedureview.userInteractionEnabled=YES;
    [_secindictr stopAnimating];
    _result=@"";
    _Moduleid=0;
    
    
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

-(void)companyPage
{
    
    _compinfoindictr.hidden=NO;
    [_compinfoindictr startAnimating];
    _Moduleid=13;
    [self UserLogmaininsert];
    [self UserRightsforparticularmoduleselect];
    _companyinfoview.userInteractionEnabled=NO;
   
}
-(void)branchpage
{
      [self UserLogmaininsert];
   
    _branchindictr.hidden=NO;
    [_branchindictr startAnimating];
    _Moduleid=14;
       [self UserLogmaininsert];
    
    [self UserRightsforparticularmoduleselect];
     _Documentsview.userInteractionEnabled=NO;
  
   

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
{   //_foldersview.userInteractionEnabled=YES;
    _rightsindictr.hidden=NO;
  
    
    [_rightsindictr startAnimating];
    _Moduleid=1011;
       [self UserLogmaininsert];
    [self UserRightsforparticularmoduleselect];
      _foldersview.userInteractionEnabled=NO;
    }
-(void)usersPage
{//_usersview.userInteractionEnabled=YES;
    _usersindicator.hidden=NO;
    
    
    [_usersindicator startAnimating];
    _Moduleid=1012;
       [self UserLogmaininsert];
    [self UserRightsforparticularmoduleselect];
    _usersview.userInteractionEnabled=NO;
    }
-(void)workProcedurePage
{
    _docindictr.hidden=NO;
   
    
    [_docindictr startAnimating];
    _Moduleid=15;
       [self UserLogmaininsert];
[self UserRightsforparticularmoduleselect];
     _workprocedureview.userInteractionEnabled=NO;
    

    
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
{ _typeindicator.hidden=NO;
    _jobsitereqview.userInteractionEnabled=NO;
    
    [_typeindicator startAnimating];
    _Moduleid=20;
       [self UserLogmaininsert];
    [self UserRightsforparticularmoduleselect];
    
}
-(void)basicReqPage
{_basicindicatr.hidden=NO;
   
    
    [_basicindicatr startAnimating];

    _Moduleid=23;
       [self UserLogmaininsert];
    [self UserRightsforparticularmoduleselect];
     _basicreqview.userInteractionEnabled=NO;
    }

-(void)serailnumpage{
      [self UserLogmaininsert];
   // if (!self.SerialVCtrl) {
        self.SerialVCtrl=[[SerialViewController alloc]initWithNibName:@"SerialViewController" bundle:nil];
   // }
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
    
    _setngindictr.hidden=NO;
  
    
    [_setngindictr startAnimating];
    [self UserLogmaininsert];
    
     [self UserRightsforparticularmoduleselect];
    _wrksetngview.userInteractionEnabled=NO;
    
}
-(void)securitypage{
      [self UserLogmaininsert];
    _secindictr.hidden=NO;
    _securityview.userInteractionEnabled=NO;
    
    [_secindictr startAnimating];
  //  if (!self.securityVCtrl) {
        self.securityVCtrl=[[SecurityViewController alloc]initWithNibName:@"SecurityViewController" bundle:nil];
    //}
    _securityVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_securityVCtrl animated:YES completion:nil];
    [_secindictr stopAnimating];
    _secindictr.hidden=YES;
    _securityview.userInteractionEnabled=YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closethetile:(id)sender
{
    _Moduleid=0;
   
    _result=@"";
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark- WebService
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],_Moduleid,@"View",@"iOS",extnalip,intrnalip,Udid,0];
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
    if (checkWS==2) {
        
    
    if ([_result isEqualToString:@"Not yet set"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Your rights are not yet set" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        _compinfoindictr.hidden=YES;
        _branchindictr.hidden=YES;
        _docindictr.hidden=YES;
        _setngindictr.hidden=YES;
        _typeindicator.hidden=YES;
        _usersindicator.hidden=YES;
        _rightsindictr.hidden=YES;
        _basicindicatr.hidden=YES;
        _secindictr.hidden=YES;
        [_compinfoindictr stopAnimating];
        [_branchindictr stopAnimating];
        [_docindictr stopAnimating];
        [_setngindictr stopAnimating];
        [_typeindicator stopAnimating];
        [_usersindicator stopAnimating];
        [_rightsindictr stopAnimating];
        [_basicindicatr stopAnimating];
        [_secindictr stopAnimating];
        _companyinfoview.userInteractionEnabled=YES;
        _Documentsview.userInteractionEnabled=YES;
        _foldersview.userInteractionEnabled=YES;
        _usersview.userInteractionEnabled=YES;
        _wrksetngview.userInteractionEnabled=YES;
        _securityview.userInteractionEnabled=YES;
        _basicreqview.userInteractionEnabled=YES;
        _jobsitereqview.userInteractionEnabled=YES;
        _workprocedureview.userInteractionEnabled=YES;
        _result=@"";

    }
    
    
    else
    {

    if (_Moduleid==13) {
        

        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            
            _compinfoindictr.hidden=YES;
            _companyinfoview.userInteractionEnabled=YES;
            
            [_compinfoindictr stopAnimating];_compinfoindictr.hidden=YES;
            _branchindictr.hidden=YES;
            _docindictr.hidden=YES;
            _setngindictr.hidden=YES;
            _typeindicator.hidden=YES;
            _usersindicator.hidden=YES;
            _rightsindictr.hidden=YES;
            _basicindicatr.hidden=YES;
            _secindictr.hidden=YES;
            [_compinfoindictr stopAnimating];
            [_branchindictr stopAnimating];
            [_docindictr stopAnimating];
            [_setngindictr stopAnimating];
            [_typeindicator stopAnimating];
            [_usersindicator stopAnimating];
            [_rightsindictr stopAnimating];
            [_basicindicatr stopAnimating];
            [_secindictr stopAnimating];
            _companyinfoview.userInteractionEnabled=YES;
            _Documentsview.userInteractionEnabled=YES;
            _foldersview.userInteractionEnabled=YES;
            _usersview.userInteractionEnabled=YES;
            _wrksetngview.userInteractionEnabled=YES;
            _securityview.userInteractionEnabled=YES;
            _basicreqview.userInteractionEnabled=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            _workprocedureview.userInteractionEnabled=YES;
            

           // if (!self.compVCtrl) {
                self.compVCtrl=[[CompanyViewController alloc]initWithNibName:@"CompanyViewController" bundle:nil];
           // }
            _compVCtrl.modalPresentationStyle = UIModalPresentationCustom;
            _compVCtrl.userrightsarray=_userrightsarray;
            self.compVCtrl.moduleid=_Moduleid;
       
            [self presentViewController:_compVCtrl
                               animated:YES completion:NULL];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _compinfoindictr.hidden=YES;
            _companyinfoview.userInteractionEnabled=YES;
            
            [_compinfoindictr stopAnimating];
            _compinfoindictr.hidden=YES;
            _branchindictr.hidden=YES;
            _docindictr.hidden=YES;
            _setngindictr.hidden=YES;
            _typeindicator.hidden=YES;
            _usersindicator.hidden=YES;
            _rightsindictr.hidden=YES;
            _basicindicatr.hidden=YES;
            _secindictr.hidden=YES;
            [_compinfoindictr stopAnimating];
            [_branchindictr stopAnimating];
            [_docindictr stopAnimating];
            [_setngindictr stopAnimating];
            [_typeindicator stopAnimating];
            [_usersindicator stopAnimating];
            [_rightsindictr stopAnimating];
            [_basicindicatr stopAnimating];
            [_secindictr stopAnimating];
            _companyinfoview.userInteractionEnabled=YES;
            _Documentsview.userInteractionEnabled=YES;
            _foldersview.userInteractionEnabled=YES;
            _usersview.userInteractionEnabled=YES;
            _wrksetngview.userInteractionEnabled=YES;
            _securityview.userInteractionEnabled=YES;
            _basicreqview.userInteractionEnabled=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            _workprocedureview.userInteractionEnabled=YES;
            

            //You don’t have right to view this form
        }
        
        
    }
    if (_Moduleid==14) {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            
            _branchindictr.hidden=YES;
            _Documentsview.userInteractionEnabled=YES;
            
            [_branchindictr stopAnimating];
            _compinfoindictr.hidden=YES;
            _branchindictr.hidden=YES;
            _docindictr.hidden=YES;
            _setngindictr.hidden=YES;
            _typeindicator.hidden=YES;
            _usersindicator.hidden=YES;
            _rightsindictr.hidden=YES;
            _basicindicatr.hidden=YES;
            _secindictr.hidden=YES;
            [_compinfoindictr stopAnimating];
            [_branchindictr stopAnimating];
            [_docindictr stopAnimating];
            [_setngindictr stopAnimating];
            [_typeindicator stopAnimating];
            [_usersindicator stopAnimating];
            [_rightsindictr stopAnimating];
            [_basicindicatr stopAnimating];
            [_secindictr stopAnimating];
            _companyinfoview.userInteractionEnabled=YES;
            _Documentsview.userInteractionEnabled=YES;
            _foldersview.userInteractionEnabled=YES;
            _usersview.userInteractionEnabled=YES;
            _wrksetngview.userInteractionEnabled=YES;
            _securityview.userInteractionEnabled=YES;
            _basicreqview.userInteractionEnabled=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            _workprocedureview.userInteractionEnabled=YES;
            

           // if (!self.branchVCtrl) {
                self.branchVCtrl=[[BranchViewController alloc]initWithNibName:@"BranchViewController" bundle:nil];
            //}
            _branchVCtrl.userrightsarray=_userrightsarray;
            //_branchVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
            [self presentViewController:_branchVCtrl
                               animated:YES completion:NULL];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _branchindictr.hidden=YES;
            _Documentsview.userInteractionEnabled=YES;
            
            [_branchindictr stopAnimating];
            _compinfoindictr.hidden=YES;
            _branchindictr.hidden=YES;
            _docindictr.hidden=YES;
            _setngindictr.hidden=YES;
            _typeindicator.hidden=YES;
            _usersindicator.hidden=YES;
            _rightsindictr.hidden=YES;
            _basicindicatr.hidden=YES;
            _secindictr.hidden=YES;
            [_compinfoindictr stopAnimating];
            [_branchindictr stopAnimating];
            [_docindictr stopAnimating];
            [_setngindictr stopAnimating];
            [_typeindicator stopAnimating];
            [_usersindicator stopAnimating];
            [_rightsindictr stopAnimating];
            [_basicindicatr stopAnimating];
            [_secindictr stopAnimating];
            _companyinfoview.userInteractionEnabled=YES;
            _Documentsview.userInteractionEnabled=YES;
            _foldersview.userInteractionEnabled=YES;
            _usersview.userInteractionEnabled=YES;
            _wrksetngview.userInteractionEnabled=YES;
            _securityview.userInteractionEnabled=YES;
            _basicreqview.userInteractionEnabled=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            _workprocedureview.userInteractionEnabled=YES;
        }
        

        
    }
    if (_Moduleid==15)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            _docindictr.hidden=YES;
            _workprocedureview.userInteractionEnabled=YES;
            
            [_docindictr stopAnimating];
            _compinfoindictr.hidden=YES;
            _branchindictr.hidden=YES;
            _docindictr.hidden=YES;
            _setngindictr.hidden=YES;
            _typeindicator.hidden=YES;
            _usersindicator.hidden=YES;
            _rightsindictr.hidden=YES;
            _basicindicatr.hidden=YES;
            _secindictr.hidden=YES;
            [_compinfoindictr stopAnimating];
            [_branchindictr stopAnimating];
            [_docindictr stopAnimating];
            [_setngindictr stopAnimating];
            [_typeindicator stopAnimating];
            [_usersindicator stopAnimating];
            [_rightsindictr stopAnimating];
            [_basicindicatr stopAnimating];
            [_secindictr stopAnimating];
            _companyinfoview.userInteractionEnabled=YES;
            _Documentsview.userInteractionEnabled=YES;
            _foldersview.userInteractionEnabled=YES;
            _usersview.userInteractionEnabled=YES;
            _wrksetngview.userInteractionEnabled=YES;
            _securityview.userInteractionEnabled=YES;
            _basicreqview.userInteractionEnabled=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            _workprocedureview.userInteractionEnabled=YES;
            

           // if (!self.cmpnyVCtrl) {
                self.cmpnyVCtrl=[[CmpnydocsViewController alloc]initWithNibName:@"CmpnydocsViewController" bundle:nil];
           // }
            _cmpnyVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
            _cmpnyVCtrl.moduleid=_Moduleid;
            [self presentViewController:_cmpnyVCtrl
                               animated:YES completion:NULL];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _docindictr.hidden=YES;
            _workprocedureview.userInteractionEnabled=YES;
            
            [_docindictr stopAnimating];
            _compinfoindictr.hidden=YES;
            _branchindictr.hidden=YES;
            _docindictr.hidden=YES;
            _setngindictr.hidden=YES;
            _typeindicator.hidden=YES;
            _usersindicator.hidden=YES;
            _rightsindictr.hidden=YES;
            _basicindicatr.hidden=YES;
            _secindictr.hidden=YES;
            [_compinfoindictr stopAnimating];
            [_branchindictr stopAnimating];
            [_docindictr stopAnimating];
            [_setngindictr stopAnimating];
            [_typeindicator stopAnimating];
            [_usersindicator stopAnimating];
            [_rightsindictr stopAnimating];
            [_basicindicatr stopAnimating];
            [_secindictr stopAnimating];
            _companyinfoview.userInteractionEnabled=YES;
            _Documentsview.userInteractionEnabled=YES;
            _foldersview.userInteractionEnabled=YES;
            _usersview.userInteractionEnabled=YES;
            _wrksetngview.userInteractionEnabled=YES;
            _securityview.userInteractionEnabled=YES;
            _basicreqview.userInteractionEnabled=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            _workprocedureview.userInteractionEnabled=YES;
            

        }
        
    }
    if (_Moduleid==16)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            _setngindictr.hidden=YES;
            _wrksetngview.userInteractionEnabled=YES;
            
            [_setngindictr stopAnimating];
            _compinfoindictr.hidden=YES;
            _branchindictr.hidden=YES;
            _docindictr.hidden=YES;
            _setngindictr.hidden=YES;
            _typeindicator.hidden=YES;
            _usersindicator.hidden=YES;
            _rightsindictr.hidden=YES;
            _basicindicatr.hidden=YES;
            _secindictr.hidden=YES;
            [_compinfoindictr stopAnimating];
            [_branchindictr stopAnimating];
            [_docindictr stopAnimating];
            [_setngindictr stopAnimating];
            [_typeindicator stopAnimating];
            [_usersindicator stopAnimating];
            [_rightsindictr stopAnimating];
            [_basicindicatr stopAnimating];
            [_secindictr stopAnimating];
            _companyinfoview.userInteractionEnabled=YES;
            _Documentsview.userInteractionEnabled=YES;
            _foldersview.userInteractionEnabled=YES;
            _usersview.userInteractionEnabled=YES;
            _wrksetngview.userInteractionEnabled=YES;
            _securityview.userInteractionEnabled=YES;
            _basicreqview.userInteractionEnabled=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            _workprocedureview.userInteractionEnabled=YES;
            

           // if (!self.wrkstngVCtrlr) {
                self.wrkstngVCtrlr=[[SettngsViewController alloc]initWithNibName:@"SettngsViewController" bundle:nil];
           // }
            _wrkstngVCtrlr.modalPresentationStyle=UIModalPresentationFormSheet;
            [self presentViewController:_wrkstngVCtrlr animated:YES completion:nil];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _setngindictr.hidden=YES;
            _wrksetngview.userInteractionEnabled=YES;
            
            [_setngindictr stopAnimating];
            _compinfoindictr.hidden=YES;
            _branchindictr.hidden=YES;
            _docindictr.hidden=YES;
            _setngindictr.hidden=YES;
            _typeindicator.hidden=YES;
            _usersindicator.hidden=YES;
            _rightsindictr.hidden=YES;
            _basicindicatr.hidden=YES;
            _secindictr.hidden=YES;
            [_compinfoindictr stopAnimating];
            [_branchindictr stopAnimating];
            [_docindictr stopAnimating];
            [_setngindictr stopAnimating];
            [_typeindicator stopAnimating];
            [_usersindicator stopAnimating];
            [_rightsindictr stopAnimating];
            [_basicindicatr stopAnimating];
            [_secindictr stopAnimating];
            _companyinfoview.userInteractionEnabled=YES;
            _Documentsview.userInteractionEnabled=YES;
            _foldersview.userInteractionEnabled=YES;
            _usersview.userInteractionEnabled=YES;
            _wrksetngview.userInteractionEnabled=YES;
            _securityview.userInteractionEnabled=YES;
            _basicreqview.userInteractionEnabled=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            _workprocedureview.userInteractionEnabled=YES;
            

           
        }
        
    }
    if (_Moduleid==20)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            _typeindicator.hidden=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            
            [_typeindicator stopAnimating];
            _compinfoindictr.hidden=YES;
            _branchindictr.hidden=YES;
            _docindictr.hidden=YES;
            _setngindictr.hidden=YES;
            _typeindicator.hidden=YES;
            _usersindicator.hidden=YES;
            _rightsindictr.hidden=YES;
            _basicindicatr.hidden=YES;
            _secindictr.hidden=YES;
            [_compinfoindictr stopAnimating];
            [_branchindictr stopAnimating];
            [_docindictr stopAnimating];
            [_setngindictr stopAnimating];
            [_typeindicator stopAnimating];
            [_usersindicator stopAnimating];
            [_rightsindictr stopAnimating];
            [_basicindicatr stopAnimating];
            [_secindictr stopAnimating];
            _companyinfoview.userInteractionEnabled=YES;
            _Documentsview.userInteractionEnabled=YES;
            _foldersview.userInteractionEnabled=YES;
            _usersview.userInteractionEnabled=YES;
            _wrksetngview.userInteractionEnabled=YES;
            _securityview.userInteractionEnabled=YES;
            _basicreqview.userInteractionEnabled=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            _workprocedureview.userInteractionEnabled=YES;
            

           // if (!self.typeVCtrl) {
                self.typeVCtrl=[[TypeViewController alloc]initWithNibName:@"TypeViewController" bundle:nil];
           // }
            _typeVCtrl.modalPresentationStyle = UIModalPresentationFormSheet;
            _typeVCtrl.userrightsarray=_userrightsarray;
            [self presentViewController:_typeVCtrl
                               animated:YES completion:NULL];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _typeindicator.hidden=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            
            [_typeindicator stopAnimating];
            _compinfoindictr.hidden=YES;
            _branchindictr.hidden=YES;
            _docindictr.hidden=YES;
            _setngindictr.hidden=YES;
            _typeindicator.hidden=YES;
            _usersindicator.hidden=YES;
            _rightsindictr.hidden=YES;
            _basicindicatr.hidden=YES;
            _secindictr.hidden=YES;
            [_compinfoindictr stopAnimating];
            [_branchindictr stopAnimating];
            [_docindictr stopAnimating];
            [_setngindictr stopAnimating];
            [_typeindicator stopAnimating];
            [_usersindicator stopAnimating];
            [_rightsindictr stopAnimating];
            [_basicindicatr stopAnimating];
            [_secindictr stopAnimating];
            _companyinfoview.userInteractionEnabled=YES;
            _Documentsview.userInteractionEnabled=YES;
            _foldersview.userInteractionEnabled=YES;
            _usersview.userInteractionEnabled=YES;
            _wrksetngview.userInteractionEnabled=YES;
            _securityview.userInteractionEnabled=YES;
            _basicreqview.userInteractionEnabled=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            _workprocedureview.userInteractionEnabled=YES;
            

        }
    }
    if (_Moduleid==1012)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            _usersindicator.hidden=YES;
            _usersview.userInteractionEnabled=YES;
            
            [_usersindicator stopAnimating];
            _compinfoindictr.hidden=YES;
            _branchindictr.hidden=YES;
            _docindictr.hidden=YES;
            _setngindictr.hidden=YES;
            _typeindicator.hidden=YES;
            _usersindicator.hidden=YES;
            _rightsindictr.hidden=YES;
            _basicindicatr.hidden=YES;
            _secindictr.hidden=YES;
            [_compinfoindictr stopAnimating];
            [_branchindictr stopAnimating];
            [_docindictr stopAnimating];
            [_setngindictr stopAnimating];
            [_typeindicator stopAnimating];
            [_usersindicator stopAnimating];
            [_rightsindictr stopAnimating];
            [_basicindicatr stopAnimating];
            [_secindictr stopAnimating];
            _companyinfoview.userInteractionEnabled=YES;
            _Documentsview.userInteractionEnabled=YES;
            _foldersview.userInteractionEnabled=YES;
            _usersview.userInteractionEnabled=YES;
            _wrksetngview.userInteractionEnabled=YES;
            _securityview.userInteractionEnabled=YES;
            _basicreqview.userInteractionEnabled=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            _workprocedureview.userInteractionEnabled=YES;
            

           // if (!self.usersVctrl) {
                self.usersVctrl=[[UsersViewController alloc]initWithNibName:@"UsersViewController" bundle:nil];
           // }
            _usersVctrl.modalPresentationStyle = UIModalPresentationPageSheet;
            _usersVctrl.userrightsarray=_userrightsarray;
            _usersVctrl.moduleid=_Moduleid;
            [self presentViewController:_usersVctrl
                               animated:YES completion:NULL];

            
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _compinfoindictr.hidden=YES;
            _branchindictr.hidden=YES;
            _docindictr.hidden=YES;
            _setngindictr.hidden=YES;
            _typeindicator.hidden=YES;
            _usersindicator.hidden=YES;
            _rightsindictr.hidden=YES;
            _basicindicatr.hidden=YES;
            _secindictr.hidden=YES;
            [_compinfoindictr stopAnimating];
            [_branchindictr stopAnimating];
            [_docindictr stopAnimating];
            [_setngindictr stopAnimating];
            [_typeindicator stopAnimating];
            [_usersindicator stopAnimating];
            [_rightsindictr stopAnimating];
            [_basicindicatr stopAnimating];
            [_secindictr stopAnimating];
            _companyinfoview.userInteractionEnabled=YES;
            _Documentsview.userInteractionEnabled=YES;
            _foldersview.userInteractionEnabled=YES;
            _usersview.userInteractionEnabled=YES;
            _wrksetngview.userInteractionEnabled=YES;
            _securityview.userInteractionEnabled=YES;
            _basicreqview.userInteractionEnabled=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            _workprocedureview.userInteractionEnabled=YES;
            

        }
    }
    if (_Moduleid==1011)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            _rightsindictr.hidden=YES;
            _foldersview.userInteractionEnabled=YES;
            
            [_rightsindictr stopAnimating];
            _compinfoindictr.hidden=YES;
            _branchindictr.hidden=YES;
            _docindictr.hidden=YES;
            _setngindictr.hidden=YES;
            _typeindicator.hidden=YES;
            _usersindicator.hidden=YES;
            _rightsindictr.hidden=YES;
            _basicindicatr.hidden=YES;
            _secindictr.hidden=YES;
            [_compinfoindictr stopAnimating];
            [_branchindictr stopAnimating];
            [_docindictr stopAnimating];
            [_setngindictr stopAnimating];
            [_typeindicator stopAnimating];
            [_usersindicator stopAnimating];
            [_rightsindictr stopAnimating];
            [_basicindicatr stopAnimating];
            [_secindictr stopAnimating];
            _companyinfoview.userInteractionEnabled=YES;
            _Documentsview.userInteractionEnabled=YES;
            _foldersview.userInteractionEnabled=YES;
            _usersview.userInteractionEnabled=YES;
            _wrksetngview.userInteractionEnabled=YES;
            _securityview.userInteractionEnabled=YES;
            _basicreqview.userInteractionEnabled=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            _workprocedureview.userInteractionEnabled=YES;
            

           // if (!self.ftileVCtrl) {
                self.ftileVCtrl=[[FtileViewController alloc]initWithNibName:@"FtileViewController" bundle:nil];
           // }
            _ftileVCtrl.modalPresentationStyle = UIModalPresentationFormSheet;
           // _ftileVCtrl.userrightsarray=_userrightsarray;
            [self presentViewController:_ftileVCtrl
                               animated:YES completion:NULL];

        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _branchindictr.hidden=YES;
            _Documentsview.userInteractionEnabled=YES;
            
            [_branchindictr stopAnimating];
            _compinfoindictr.hidden=YES;
            _branchindictr.hidden=YES;
            _docindictr.hidden=YES;
            _setngindictr.hidden=YES;
            _typeindicator.hidden=YES;
            _usersindicator.hidden=YES;
            _rightsindictr.hidden=YES;
            _basicindicatr.hidden=YES;
            _secindictr.hidden=YES;
            [_compinfoindictr stopAnimating];
            [_branchindictr stopAnimating];
            [_docindictr stopAnimating];
            [_setngindictr stopAnimating];
            [_typeindicator stopAnimating];
            [_usersindicator stopAnimating];
            [_rightsindictr stopAnimating];
            [_basicindicatr stopAnimating];
            [_secindictr stopAnimating];
            _companyinfoview.userInteractionEnabled=YES;
            _Documentsview.userInteractionEnabled=YES;
            _foldersview.userInteractionEnabled=YES;
            _usersview.userInteractionEnabled=YES;
            _wrksetngview.userInteractionEnabled=YES;
            _securityview.userInteractionEnabled=YES;
            _basicreqview.userInteractionEnabled=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            _workprocedureview.userInteractionEnabled=YES;

        }
    }
    if (_Moduleid==23)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            _branchindictr.hidden=YES;
            _Documentsview.userInteractionEnabled=YES;
            
            [_branchindictr stopAnimating];
            _compinfoindictr.hidden=YES;
            _branchindictr.hidden=YES;
            _docindictr.hidden=YES;
            _setngindictr.hidden=YES;
            _typeindicator.hidden=YES;
            _usersindicator.hidden=YES;
            _rightsindictr.hidden=YES;
            _basicindicatr.hidden=YES;
            _secindictr.hidden=YES;
            [_compinfoindictr stopAnimating];
            [_branchindictr stopAnimating];
            [_docindictr stopAnimating];
            [_setngindictr stopAnimating];
            [_typeindicator stopAnimating];
            [_usersindicator stopAnimating];
            [_rightsindictr stopAnimating];
            [_basicindicatr stopAnimating];
            [_secindictr stopAnimating];
            _companyinfoview.userInteractionEnabled=YES;
            _Documentsview.userInteractionEnabled=YES;
            _foldersview.userInteractionEnabled=YES;
            _usersview.userInteractionEnabled=YES;
            _wrksetngview.userInteractionEnabled=YES;
            _securityview.userInteractionEnabled=YES;
            _basicreqview.userInteractionEnabled=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            _workprocedureview.userInteractionEnabled=YES;
           // if (!self.basicreqVctrl) {
                self.basicreqVctrl=[[BasicReqViewController alloc]initWithNibName:@"BasicReqViewController" bundle:nil];
            //}
            // _basicreqVctrl.modalPresentationStyle = UIModalPresentationPageSheet;
            _basicreqVctrl.userrightsarray=_userrightsarray;
            [self presentViewController:_basicreqVctrl
                               animated:YES completion:NULL];

            
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _branchindictr.hidden=YES;
            _Documentsview.userInteractionEnabled=YES;
            
            [_branchindictr stopAnimating];
            _compinfoindictr.hidden=YES;
            _branchindictr.hidden=YES;
            _docindictr.hidden=YES;
            _setngindictr.hidden=YES;
            _typeindicator.hidden=YES;
            _usersindicator.hidden=YES;
            _rightsindictr.hidden=YES;
            _basicindicatr.hidden=YES;
            _secindictr.hidden=YES;
            [_compinfoindictr stopAnimating];
            [_branchindictr stopAnimating];
            [_docindictr stopAnimating];
            [_setngindictr stopAnimating];
            [_typeindicator stopAnimating];
            [_usersindicator stopAnimating];
            [_rightsindictr stopAnimating];
            [_basicindicatr stopAnimating];
            [_secindictr stopAnimating];
            _companyinfoview.userInteractionEnabled=YES;
            _Documentsview.userInteractionEnabled=YES;
            _foldersview.userInteractionEnabled=YES;
            _usersview.userInteractionEnabled=YES;
            _wrksetngview.userInteractionEnabled=YES;
            _securityview.userInteractionEnabled=YES;
            _basicreqview.userInteractionEnabled=YES;
            _jobsitereqview.userInteractionEnabled=YES;
            _workprocedureview.userInteractionEnabled=YES;

        }
    }
    }
        checkWS=0;
    }

}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
       if([elementName isEqualToString:@"UserRightsforparticularmoduleselectResponse"])
    {
        
        checkWS=2;
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
