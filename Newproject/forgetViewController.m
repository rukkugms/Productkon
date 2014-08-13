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
        _passwordview.hidden=NO;
        [[_passwordview layer] setBorderWidth:1];
        [[_passwordview layer] setCornerRadius:10];
        _logoutview.hidden=YES;
        _navitem.title=@"Reset Your Password";
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
    [self LogoutFromAll];
}
-(IBAction)questionpopup:(id)sender
{UIViewController* popoverContent = [[UIViewController alloc]
                                     init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 300, 150)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 300, 150)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight= 32;
    
    
    [popoverView addSubview:_popovertableview];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(300, 150);
    
    //create a popover controller
    self.popovercontroller = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    [self.popovercontroller presentPopoverFromRect:_qstnbtn.frame
                                            inView:self.passwordview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];

    

}
#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
    
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
        
       
                //cell.textLabel.text=[_statearray objectAtIndex:indexPath.row];
    }
    
    
    
    
    
    
    
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //  [_statebtn setTitle:[_statearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                
    
        
        
    
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
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    // NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
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
        
        if ([_soapResults isEqualToString:@"Invalid Username or Password"]) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([_soapResults isEqualToString:@"Logout Success"]) {
            
        [self dismissViewControllerAnimated:YES completion:NULL];
        }
        _soapResults=nil;
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ////NSLog(@"buttonIndex%d",buttonIndex);
    
    if ([alertView.message isEqualToString:@"Invalid Username or Password"]) {
        
        _usernametextfield.text=@"";
        _passwordtextfield.text=@"";
        
         }
}


@end
