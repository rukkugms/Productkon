//
//  AddressViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 3/24/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "AddressViewController.h"

@interface AddressViewController ()

@end

@implementation AddressViewController

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
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
   _addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];

    _addresstable.layer.borderWidth=3.0;
    _addresstable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titileview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    
    [[self.adrsstxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.adrsstxtview layer] setBorderWidth:2];
    [[self.adrsstxtview layer] setCornerRadius:10];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self Addressmasterselect];
}

#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
       return [_addesslistarray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
                  [[NSBundle mainBundle]loadNibNamed:@"Addresscell" owner:self options:nil];
            cell=_addrscell;
        }
        
        
    Mdladdress *addmdl=(Mdladdress *)[_addesslistarray objectAtIndex:indexPath.row];
    _headerlbl=(UILabel *)[cell viewWithTag:1];
    _headerlbl.text=addmdl.header;
    _addresslbl=(UILabel *)[cell viewWithTag:2];
    _addresslbl.text=addmdl.address;
    
    
    return cell;
    
    
}
#pragma mark - tabledelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    }
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        deletepath=indexPath.row;
        
        [self AdressMasterDelete];
        [_addesslistarray removeObject:indexPath];
        
        
        
        
        
    }
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_addresstable)
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


#pragma mark - webservice
-(void)Addressmasterselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Addressmasterselect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "</Addressmasterselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/Addressmasterselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)AddressmasterInsert{
      recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<AddressmasterInsert xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<AddHeader>%@</AddHeader>\n"
                   "<AddAddress>%@</AddAddress>\n"
                   "</AddressmasterInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_headrtxtfld.text,_adrsstxtview.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/AddressmasterInsert" forHTTPHeaderField:@"Soapaction"];
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
-(void)AddressMasterUpdate{
    recordResults = FALSE;
    NSString *soapMessage;
    
    Mdladdress*ad1=(Mdladdress*)[_addesslistarray objectAtIndex:path];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<AddressMasterUpdate xmlns=\"http://testUSA.kontract360.com/\">\n"
                    "<AddEntryId>%d</AddEntryId>\n"
                    "<AddCode>%@</AddCode>\n"
                   "<AddHeader>%@</AddHeader>\n"
                   "<AddAddress>%@</AddAddress>\n"
                   "</AddressMasterUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[ad1.entryid integerValue],ad1.code,_headrtxtfld.text,_adrsstxtview.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/AddressMasterUpdate" forHTTPHeaderField:@"Soapaction"];
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
-(void)AdressMasterDelete{
    webtype=3;
    recordResults = FALSE;
    NSString *soapMessage;
    
    Mdladdress*ad1=(Mdladdress*)[_addesslistarray objectAtIndex:deletepath];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<AdressMasterDelete xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<AddEntryId>%d</AddEntryId>\n"
                   
                   "</AdressMasterDelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[ad1.entryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/AdressMasterDelete" forHTTPHeaderField:@"Soapaction"];
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
	[_xmlParser parse];
    if(webtype==1||webtype==2||webtype==3){
        [self Addressmasterselect];
        webtype=0;
    }
    [_addresstable reloadData];
    
        
     
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"AddressmasterselectResult"])
    {_addesslistarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"AddEntryId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"AddCode"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"AddHeader"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"AddAddress"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"AddressmasterInsertResult"])
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
    if([elementName isEqualToString:@"AddEntryId"])
    {
        
        recordResults = FALSE;
        _addressmdl=[[Mdladdress alloc]init];
        _addressmdl.entryid=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"AddCode"])
    {
        
        recordResults = FALSE;
        _addressmdl.code=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"AddHeader"])
    {
        
        recordResults = FALSE;
        _addressmdl.header=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"AddAddress"])
    {
        
        recordResults = FALSE;
        
        _addressmdl.address=_soapResults;
        [_addesslistarray addObject:_addressmdl];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"result"])
    {
        
        recordResults = FALSE;
        msgstrg=_soapResults;
        if(webtype==1||webtype==2){
            
      
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
           
            [alert show];
        }
          _soapResults = nil;
    }

}

- (IBAction)clsebtn:(id)sender {
    _addview.hidden=YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addbtn:(id)sender {
    _addview.hidden=NO;
     _addnavitem.title=@"Create";
    webtype=1;
    _headrtxtfld.text=@"";
    _adrsstxtview.text=@"";
    _cancelbtn.enabled=YES;
}

- (IBAction)deletebtn:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_addresstable setEditing:NO animated:NO];
        [_addresstable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_addresstable setEditing:YES animated:YES];
        [_addresstable reloadData];
        
        
        
        
    }

    
}
- (IBAction)cancelbtn:(id)sender {
    _headrtxtfld.text=@"";
    _adrsstxtview.text=@"";
}

- (IBAction)updatebtn:(id)sender {
    if ([_headrtxtfld.text isEqualToString:@""]){
    
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Header is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
    }
    else if([_adrsstxtview.text isEqualToString:@""]){
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Address is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];

        
    }
    else if(webtype==1){
        [self AddressmasterInsert];
    }
    else if(webtype==2){
        [self AddressMasterUpdate];
    }
    

    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ////NSLog(@"buttonIndex%d",buttonIndex);
    if ([alertView.message isEqualToString:msgstrg]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _headrtxtfld.text=@"";
            _adrsstxtview.text=@"";

            
            
        }
    }

    
    if ([alertView.message isEqualToString:@"Header is required"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _headrtxtfld.text=@"";
            
            
        }
    }
    
    if ([alertView.message isEqualToString:@"Address is required"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _adrsstxtview.text=@"";
            
            
        }
    }
}


- (IBAction)addclsebtn:(id)sender {
    _addview.hidden=YES;
    
}

- (IBAction)editbtn:(id)sender {
   // _.enabled=NO;
     _addview.hidden=NO;
    _addnavitem.title=@"Edit";
 webtype=2;
      button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.addresstable];
    NSIndexPath *textFieldIndexPath = [self.addresstable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    path=textFieldIndexPath.row;
    Mdladdress *addmdl=(Mdladdress *)[_addesslistarray objectAtIndex:path];
    _headrtxtfld.text=addmdl.header;
    _adrsstxtview.text=addmdl.address;
    _cancelbtn.enabled=NO;

}
@end
