//
//  SubCatViewController.m
//  Newproject
//
//  Created by Riya on 10/31/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "SubCatViewController.h"

@interface SubCatViewController ()

@end

@implementation SubCatViewController

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
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    self.addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    //_addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
    _categorytabe.layer.borderWidth=3.0;
    _categorytabe.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    //[self MultiFleetCategoryselect];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self FleetCategoryselect];
}
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 200);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_categorybtn.frame
                                            inView:self.addview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
}

#pragma mark - Web Service
-(void)FleetCategoryselect{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FleetCategoryselect xmlns=\"http://ios.kontract360.com/\">\n"
                    "<FlCatEquipmentId>%d</FlCatEquipmentId>\n"
                   "</FleetCategoryselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_fleetid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175:7342/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/FleetCategoryselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)FleetCategorysubtypeinsert{
    recordResults = FALSE;
    NSString *soapMessage;
      Catergrymdl*categrymdl=(Catergrymdl *)[_categryarray objectAtIndex:insrtpath];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FleetCategorysubtypeinsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<FLCatEquipmentId>%d</FLCatEquipmentId>\n"
                   "<FLCatSubTypeId>%d</FLCatSubTypeId>\n"
                   "<FLCatDescription>%@</FLCatDescription>\n"
                   "</FleetCategorysubtypeinsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_fleetid,[categrymdl.entryid integerValue],categrymdl.SubTypeName];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175:7342/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/FleetCategorysubtypeinsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)MultiFleetCategoryselect{
    recordResults = FALSE;
   
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<MultiFleetCategoryselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<FlCatEquipmentId>%d</FlCatEquipmentId>\n"
                   "</MultiFleetCategoryselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_fleetid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175:7342/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/MultiFleetCategoryselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)FleetcategorysubtypeDelete{
    webtype=3;
    recordResults = FALSE;
    Catergrymdl*categrymdl=(Catergrymdl *)[_FLcategryarray objectAtIndex:path];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FleetcategorysubtypeDelete xmlns=\"http://ios.kontract360.com/\">\n"
                   "<FLCatEquipmentId>%d</FLCatEquipmentId>\n"
                    "<FLCatSubTypeId>%d</FLCatSubTypeId>\n"
                   "</FleetcategorysubtypeDelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_fleetid,[categrymdl.SubTypeId integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175:7342/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/FleetcategorysubtypeDelete" forHTTPHeaderField:@"Soapaction"];
    
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
    [_categorytabe reloadData];
    [_popOverTableView reloadData];
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"MultiFleetCategoryselectResponse"])
    {
        _categryarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"SubTypeEntryId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SubTypeId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SubTypeName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FleetCategoryselectResponse"])
    {
        _catagrydict=[[NSMutableDictionary alloc]init];
         _FLcategryarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"FLCatEntryId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FLCatEquipmentId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FLCatSubTypeId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"FLCatDescription"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    
    if([elementName isEqualToString:@"FleetCategorysubtypeinsertResponse"])
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
    if([elementName isEqualToString:@"FLCatEntryId"])
    {
         _categrymdl=[[Catergrymdl alloc]init];
         recordResults = FALSE;
        _categrymdl.entryid=_soapResults;
        catid=_soapResults;
        _soapResults=nil;

    }
    if([elementName isEqualToString:@"FLCatEquipmentId"])
    {
        
        recordResults = FALSE;
        _soapResults=nil;
        

    }
    if([elementName isEqualToString:@"FLCatSubTypeId"])
    {
        
        recordResults = FALSE;
          _categrymdl.SubTypeId=_soapResults;
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"FLCatDescription"])
    {
        
        recordResults = FALSE;
           _categrymdl.SubTypeName=_soapResults;
        [_FLcategryarray addObject:_categrymdl];
         [_catagrydict setObject:catid forKey:_soapResults];
        _soapResults=nil;

    }


    if([elementName isEqualToString:@"SubTypeEntryId"])
    {
        
        recordResults = FALSE;
        _categrymdl=[[Catergrymdl alloc]init];
        _categrymdl.entryid=_soapResults;
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"SubTypeId"])
    {
        
        recordResults = FALSE;
        _categrymdl.SubTypeId=_soapResults;
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"SubTypeName"])
    {
        
        recordResults = FALSE;
        _categrymdl.SubTypeName=_soapResults;
        [_categryarray addObject:_categrymdl];
        _soapResults=nil;
    }
    
    
    if([elementName isEqualToString:@"result"])
    {
        
        
        recordResults = FALSE;
        if (webtype==3) {
            
        }
        else{
        
            msgstring=_soapResults;
            
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            [_categorybtn setTitle:@"Select" forState:UIControlStateNormal];
        }
        
        [self FleetCategoryselect];
        
        
        _soapResults=nil;
    }
}

#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_popOverTableView){
    
        return [_categryarray count];
    }
    else{
        return [_catagrydict count];
    }
    return YES;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
       if(tableView==_categorytabe){
            
            [[NSBundle mainBundle]loadNibNamed:@"SubcatCell" owner:self options:nil];
             cell=_catgrycell;
       }
        
        
    }
    
    if(tableView==_categorytabe){
      
        
         _catgrylbl=(UILabel *)[cell viewWithTag:1];
        NSArray*array=[_catagrydict allKeys];
        _catgrylbl.text=[array objectAtIndex:indexPath.row];

    }
    
    if(tableView==_popOverTableView){
        
        Catergrymdl*categrymdl=(Catergrymdl *)[_categryarray objectAtIndex:indexPath.row];
        cell.textLabel.text=categrymdl.SubTypeName;
       // _catgrylbl=(UILabel *)[cell viewWithTag:1];
        //_catgrylbl.text=categrymdl.SubTypeName;
    }
    
    
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==_popOverTableView) {
        insrtpath=indexPath.row;
         Catergrymdl*categrymdl=(Catergrymdl *)[_categryarray objectAtIndex:indexPath.row];
        [_categorybtn setTitle:categrymdl.SubTypeName forState:UIControlStateNormal];
        
    }
    [self.popOverController dismissPopoverAnimated:YES];
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        path=indexPath.row;
        
        [self FleetcategorysubtypeDelete];
        [_categryarray removeObject:indexPath];
        
        
        
        }
    
}



- (IBAction)clsebtn:(id)sender {
    _addview.hidden=YES;
}

- (IBAction)viewclsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)catgrybtn:(id)sender {
    [self createpopover];
    [self MultiFleetCategoryselect];
}

- (IBAction)mastergobtn:(id)sender {
    
    self.CategryVCtrl=[[CategoryViewController alloc]initWithNibName:@"CategoryViewController" bundle:nil];
    self.CategryVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:self.CategryVCtrl animated:YES completion:nil];
}

- (IBAction)addbtn:(id)sender {
    _addview.hidden=NO;
    [_categorybtn setTitle:@"Select" forState:UIControlStateNormal];
}

- (IBAction)deletebtn:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_categorytabe setEditing:NO animated:NO];
        [_categorytabe reloadData];
        
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
[_categorytabe setEditing:YES animated:YES];
        [_categorytabe reloadData];
        
        
        
        
    }

    
}

- (IBAction)updatebtn:(id)sender {
     [self FleetCategorysubtypeinsert];
    
    
}
@end
