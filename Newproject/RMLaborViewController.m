//
//  RMLaborViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 06/01/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "RMLaborViewController.h"
#define kCellHeight 44
#define kNavBarHeight 30

@interface RMLaborViewController ()

@end

@implementation RMLaborViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSourceTableWithFrame:CGRectMake(0, 0, 340,271)];
    [self setupDestinationTableWithFrame:CGRectMake(0, 0, 529, 271)];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MM/dd/YYYY"];
    
    _currentdatestring= [dateFormat stringFromDate:[NSDate date]];
    
    [_startdatebtn setTitle:_currentdatestring forState:UIControlStateNormal];
    [_enddatebtn setTitle:_currentdatestring forState:UIControlStateNormal];
    
    startdate=[NSDate date];
    enddate=[NSDate date];
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
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanning:)];
    panGesture.delegate=self;
    [self.dropview addGestureRecognizer:panGesture];
    _craftbtn.userInteractionEnabled=NO;

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
        NSLog(@"%@",date);
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"MM/dd/yyyy"];
        startdate=date;
        NSString *dateString = [dateFormat stringFromDate:date];
        [_startdatebtn setTitle:dateString forState:UIControlStateNormal];
        [self.popovercontroller dismissPopoverAnimated:YES];
       // [self FillJRDetails];
    }
    if (calendertype==2) {
        
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"MM/dd/yyyy"];
        enddate=date;
        NSString *dateString = [dateFormat stringFromDate:date];
        [_enddatebtn setTitle:dateString forState:UIControlStateNormal];
        [self.popovercontroller dismissPopoverAnimated:YES];
        //[self FillJRDetails];
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
    [self FillJobCraft];
    
}

- (IBAction)Showdata:(id)sender {
    if ([_jobbtn.titleLabel.text isEqualToString:@"Select"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please select a jobsite" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];

    }
   else if ([startdate compare:enddate] == NSOrderedDescending){
        
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Start date should be less than or equal to end date" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
       startdate=nil;
       enddate=nil;
       
    }
    
    else{
            
            [self FillJRDetails];
        [self FillEmployeesBasedonJobandDate];
            
        }

    
}

- (IBAction)releaseaction:(id)sender {
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.secdgtable];
    NSIndexPath *textFieldIndexPath = [self.secdgtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    releaseindex=textFieldIndexPath.row;
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Do you want to release this employee?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
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
            return [_craftlistarray count];
        }
    
    }
    if (tableView==_maintableview) {
        return [_mainlistarray count];
        
    }
    if (tableView==_firstdgtable) {
        return [_firstdgarray count];
        
    }
    if (tableView==_secdgtable) {
        return [_secdgarray count];
        
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
            cell.textLabel.text=[_craftlistarray objectAtIndex:indexPath.row];
        }
        
        
        
    }
     if (tableView==_maintableview)
     {
           RMLaborMain *mainmodel=(RMLaborMain *)[_mainlistarray objectAtIndex:indexPath.row];
         _craftlabel=(UILabel *)[cell viewWithTag:1];
         _craftlabel.text=mainmodel.Craft;
         _declabel=(UILabel*)[cell viewWithTag:2];
         _declabel.text=mainmodel.Descption;
         _requiredlabel=(UILabel*)[cell viewWithTag:3];
         _requiredlabel.text=mainmodel.Required;
         _filledlabel=(UILabel*)[cell viewWithTag:4];
         _filledlabel.text=mainmodel.Filled;
         _balancelabel=(UILabel*)[cell viewWithTag:5];
         _balancelabel.text=mainmodel.Balance;
     }
    
     else if (tableView==_firstdgtable)
     {
          LbrFirst *first=(LbrFirst *)[_firstdgarray objectAtIndex:indexPath.row];
         _Firstnamelabel=(UILabel *)[cell viewWithTag:1];
         _Firstnamelabel.text=first.EmpFirstName;
         _secnamelabel=(UILabel*)[cell viewWithTag:2];
         _secnamelabel.text=first.EmpLastName;
     }
    
    else if (tableView==_secdgtable)
     {
         LBSecond *second=(LBSecond *)[_secdgarray objectAtIndex:indexPath.row];
         _flabel=(UILabel *)[cell viewWithTag:1];
         _flabel.text=second.JRCempFirstName;
         _Llabel=(UILabel*)[cell viewWithTag:2];
         _Llabel.text=second.JRCempLastName;
         _Dgcraftlabel=(UILabel*)[cell viewWithTag:3];
         _Dgcraftlabel.text=second.desname;
         _assigndatelabel=(UILabel*)[cell viewWithTag:4];
         NSArray*ary=[second.AssignDate componentsSeparatedByString:@"T"];
         NSString*news=[ary objectAtIndex:0];
         NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
         [dateFormat setDateFormat:@"yyyy-MM-dd"];
         NSDate *dates = [dateFormat dateFromString:news];
         [dateFormat setDateFormat:@"MM-dd-yyy"];
         NSString *myFormattedDate = [dateFormat stringFromDate:dates];
         _assigndatelabel.text=myFormattedDate;

        
     }
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (tableView==_popovertableview) {
        if (poptype==1) {
            
        
        jobsitemodel *jobsmdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:indexPath.row];
       
        
                
                [_jobbtn setTitle:[NSString stringWithFormat:@"%@-%@-%@",jobsmdl.jobname,jobsmdl.jobno,jobsmdl.skill]forState:UIControlStateNormal];
            
            [_craftbtn setTitle:[NSString stringWithFormat:@"Select"]forState:UIControlStateNormal];
           _craft=@"";
            jobsiteindexpath=indexPath.row;
            _craftbtn.userInteractionEnabled=YES;
             [self FillEmployeesBasedonCraft];
            
            //[self FillJRDetails];
        }
        else if(poptype==2)
        {
            
            [_craftbtn setTitle:[_craftlistarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            _craft=[_craftlistarray objectAtIndex:indexPath.row];
            [self FillEmployeesBasedonCraft];
        }
        
       
    }
    [self.popovercontroller dismissPopoverAnimated:YES];
    
    
}
#pragma mark UITableViewDelegate methods
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_maintableview||tableView==_firstdgtable||tableView==_secdgtable)
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

