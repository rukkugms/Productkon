//
//  forgetViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 01/08/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "forgetViewController.h"

@interface forgetViewController ()

@end

@implementation forgetViewController

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
    // self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _passwordview.hidden=YES;
    _logoutview.hidden=YES;
  //  _passwordview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
   // _logoutview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f /alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_btnindex==0) {
         _questionsarray=[[NSMutableArray alloc]init];
        _passwordview.hidden=NO;
        [[_passwordview layer] setBorderWidth:1];
        [[_passwordview layer] setCornerRadius:10];
        _logoutview.hidden=YES;
        _navitem.title=@"Reset Your Password";
        _userText.text=@"";
        _newpswdText.text=@"";
        _confirmpswdText.text=@"";
        _answrText.text=@"";
        _answrText.enabled=NO;
        [_qstnbtn setTitle:@"Select" forState:UIControlStateNormal];
    }
    else
    {
        
        _passwordview.hidden=YES;
        _logoutview.hidden=NO;
        _paswordbtn.tintColor=[UIColor whiteColor];
        _logoutbtn.tintColor=[UIColor blackColor];
        _navitem.title=@"Logout From All Devices";
        [[_logoutview layer] setBorderWidth:1];
        [[_logoutview layer] setCornerRadius:10];
        _usernametextfield.text=@"";
        _passwordtextfield.text=@"";
    }
    

   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-IBActions
-(IBAction)closeforgetpage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)Passwordaction:(id)sender
{
    _logoutview.hidden=YES;
    _passwordview.hidden=NO;
    _paswordbtn.tintColor=[UIColor whiteColor];
    _logoutbtn.tintColor=[UIColor blackColor];

}
-(IBAction)logoutaction:(id)sender
{
    _logoutview.hidden=NO;
    _passwordview.hidden=YES;
    _paswordbtn.tintColor=[UIColor blackColor];
    _logoutbtn.tintColor=[UIColor whiteColor];

}
-(IBAction)logoutfromall:(id)sender
{
    
   // [self LogoutFromAll];
}

