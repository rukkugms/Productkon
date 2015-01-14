//
//  BillingViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 3/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "BillingViewController.h"

@interface BillingViewController ()

@end

@implementation BillingViewController

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
   

    _billingtable.layer.borderWidth = 2.0;
    _billingtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.tabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:251.0/255.0f alpha:1.0f];
 self.titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:251.0/255.0f alpha:1.0f];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _fArray=[[NSMutableArray alloc]init];
    [self SelectMarkupMaster];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closebillingmatrixpage:(id)sender
{ [_matrixbutton setTitle:@"Select" forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)selectamatrix:(id)sender
{
    [self createpopover];
}
-(IBAction)viewmatrixaction:(id)sender
{  // [self TotalMarkupselect];
  //  [self Selectallmanpower];
    [self BillingMatrixselect];
  
}
#pragma mark-Tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popovertableview) {
        return [_poparray count];
    }
    if (tableView==_billingtable) {
        //return [_manpowerarray count];
        return [_fArray count];
    }
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (tableView==_billingtable) {
        //[[NSBundle mainBundle]loadNibNamed:@"billingcell" owner:self options:nil];
          [[NSBundle mainBundle]loadNibNamed:@"Matrixcell" owner:self options:nil];
        
        cell=_fcell;
       // cell=_billcell;
    }
    
        
    
    if (tableView==_popovertableview)
    {
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
        cell.textLabel.text=[NSString stringWithFormat:@"%@",[_poparray objectAtIndex:indexPath.row]];

    }
    if (tableView==_billingtable)
    {
        if (indexPath.row==0) {
               //_filbl.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
            _filbl.font= [UIFont systemFontOfSize:10.0];
              
             _f2lbl.font= [UIFont systemFontOfSize:10.0];
            _f3labl.font= [UIFont systemFontOfSize:10.0];
            _f4lbl.font =  [UIFont systemFontOfSize:10.0];
            _f5lbl.font = [UIFont systemFontOfSize:10.0];
            _f6lbl.font =  [UIFont systemFontOfSize:10.0];
            _f7lbl.font =  [UIFont systemFontOfSize:10.0];
            _f8lbl.font = [UIFont systemFontOfSize:10.0];
            _f9lbl.font =  [UIFont systemFontOfSize:10.0];
            _f10lbl.font =  [UIFont systemFontOfSize:10.0];
            _f11lbl.font =  [UIFont systemFontOfSize:10.0];
            _f11lbl.font =  [UIFont systemFontOfSize:10.0];
            _f12lbl.font =  [UIFont systemFontOfSize:10.0];
            _f13lbl.font =  [UIFont systemFontOfSize:10.0];
            _f14lbl.font =  [UIFont systemFontOfSize:10.0];
            _f15lbl.font =  [UIFont systemFontOfSize:10.0];
            _f16lbl.font =  [UIFont systemFontOfSize:10.0];
            _f17lbl.font =  [UIFont systemFontOfSize:10.0];
            _f18lbl.font =  [UIFont systemFontOfSize:10.0];
            _f19lbl.font = [UIFont systemFontOfSize:10.0];
            _f20lbl.font = [UIFont systemFontOfSize:10.0];
            _f21lbl.font =  [UIFont systemFontOfSize:10.0];
            _f22lbl.font =  [UIFont systemFontOfSize:10.0];
}
        
        Fmodel *fmdl1=(Fmodel *)[_fArray objectAtIndex:indexPath.row];
        _filbl=(UILabel *)[cell viewWithTag:1];
        _filbl.text=fmdl1.f1;
        _f2lbl=(UILabel *)[cell viewWithTag:2];
        _f2lbl.text=fmdl1.f2;
        _f3labl=(UILabel *)[cell viewWithTag:3];
        _f3labl.text=fmdl1.f3;
        _f6lbl=(UILabel *)[cell viewWithTag:6];
        _f6lbl.text=fmdl1.f4;
        
        _f7lbl=(UILabel *)[cell viewWithTag:7];
        _f7lbl.text=fmdl1.f5;
    
        
        _f8lbl=(UILabel *)[cell viewWithTag:8];
        _f8lbl.text=fmdl1.f6;
        _f9lbl=(UILabel *)[cell viewWithTag:9];
        _f9lbl.text=fmdl1.f7;

        _f10lbl=(UILabel *)[cell viewWithTag:10];
        _f10lbl.text=fmdl1.f8;
        
        _f11lbl=(UILabel *)[cell viewWithTag:11];
        _f11lbl.text=fmdl1.f9;
        _f12lbl=(UILabel *)[cell viewWithTag:12];
        _f12lbl.text=fmdl1.f10;
        _f13lbl=(UILabel *)[cell viewWithTag:13];
        _f13lbl.text=fmdl1.f11;
        _f14lbl=(UILabel *)[cell viewWithTag:14];
        _f14lbl.text=fmdl1.f12;
        
        _f15lbl=(UILabel *)[cell viewWithTag:15];
        _f15lbl.text=fmdl1.f13;
        _f16lbl=(UILabel *)[cell viewWithTag:16];
        _f16lbl.text=fmdl1.f14;
        _f17lbl=(UILabel *)[cell viewWithTag:17];
        _f17lbl.text=fmdl1.f15;
        _f18lbl=(UILabel *)[cell viewWithTag:18];
        _f18lbl.text=fmdl1.f16;
        _f19lbl=(UILabel *)[cell viewWithTag:19];
        _f19lbl.text=fmdl1.f17;
        
        _f20lbl=(UILabel *)[cell viewWithTag:20];
        _f20lbl.text=fmdl1.f18;
        _f4lbl=(UILabel *)[cell viewWithTag:21];
        _f4lbl.text=fmdl1.f19;
        
        _f5lbl=(UILabel *)[cell viewWithTag:22];
        _f5lbl.text=fmdl1.f20;


        _f21lbl=(UILabel *)[cell viewWithTag:4];
        _f21lbl.text=fmdl1.st;
        _f22lbl=(UILabel *)[cell viewWithTag:5];
        _f22lbl.text=fmdl1.ot;
               
        //         Mastermarkmodel *markmdl=(Mastermarkmodel*)[_totalmarkuparray objectAtIndex:0];
        //         Manpwr *pwrmdl=(Manpwr*)[_manpowerarray objectAtIndex:indexPath.row];
        //
        //        _deslabel=(UILabel*)[cell viewWithTag:1];
        //        _deslabel.text=pwrmdl.itemdescptn;
        //        _unitcostlabel=(UILabel*)[cell viewWithTag:2];
        //        _unitcostlabel.text=[NSString stringWithFormat:@"$%@",pwrmdl.unitcost];
        //        float unitcost=[pwrmdl.unitcost floatValue];
        //        NSLog(@"%f",unitcost);
        //        float stper=[markmdl.stper1 floatValue];
        //        NSLog(@"%f",stper);
        //        float mulst=unitcost*stper;
        //        float st=mulst/100;
        //         NSLog(@"%f",st);
        //
        //
        //
        //
        //        float unitcost2=[pwrmdl.unitcost floatValue];
        //        float otper=[markmdl.otper1 floatValue];
        //        NSLog(@"%f",otper);
        //        float mulvalue=unitcost2*otper;
        //        float ot=mulvalue/100;
        //        NSLog(@"%f",ot);
        //        NSString *stvalue=[NSString stringWithFormat:@"$%.2f",st];
        //        NSString *otvalue=[NSString stringWithFormat:@"$%.2f",ot];
        //        _stratelabel=(UILabel*)[cell viewWithTag:3];
        //        _stratelabel.text=stvalue;
        //        _otratelabel=(UILabel*)[cell viewWithTag:4];
        //        _otratelabel.text=otvalue;

        
}
    
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_billingtable){
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        
    }else
    {
        [cell setBackgroundColor:[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f]];
    }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_popovertableview)
    {
        [_matrixbutton setTitle:[_poparray objectAtIndex:indexPath.row]forState:UIControlStateNormal];
        _mark=[_poparray objectAtIndex:indexPath.row];
         _manpowerarray=[[NSMutableArray alloc]init];
        [_billingtable reloadData];
    }
  
    [self.popovercontroller dismissPopoverAnimated:YES];
}

