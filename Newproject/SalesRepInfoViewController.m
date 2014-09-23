  //
//  SalesRepInfoViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 20/06/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "SalesRepInfoViewController.h"

@interface SalesRepInfoViewController ()

@end

@implementation SalesRepInfoViewController

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
//        _scroll.frame=CGRectMake(0, 0, 1024,708);
//    [_scroll setContentSize:CGSizeMake(1024,760)];
    _infoview.backgroundColor=[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.scroll.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.addView.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];

   // self.navbar.tintColor=[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f];
    _salesRepTable.layer.borderWidth=2;
    _salesRepTable.layer.borderColor= [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _searchbar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate = (id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.salesRepTable.tableHeaderView =_searchbar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self CustomerSalesRepInfoselect];

    
//    UIBarButtonItem*addbtn=[[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addaction)];
//    UIBarButtonItem*editbtn=[[UIBarButtonItem alloc]initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(editaction)];
//    NSArray*barbutns=[[NSArray alloc]initWithObjects:addbtn,editbtn, nil];
//    [self.navigationItem setRightBarButtonItems:barbutns animated:YES];
//    _addView.hidden=YES;
    
    
}
-(void)editaction
{
    if ([self.salesRepTable isEditing]) {
        // If the tableView is already in edit mode, turn it off. Also change the title of the button to reflect the intended verb (‘Edit’, in this case).
        
        [self.salesRepTable setEditing:NO animated:YES];
        //[_Editbtn setTitle:@"Edit"forState:UIControlStateNormal];
    }
    else {
        // [_Editbtn setTitle:@"Done"forState:UIControlStateNormal];
        
        // Turn on edit mode
        
        [self.salesRepTable setEditing:YES animated:YES];
    }
    
}

//-(void)addaction
//{
//    _addView.hidden=NO;
//}
//- (IBAction)editcellbtn:(id)sender
//{
//    _addView.hidden=NO;
//}
-(IBAction)closetheView:(id)sender
{
    self.addView.hidden=YES;
    _salesRepTable.userInteractionEnabled=YES;
    _custcodetextfield.text=@"";
    _emailtextfield.text=@"";
    _extensiontextfield.text=@"";
    _mobiletextfield.text=@"";
    _phoneofficetextfield.text=@"";
    _nametextfield.text=@"";
    _empidtextfield.text=@"";
   
}
- (IBAction)editsalesaction:(id)sender
{
    _cancelbtnlbl.enabled=NO;
    _salesRepTable.userInteractionEnabled=NO;
   // [_salesRepTable setEditing:NO animated:NO];
       _cancelbtnlbl.titleLabel.textColor=[UIColor grayColor];
    _addView.hidden=NO;
    _navbar.title=@"Edit";
    optionidentifier=2;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.salesRepTable];
    NSIndexPath *textFieldIndexPath = [self.salesRepTable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    Rsalesmdl*rmdl=(Rsalesmdl *)[_salesarray objectAtIndex:textFieldIndexPath.row];
    
    _custcodetextfield.text=rmdl.CustomerCode;
    _empidtextfield.text=rmdl.EmpId;
    _nametextfield.text=rmdl.EmpName;
    _phoneofficetextfield.text=rmdl.PhoneOffice;
    _emailtextfield.text=rmdl.Email;
    _mobiletextfield.text=rmdl.Mobile;
    _extensiontextfield.text=rmdl.Extension;

}
- (IBAction)addsalesaction:(id)sender
{_cancelbtnlbl.enabled=YES;
    _salesRepTable.userInteractionEnabled=NO;
   // [_salesRepTable setEditing:NO animated:NO];
   _cancelbtnlbl.titleLabel.textColor=[UIColor colorWithRed:0/255.0f green:122.0/255.0f blue:255.0/255.0f alpha:1.0f];
    _addView.hidden=NO;
     _navbar.title=@"Create";
    optionidentifier=1;
    _custcodetextfield.text=@"";
    _emailtextfield.text=@"";
    _extensiontextfield.text=@"";
    _mobiletextfield.text=@"";
    _phoneofficetextfield.text=@"";
    _nametextfield.text=@"";
    _empidtextfield.text=@"";

}
- (IBAction)deletesalesaction:(id)sender
{
    if ([self.salesRepTable isEditing]) {
        // If the tableView is already in edit mode, turn it off. Also change the title of the button to reflect the intended verb (‘Edit’, in this case).
        
        [self.salesRepTable setEditing:NO animated:YES];
        //[_Editbtn setTitle:@"Edit"forState:UIControlStateNormal];
    }
    else {
        // [_Editbtn setTitle:@"Done"forState:UIControlStateNormal];
        
        // Turn on edit mode
        
        [self.salesRepTable setEditing:YES animated:YES];
    }
 
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_salesarray count];
    // Return the number of rows in the section.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
                   [[NSBundle mainBundle]loadNibNamed:@"Srepcell" owner:self options:nil];
                    cell=_salescell;
        
        
        
    }
    
    
    Rsalesmdl*rmdl=(Rsalesmdl *)[_salesarray objectAtIndex:indexPath.row];
    _custcodelabel=(UILabel*)[cell viewWithTag:1];
    _custcodelabel.text=rmdl.CustomerCode;
    _empidlabel=(UILabel*)[cell viewWithTag:2];
    _empidlabel.text=rmdl.EmpId;
    _namelabel=(UILabel*)[cell viewWithTag:3];
    _namelabel.text=rmdl.EmpName;
    _phonelabel=(UILabel*)[cell viewWithTag:4];
    _phonelabel.text=rmdl.PhoneOffice;
    _extensionlabel=(UILabel*)[cell viewWithTag:5];
    _extensionlabel.text=rmdl.Extension;
    _mobilelabel=(UILabel*)[cell viewWithTag:6];
    _mobilelabel.text=rmdl.Mobile;
    _email=(UILabel*)[cell viewWithTag:7];
    _email.text=rmdl.Email;

    
    
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        
    }else
    {
        
        //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
        [cell setBackgroundColor:[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f]];
    }
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        path=indexPath.row;
        
        [self CustomerSalesRepInfodelete];
        [_salesarray removeObject:indexPath];
        
        
        
        
        
    }
    
}

