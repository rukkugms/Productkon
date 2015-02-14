//
//  PMJobViewController.m
//  Newproject
//
//  Created by Riya on 1/7/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "PMJobsViewController.h"

@interface PMJobsViewController ()

@end

@implementation PMJobsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.linkview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
    _jobtable.layer.borderWidth=3.0;
    _jobtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _disclurearray=[[NSMutableArray alloc]initWithObjects:@"Link Contract",@"Purchase Order",@"Work Order", nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self FillJobsModel];
    
    _SearchingBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _SearchingBar.delegate = (id)self;
    _SearchingBar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    // _navitem.titleView.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    
    self.jobtable.tableHeaderView =_SearchingBar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_SearchingBar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;
    
    
    _SearchingBar.text=@"";

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark-popover
-(void)createpopover{
      poptype=2;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 220, 200)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 220, 200)];
    
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight= 32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popovertableview];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(220, 200);
    
    //create a popover controller
    self.popovercontroller = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popovercontroller.popoverContentSize=CGSizeMake(220.0f, 220.0f);
    self.popovercontroller=_popovercontroller;
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    [self.popovercontroller presentPopoverFromRect:_linkbtn.frame
                                            inView:self.linkview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];

    
    
    
    
}

#pragma mark - Web Service
-(void)FillJobsModel{
    recordResults = FALSE;
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FillJobsModel xmlns=\"https://vip.kontract360.com/\">\n"
                   "</FillJobsModel>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/FillJobsModel" forHTTPHeaderField:@"Soapaction"];
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
-(void)FillContract{
    recordResults = FALSE;
    
    PMjobsmdl *jobmdl1=(PMjobsmdl *)[_jobarray objectAtIndex:btnindex];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FillContract xmlns=\"https://vip.kontract360.com/\">\n"
                   "<customername>%d</customername>\n"
                   "</FillContract>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[jobmdl1.customerid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/FillContract" forHTTPHeaderField:@"Soapaction"];
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
-(void)UpdateContract{
    recordResults = FALSE;
    
    PMjobsmdl *jobmdl1=(PMjobsmdl *)[_jobarray objectAtIndex:btnindex];
    NSString *soapMessage;
    
    NSArray *link=[_linkbtn.titleLabel.text componentsSeparatedByString:@"-"];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateContract xmlns=\"https://vip.kontract360.com/\">\n"
                   "<id>%d</id>\n"
                   "<conid>%d</conid>\n"
                   "</UpdateContract>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[jobmdl1.entryid integerValue],[[_linkdict objectForKey:[link objectAtIndex:0] ]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/UpdateContract" forHTTPHeaderField:@"Soapaction"];
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
 
    [_jobtable reloadData];
    [_popovertableview reloadData];
    
    
    
    
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"FillJobsModelResponse"])
    {
        _jobarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
        if([elementName isEqualToString:@"JobNumber"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"TrimmedJobNumber"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobDescSummary"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"JobStartDate"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CustomerId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"CustomerName"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Unit"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ContractAmount"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SelectedBidId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ContractNumber"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobSkillName"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobManHours"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobEquipmentHours"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobMaterialHours"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobMan"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobEquipment"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobMaterial"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobOTHER"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FillContractResponse"])
    {
        
        _linkdict =[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"entryid"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Number"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UpdateContractResponse"])
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
       if([elementName isEqualToString:@"Id"])
    {
          _jobmdl=[[PMjobsmdl alloc]init];
        
         recordResults = FALSE;
        _jobmdl.entryid=_soapResults;
         _soapResults = nil;
    }
       if([elementName isEqualToString:@"JobNumber"])
    {
        
        
        recordResults = FALSE;
        
        _soapResults = nil;

    }
    
    
    if([elementName isEqualToString:@"TrimmedJobNumber"])
    {
        
        
        recordResults = FALSE;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"JobDescSummary"])
    {
        
        
        recordResults = FALSE;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        
        
        recordResults = FALSE;
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"JobStartDate"])
    {
        
        
        recordResults = FALSE;
        NSArray *dateArray=[[NSArray alloc]init];
        dateArray=[_soapResults componentsSeparatedByString:@"T"];
        NSString *date1 =[dateArray objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];
        _jobmdl.startdate=myFormattedDate;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"CustomerId"])
    {
        
        
        recordResults = FALSE;
         _jobmdl.customerid=_soapResults;
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"CustomerName"])
    {
        
        
        recordResults = FALSE;
        _jobmdl.customername=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"Unit"])
    {
        
        
        recordResults = FALSE;
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"ContractAmount"])
    {
        
        
        recordResults = FALSE;
        _jobmdl.amount=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SelectedBidId"])
    {
        
        recordResults = FALSE;
         _jobmdl.bidnumber=_soapResults;
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"ContractNumber"])
    {
        
        
        recordResults = FALSE;
         _jobmdl.contract=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"JobSkillName"])
    {
        
        
        recordResults = FALSE;
         _jobmdl.jobnumber=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"JobManHours"])
    {
        
        
        recordResults = FALSE;
         _jobmdl.manhr=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"JobEquipmentHours"])
    {
        
        
        recordResults = FALSE;
         _jobmdl.equhr=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"JobMaterialHours"])
    {
        
        
        recordResults = FALSE;
         _jobmdl.material=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"JobMan"])
    {
        
        
        recordResults = FALSE;
         _jobmdl.manpower=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"JobEquipment"])
    {
        
        
        recordResults = FALSE;
         _jobmdl.equipment=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"JobMaterial"])
    {
        
        
        recordResults = FALSE;
         _jobmdl.material=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"JobOTHER"])
    {
        
        
        recordResults = FALSE;
         _jobmdl.others=_soapResults;
        [_jobarray addObject:_jobmdl];
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"entryid"])
    {
        
        
     recordResults = FALSE;
        newstrg=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Number"])
    {
        
        
        recordResults = FALSE;
        [_linkdict setObject:newstrg forKey:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
          recordResults = FALSE;
        if([_soapResults isEqualToString:@"updated"]){
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Updated Successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            [self FillJobsModel];
        }
          _soapResults = nil;
        
        
    }


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
    if (tableView==_popovertableview) {
        if (poptype==1) {
           
            return [_disclurearray count];
        }
        else{
            
            return [_linkdict count];
        }
        
    }
    else  if (tableView==_jobtable) {
        return [_jobarray count];
        
    }
    
    return YES;
   
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_jobtable) {
            
            
            [[NSBundle mainBundle]loadNibNamed:@"PMjobscell" owner:self options:nil];
            cell=_jobcell;
        }
    }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
     if (tableView==_popovertableview) {
         if (poptype==1) {
              cell.textLabel.text=[_disclurearray objectAtIndex:indexPath.row];
         }
         else{
              PMjobsmdl *jobmdl1=(PMjobsmdl *)[_jobarray objectAtIndex:btnindex];
             NSArray*array=[_linkdict allKeys];
             
             cell.textLabel.text=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:indexPath.row],jobmdl1.customername];
             
        
         }
     }
     if (tableView==_jobtable) {
         
         PMjobsmdl *jobmdl1=(PMjobsmdl *)[_jobarray objectAtIndex:indexPath.row];
         _numbrcell=(UILabel *)[cell viewWithTag:1];
         _numbrcell.text=jobmdl1.jobnumber;
         _bidlbl=(UILabel *)[cell viewWithTag:2];
         _bidlbl.text=jobmdl1.bidnumber;
         UITapGestureRecognizer *tapGesture =
         [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap:)];
         [_bidlbl addGestureRecognizer:tapGesture];
         _datelbl=(UILabel *)[cell viewWithTag:3];
         _datelbl.text=jobmdl1.startdate;
         _custmrlbl=(UILabel *)[cell viewWithTag:4];
         _custmrlbl.text=jobmdl1.customername;
         _cntrctlbl=(UILabel *)[cell viewWithTag:5];
         _cntrctlbl.text=jobmdl1.contract;
         _Amtlbl=(UILabel *)[cell viewWithTag:6];
         _Amtlbl.text=jobmdl1.amount;
         _manhrlbl=(UILabel *)[cell viewWithTag:7];
         _manhrlbl.text=jobmdl1.manhr;
         _eqhrlbl=(UILabel *)[cell viewWithTag:8];
         _eqhrlbl.text=jobmdl1.equhr;
         _manpwrlbl=(UILabel *)[cell viewWithTag:9];
         _manpwrlbl.text=jobmdl1.manpower;
         _equlbl=(UILabel *)[cell viewWithTag:10];
         _equlbl.text=jobmdl1.equipment;
         _matlbl=(UILabel *)[cell viewWithTag:11];
         _matlbl.text=jobmdl1.material;
         _othrlbl=(UILabel *)[cell viewWithTag:12];
         _othrlbl.text=jobmdl1.others;
         
         
         
         
     }
    return cell;

    
    
}
#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_popovertableview) {
         PMjobsmdl *jobmdl1=(PMjobsmdl *)[_jobarray objectAtIndex:btnindex];
        if (poptype==1) {
            
        
        NSInteger path=indexPath.row;
            
            
            if (path==0) {
                _linkview.hidden=NO;
                _updatebtnlbl.enabled=YES;
                [_linkbtn setTitle:@"Select" forState:UIControlStateNormal];
                _navtitle.title=[NSString stringWithFormat:@"%@-Link Contract",jobmdl1.jobnumber];
            }
            else if (path==1) {
                self.purchaseVCtrl=[[PurchaseViewController alloc]initWithNibName:@"PurchaseViewController" bundle:nil];
                self.purchaseVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
                self.purchaseVCtrl.jobid=jobmdl1.entryid;
                [self dismissViewControllerAnimated:YES completion:^{[self presentViewController:self.purchaseVCtrl animated:YES completion:nil];
                }];

            }
            else if (path==2) {
                self.WorkVCtrl=[[WorkorderViewController alloc]initWithNibName:@"WorkorderViewController" bundle:nil];
                self.WorkVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
                self.WorkVCtrl.jobid=jobmdl1.entryid;
                [self dismissViewControllerAnimated:YES completion:^{[self presentViewController:self.WorkVCtrl animated:YES completion:nil];
                }];
               
            }

                }
        else{
            PMjobsmdl *jobmdl1=(PMjobsmdl *)[_jobarray objectAtIndex:btnindex];
            NSArray*array=[_linkdict allKeys];
            
          
            [_linkbtn setTitle:[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:indexPath.row],jobmdl1.customername] forState:UIControlStateNormal];
        }
        
        
    }
    [self.popovercontroller dismissPopoverAnimated:YES];
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_jobtable)
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

