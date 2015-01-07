//
//  RMLaborViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 06/01/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "RMLaborViewController.h"

@interface RMLaborViewController ()

@end

@implementation RMLaborViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _maintabletitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
     self.dropview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _maintableview.layer.borderWidth=3.0;
    _maintableview.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _firstdgtable.layer.borderWidth=3.0;
    _firstdgtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _secdgtable.layer.borderWidth=3.0;
    _secdgtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;


    [self JobsSelect];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 250, 200)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 250, 200)];
    
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight= 32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    
    [popoverView addSubview:_popovertableview];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(250, 200);
    
    //create a popover controller
    self.popovercontroller = [[UIPopoverController alloc]
                    initWithContentViewController:popoverContent];
    self.popovercontroller.popoverContentSize=CGSizeMake(250.0f, 200.0f);
    self.popovercontroller=_popovercontroller;
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    if (poptype==1) {
        
    
    
   
            [self.popovercontroller presentPopoverFromRect:_jobbtn.frame
                                          inView:self.view
                        permittedArrowDirections:UIPopoverArrowDirectionUp
                                        animated:YES];
    }
    else if(poptype==2)
    {
        [self.popovercontroller presentPopoverFromRect:_craftbtn.frame
                                                inView:self.view
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }
    
}
#pragma mark - Calendar
-(void)createCalenderPopover
{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 315, 330)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(315, 330);
    
    CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
    self.calender = calendar;
    calendar.delegate =(id) self;
    
    
    NSDate *date = [NSDate date];
    
    // format it
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    // convert it to a string
    NSString *dateString = [dateFormat stringFromDate:date];
    //NSLog(@"datestring%@",dateString);
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    calendar.selectedDate = [self.dateFormatter dateFromString:dateString];
    
    calendar.minimumDate = [self.dateFormatter dateFromString:@"09/07/2011"];
    calendar.maximumDate = [self.dateFormatter dateFromString:@"1/07/2019"];
    calendar.shouldFillCalendar = YES;
    calendar.adaptHeightToNumberOfWeeksInMonth = NO;
    
    calendar.frame = CGRectMake(10, 10, 300, 320);
    [popoverView addSubview:calendar];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
    
    
    //create a popover controller
    self.popovercontroller = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popovercontroller.popoverContentSize=CGSizeMake(320.0f, 340.0f);
    self.popovercontroller=_popovercontroller;
    
    if (calendertype==1) {
        
        [self.popovercontroller presentPopoverFromRect:_startdatebtn.frame
                                                inView:self.view
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }
    if (calendertype==2) {
        [self.popovercontroller presentPopoverFromRect:_enddatebtn.frame
                                                inView:self.view
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
        
    }
}
- (void)localeDidChange {
    [self.calender setLocale:[NSLocale currentLocale]];
}



#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    if (calendertype==1) {
        
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"MM/dd/YYYY"];
        
        NSString *dateString = [dateFormat stringFromDate:date];
        [_startdatebtn setTitle:dateString forState:UIControlStateNormal];
        
    }
    if (calendertype==2) {
        
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"MM/dd/YYYY"];
        
        NSString *dateString = [dateFormat stringFromDate:date];
        [_enddatebtn setTitle:dateString forState:UIControlStateNormal];
    }
}

#pragma mark-IBActions
- (IBAction)clsebtn:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)SelectJobs:(id)sender {
    poptype=1;
    [self createpopover];
    [self JobsSelect];
}

- (IBAction)SelectStartdate:(id)sender {
    calendertype=1;
    [self createCalenderPopover];
}

- (IBAction)SelectEnddate:(id)sender {
    calendertype=2;
    [self createCalenderPopover];
}

- (IBAction)SelectCraft:(id)sender {
    poptype=2;
     [self createpopover];
}

