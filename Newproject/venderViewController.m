//
//  venderViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 05/03/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "venderViewController.h"

@interface venderViewController ()

@end

@implementation venderViewController
@synthesize delegate;

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
    _venderaddview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     
    [self Selectvendor];
    _vendelisttable.layer.borderWidth = 2.0;
    _vendelisttable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _tabletitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];

    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self Selectvendor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-Actions
-(IBAction)closevendorpage:(id)sender
{ _venderaddview.hidden=YES;
    _vendelisttable.userInteractionEnabled=YES;
    if ([self.delegate respondsToSelector:@selector(newaction)])
    {
    [self.delegate newaction];
    [self dismissViewControllerAnimated:YES completion:NULL];

    
}

    
}
-(IBAction)deletevendors:(id)sender
{
    
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_vendelisttable setEditing:NO animated:NO];
        [_vendelisttable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_vendelisttable setEditing:YES animated:YES];
        [_vendelisttable reloadData];
        
    }
}
-(IBAction)addvender:(id)sender
{
    optionidentifier=1;
    _venderaddview.hidden=NO;
    

    _vendelisttable.userInteractionEnabled=NO;
    _navitem.title=@"Create";
    _resultdispaylabel.hidden=YES;
    _nametextfld.text=@"";
    _addresstextfld.text=@"";
    _phonetextfld.text=@"";
    _ratetextfld.text=@"";
    _cancelbtn.enabled=YES;
      _vendelisttable.userInteractionEnabled=NO;
}
-(IBAction)closeaddview:(id)sender
{
    _venderaddview.hidden=YES;
    _vendelisttable.userInteractionEnabled=YES;
    _resultdispaylabel.hidden=YES;
    _nametextfld.text=@"";
    _addresstextfld.text=@"";
    _phonetextfld.text=@"";
    _ratetextfld.text=@"";
    //_vendelisttable.userInteractionEnabled=NO;
}
-(IBAction)updatevender:(id)sender
{
    if(optionidentifier==1)
    {
    Validation*val=[[Validation alloc]init];
    int value1=[val isBlank:[_nametextfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
    
    else
    {

    [self VendorInsert];
    }
}
    else if(optionidentifier==2)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isBlank:[_nametextfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
        else
        {

        [self UpdateVendor];
        }
    }
}
-(IBAction)editvender:(id)sender
{
    _vendelisttable.userInteractionEnabled=NO;


    optionidentifier=2;
    _cancelbtn.enabled=NO;
    _cancelbtn.titleLabel.textColor=[UIColor grayColor];
    _venderaddview.hidden=NO;
    _resultdispaylabel.hidden=YES;
    _navitem.title=@"Edit";
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.vendelisttable];
    NSIndexPath *textFieldIndexPath = [self.vendelisttable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    vendermodel*vmdl=(vendermodel *)[_venderlistarray objectAtIndex:textFieldIndexPath.row];
    
    _nametextfld.text=vmdl.vendorname;
    _addresstextfld.text=vmdl.vendoraddress;
    _phonetextfld.text=vmdl.vendorphone;
    _ratetextfld.text=[NSString stringWithFormat:@"$%@",vmdl.vendorrate];
}
-(IBAction)cancelvendor:(id)sender
{
    _nametextfld.text=@"";
    _addresstextfld.text=@"";
    _phonetextfld.text=@"";
    _ratetextfld.text=@"";
}

#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_venderlistarray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"customvendercell" owner:self options:nil];
        cell=_vendercell;
        //        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    vendermodel*vmdl=(vendermodel *)[_venderlistarray objectAtIndex:indexPath.row];
    _namelabel=(UILabel *)[cell viewWithTag:1];
    _namelabel.text=vmdl.vendorname;
    _addresslabel=(UILabel *)[cell viewWithTag:2];
    _addresslabel.text=vmdl.vendoraddress;
    _phonelabel=(UILabel *)[cell viewWithTag:3];
    _phonelabel.text=_vmodel.vendorphone;
    _ratelabel=(UILabel *)[cell viewWithTag:4];
    _ratelabel.text=[NSString stringWithFormat:@"$%@",vmdl.vendorrate];
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    if (!self.jbdetailVCtrl) {
    //        self.jbdetailVCtrl=[[jobdetailsViewController alloc]initWithNibName:@"jobdetailsViewController" bundle:nil];
    //    }
    //    _jbdetailVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    //    [self presentViewController:_jbdetailVCtrl
    //                       animated:YES completion:NULL];
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        path=indexPath.row;
        
        [self Vendordelete];
        [_venderlistarray removeObject:indexPath];
        
        
        
        
        
    }
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_vendelisttable)
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
#pragma mark-webservices
-(void)Selectvendor
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Selectvendor xmlns=\"http://test.kontract360.com/\">\n"
                   "<ItemId>%d</ItemId>\n"
                   "</Selectvendor>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_itemid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Selectvendor" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webdata = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
    
}
-(void)VendorInsert
{  webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<VendorInsert xmlns=\"http://test.kontract360.com/\">\n"
                   "<ItemId>%d</ItemId>\n"
                   "<VendorName>%@</VendorName>\n"
                   "<VendorAddress>%@</VendorAddress>\n"
                   "<VendorPhone>%@</VendorPhone>\n"
                   "<VendorRate>%f</VendorRate>\n"
                   "</VendorInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_itemid,_nametextfld.text,_addresstextfld.text,_phonetextfld.text,[_ratetextfld.text floatValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/VendorInsert" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webdata = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
    
}
-(void)UpdateVendor
{  webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
     vendermodel*vmdl=(vendermodel *)[_venderlistarray objectAtIndex:btnindex];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateVendor xmlns=\"http://test.kontract360.com/\">\n"
                   "<EntryId>%d</EntryId>\n"
                   "<ItemId>%d</ItemId>\n"
                   "<VendorName>%@</VendorName>\n"
                   "<VendorAddress>%@</VendorAddress>\n"
                   "<VendorPhone>%@</VendorPhone>\n"
                   "<VendorRate>%f</VendorRate>\n"
                   "</UpdateVendor>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",vmdl.VEntryId,_itemid,_nametextfld.text,_addresstextfld.text,_phonetextfld.text,[_ratetextfld.text floatValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/UpdateVendor" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webdata = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
    
}



-(void)Vendordelete
{    webtype=2;
    recordResults = FALSE;
    NSString *soapMessage;
    
     vendermodel*vmdl=(vendermodel *)[_venderlistarray objectAtIndex:path];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Vendordelete xmlns=\"http://test.kontract360.com/\">\n"
                    "<EntryId>%d</EntryId>\n"
                   "<ReqID>%d</ReqID\n"
                   "</Vendordelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",vmdl.VEntryId,_itemid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Vendordelete" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webdata = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
    
}

#pragma mark - Connection
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[_webdata setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   	[_webdata appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please Check Your Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [Alert show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %d", [_webdata length]);
	NSString *theXML = [[NSString alloc] initWithBytes: [_webdata mutableBytes] length:[_webdata length] encoding:NSUTF8StringEncoding];
	NSLog(@"xml===== %@",theXML);
	
	
	if( _xmlparser )
	{
		
	}
	
	_xmlparser = [[NSXMLParser alloc] initWithData: _webdata];
	[_xmlparser setDelegate:(id)self];
	[_xmlparser setShouldResolveExternalEntities: YES];
	[_xmlparser parse];
    [_vendelisttable reloadData];
    if(webtype==1||webtype==2)
    {
        [self Selectvendor];
        webtype=0;
    }
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"SelectvendorResponse"])
    {
        _venderlistarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"SelectvendorResult"])
    {
        _venderlistarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"VEntryId"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"VendorId"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ItemId"])
    {
                if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"VendorName"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"VendorAddress"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"VendorPhone"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"VendorRate"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"VendorInsertResult"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UpdateVendorResult"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"result"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    


    



    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults
       )
        
	{
        
        
		[_soapresults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"VEntryId"])
    {
        _vmodel=[[vendermodel alloc]init];
        
        recordResults = FALSE;
        _vmodel.VEntryId=[_soapresults integerValue];
        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"VendorId"])
    {
        
        recordResults = FALSE;
        _vmodel.VendorId=[_soapresults integerValue];
        
    _soapresults = nil;
    }
    if([elementName isEqualToString:@"ItemId"])
    {
        
        recordResults = FALSE;
        _vmodel.ItemId=[_soapresults integerValue];
        _soapresults = nil;
    }
    

    if([elementName isEqualToString:@"VendorName"])
    {
        
        recordResults = FALSE;
        _vmodel.vendorname=_soapresults;
        _soapresults = nil;
    }
    

    if([elementName isEqualToString:@"VendorAddress"])
    {
        
        recordResults = FALSE;
        _vmodel.vendoraddress=_soapresults;
        _soapresults = nil;
    }
    

    if([elementName isEqualToString:@"VendorPhone"])
    {
        
        recordResults = FALSE;
        _vmodel.vendorphone=_soapresults;
        _soapresults = nil;
    }
    

    if([elementName isEqualToString:@"VendorRate"])
    {
        
        recordResults = FALSE;
        _vmodel.vendorrate=_soapresults;
        [_venderlistarray addObject:_vmodel];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"VendorInsertResult"])
    {
        
        recordResults = FALSE;
        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"UpdateVendorResult"])
    {
        
        recordResults = FALSE;
        
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"result"])
    {
        
        recordResults = FALSE;
        if (webtype==1) {
            _soapstring=_soapresults;
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:_soapresults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
               }
        _soapresults = nil;
    }



    
}