-(void)labelTap:(UITapGestureRecognizer *)sender{
    
    CGPoint location = [sender locationInView:self.view];
    CGPoint locationInTableview = [self.jobtable convertPoint:location fromView:self.view];
    NSIndexPath *indexPath = [self.jobtable indexPathForRowAtPoint:locationInTableview];
    
    PMjobsmdl*job=(PMjobsmdl *)[_jobarray objectAtIndex:indexPath.row];
    NSLog(@"textFieldIndexPath%d",indexPath.row);
    _bidVCtrl=[[BidViewController alloc]initWithNibName:@"BidViewController" bundle:nil];
    
    _bidVCtrl.bidnumbr=job.bidnumber;
    _bidVCtrl.frmplan=1;
    [self presentViewController:_bidVCtrl animated:YES completion:nil];
    
    

}
#pragma mark - Alertview delegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ////NSLog(@"buttonIndex%d",buttonIndex);
    
    if ([alertView.message isEqualToString:@"Updated Successfully"]) {
        
        
        
        if (buttonIndex==0) {
             _updatebtnlbl.enabled=YES;
            _linkview.hidden=YES;
            
            
          }
    }
}
#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_SearchingBar.text;
    //NSLog(@"search%@",searchstring);
  //  [self SearchEquipment];
    [searchBar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    // [self Allmanpwrarry];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_SearchingBar.text length]==0) {
        
        [self FillJobsModel];
        // [searchBar resignFirstResponder];
        
        
    }
    // [searchBar resignFirstResponder];
    
    
}