-(IBAction)questionpopup:(id)sender
{
   // [self CheckQuestionsforUser];
    UIViewController* popoverContent = [[UIViewController alloc]
                                     init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 330, 150)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 330, 150)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight= 32;
    
    
    [popoverView addSubview:_popovertableview];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(330, 150);
    
    //create a popover controller
    self.popovercontroller = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    [self.popovercontroller presentPopoverFromRect:_qstnbtn.frame
                                            inView:self.passwordview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];

    

}
-(IBAction)changePassword:(id)sender
{
    
    if ([_userText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter your username" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];

    }
    else if ([_newpswdText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
    {
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter your new password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_newpswdText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length<5)
    {
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter atleast 5 charactors" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_confirmpswdText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
    {
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please confirm your password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_qstnbtn.titleLabel.text isEqualToString:@"Select"]||[_qstnbtn.titleLabel.text isEqualToString:@""])
    {
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Select a security question" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_answrText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
    {
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter your answer" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_newpswdText.text isEqualToString:_confirmpswdText.text]) {
        [self Checkanswerselect];
    }
    else{
             
             UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Password does not match" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
             [alert show];
             
    }

    
}
-(IBAction)cancelaction:(id)sender
{
    _userText.text=@"";
    _newpswdText.text=@"";
    _confirmpswdText.text=@"";
    _answrText.text=@"";
    _answrText.enabled=NO;
    [_qstnbtn setTitle:@"Select" forState:UIControlStateNormal];
     _questionsarray=[[NSMutableArray alloc]init];
}
#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_questionsarray count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if(tableView==_popovertableview)
    {
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
        
       
                cell.textLabel.text=[_questionsarray objectAtIndex:indexPath.row];
    }
    
    
    
    
    
    
    
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     [_qstnbtn setTitle:[_questionsarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                
    
        
    _answrText.enabled=YES;
    
    [self.popovercontroller dismissPopoverAnimated:YES];
    
}

#pragma mark- WebService
-(void)LogoutFromAll{
    recordResults = FALSE;
   
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<LogoutFromAll xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserName>%@</UserName>\n"
                   "<Password>%@</Password>\n"
                   "</LogoutFromAll>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_usernametextfield.text,_passwordtextfield.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
   //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/LogoutFromAll" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CheckQuestionsforUser
{
    recordResults = FALSE;
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   "<CheckQuestionsforUser xmlns=\"http://ios.kontract360.com/\">\n"
                   "<username>%@</username>\n"
                   "</CheckQuestionsforUser>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_userText.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CheckQuestionsforUser" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Checkanswerselect
{
    recordResults = FALSE;
    NSString *quest=[_questionDict objectForKey:_qstnbtn.titleLabel.text];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   "<Checkanswerselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<username>%@</username>\n"
                   "<qid>%d</qid>\n"
                   "<answer>%@</answer>\n"
                   "</Checkanswerselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_userText.text,[quest integerValue],_answrText.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Checkanswerselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ChangePassword
{
    recordResults = FALSE;
       NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   "<ChangePassword xmlns=\"http://ios.kontract360.com/\">\n"
                   "<username>%@</username>\n"
                   "<password>%@</password>\n"
                   "</ChangePassword>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_userText.text,_newpswdText.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ChangePassword" forHTTPHeaderField:@"Soapaction"];
    
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
    
    

}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"LogoutFromAllResponse"])
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
    if([elementName isEqualToString:@"CheckQuestionsforUserResponse"])
    {
        
        _questionsarray=[[NSMutableArray alloc]init];
        _questionDict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"qid"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"question"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CheckanswerselectResponse"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Column1"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ChangePasswordResponse"])
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

    if([elementName isEqualToString:@"result1"])
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
    if([elementName isEqualToString:@"result"]){
        
        recordResults = FALSE;
        
        //if ([_soapResults isEqualToString:@"Invalid Username or Password"]) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        //}
       // else if([_soapResults isEqualToString:@"Logout Success"]) {
            
     //   [self dismissViewControllerAnimated:YES completion:NULL];
      //  }
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"qid"]){
        
        recordResults = FALSE;
        _questionstring=_soapResults;
         _soapResults=nil;
}
    if([elementName isEqualToString:@"question"]){
        
        recordResults = FALSE;
        [_questionsarray addObject:_soapResults];
        [_questionDict setObject:_questionstring forKey:_soapResults];
        _soapResults=nil;
    }
//    if([elementName isEqualToString:@"CheckanswerselectResult"]){
//        
//        recordResults = FALSE;
//        
//        _soapResults=nil;
//    }
    if([elementName isEqualToString:@"Column1"]){
        
        recordResults = FALSE;
        if ([_soapResults integerValue]>0) {
            [self ChangePassword];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Your answer doesnot match" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        _soapResults=nil;
    }
     if([elementName isEqualToString:@"result1"]){
         msgstrg=_soapResults;
          //if (_btnindex==0) {
         UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
         [alert show];
              //[self dismissViewControllerAnimated:YES completion:nil];
          //}
         _soapResults=nil;

     }

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ////NSLog(@"buttonIndex%d",buttonIndex);
    
    if ([alertView.message isEqualToString:@"Password Successfully Changed"]) {
        
        _userText.text=@"";
        _newpswdText.text=@"";
        _confirmpswdText.text=@"";
        _answrText.text=@"";
        [_qstnbtn setTitle:@"Select" forState:UIControlStateNormal];

        
         }
    if ([alertView.message isEqualToString:msgstrg])
    {
        _userText.text=@"";
        _newpswdText.text=@"";
        _confirmpswdText.text=@"";
        _answrText.text=@"";
        [_qstnbtn setTitle:@"Select" forState:UIControlStateNormal];
        
        
    }
    if ([alertView.message isEqualToString:@"Password does not match"]) {
        
        _newpswdText.text=@"";
        _confirmpswdText.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Please enter atleast 5 charactors"]) {
        
        _newpswdText.text=@"";
        _confirmpswdText.text=@"";
        
    }


}

#pragma mark-textfld delegates
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField==_newpswdText)
    {
        NSUInteger newLength = [_newpswdText.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;
    }
    if(textField==_confirmpswdText)
    {
        NSUInteger newLength = [_confirmpswdText.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;
    }
    if(textField==_answrText)
    {
        NSUInteger newLength = [_answrText.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;
    }
    return YES;

}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField==_userText) {
        _qstnbtn.titleLabel.text=@"Select";
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
  
    if (textField==_userText)
    {
        if ([_userText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length ==0) {
           
        }
        else{
        [self CheckQuestionsforUser];
        }
    }
}
@end