-(void)createpopover
{
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(210, 200);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_matrixbutton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];

}
#pragma mark-Webservices
-(void)SelectMarkupMaster
{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectMarkupMaster xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectMarkupMaster>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectMarkupMaster" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)TotalMarkupselect
{
    NSString *markupid=[_popdict objectForKey:_mark];
    NSLog(@"%@",_mark);
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<TotalMarkupselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MarkupID>%d</MarkupID>\n"
                   "</TotalMarkupselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[markupid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/TotalMarkupselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Selectallmanpower{
    webtype=2;
   
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllManpower xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllManpower>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
   //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllManpower" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)BillingMatrixselect{
       NSString *markupid=[_popdict objectForKey:_mark];
   
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<BillingMatrixselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<Id>%d</Id>\n"
                   "<MarkUp>%d</MarkUp>\n"
                   "</BillingMatrixselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",1,[markupid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BillingMatrixselect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)BillingMatrix1select{
 
    
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                    "<BillingMatrix1select xmlns=\"http://ios.kontract360.com/\">\n"
                    "<Id>%d</Id>\n"
                    "</BillingMatrix1select>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",1];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BillingMatrix1select" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Check Your Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
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
    [_popovertableview reloadData];
//    if (webtype==1) {
//        [self TotalMarkupselect];
//        webtype=2;
//    }
    [_billingtable reloadData];
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"SelectMarkupMasterResponse"])
    {
        _poparray=[[NSMutableArray alloc]init];
        _popdict=[[NSMutableDictionary alloc]init];
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"MarkupEntryId"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    
    if ([elementName isEqualToString:@"MarkUpName"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"CompanyStd"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"TotalMarkupselectResponse"])
    {
        _totalmarkuparray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"STPer"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"STDoll"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"OTPer"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"OTDoll"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"STPer1"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"OTPer1"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"SelectAllManpowerResponse"])
    {
        _manpowerarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryId"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ItemCode"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SubType"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UnitCost"])
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

    if([elementName isEqualToString:@"BillingMatrix1selectResult"])
    {
        _fArray=[[NSMutableArray alloc]init];
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Fid"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"f1"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"f2"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"f3"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"F4"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"F5"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"F6"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"F7"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"F8"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"F9"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
       if([elementName isEqualToString:@"F10"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"F11"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"F12"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"F13"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"F14"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"F15"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"F16"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"F17"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"F18"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"F19"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"F20"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"id"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"st"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ot"])
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
    
    
    
	if( recordResults)
        
	{
        [_soapresults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    if ([elementName isEqualToString:@"MarkupEntryId"]) {
       
        recordResults=FALSE;
        _billstring=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"MarkUpName"]) {
        
        recordResults=FALSE;
        [_popdict setObject:_billstring forKey:_soapresults];
        [_poparray addObject:_soapresults];
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"CompanyStd"]) {
        
        recordResults=FALSE;
        
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"TotalMarkupselectResponse"]) {
        
        recordResults=FALSE;
        
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"STPer"]) {
        _mastermark=[[Mastermarkmodel alloc]init];
        recordResults=FALSE;
        _mastermark.STPer=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"STDoll"]) {
        
        recordResults=FALSE;
        _mastermark.STDoll=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"OTPer"]) {
        
        recordResults=FALSE;
        _mastermark.OTPer=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"OTDoll"]) {
        
        recordResults=FALSE;
        _mastermark.OTDoll=_soapresults;
       _soapresults=nil;
    }
    if ([elementName isEqualToString:@"STPer1"]) {
        
        recordResults=FALSE;
        _mastermark.stper1=_soapresults;
        
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"OTPer1"]) {
        
        recordResults=FALSE;
        _mastermark.otper1=_soapresults;
        [_totalmarkuparray addObject:_mastermark];
        _soapresults=nil;
    }

    if([elementName isEqualToString:@"EntryId"])
    {
        _manpwr=[[Manpwr alloc]init];
        
        recordResults = FALSE;
        
        _manpwr.entryid=[_soapresults integerValue];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ItemCode"])
    {
        
        recordResults = FALSE;
        _manpwr.itemcode=_soapresults;
        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
        
        
        _manpwr.itemdescptn=_soapresults;
        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"SubType"])
    {
        
        recordResults = FALSE;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"UnitCost"])
    {
        
        recordResults = FALSE;
        _manpwr.unitcost=_soapresults;
        [_manpowerarray addObject:_manpwr];
        _soapresults = nil;
    }


    if([elementName isEqualToString:@"result"])
    {
         recordResults = FALSE;
        if ([_soapresults isEqualToString:@"Executed"]) {
              [self BillingMatrix1select];
        }
         _soapresults = nil;

    }


    if([elementName isEqualToString:@"Fid"])
    {
        _fmdl=[[Fmodel alloc]init];
        
         recordResults = FALSE;
        _fmdl.Fid=_soapresults;
        _soapresults = nil;

    }
    
    if([elementName isEqualToString:@"f1"])
    {
        
        recordResults = FALSE;
         _fmdl.f1=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"f2"])
    {
        
        recordResults = FALSE;
        _fmdl.f2=_soapresults;

        _soapresults = nil;
    }
    if([elementName isEqualToString:@"f3"])
    {
        
        recordResults = FALSE;
        _fmdl.f3=_soapresults;

        _soapresults = nil;
    }
    if([elementName isEqualToString:@"F4"])
    {
        
        recordResults = FALSE;
        _fmdl.f4=_soapresults;

        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"F5"])
    {
        
        recordResults = FALSE;
        _fmdl.f5=_soapresults;

        _soapresults = nil;
    }
    if([elementName isEqualToString:@"F6"])
    {
        
        recordResults = FALSE;
        _fmdl.f6=_soapresults;

        _soapresults = nil;
    }
    if([elementName isEqualToString:@"F7"])
    {
        
        recordResults = FALSE;
        _fmdl.f7=_soapresults;

        _soapresults = nil;
    }
    if([elementName isEqualToString:@"F8"])
    {
        
        recordResults = FALSE;
        _fmdl.f8=_soapresults;

        _soapresults = nil;

    }
    
    if([elementName isEqualToString:@"F9"])
    {
        
        recordResults = FALSE;
        _fmdl.f9=_soapresults;

        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"F10"])
    {
        
        recordResults = FALSE;
        _fmdl.f10=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"F11"])
    {
        
        recordResults = FALSE;
         _fmdl.f11=_soapresults;
        
        _soapresults = nil;
    }
    
    
    if([elementName isEqualToString:@"F12"])
    {
        
        recordResults = FALSE;
          _fmdl.f12=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"F13"])
    {
        
        recordResults = FALSE;
        _fmdl.f13=_soapresults;

        _soapresults = nil;
    }
    if([elementName isEqualToString:@"F14"])
    {
        
        recordResults = FALSE;
        _fmdl.f14=_soapresults;

        _soapresults = nil;

    }
    if([elementName isEqualToString:@"F15"])
    {
        recordResults = FALSE;
        _fmdl.f15=_soapresults;

        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"F16"])
    {
        
        recordResults = FALSE;
          _fmdl.f16=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"F17"])
    {
        
        recordResults = FALSE;
          _fmdl.f17=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"F18"])
    {
        
        recordResults = FALSE;
          _fmdl.f18=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"F19"])
    {
        
        recordResults = FALSE;
          _fmdl.f19=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"F20"])
    {
        
        recordResults = FALSE;
          _fmdl.f20=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"id"])
    {
        
        recordResults = FALSE;
            [_fArray addObject:_fmdl];
        
        _soapresults = nil;

    }
    if([elementName isEqualToString:@"st"])
    {
        
        recordResults = FALSE;
        _fmdl.st=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"ot"])
    {
        
        recordResults = FALSE;
        _fmdl.ot=_soapresults;
    

        _soapresults = nil;

    }

    
}


@end