- (IBAction)closesalesreppage:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
#pragma mark-Webservices
-(void)CustomerSalesRepInfoselect
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerSalesRepInfoselect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<CustomerCode>%@</CustomerCode>\n"
                   "</CustomerSalesRepInfoselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_ccode];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/CustomerSalesRepInfoselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CustomerSalesRepInfoInsert
{  webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerSalesRepInfoInsert xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<CustomerCode>%@</CustomerCode>\n"
                   "<EmpId>%@</EmpId>\n"
                   "<EmpName>%@</EmpName>\n"
                   "<PhoneOffice>%@</PhoneOffice>\n"
                   "<Extension>%@</Extension>\n"
                   "<Mobile>%@</Mobile>\n"
                   "<Email>%@</Email>\n"
                   "</CustomerSalesRepInfoInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_ccode,_empidtextfield.text,_nametextfield.text,_phoneofficetextfield.text,_extensiontextfield.text,_mobiletextfield.text,_emailtextfield.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/CustomerSalesRepInfoInsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CustomerSalesRepInfoUpdate
{
    webtype=1;
    recordResults = FALSE;
    Rsalesmdl*rmdl=(Rsalesmdl *)[_salesarray objectAtIndex:btnindex];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerSalesRepInfoUpdate xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<EntryId>%d</EntryId>\n"
                   "<CustomerCode>%@</CustomerCode>\n"
                   "<EmpId>%@</EmpId>\n"
                   "<EmpName>%@</EmpName>\n"
                   "<PhoneOffice>%@</PhoneOffice>\n"
                   "<Extension>%@</Extension>\n"
                   "<Mobile>%@</Mobile>\n"
                   "<Email>%@</Email>\n"
                   "</CustomerSalesRepInfoUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",rmdl.entryid,rmdl.CustomerCode,_empidtextfield.text,_nametextfield.text,_phoneofficetextfield.text,_extensiontextfield.text,_mobiletextfield.text,_emailtextfield.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/CustomerSalesRepInfoUpdate" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CustomerSalesRepInfodelete
{
    
    webtype=2;
    recordResults = FALSE;
    NSString *soapMessage;
    
    Rsalesmdl*rmdl=(Rsalesmdl *)[_salesarray objectAtIndex:path];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerSalesRepInfodelete xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<EntryId>%d</EntryId>\n"
                   "</CustomerSalesRepInfodelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",rmdl.entryid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/CustomerSalesRepInfodelete" forHTTPHeaderField:@"Soapaction"];
    
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


-(void)CustomerSalesRepInfoSearch
{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerSalesRepInfoSearch xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "<CustomerCode>%@</CustomerCode>\n"
                   "</CustomerSalesRepInfoSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring,_ccode];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/CustomerSalesRepInfoSearch" forHTTPHeaderField:@"Soapaction"];
    
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
	
	
	if( _xmlparser )
	{
		
	}
	
	_xmlparser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlparser setDelegate:(id)self];
	[_xmlparser setShouldResolveExternalEntities: YES];
	[_xmlparser parse];
    [_salesRepTable reloadData];
    if (webtype==1||webtype==2) {
        [self CustomerSalesRepInfoselect];
        webtype=0;
    }
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"CustomerSalesRepInfoselectResponse"]) {
        _salesarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"CustomerSalesRepInfoSearchResponse"]) {
        _salesarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"EntryId"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    
    if ([elementName isEqualToString:@"CustomerCode"]) {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    
    if ([elementName isEqualToString:@"EmpId"]) {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    
    if ([elementName isEqualToString:@"EmpName"]) {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    
    if ([elementName isEqualToString:@"PhoneOffice"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"Extension"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"Mobile"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }if ([elementName isEqualToString:@"Email"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"CustomerSalesRepInfoInsertResponse"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"CustomerSalesRepInfoUpdateResponse"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"result"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }


    
    

}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults)
        
	{
        
        
		[_soapResults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    if ([elementName isEqualToString:@"EntryId"]) {
        _rmodel=[[Rsalesmdl alloc]init];
        recordResults=FALSE;
        _rmodel.entryid=[_soapResults integerValue];
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"CustomerCode"]) {
       
        recordResults=FALSE;
        _rmodel.CustomerCode=_soapResults;
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"EmpId"]) {
        
        recordResults=FALSE;
        _rmodel.EmpId=_soapResults;
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"EmpName"]) {
        
        recordResults=FALSE;
        _rmodel.EmpName=_soapResults;
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"PhoneOffice"]) {
       
        recordResults=FALSE;
        _rmodel.PhoneOffice=_soapResults;
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"Extension"]) {
        
        recordResults=FALSE;
        _rmodel.Extension=_soapResults;
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"Mobile"]) {
        recordResults=FALSE;
        _rmodel.Mobile=_soapResults;
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"Email"]) {
        recordResults=FALSE;
        _rmodel.Email=_soapResults;
        [_salesarray addObject:_rmodel];
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"CustomerSalesRepInfoInsertResult"]) {
        recordResults=FALSE;
        
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"CustomerSalesRepInfoUpdateResult"]) {
        recordResults=FALSE;
        
        _soapResults=nil;
    }


    if ([elementName isEqualToString:@"result"]) {
        recordResults=FALSE;
        _resultstring=_soapResults;
        if (webtype==1) {
            
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        }
        _soapResults=nil;
    }

    





}
-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView.message isEqualToString:_resultstring]) {
        if (optionidentifier==2) {
            _addView.hidden=YES;
            _salesRepTable.userInteractionEnabled=YES;
        }
        _custcodetextfield.text=@"";
        _emailtextfield.text=@"";
        _extensiontextfield.text=@"";
        _mobiletextfield.text=@"";
        _phoneofficetextfield.text=@"";
        _nametextfield.text=@"";
        _empidtextfield.text=@"";
    }
    if ([alertView.message isEqualToString:@"Invalid Phone Number"]) {
        _phoneofficetextfield.text=@"";
    }
    if ([alertView.message isEqualToString:@"Invalid Mobile Number"]) {
        _mobiletextfield.text=@"";
    }
    if ([alertView.message isEqualToString:@"Invalid Extension"]) {
        _extensiontextfield.text=@"";
    }
    if ([alertView.message isEqualToString:@"Invalid Email"]) {
        _emailtextfield.text=@"";
    }
    if ([alertView.message isEqualToString:@"Invalid Company Name"]) {
        _nametextfield.text=@"";
    }



}
- (IBAction)update:(id)sender {
   
        if([_nametextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([_mobiletextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Mobile Number is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([_phoneofficetextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Phone Number is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([_emailtextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length!=0)
        {
            Validation *val=[[Validation alloc]init];
            int value2 = [val validEmailAddress:_emailtextfield.text];
            if(value2==0)
            {
                
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert1 show];
            }
            else
            {
                if (optionidentifier==1)
                {
                [self CustomerSalesRepInfoInsert];
                }
                else
                {
                     [self CustomerSalesRepInfoUpdate];
                }
            }

        }
    else
    {
        if (optionidentifier==1)
        {
            [self CustomerSalesRepInfoInsert];
        }
        else
        {
            [self CustomerSalesRepInfoUpdate];
        }

    }
    
    
    

//        else if (optionidentifier==1) {
//            
//            
//             else if(![_emailidtxtfld.text isEqualToString:@""])
//            {
//                Validation *val=[[Validation alloc]init];
//                int value2 = [val validEmailAddress:_emailtextfield.text];
//                if(value2==0)
//                {
//                    
//                    UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                    [alert1 show];
//                }
//                
//                
//                
//                else
//                {
//            
//                    [self CustomerSalesRepInfoInsert];
//                }
//            }
//            
//            else
//            {
//                
//                [self CustomerSalesRepInfoInsert];
//            }
//
//        }
//    
//        else if(optionidentifier==2)
//        {
//            
//            
//            
//            
//            if([_emailtextfield.text isEqualToString:@""])
//            {
//                Validation *val=[[Validation alloc]init];
//                int value2 = [val validEmailAddress:_emailtextfield.text];
//                if(value2==0)
//                {
//                    
//                    UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                    [alert1 show];
//                }
//                
//                
//                else{
//                    
//                    
//                    
//                    [self CustomerSalesRepInfoUpdate];
//                }
//            }
//            else{
//                
//                
//                
//                [self CustomerSalesRepInfoUpdate];
//            }
//
//            
//        }
}

- (IBAction)cancel:(id)sender {
    _custcodetextfield.text=@"";
    _emailtextfield.text=@"";
    _extensiontextfield.text=@"";
    _mobiletextfield.text=@"";
    _phoneofficetextfield.text=@"";
    _nametextfield.text=@"";
    _empidtextfield.text=@"";

}
#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    [self CustomerSalesRepInfoSearch];
    [searchBar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self CustomerSalesRepInfoselect];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_searchbar.text length]==0) {
        
        [self CustomerSalesRepInfoselect];
        // [searchBar resignFirstResponder];
        
        
    }
    //[searchBar resignFirstResponder];
    
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
        if(textField==_phoneofficetextfield)
    {
        
        phonenostring=_phoneofficetextfield.text;
        
        
        if ([phonenostring length]<10) {
            if([phonenostring isEqualToString:@""])
            {
                
            }
            else
            {
                //fmt=1;
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                
                [alert show];
                
            }
            
            
            
        }
        else
        {
            
            Validation*val=[[Validation alloc]init];
            int value1=[val isdataformat:_phoneofficetextfield.text];
            if(value1==0)
            {
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert1 show];
                
                
            }
            else
            {
                
                phonenostring=_phoneofficetextfield.text;
                //checking a particular charector
                // NSString *connectstring;
                NSString*new=[phonenostring substringWithRange:NSMakeRange(3, 1)];
                NSString*new1=[phonenostring substringWithRange:NSMakeRange(7, 1)];
                
                
                
                NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
                NSString *resultString = [[phonenostring componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
                NSLog (@"Result: %@", resultString);
                if ([resultString length]==9){
                    
                    
                    //fmt=1;
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
                
                if ([phonenostring length]==12) {
                    
                    
                    
                    
                    
                    
                    if ([new  isEqualToString:@"-"]&&[new1  isEqualToString:@"-"]) {
                        _phonenofmtstring=phonenostring;
                        // fmt=2;
                    }
                    else
                    {
                        //fmt=1;
                        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                        
                        [alert show];
                    }
                    
                }
                
                
                
                if ([resultString length]==10){
                    
                    
                    //fmt=2;
                    
                    NSString *subString = [resultString substringWithRange:NSMakeRange(0,3)];
                    NSLog(@"%@",subString);
                    NSString *substring2=[resultString  substringWithRange:NSMakeRange(3,3)];
                    NSLog(@"%@",substring2);
                    NSString *substring3=[resultString  substringWithRange:NSMakeRange(6,4)];
                    NSLog(@"%@",substring3);
                    _phonenofmtstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
                    NSLog(@"%@",_phonenofmtstring);
                    
                    
                    
                    
                    _phoneofficetextfield.text=_phonenofmtstring;
                    
                }
                
                
                
                
                
                if ([resultString length]==11){
                    
                    
                    //fmt=1;
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
            }
        }
    }
    if (textField==_mobiletextfield) {
        
    
    
        
        mobilestring=_mobiletextfield.text;
        
        
        if ([mobilestring length]<10) {
            if([mobilestring isEqualToString:@""])
            {
                
            }
            else
            {
                //fmt=1;
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                
                [alert show];
                
            }
            
            
            
        }
        else
        {
            
            Validation*val=[[Validation alloc]init];
            int value1=[val isdataformat:_mobiletextfield.text];
            if(value1==0)
            {
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert1 show];
                
                
            }
            else
            {
                
                mobilestring=_mobiletextfield.text;
                //checking a particular charector
                // NSString *connectstring;
                NSString*new=[mobilestring substringWithRange:NSMakeRange(3, 1)];
                NSString*new1=[mobilestring substringWithRange:NSMakeRange(7, 1)];
                
                
                
                NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
                NSString *resultString = [[mobilestring componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
                NSLog (@"Result: %@", resultString);
                if ([resultString length]==9){
                    
                    
                    //fmt=1;
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
                
                if ([mobilestring length]==12) {
                    
                    
                    
                    
                    
                    
                    if ([new  isEqualToString:@"-"]&&[new1  isEqualToString:@"-"]) {
                        _mobilefmtstring=mobilestring;
                        // fmt=2;
                    }
                    else
                    {
                        //fmt=1;
                        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                        
                        [alert show];
                    }
                    
                }
                
                
                
                if ([resultString length]==10){
                    
                    
                    //fmt=2;
                    
                    NSString *subString = [resultString substringWithRange:NSMakeRange(0,3)];
                    NSLog(@"%@",subString);
                    NSString *substring2=[resultString  substringWithRange:NSMakeRange(3,3)];
                    NSLog(@"%@",substring2);
                    NSString *substring3=[resultString  substringWithRange:NSMakeRange(6,4)];
                    NSLog(@"%@",substring3);
                    _mobilefmtstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
                    NSLog(@"%@",_mobilefmtstring);
                    
                    
                    
                    
                    _mobiletextfield.text=_mobilefmtstring;
                    
                }
                
                
                
                
                
                if ([resultString length]==11){
                    
                    
                    //fmt=1;
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
            }
        }
    }
    
    
if(textField==_emailtextfield){
        
        Validation *val=[[Validation alloc]init];
        if(![_emailtextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
        {
            int value2 = [val validEmailAddress:[_emailtextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
            if(value2==0)
            {
                
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert1 show];
            }
            
            
        }
        
        
    }
    if(textField==_extensiontextfield){
        
        Validation *val=[[Validation alloc]init];
        if(![_extensiontextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
        {
            int value2 = [val isNumeric:[_extensiontextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
            if(value2==0)
            {
                
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Extension" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert1 show];
            }
            
            
        }
        
        
    }

    
    
    
    if(textField==_nametextfield){
        
        
        
        Validation *val=[[Validation alloc]init];
        int value1=[val validatespecialcharacters:_nametextfield.text];
        if(value1==0)
        {
            
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Company Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }

    
    
    
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField==_mobiletextfield)
    {
        NSUInteger newLength = [_mobiletextfield.text length] + [string length] - range.length;
        return (newLength > 12) ? NO : YES;
    }
    if(textField==_phoneofficetextfield)
    {
        NSUInteger newLength = [_phoneofficetextfield.text length] + [string length] - range.length;
        return (newLength > 12) ? NO : YES;
    }
    
    if(textField==_empidtextfield)
    {
        NSUInteger newLength = [_empidtextfield.text length] + [string length] - range.length;
        return (newLength > 10) ? NO : YES;
    }
    if(textField==_emailtextfield)
    {
        NSUInteger newLength = [_emailtextfield.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    if(textField==_nametextfield)
    {
        NSUInteger newLength = [_nametextfield.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    if(textField==_extensiontextfield)
    {
        NSUInteger newLength = [_extensiontextfield.text length] + [string length] - range.length;
        return (newLength > 5) ? NO : YES;
    }
    return YES;
    
}



@end
