//
//  ResViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "ResViewController.h"

@interface ResViewController ()

@end

@implementation ResViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //new project.....
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _result=@"";
    _ModuleID=0;
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(manpwrpage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.manpwrview addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(equipPage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.eqpView addGestureRecognizer:doubleTap1];
    UITapGestureRecognizer *doubleTap2 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(materialsPage)];
    doubleTap2.numberOfTapsRequired=1;
    doubleTap2.delegate=(id)self;
    [self.materialView addGestureRecognizer:doubleTap2];
    UITapGestureRecognizer *doubleTap3 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(fleetPage)];
    doubleTap3.numberOfTapsRequired=1;
    doubleTap3.delegate=(id)self;
    [self.fleetview addGestureRecognizer:doubleTap3];

    UITapGestureRecognizer *doubleTap4 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(toolPage)];
    doubleTap4.numberOfTapsRequired=1;
    doubleTap4.delegate=(id)self;
    [self.smalltoolview addGestureRecognizer:doubleTap4];
    
    UITapGestureRecognizer *doubleTap5 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(ThirdPage)];
    doubleTap5.numberOfTapsRequired=1;
    doubleTap5.delegate=(id)self;
    [self.thirdpartyview addGestureRecognizer:doubleTap5];
    
    UITapGestureRecognizer *doubleTap6 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(ConsumPage)];
    doubleTap6.numberOfTapsRequired=1;
    doubleTap6.delegate=(id)self;
    [self.consumbleview addGestureRecognizer:doubleTap6];


    UITapGestureRecognizer *doubleTap7 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(AssetPage)];
    doubleTap7.numberOfTapsRequired=1;
    doubleTap7.delegate=(id)self;
    [self.cmpanyassetview addGestureRecognizer:doubleTap7];
    UITapGestureRecognizer *doubleTap8 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(crewpage)];
    doubleTap8.numberOfTapsRequired=1;
    doubleTap8.delegate=(id)self;
    [self.crewview addGestureRecognizer:doubleTap8];

    UITapGestureRecognizer *doubleTap9 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(hrpage)];
    doubleTap9.numberOfTapsRequired=1;
    doubleTap9.delegate=(id)self;
    [self.hrview addGestureRecognizer:doubleTap9];
    [self.hrview setExclusiveTouch:YES];
    UITapGestureRecognizer *doubleTap10 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(saftypage)];
    doubleTap10.numberOfTapsRequired=1;
    doubleTap10.delegate=(id)self;
    [self.saftyview addGestureRecognizer:doubleTap10];
    [self.saftyview setExclusiveTouch:YES];


}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _hrindicator.hidden=YES;
    _manpwrview.userInteractionEnabled=YES;
    _manactivity.hidden=YES;
    _eqpView.userInteractionEnabled=YES;
    _eqactivity.hidden=YES;
    _materialView.userInteractionEnabled=YES;
    _matactivity.hidden=YES;
    _fleetview.userInteractionEnabled=YES;
    _fleetactivity.hidden=YES;
    _crewview.userInteractionEnabled=YES;
    _gpactivity.hidden=YES;
    _thirdpartyview.userInteractionEnabled=YES;
    _tpactivity.hidden=YES;
    _consumbleview.userInteractionEnabled=YES;
    _conactivity.hidden=YES;
    _smalltoolview.userInteractionEnabled=YES;
    _stactivity.hidden=YES;
    _cmpanyassetview.userInteractionEnabled=YES;
    _assetactivity.hidden=YES;
     [_conactivity stopAnimating];
    [_manactivity stopAnimating];
    [_eqactivity stopAnimating];
    [_matactivity stopAnimating];
    [_fleetactivity stopAnimating];
    [_gpactivity stopAnimating];
    [_tpactivity stopAnimating];
    [_stactivity stopAnimating];
    [_assetactivity stopAnimating];
    
    
    
    
    
}
-(void)hrpage{
    _ModuleID=8;
    [self UserLogmaininsert];
    //_custindictr.hidden=YES;
   // _ledactvtyindctr.hidden=YES;
   // _planactivityindctr.hidden=YES;
    //_estactvityindicator.hidden=YES;
    
   // _promgmtindicatr.hidden=YES;
   // _compactivityindctr.hidden=YES;
   // _resactivtyindictr.hidden=YES;
    
    _hrindicator.hidden=NO;
    _hrview.userInteractionEnabled=NO;
    [_hrindicator startAnimating];
    [self UserRightsforparticularmoduleselect];

}
-(void)saftypage{
    
    _SafetyVCtrl=[[SafetyViewController alloc]initWithNibName:@"SafetyViewController" bundle:nil];
      _SafetyVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
  
    [self presentViewController:_SafetyVCtrl
                       animated:YES completion:NULL];

    
}
-(void)equipPage
{
    _eqpView.userInteractionEnabled=YES;
    _eqactivity.hidden=NO;
    [_eqactivity startAnimating];
    _ModuleID=27;
    [self UserLogmaininsert];
    [self UserRightsforparticularmoduleselect];
     _eqpView.userInteractionEnabled=NO;
   
}

