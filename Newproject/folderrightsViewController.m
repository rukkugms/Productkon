//
//  folderrightsViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 17/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "folderrightsViewController.h"

@interface folderrightsViewController ()

@end

@implementation folderrightsViewController

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
    _editview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _folderrighttable.layer.borderWidth = 2.0;
    _folderrighttable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];

    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [self SelectAllFolderRights];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-tableview datasources
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_allfolderrightsarray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"custonfldrrigtscell" owner:self options:nil];
        cell=_folderrightscell;
    }
    allfolderrights*fldrrghtsmdl=(allfolderrights *)[_allfolderrightsarray objectAtIndex:indexPath.row];
    _namelabel=(UILabel *)[cell viewWithTag:5];
    _namelabel.text=fldrrghtsmdl.username;
    _createcheckbtn=(UIButton*)[cell viewWithTag:1];
    _upldcheckbtn=(UIButton*)[cell viewWithTag:2];
    _dwnldcheckbtn=(UIButton*)[cell viewWithTag:3];

    if (fldrrghtsmdl.create==0) {
        [_createcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else if(fldrrghtsmdl.create==1){
        [_createcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
    if (fldrrghtsmdl.upload==0) {
        [_upldcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else if(fldrrghtsmdl.upload==1){
        [_upldcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
    if (fldrrghtsmdl.dwnld==0) {
        [_dwnldcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else if(fldrrghtsmdl.dwnld==1){
        [_dwnldcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }



    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_folderrighttable)
    {
        if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
        }else
        {
            
            //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
            
            
        }
    }
}

#pragma mark-IBActions
-(IBAction)closefolderrightsview:(id)sender
{
     _editview.hidden=YES;
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)editfolderrights:(id)sender
{
    _updatebtn.enabled=YES;
    _editview.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.folderrighttable];
    NSIndexPath *textFieldIndexPath = [self.folderrighttable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    allfolderrights*mdl=(allfolderrights *)[_allfolderrightsarray objectAtIndex:textFieldIndexPath.row];
    _editnamelabel.text=mdl.username;
    if (mdl.create==0) {
        [_editcreatecheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else if(mdl.create==1){
        [_editcreatecheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
    if (mdl.upload==0) {
        [_editupldcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else if(mdl.upload==1){
        [_editupldcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
    if (mdl.dwnld==0) {
        [_editdwnldcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else if(mdl.dwnld==1){
        [_editdwnldcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }


}
-(IBAction)closeeditview:(id)sender
{
    _editview.hidden=YES;
    _updatebtn.enabled=YES;
}
-(IBAction)createaction:(id)sender
{ createstring=@"create";
    if (createcheck==0) {
        [_editcreatecheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        createcheck=1;
        
    }
    
    else{
        [_editcreatecheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        createcheck=0;
        
    }

}
-(IBAction)upldaction:(id)sender
{
    upldstring=@"upld";
    if (uploadcheck==0) {
        [_editupldcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        uploadcheck=1;
        
    }
    
    else{
        [_editupldcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        uploadcheck=0;
        
    }

}
-(IBAction)dwnldaction:(id)sender
{
    dwnldstring=@"dwld";
    if (dwnlodcheck==0) {
        [_editdwnldcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        dwnlodcheck=1;
        
    }
    
    else{
        [_editdwnldcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        dwnlodcheck=0;
        
    }

}
-(IBAction)updatefolderrights:(id)sender
{
    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    if (rightsmodel.EditModule==0) {
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to edit this record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        
        
    }
    else
    {
        
    [self UserLogmainupdate];
    _updatebtn.enabled=NO;
    [self UpdateFolderRights];
        
    }
    
}
-(IBAction)cancel:(id)sender
{
     [_editdwnldcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_editupldcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_editcreatecheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    
}

#pragma mark- WebService
-(void)SelectAllFolderRights{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllFolderRights xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllFolderRights>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllFolderRights" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateFolderRights
{
    webtype=1;
     allfolderrights*mdl=(allfolderrights *)[_allfolderrightsarray objectAtIndex:btnindex];
    
    recordResults = FALSE;
    NSString *soapMessage;
    NSInteger create;
    NSInteger upld;
    NSInteger dwnld;
    if([createstring isEqualToString:@"create"])
    {
    if (createcheck==0) {
        create=0;
    }
    else{
        create=1;
        
    }
      createstring=@"";
    }
    else
    {
        create=mdl.create;
    }
     if([upldstring isEqualToString:@"upld"])
     {
    if (uploadcheck==0) {
        upld=0;
    }
    else{
        upld=1;
        
    }
         upldstring=@"";
     }
    else
    {
        upld=mdl.upload;
    }
    if([dwnldstring isEqualToString:@"dwld"])
    {
    if (dwnlodcheck==0) {
        dwnld=0;
    }
    else{
        dwnld=1;
        
    }
        dwnldstring=@"";
    }
    else
    {
        dwnld=mdl.dwnld;
    }



    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateFolderRights xmlns=\"http://ios.kontract360.com/\">\n"
                   "<userid>%d</userid>\n"
                   "<create>%d</create>\n"
                   "<delete>%d</delete>\n"
                   "<upload>%d</upload>\n"
                   "<download>%d</download>\n"
                   "</UpdateFolderRights>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",mdl.userid,create,mdl.del,upld,dwnld];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateFolderRights" forHTTPHeaderField:@"Soapaction"];
    
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],_moduleid,@"Edit",@"iOS",extnalip,intrnalip,Udid,0];
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
        [_folderrighttable reloadData];


}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectAllFolderRightsResult"])
    {
        _allfolderrightsarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"userid"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"username"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"create"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"delete"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"upload"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"download"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"UpdateFolderRightsResult"])
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
    if([elementName isEqualToString:@"userid"])
    {
        _fldrrights=[[allfolderrights alloc]init];
        
        recordResults = FALSE;
        
        _fldrrights.userid=[_soapResults integerValue];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"username"])
    {
        
        
        recordResults = FALSE;
        
        _fldrrights.username=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"create"])
    {
        
        
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"false"]) {
            _fldrrights.create=0;
            createcheck=0;
            
        }
        else{
            _fldrrights.create=1;
            createcheck=1;
        }
        
                _soapResults = nil;

    }
    if([elementName isEqualToString:@"delete"])
    {
        
        
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"false"]) {
            _fldrrights.del=0;
             //checkbtnclick=0;
            
        }
        else{
            _fldrrights.del=1;
            //checkbtnclick=1;
        }
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"upload"])
    {
        
        
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"false"]) {
            _fldrrights.upload=0;
             uploadcheck=0;
            
        }
        else{
            _fldrrights.upload=1;
             uploadcheck=1;
        }
        
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"download"])
    {
        
        
        
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"false"]) {
            _fldrrights.dwnld=0;
             dwnlodcheck=0;
            
        }
        else{
            _fldrrights.dwnld=1;
             dwnlodcheck=1;
        }
        [_allfolderrightsarray addObject:_fldrrights];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"result"])
    {
        
        recordResults=FALSE;
            _soapstring=_soapResults;
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
                   [self SelectAllFolderRights];
        
        

                _soapResults=nil;
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
        ////NSLog(@"buttonIndex%d",buttonIndex);
        
        if ([alertView.message isEqualToString:_soapstring]) {
            
            
            
            if (buttonIndex==0) {
                
                
                [_editcreatecheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
                [_editdwnldcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
                [_editupldcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
                _editview.hidden=YES;
                _updatebtn.enabled=YES;
                
                
            }
        }


}







@end