#pragma mark - Button Action

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)disclurebtn:(id)sender {
    poptype=1;
    UIViewController* popoverContent = [[UIViewController alloc]init];
    UIView* popoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 132, 121)];
    // popoverView.backgroundColor = [UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 132, 121)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight= 41;
    //_popovertableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    //_popovertableview.separatorColor=[UIColor blackColor];
    [popoverView addSubview:_popovertableview];
    popoverContent.view = popoverView;
    popoverContent.contentSizeForViewInPopover = CGSizeMake(132, 121);
    
    button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.jobtable];
    NSIndexPath *textFieldIndexPath = [self.jobtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    
    //UITableView *table = (UITableView *)[cell superview];
    self.popovercontroller = [[UIPopoverController alloc]initWithContentViewController:popoverContent];
    self.popovercontroller.popoverContentSize=CGSizeMake(132.0f, 121.0f);
    self.popovercontroller=_popovercontroller;
    [self.popovercontroller presentPopoverFromRect:_disclsurbtnlbl.frame inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}
- (IBAction)updatebtn:(id)sender {
    _updatebtnlbl.enabled=NO;
    [self UpdateContract];
    
}

- (IBAction)linkclsebtn:(id)sender {
    _linkview.hidden=YES;
}

- (IBAction)linkpopbtn:(id)sender {
    [self createpopover];
    [self FillContract];
}
@end