#pragma mark-Webservices

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
-(void)FillJRDetails{
    recordResults=FALSE;
    NSString *soapMessage;
    
     jobsitemodel *jobsmdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:jobsiteindexpath];
    NSString *start;
    NSString *end;
    
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dates = [dateFormat1 dateFromString:_startdatebtn.titleLabel.text];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    
    NSString*    dateString = [dateFormat2 stringFromDate:dates];
    start=dateString;

    
    
    NSDateFormatter *dateFormat3 = [[NSDateFormatter alloc] init];
    [dateFormat3 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dat = [dateFormat3 dateFromString:_enddatebtn.titleLabel.text];
    NSLog(@"s%@",dat);
    NSDateFormatter *dateFormat4 = [[NSDateFormatter alloc]init];
    [dateFormat4 setDateFormat: @"yyyy-MM-dd"];
    
    NSString*    dateString1 = [dateFormat4 stringFromDate:dat];
    end=dateString1;

    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FillJRDetails xmlns=\"http://ios.kontract360.com/\">\n"
                   "<EmpJobsite>%@</EmpJobsite>\n"
                   "<StartD>%@</StartD>\n"
                   "<EndD>%@</EndD>\n"
                   "</FillJRDetails>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",jobsmdl.jobno,start,end];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/FillJRDetails" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)FillJobCraft{
    recordResults=FALSE;
    NSString *soapMessage;
    
    jobsitemodel *jobsmdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:jobsiteindexpath];

    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FillJobCraft xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<jobsite>%@</jobsite>\n"
                   "</FillJobCraft>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",jobsmdl.jobno];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/FillJobCraft" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)FillEmployeesBasedonCraft{
    recordResults=FALSE;
    NSString *soapMessage;
    
    jobsitemodel *jobsmdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:jobsiteindexpath];
    NSString *craftcode=[_craftlistdict objectForKey:_craft];
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FillEmployeesBasedonCraft xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<CraftCode>%@</CraftCode>\n"
                   "<Job>%@</Job>\n"
                   "</FillEmployeesBasedonCraft>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",craftcode,jobsmdl.jobno];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/FillEmployeesBasedonCraft" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)FillEmployeesBasedonJobandDate{
    recordResults=FALSE;
    NSString *soapMessage;
    
    jobsitemodel *jobsmdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:jobsiteindexpath];
    NSString *start;
    NSString *end;
    
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dates = [dateFormat1 dateFromString:_startdatebtn.titleLabel.text];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    
    NSString*    dateString = [dateFormat2 stringFromDate:dates];
    start=dateString;
    
    
    
    NSDateFormatter *dateFormat3 = [[NSDateFormatter alloc] init];
    [dateFormat3 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dat = [dateFormat3 dateFromString:_enddatebtn.titleLabel.text];
    NSLog(@"s%@",dat);
    NSDateFormatter *dateFormat4 = [[NSDateFormatter alloc]init];
    [dateFormat4 setDateFormat: @"yyyy-MM-dd"];
    
    NSString*    dateString1 = [dateFormat4 stringFromDate:dat];
    end=dateString1;

    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FillEmployeesBasedonJobandDate xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<JobCode>%@</JobCode>\n"
                   "<StrD>%@</StrD>\n"
                   "<EnDD>%@</EnDD>\n"
                   "</FillEmployeesBasedonJobandDate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",jobsmdl.jobno,start,end];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/FillEmployeesBasedonJobandDate" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)InsertJobReferral{
    recordResults=FALSE;
    NSString *soapMessage;
    
    jobsitemodel *jobsmdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:jobsiteindexpath];
    NSString *craftcode=[_craftlistdict objectForKey:_craft];
    
    
    LbrFirst *first=(LbrFirst*)[_firstdgarray objectAtIndex:dragpath];
    NSInteger empid=[first.EmpId integerValue];
    
    NSString *start;
    NSString *end;
    
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dates = [dateFormat1 dateFromString:_startdatebtn.titleLabel.text];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    
    NSString*    dateString = [dateFormat2 stringFromDate:dates];
    start=dateString;
    
    
    
    NSDateFormatter *dateFormat3 = [[NSDateFormatter alloc] init];
    [dateFormat3 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dat = [dateFormat3 dateFromString:_enddatebtn.titleLabel.text];
    NSLog(@"s%@",dat);
    NSDateFormatter *dateFormat4 = [[NSDateFormatter alloc]init];
    [dateFormat4 setDateFormat: @"yyyy-MM-dd"];
    
    NSString*    dateString1 = [dateFormat4 stringFromDate:dat];
    end=dateString1;
    
    


    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertJobReferral xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<jobsite>%@</jobsite>\n"
                   "<std>%@</std>\n"
                   "<endd>%@</endd>\n"
                   "<craftid>%@</craftid>\n"
                   "<empid>%d</empid>\n"
                   "</InsertJobReferral>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",jobsmdl.jobno,start,end,craftcode,empid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/InsertJobReferral" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReleaseJobRefferals{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    LBSecond *second=(LBSecond *)[_secdgarray objectAtIndex:releaseindex];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReleaseJobRefferals xmlns=\"http://ios.kontract360.com/\">\n"
                    "<entryid>%d</entryid>\n"
                   
                   "</ReleaseJobRefferals>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[second.JREntryId integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReleaseJobRefferals" forHTTPHeaderField:@"Soapaction"];
    
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
    [_maintableview reloadData];
    [_firstdgtable reloadData];
    [_secdgtable reloadData];
    
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
    if([elementName isEqualToString:@"FillJRDetailsResponse"])
    {_mainlistarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Description"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Required"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Filled"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Balance"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Craft"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FillJobCraftResponse"])
    {
        _craftlistarray=[[NSMutableArray alloc]init];
        _craftlistdict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ItemCode"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"craftname"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FillEmployeesBasedonCraftResponse"])
    {
        _firstdgarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EmpId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EmpDOB"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EmpJobDescID"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EmpNoOfDependents"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EmpFirstName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EmpLastName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EmpBasicPay"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"FillEmployeesBasedonJobandDateResponse"])
    {
        _secdgarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"JREntryId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JRJobNumber"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JRCempId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JRFromDate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JRToDate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JRReleased"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JRCempFirstName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JRCempLastName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"AssignDate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"desname"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"InsertJobReferralResponse"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    if([elementName isEqualToString:@"records"])
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
    if([elementName isEqualToString:@"EntryId"])
    {
        _mainmodel=[[RMLaborMain alloc]init];
        recordResults = FALSE;
        _mainmodel.entryid=_soapResults;
        _soapResults = nil;
           }
    if([elementName isEqualToString:@"Description"])
    {
        recordResults = FALSE;
        _mainmodel.Descption=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Required"])
    {
        recordResults = FALSE;
        _mainmodel.Required=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Filled"])
    {
        recordResults = FALSE;
        _mainmodel.Filled=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Balance"])
    {
        recordResults = FALSE;
        _mainmodel.Balance=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Craft"])
    {
        recordResults = FALSE;
        _mainmodel.Craft=_soapResults;
        [_mainlistarray addObject:_mainmodel];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ItemCode"])
    {
       
        recordResults = FALSE;
        _craftitemcode=_soapResults;
        _soapResults = nil;
           }
    if([elementName isEqualToString:@"craftname"])
    {
        
        recordResults = FALSE;
        [_craftlistarray addObject:[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
       [_craftlistdict setObject:_craftitemcode forKey:[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EmpId"])
    {
        _firstmodel=[[LbrFirst alloc]init];
        recordResults = FALSE;
        _firstmodel.EmpId=_soapResults;
        _soapResults = nil;
        
      
    }
    if([elementName isEqualToString:@"EmpDOB"])
    {
        recordResults = FALSE;
        _firstmodel.EmpDOB=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"EmpJobDescID"])
    {
        
        recordResults = FALSE;
        _firstmodel.EmpJobDescID=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EmpNoOfDependents"])
    {
        recordResults = FALSE;
        _firstmodel.EmpNoOfDependents=_soapResults;
        _soapResults = nil;
           }
    if([elementName isEqualToString:@"EmpFirstName"])
    {  recordResults = FALSE;
        _firstmodel.EmpFirstName=_soapResults;
        _soapResults = nil;
        
          }
    if([elementName isEqualToString:@"EmpLastName"])
    {
        recordResults = FALSE;
        _firstmodel.EmpLastName=_soapResults;
        _soapResults = nil;
      
    }
    if([elementName isEqualToString:@"EmpBasicPay"])
    {
        recordResults = FALSE;
        _firstmodel.EmpBasicPay=_soapResults;
        _soapResults = nil;
        [_firstdgarray addObject:_firstmodel];
       
    }
    if([elementName isEqualToString:@"JREntryId"])
    {
        
        _secmodel=[[LBSecond alloc]init];
        recordResults = FALSE;
        _secmodel.JREntryId=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JRJobNumber"])
    {
        recordResults = FALSE;
        _secmodel.JRJobNumber=_soapResults;
        _soapResults = nil;
           }
    if([elementName isEqualToString:@"JRCempId"])
    {
        recordResults = FALSE;
        _secmodel.JRCempId=_soapResults;
        _soapResults = nil;

           }
    if([elementName isEqualToString:@"JRFromDate"])
    {
        recordResults = FALSE;
        _secmodel.JRFromDate=_soapResults;
        _soapResults = nil;

            }
    if([elementName isEqualToString:@"JRToDate"])
    {
        recordResults = FALSE;
        _secmodel.JRToDate=_soapResults;
        _soapResults = nil;

      
    }
    if([elementName isEqualToString:@"JRReleased"])
    {
        
        recordResults = FALSE;
        _secmodel.JRReleased=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"JRCempFirstName"])
    {
        recordResults = FALSE;
        _secmodel.JRCempFirstName=_soapResults;
        _soapResults = nil;

       
    }
    if([elementName isEqualToString:@"JRCempLastName"])
    {
        recordResults = FALSE;
        _secmodel.JRCempLastName=_soapResults;
        _soapResults = nil;

        
    }
    
    if([elementName isEqualToString:@"AssignDate"])
    { recordResults = FALSE;
        _secmodel.AssignDate=_soapResults;
        [_secdgarray addObject:_secmodel];
        _soapResults = nil;

           }
    if([elementName isEqualToString:@"desname"])
    {
        recordResults = FALSE;
        _secmodel.desname=_soapResults;
        
        _soapResults = nil;

            }
    if([elementName isEqualToString:@"records"])
    { recordResults = FALSE;
        if ([_soapResults isEqualToString:@"inserted"]) {
            [self FillEmployeesBasedonJobandDate];
            [self FillJRDetails];
        }
        if ([_soapResults isEqualToString:@"Released"]) {
            [self FillEmployeesBasedonJobandDate];
        }
        if ([_soapResults isEqualToString:@"Employee already assigned to  some other jobs in some dates of this period"])
        {
            _existingstring=_soapResults;
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        _soapResults = nil;
        
    }
    


}


#pragma mark UIGestureRecognizer

- (void)handlePanning:(UIPanGestureRecognizer *)gestureRecognizer
{
    switch ([gestureRecognizer state]) {
        case UIGestureRecognizerStateBegan:
            [self startDragging:gestureRecognizer];
            break;
        case UIGestureRecognizerStateChanged:
            [self doDrag:gestureRecognizer];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
            [self stopDragging:gestureRecognizer];
            break;
        default:
            break;
    }
}
#pragma mark Helper methods for initialization

- (void)setupSourceTableWithFrame:(CGRect)frame
{
    
    [self.dropview addSubview:_firstdgtable];
}

- (void)setupDestinationTableWithFrame:(CGRect)frame
{
    
    CGRect dropAreaFrame = frame;
    dropAreaFrame.origin.y = kNavBarHeight;
    dropAreaFrame.size.height -= kNavBarHeight;
    
    dropArea = [[UIView alloc] initWithFrame:CGRectMake(469, 30, 529, 271)];
   // [dropArea setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f]];
    [dropArea setBackgroundColor:[UIColor redColor]];
    [self.dropview addSubview:dropArea];
    
    CGRect contentFrame = dropAreaFrame;
    contentFrame.origin = CGPointMake(0, 0);
    
    UILabel* dropAreaLabel = [[UILabel alloc] initWithFrame:contentFrame];
    dropAreaLabel.backgroundColor = [UIColor clearColor];
    dropAreaLabel.font = [UIFont boldSystemFontOfSize:12];
    dropAreaLabel.textAlignment = NSTextAlignmentCenter;
    dropAreaLabel.textColor = [UIColor whiteColor];
    // dropAreaLabel.text = @"Drop items here...";
    [dropArea addSubview:dropAreaLabel];
    
    [dropArea addSubview:_secdgtable];
    
}

- (void)initDraggedCellWithCell:(UITableViewCell*)cell AtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_firstdgtable indexPathForRowAtPoint:point];
    //UITableViewCell* cell = [_subtypetable cellForRowAtIndexPath:indexPath];
    // get rid of old cell, if it wasn't disposed already
    if(draggedCell != nil)
    {
        [draggedCell removeFromSuperview];
        // [draggedCell release];
        draggedCell = nil;
    }
    CGRect frame;
    if(point.y>=489){
        
        frame= CGRectMake(point.x, 250, cell.frame.size.width-5, cell.frame.size.height-10);
    }
    else{
        frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
    }

    //CGRect frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
    
    draggedCell = [[UITableViewCell alloc] init];
    draggedCell.selectionStyle = UITableViewCellSelectionStyleGray;
    LbrFirst*first=(LbrFirst *)[_firstdgarray objectAtIndex:indexPath.row];
    draggedCell.textLabel.text =first.EmpFirstName;
    draggedCell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    draggedCell.textLabel.textColor = cell.textLabel.textColor;
    draggedCell.highlighted = YES;
    draggedCell.frame = frame;
    draggedCell.alpha = 0.8;
    
    [self.dropview addSubview:draggedCell];
}



#pragma mark Helper methods for dragging

- (void)startDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    
    CGPoint pointInSrc = [gestureRecognizer locationInView:_firstdgtable];
    CGPoint pointInDst = [gestureRecognizer locationInView:_secdgtable];
    
    if([_firstdgtable pointInside:pointInSrc withEvent:nil])
    {
        [self startDraggingFromSrcAtPoint:pointInSrc];
        dragFromSource = YES;
    }
    else if([_secdgtable pointInside:pointInDst withEvent:nil])
    {
        //[self startDraggingFromDstAtPoint:pointInDst];
        dragFromSource = NO;
    }
    
}

- (void)startDraggingFromSrcAtPoint:(CGPoint)point
{
    
   
        
        NSIndexPath* indexPath = [_firstdgtable indexPathForRowAtPoint:point];
        UITableViewCell* cell = [_firstdgtable cellForRowAtIndexPath:indexPath];
        
        if(cell != nil)
        {
            CGPoint origin = cell.frame.origin;
            origin.x += _firstdgtable.frame.origin.x;
            origin.y += _firstdgtable.frame.origin.y;
            
            [self initDraggedCellWithCell:cell AtPoint:origin];
            cell.highlighted = NO;
            
            if(draggedData != nil)
            {
                //[draggedData release];
                draggedData = nil;
            }
            
            dragpath=indexPath.row;
            
            LbrFirst*first=(LbrFirst *)[_firstdgarray objectAtIndex:dragpath];
            
            draggedData = first.EmpFirstName;
            // NSLog(@"%@",manmdl1.itemdescptn);
        }
    
    
}


- (void)doDrag:(UIPanGestureRecognizer *)gestureRecognizer
{
    if(draggedCell != nil && draggedData != nil)
    {
        CGPoint translation = [gestureRecognizer translationInView:[draggedCell superview]];
        [draggedCell setCenter:CGPointMake([draggedCell center].x + translation.x,
                                           [draggedCell center].y + translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:[draggedCell superview]];
    }
}
- (void)stopDragging:(UIPanGestureRecognizer *)gestureRecognizer
{   _existingstring=@"";
    if(draggedCell != nil && draggedData != nil)
    {
        
        
        
        if([gestureRecognizer state] == UIGestureRecognizerStateEnded
           && [dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil])
        {
            NSIndexPath* indexPath = [_secdgtable indexPathForRowAtPoint:[gestureRecognizer locationInView:_secdgtable]];
            if(indexPath != nil)
            {
                LBSecond*second=(LBSecond *)[_secdgarray objectAtIndex:indexPath.row];
                second.JRCempFirstName=draggedData;
                
                [_secdgarray addObject:second];
                
               
                [_secdgtable insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
                
                    
                    [self InsertJobReferral];
                
                
            }
            else
            {
                if ([_secdgarray count]==0) {
                    LBSecond*sec=[[LBSecond alloc]init];
                    sec.JRCempFirstName=draggedData;
                    [_secdgarray addObject:sec];
                    
                }
                else{
                    LBSecond*sec=(LBSecond *)[_secdgarray objectAtIndex:indexPath.row];
                    sec.JRCempFirstName=draggedData;
                    
                    [_secdgarray addObject:sec];
                }
                
                    
                    [self InsertJobReferral];
                
            }
        }
        else if(!dragFromSource && pathFromDstTable != nil)
        {
            // insert cell back where it came from
            [_secdgarray insertObject:draggedData atIndex:pathFromDstTable.row];
            [_secdgtable insertRowsAtIndexPaths:[NSArray arrayWithObject:pathFromDstTable] withRowAnimation:UITableViewRowAnimationMiddle];
            
           
            pathFromDstTable = nil;
        }
        if ([_existingstring isEqualToString:@"Employee already assigned to  some other jobs in some dates of this period"]) {
            [draggedCell removeFromSuperview];
          
            draggedCell = nil;
            
           
            draggedData = nil;
        }
        else
        {
            [UIView animateWithDuration:0.3 animations:^
             {
                 CGRect frame = _secdgtable.frame;
                
                 _secdgtable.frame = frame;
             }];
            
            [draggedCell removeFromSuperview];
          
            draggedCell = nil;
            
           
            draggedData = nil;
        }
    }
}






-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if ([alertView.message isEqualToString:@"Start date should be less than or equal to end date"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
            [dateFormat setDateFormat:@"MM/dd/YYYY"];
            
            _currentdatestring= [dateFormat stringFromDate:[NSDate date]];
            
            [_startdatebtn setTitle:_currentdatestring forState:UIControlStateNormal];
            [_enddatebtn setTitle:_currentdatestring forState:UIControlStateNormal];
            startdate=[NSDate date];
            enddate=[NSDate date];
            [self FillJRDetails];
            
        }
    }
    if ([alertView.message isEqualToString:@"Do you want to release this employee?"]) {
        
        
        
        if (buttonIndex==1) {
            [self ReleaseJobRefferals];
            [self FillJRDetails];
            
        }
    
    }
    if ([alertView.message isEqualToString:@"Employee already assigned to  some other jobs in some dates of this period"]) {
        
        
        
        if (buttonIndex==0) {
            [self FillEmployeesBasedonJobandDate];
             [self FillJRDetails];
            
        }
        
    }
    
   

}
@end