#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView==_popovertableview) {
        if (poptype==1) {
            
        
        return [_jobarray count];
        }else if(poptype==2)
        {
            return 5;
        }
    
    }
    if (tableView==_maintableview) {
        //return [_mainlistarray count];
         return 5;
    }
    if (tableView==_firstdgtable) {
        //return [_firstdgarray count];
         return 5;
    }
    if (tableView==_secdgtable) {
        //return [_secdgarray count];
         return 5;
    }
    return YES;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        if (tableView==_maintableview) {
            [[NSBundle mainBundle]loadNibNamed:@"LbrRMmaincell" owner:self options:nil];
            cell=_maincell;
        }
        else if (tableView==_firstdgtable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"LbrFstdgcell" owner:self options:nil];
            cell=_fdgcell;
        }
        else if (tableView==_secdgtable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"LbrSecdgcell" owner:self options:nil];
            cell=_Sdgcell;
        }
        
            }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    if (tableView==_popovertableview) {
        if (poptype==1) {

        jobsitemodel *jobsmdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:indexPath.row];
        
                cell.textLabel.text=[NSString stringWithFormat:@"%@-%@-%@",jobsmdl.jobname,jobsmdl.jobno,jobsmdl.skill];
        }
        else if(poptype==2)
        {
            cell.textLabel.text=@"Craft";
        }
        
        
        
    }
     if (tableView==_maintableview)
     {
         
         _craftlabel=(UILabel *)[cell viewWithTag:1];
         _declabel=(UILabel*)[cell viewWithTag:2];
         _requiredlabel=(UILabel*)[cell viewWithTag:3];
         _filledlabel=(UILabel*)[cell viewWithTag:4];
         _balancelabel=(UILabel*)[cell viewWithTag:5];
     }
    
     else if (tableView==_firstdgtable)
     {
         _Firstnamelabel=(UILabel *)[cell viewWithTag:1];
         _secnamelabel=(UILabel*)[cell viewWithTag:2];
     }
    
    else if (tableView==_secdgtable)
     {
         
         _flabel=(UILabel *)[cell viewWithTag:1];
         _Llabel=(UILabel*)[cell viewWithTag:2];
         _Dgcraftlabel=(UILabel*)[cell viewWithTag:3];
         _assigndatelabel=(UILabel*)[cell viewWithTag:4];
     }
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (tableView==_popovertableview) {
        if (poptype==1) {
            
        
        jobsitemodel *jobsmdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:indexPath.row];
       
        
                
                [_jobbtn setTitle:[NSString stringWithFormat:@"%@-%@-%@",jobsmdl.jobname,jobsmdl.jobno,jobsmdl.skill]forState:UIControlStateNormal];
        
                
        }
        else if(poptype==2)
        {
            
        }
        
       
    }
    [self.popovercontroller dismissPopoverAnimated:YES];
    
    
}

-(void)JobsSelect{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<JobsSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   
                   "</JobsSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/JobsSelect" forHTTPHeaderField:@"Soapaction"];
    
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
    
    [_popovertableview reloadData];
    
    
}

#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"JobsSelectResponse"])
    {
        _jobarray=[[NSMutableArray alloc]init];
        _jobmdlarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"id"]){
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
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SkillName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"JobSiteName"])
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
    if([elementName isEqualToString:@"id"])
    {_jobmdl=[[jobsitemodel alloc]init];
        recordResults = FALSE;
        _jobmdl.jobid=[_soapResults integerValue];
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"JobNumber"])
    {
        recordResults = FALSE;
        _jobmdl.jobno=_soapResults;
        //jobnumber=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SkillName"])
    {
        recordResults = FALSE;
        _jobmdl.skill=_soapResults;
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"JobSiteName"])
    {
        recordResults = FALSE;
        _jobmdl.jobname=_soapResults;
        
        [_jobarray addObject:[NSString stringWithFormat:@"%@",_soapResults]];
        [_jobmdlarray addObject:_jobmdl];
        
        _soapResults = nil;
    }
}

@end