-(void)manpwrpage{
    _manpwrview.userInteractionEnabled=YES;
    _manactivity.hidden=NO;
    [_matactivity startAnimating];
    
    _ModuleID=26;
     [self UserLogmaininsert];
    [self UserRightsforparticularmoduleselect];
     _manpwrview.userInteractionEnabled=NO;
   }
-(void)materialsPage
{
    _materialView.userInteractionEnabled=YES;
    _matactivity.hidden=NO;
    [_matactivity startAnimating];
    
    _ModuleID=28;
     [self UserLogmaininsert];
    [self UserRightsforparticularmoduleselect];
    _materialView.userInteractionEnabled=NO;
   
}


-(void)fleetPage{
    _fleetview.userInteractionEnabled=YES;
    _fleetactivity.hidden=NO;
    [_fleetactivity startAnimating];
    _ModuleID=29;
     [self UserLogmaininsert];
    [self UserRightsforparticularmoduleselect];
     _fleetview.userInteractionEnabled=NO;
  
    
}
-(void)toolPage{
    _smalltoolview.userInteractionEnabled=YES;
    _stactivity.hidden=NO;
    [_stactivity startAnimating];
    _ModuleID=36;
     [self UserLogmaininsert];
    [self UserRightsforparticularmoduleselect];
      _smalltoolview.userInteractionEnabled=NO;
   

    
}
-(void)ThirdPage{
    _thirdpartyview.userInteractionEnabled=YES;
    _tpactivity.hidden=NO;
    [_tpactivity startAnimating];
    _ModuleID=34;
     [self UserLogmaininsert];
    [self UserRightsforparticularmoduleselect];
     _thirdpartyview.userInteractionEnabled=NO;
   

}
-(void)ConsumPage{
    _consumbleview.userInteractionEnabled=YES;
    _conactivity.hidden=NO;
    [_conactivity startAnimating];
    _ModuleID=35;
     [self UserLogmaininsert];
    [self UserRightsforparticularmoduleselect];
    _consumbleview.userInteractionEnabled=NO;
    
    
}
-(void)AssetPage{
    _cmpanyassetview.userInteractionEnabled=YES;
    _assetactivity.hidden=NO;
    [_assetactivity startAnimating];
    _ModuleID=37;
     [self UserLogmaininsert];
    [self UserRightsforparticularmoduleselect];
    _cmpanyassetview.userInteractionEnabled=NO;
   
}
-(void)crewpage{
    _crewview.userInteractionEnabled=YES;
    _gpactivity.hidden=NO;
    [_gpactivity startAnimating];

    _ModuleID=30;
     [self UserLogmaininsert];
    [self UserRightsforparticularmoduleselect];
     _crewview.userInteractionEnabled=NO;
    

    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closebtnActn:(id)sender {
    _result=@"";
    _ModuleID=0;
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark-Webservice
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
                   "</soap:Envelope>\n",[userid integerValue],_ModuleID];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],_ModuleID,@"View",@"iOS",extnalip,intrnalip,Udid,0];
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
    //NSDictionary *dictionary=[_xmlParser dictionaryWithValuesForKeys:[[NSArray alloc]initWithObjects:@"JobNumber", nil]];
    
    //  NSLog(@"dictioanry is %@",dictionary);
    
    
	[_xmlParser parse];
    if (checkWS==2) {
        
    
    if ([_result isEqualToString:@"Not yet set"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Your rights are not yet set" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        _manpwrview.userInteractionEnabled=YES;
        _manactivity.hidden=YES;
        [_manactivity stopAnimating];
        _eqpView.userInteractionEnabled=YES;
        _eqactivity.hidden=YES;
        [_eqactivity stopAnimating];
        _materialView.userInteractionEnabled=YES;
        _matactivity.hidden=YES;
        [_matactivity stopAnimating];
        _fleetview.userInteractionEnabled=YES;
        _fleetactivity.hidden=YES;
           [_fleetactivity stopAnimating];
        _crewview.userInteractionEnabled=YES;
        _gpactivity.hidden=YES;
           [_gpactivity stopAnimating];
        _thirdpartyview.userInteractionEnabled=YES;
        _tpactivity.hidden=YES;
         [_tpactivity stopAnimating];
        _consumbleview.userInteractionEnabled=YES;
        _conactivity.hidden=YES;
        [_conactivity stopAnimating];

        _smalltoolview.userInteractionEnabled=YES;
        _stactivity.hidden=YES;
          [_stactivity stopAnimating];
        _cmpanyassetview.userInteractionEnabled=YES;
        _assetactivity.hidden=YES;
          [_assetactivity stopAnimating];
        _result=@"";

    }
    
    
    else
    {

    if (_ModuleID==26) {
        
        
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            
            
            // if (!self.manVCtrl) {
            _manVCtrl=[[ManViewController alloc]initWithNibName:@"ManViewController" bundle:nil];
            // }
            _manVCtrl.modalPresentationStyle = UIModalPresentationFullScreen;
            _manVCtrl.userrightsarray=_userrightsarray;
            [self presentViewController:_manVCtrl
                               animated:YES completion:NULL];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];

        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];
            //You don’t have right to view this form
        }
        
        
    }
    if (_ModuleID==27) {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];
            //if (!self.equipVCtrl) {
            _equipVCtrl=[[EqpmViewController alloc]initWithNibName:@"EqpmViewController" bundle:nil];
            // }
            _equipVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
            _equipVCtrl.userrightsarray=_userrightsarray;
            [self presentViewController:_equipVCtrl
                               animated:YES completion:NULL];
            
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];

        }
       

        
    }
    if (_ModuleID==28)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];

            // if (!self.materialVCtrl) {
            _materialVCtrl=[[MaterialsViewController alloc]initWithNibName:@"MaterialsViewController" bundle:nil];
            // }
            _materialVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
            _materialVCtrl.userrightsarray=_userrightsarray;
            [self presentViewController:_materialVCtrl
                               animated:YES completion:NULL];        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];
            

        }
      
    }
    if (_ModuleID==29)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];

            // if (!self.fleetVCtrl) {
            _fleetVCtrl=[[FleetsViewController alloc]initWithNibName:@"FleetsViewController" bundle:nil];
            // }
            
            _fleetVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
            _fleetVCtrl.userrightsarray=_userrightsarray;
            [self presentViewController:_fleetVCtrl animated:YES completion:nil];        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];
            

        }
            }
    if (_ModuleID==30)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];
            

            //if (!self.gpctrl) {
            self.gpctrl=[[GPSetupTileViewController alloc]initWithNibName:@"GPSetupTileViewController" bundle:nil];
            //  }
            _gpctrl.modalPresentationStyle = UIModalPresentationFormSheet;
            [self presentViewController:_gpctrl
                               animated:YES completion:NULL];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];
            

        }
       
        
    }
    if (_ModuleID==34)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];
            

            // if (!self.ThirdVCtrl) {
            _ThirdVCtrl=[[ThirdPartyViewController alloc]initWithNibName:@"ThirdPartyViewController" bundle:nil];
            // }
            
            _ThirdVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
            _ThirdVCtrl.userrightsarray=_userrightsarray;
            [self presentViewController: _ThirdVCtrl animated:YES completion:nil];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];
            

        }
       

    }
    if (_ModuleID==35)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];
            

            //if (!self.ConsuVCtrl) {
            _ConsuVCtrl=[[ConsumbleViewController alloc]initWithNibName:@"ConsumbleViewController" bundle:nil];
            //}
            
            _ConsuVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
            _ConsuVCtrl.userrightsarray=_userrightsarray;
            [self presentViewController: _ConsuVCtrl animated:YES completion:nil];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];
            

        }
       

    }
    if (_ModuleID==36)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];
            

            // if (!self.smalltoolVCtrl) {
            _smalltoolVCtrl=[[SmalltoolsViewController alloc]initWithNibName:@"SmalltoolsViewController" bundle:nil];
            // }
            
            _smalltoolVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
            _smalltoolVCtrl.userrightsarray=_userrightsarray;
            [self presentViewController: _smalltoolVCtrl animated:YES completion:nil];
            
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];
            

        }
       
       
    }
        if (_ModuleID==8)
        {
            Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
            if (rightsmodel.ViewModule==1) {
                _hrindicator.hidden=YES;
                _hrview.userInteractionEnabled=YES;
                [_hrindicator stopAnimating];
              
                _hrview.userInteractionEnabled=YES;
                
                // if (!self.TilehrVCtrl) {
                self.TilehrVCtrl=[[TilehrViewController alloc]initWithNibName:@"TilehrViewController" bundle:nil];
                // }
                
                _TilehrVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
                
                [self presentViewController:_TilehrVCtrl
                                   animated:YES completion:NULL];
                
            }
            else
            {
                _hrindicator.hidden=YES;
                [_hrindicator stopAnimating];
                _hrview.userInteractionEnabled=YES;
//                _compactivityindctr.hidden=YES;
//                [_compactivityindctr stopAnimating];
//                _resactivtyindictr.hidden=YES;
//                [_resactivtyindictr stopAnimating];
//                _custindictr.hidden=YES;
//                [_custindictr stopAnimating];
//                _ledactvtyindctr.hidden=YES;
//                [_ledactvtyindctr stopAnimating];
//                _planactivityindctr.hidden=YES;
//                [_planactivityindctr stopAnimating];
//                _estactvityindicator.hidden=YES;
//                [_estactvityindicator stopAnimating];
                _hrindicator.hidden=YES;
                [_hrindicator stopAnimating];
//                _promgmtindicatr.hidden=YES;
//                [_promgmtindicatr stopAnimating];
//                _companyView.userInteractionEnabled=YES;
//                _reurceview.userInteractionEnabled=YES;
//                _customerview.userInteractionEnabled=YES;
//                _leadView.userInteractionEnabled=YES;
//                _planngview.userInteractionEnabled=YES;
//                _estimtnview.userInteractionEnabled=YES;
//                _projectview.userInteractionEnabled=YES;
                _hrview.userInteractionEnabled=YES;
                
                
                
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                
            }
        
        
        
    }
          
    if (_ModuleID==37)
    {
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        if (rightsmodel.ViewModule==1) {
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];
            

            // if (!self.AssetVCtrl) {
            _AssetVCtrl=[[AssetsViewController alloc]initWithNibName:@"AssetsViewController" bundle:nil];
            //}
            
            _AssetVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
            _AssetVCtrl.userrightsarray=_userrightsarray;
            [self presentViewController: _AssetVCtrl animated:YES completion:nil];
            
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _manpwrview.userInteractionEnabled=YES;
            _manactivity.hidden=YES;
            [_manactivity stopAnimating];
            _eqpView.userInteractionEnabled=YES;
            _eqactivity.hidden=YES;
            [_eqactivity stopAnimating];
            _materialView.userInteractionEnabled=YES;
            _matactivity.hidden=YES;
            [_matactivity stopAnimating];
            _fleetview.userInteractionEnabled=YES;
            _fleetactivity.hidden=YES;
            [_fleetactivity stopAnimating];
            _crewview.userInteractionEnabled=YES;
            _gpactivity.hidden=YES;
            [_gpactivity stopAnimating];
            _thirdpartyview.userInteractionEnabled=YES;
            _tpactivity.hidden=YES;
            [_tpactivity stopAnimating];
            _consumbleview.userInteractionEnabled=YES;
            _conactivity.hidden=YES;
            [_conactivity stopAnimating];
            
            _smalltoolview.userInteractionEnabled=YES;
            _stactivity.hidden=YES;
            [_stactivity stopAnimating];
            _cmpanyassetview.userInteractionEnabled=YES;
            _assetactivity.hidden=YES;
            [_assetactivity stopAnimating];
            

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
    if([elementName isEqualToString:@"message"]){
        
        recordResults = FALSE;
        [self.navigationController popToRootViewControllerAnimated:YES];
        _soapResults=nil;
    }
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