#pragma mark-Textfield Delegates
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if(textField==_nametextfld)
    {
        NSUInteger newLength = [_nametextfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
    if(textField==_addresstextfld)
    {
        NSUInteger newLength = [_addresstextfld.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    if(textField==_ratetextfld)
    {
        NSUInteger newLength = [_ratetextfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    
    if(textField==_phonetextfld)
    {
        NSUInteger newLength = [_phonetextfld.text length] + [string length] - range.length;
        return (newLength > 12) ? NO : YES;
    }
    
    
    
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    
    Validation*val=[[Validation alloc]init];
    if(textField==_nametextfld)
    {
        int value1=[val isBlank:_nametextfld.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Name Is Required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];

        }
    }
    if (textField==_ratetextfld) {
        int value2=[val isNumeric:_ratetextfld.text];
        if (value2==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
    }
        if (textField==_phonetextfld)
            
            {
                
                phnnostring=_phonetextfld.text;
                
                
                if ([phnnostring length]<10) {
                    if([phnnostring isEqualToString:@""])
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
                    int value1=[val isdataformat:_phonetextfld.text];
                    if(value1==0)
                    {
                        UIAlertView*alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                        [alert1 show];
                        
                        
                    }
                    else
                    {
                        
                        phnnostring=_phonetextfld.text;
                        //checking a particular charector
                        // NSString *connectstring;
                        NSString*new=[phnnostring substringWithRange:NSMakeRange(3, 1)];
                        NSString*new1=[phnnostring substringWithRange:NSMakeRange(7, 1)];
                        
                        
                        
                        NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
                        NSString *resultString = [[phnnostring componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
                        NSLog (@"Result: %@", resultString);
                        if ([resultString length]==9){
                            
                            
                            //fmt=1;
                           UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                            
                            [alert show];
                            
                        }
                        
                        
                        if ([phnnostring length]==12) {
                            
                            
                            
                            
                            
                            
                            if ([new  isEqualToString:@"-"]&&[new1  isEqualToString:@"-"]) {
                                _phnnofmtstring=phnnostring;
                                //fmt=2;
                            }
                            else
                            { //fmt=1;
                               UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                                
                                [alert show];
                            }
                            
                        }
                        
                        
                        
                        if ([resultString length]==10){
                            
                            
                           // fmt=2;
                            
                            NSString *subString = [resultString substringWithRange:NSMakeRange(0,3)];
                            NSLog(@"%@",subString);
                            NSString *substring2=[resultString  substringWithRange:NSMakeRange(3,3)];
                            NSLog(@"%@",substring2);
                            NSString *substring3=[resultString  substringWithRange:NSMakeRange(6,4)];
                            NSLog(@"%@",substring3);
                            _phnnofmtstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
                            NSLog(@"%@",_phnnofmtstring);
                            
                            
                            
                            
                            _phonetextfld.text=_phnnofmtstring;
                            
                        }
                        
                        
                        
                        
                        
                        if ([resultString length]==11){
                            
                            
                           // fmt=1;
                           UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                            
                            [alert show];
                            
                        }
                        
                    }
                }
            
    
    
            }
    
    
    return YES;
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([alertView.message isEqualToString:@"Invalid Rate"]) {
        
        
        _ratetextfld.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Name is required"])
    {
        _nametextfld.text=@"";
    }
    if ([alertView.message isEqualToString:_soapstring]) {
        
        if (optionidentifier==1) {
            
        
        _nametextfld.text=@"";
        _addresstextfld.text=@"";
        _phonetextfld.text=@"";
        _ratetextfld.text=@"";
        }
        else if(optionidentifier==2)
        {
            _nametextfld.text=@"";
            _addresstextfld.text=@"";
            _phonetextfld.text=@"";
            _ratetextfld.text=@"";
            _venderaddview.hidden=YES;
            _vendelisttable.userInteractionEnabled=YES;
        }
            

        
    }

    if ([alertView.message isEqualToString:@"Invalid Phone Number"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _phonetextfld.text=@"";
            
        }
    

        
    }

   }


@end
