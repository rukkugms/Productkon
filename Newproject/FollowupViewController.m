//
//  FollowupViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/17/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "FollowupViewController.h"

@interface FollowupViewController ()

@end

@implementation FollowupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=NSLocalizedString(@"Follow Up", @"Follow Up");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    
    
    _SearchingBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _SearchingBar.delegate = (id)self;
    _SearchingBar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    //searchBar.tintColor=[UIColor cyanColor];
    self.followuptable.tableHeaderView =_SearchingBar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_SearchingBar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;

    _view1.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:251.0/255.0f alpha:1.0f];
    _scrollview.frame=CGRectMake(0, 0,1004, 768);
    [_scrollview setContentSize:CGSizeMake(1004,850)];
    //_view1.backgroundColor=[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f];
    
    
    
    _followuptable.layer.borderWidth = 2.0;
    _followuptable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _followuptable.separatorColor=[UIColor colorWithRed:219.0/255.0f green:236.0/255.0f blue:244.0/255.0f alpha:1.0f];
      _navigationbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
     _btnArray=[[NSMutableArray alloc]initWithObjects:@"New FollowUP",@"Edit FollowUP",@"Delete FollowUP" ,nil];
    _communctiontypeArray=[[NSMutableArray alloc]initWithObjects:@"Email Follow UP",@"Phone Follow UP",@"Launch Appointment",@"Golf Game", nil];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getActivityFollowup];
    
    
    UIBarButtonItem*addbtn=[[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addaction)];
    UIBarButtonItem*editbtn=[[UIBarButtonItem alloc]initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(editaction)];
    NSArray*barbutns=[[NSArray alloc]initWithObjects:addbtn,editbtn, nil];
    [self.navigationItem setRightBarButtonItems:barbutns animated:YES];
    
}
-(void)editaction{
    
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_followuptable setEditing:NO animated:NO];
        [_followuptable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_followuptable setEditing:YES animated:YES];
        [_followuptable reloadData];
        
        
        
        
    }
}




-(void)butnaction{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"EDIT"
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:nil];
    for (NSString *actionString in self.btnArray) {
        [actionSheet addButtonWithTitle:actionString];
    }
    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
    [actionSheet showInView:self.view];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if  ([buttonTitle isEqualToString:@"Edit Leads"]) {
        NSLog(@"Destructive pressed --> Delete Something");
    }
    if ([buttonTitle isEqualToString:@"New FollowUP"]) {
       _view2 .hidden=NO;
        // self.leadTable.userInteractionEnabled=NO;
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    if(tableView==_popOverTableView) {
       
                return [_communctiontypeArray count];
             
        
        
    }
    else if(tableView==_followuptable) {
    
        return [_FollowupArray count];
    }
    if (tableView==_cmttable) {
        return [_CommentsArray count];
    }

        return YES;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"FollowupCell" owner:self options:nil];
        cell=_followcell;
        
        if (tableView==_cmttable) {
            [[NSBundle mainBundle]loadNibNamed:@"FollowCommentcell" owner:self options:nil];
            
            cell=_cmtcell;
            
        }
        

    }
    //cell.textLabel.text=@"Customer Name";
    if(tableView==_popOverTableView)
    {
     cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
    cell.textLabel.font = [UIFont systemFontOfSize:12.0];
     cell.textLabel.text=[_communctiontypeArray objectAtIndex:indexPath.row];
    }
    if(tableView==_followuptable){
        followupmodel*follwmdl1=(followupmodel *)[_FollowupArray objectAtIndex:indexPath.row];
        _summarylbl=(UILabel*)[cell viewWithTag:1];
        _summarylbl.text=follwmdl1.headline;
        _OrgContact=(UILabel*)[cell viewWithTag:2];
        _OrgContact.text=_followupmdl.OrgContact;
        _cmtunictntype=(UILabel*)[cell viewWithTag:3];
        _cmtunictntype.text=follwmdl1.Communicationtype;
        _datecontact=(UILabel*)[cell viewWithTag:4];
        
        
        NSArray *dateArray=[[NSArray alloc]init];
        dateArray=[follwmdl1.DateContact componentsSeparatedByString:@"T"];
        NSString *date1 =[dateArray objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];

        _datecontact.text=myFormattedDate;
        
    }
    
    
    
      if (tableView==_cmttable) {
          commentmdl*cmtmdl=(commentmdl *)[_CommentsArray  objectAtIndex:indexPath.row];
          
          _commentlbl=(UILabel*)[cell viewWithTag:1];
          _commentlbl.text=cmtmdl.comments;
          _titilelbl=(UILabel*)[cell viewWithTag:2];
          _titilelbl.text=cmtmdl.commentdate;

      }
    return cell;
    
    
}


#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_popOverTableView)
    {
        [_communictntypeBtn setTitle:[_communctiontypeArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView==_followuptable)
    {
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        
    }else
    {
        
        //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
        [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]
];
        
    }
    }
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        _Path=indexPath;
        
        [self DeleteFollowup];
        [_FollowupArray removeObject:indexPath];
        
        
        
        [self getActivityFollowup];
        
        
    }
    
}


#pragma mark -Button
-(void)addaction {
    
    butnidtfr=1;
    //_view2.hidden=NO;
    _view2.frame = CGRectMake(510, 346, 0, 0);
    //    CGPoint origin = _hidenview.frame.origin;
    [UIView animateWithDuration: 1.0f animations:^{
        _view2.frame = CGRectMake(195, 60, 744, 486);
        //        _hidenview.center = origin;
        _view2.alpha = 1.0;
        
    }];

}
- (IBAction)closebtn:(id)sender {
    _view2.frame = CGRectMake(195, 60, 744, 486);
    //    CGPoint origin = _hidenview.frame.origin;
    [UIView animateWithDuration: 1.0f animations:^{
        _view2.frame = CGRectMake(510, 346, 0, 0);
        //        _hidenview.center = origin;
        _view2.alpha = 0;
        
    }];
       butnidtfr=0;

    
    
}

-(IBAction)selectCommunicationType:(id)sender
{
    [self createPopover];
}

- (IBAction)updatebtn:(id)sender {
    if (butnidtfr==1) {
        [self Addfollowup];
        
    }
    else{
       // [self updatelead];
        
    }
    
    [self getActivityFollowup];

    
}

- (IBAction)cancelbtn:(id)sender {
}

- (IBAction)disclurebtn:(id)sender {
    poptype=2;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 531, 544)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    
    
    [popoverView addSubview:self.commentview];
    self.commentview.hidden=NO;
    // CGRect rect = frame;
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(531, 544);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
      UIButton *button=(UIButton *)nil;
        UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
        UITableView *table = (UITableView *)[cell superview];
       NSIndexPath *IndexPath = [table indexPathForCell:cell];
    _Path=IndexPath;
    
    
    
    [self.popOverController presentPopoverFromRect: CGRectMake(380, 120, 300, 500)                                        inView:self.view
                          permittedArrowDirections:nil
                                          animated:YES];
    
    
    
    [self FollowupCommentsList];
    

    
    
}

- (IBAction)editcellbtn:(id)sender
{
    _view2.frame = CGRectMake(510, 346, 0, 0);
    //    CGPoint origin = _hidenview.frame.origin;
    [UIView animateWithDuration: 1.0f animations:^{
        _view2.frame = CGRectMake(195, 60, 744, 486);
        //        _hidenview.center = origin;
        _view2.alpha = 1.0;
        
    }];

    UIButton *button = (UIButton *)sender;
    
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    UITableView *table = (UITableView *)[cell superview];
    _Path = [table indexPathForCell:cell];
    
    NSLog(@"indexpath%d",_Path.row);
    
    followupmodel*follwmdl2=(followupmodel*)[_FollowupArray objectAtIndex:_Path.row];
    _summarytxtfld.text=follwmdl2.headline;
    _contacttxtfld.text=follwmdl2.OrgContact;
    [_communictntypeBtn setTitle:follwmdl2.Communicationtype forState:UIControlStateNormal];
    
    NSArray *dateArray=[[NSArray alloc]init];
    dateArray=[follwmdl2.DateContact componentsSeparatedByString:@"T"];
    NSString *date1 =[dateArray objectAtIndex:0];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *dates = [dateFormat dateFromString:date1];
    [dateFormat setDateFormat:@"MM-dd-yyy"];
    NSString *myFormattedDate = [dateFormat stringFromDate:dates];
    
    [_dateBtn setTitle:myFormattedDate forState:UIControlStateNormal];
    _cmuntntimetxtfld.text=follwmdl2.TimeContact;
    _detailtxtview.text=follwmdl2.Summary;
    

    
    
    
}

- (IBAction)namebtn:(id)sender {
    NSLog(@"Name.......");
}


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
    self.calendar = calendar;
    calendar.delegate = self;
    
    
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
    calendar.maximumDate = [self.dateFormatter dateFromString:@"1/07/2013"];
    calendar.shouldFillCalendar = YES;
    calendar.adaptHeightToNumberOfWeeksInMonth = NO;
    
    calendar.frame = CGRectMake(10, 10, 300, 320);
    [popoverView addSubview:calendar];
    
    //    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(calendar.frame) + 4, self.view.bounds.size.width, 24)];
    //    [self.view addSubview:self.dateLabel];
    
    //  self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
    
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_dateBtn.frame
                                            inView:self.view2
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
}
//     if([_datecheckstring isEqualToString:@"iphone"])
//     {
//         [self.popOverController presentPopoverFromRect:_dateiphonebtn.frame
//                                                 inView:self.view
//                               permittedArrowDirections:UIPopoverArrowDirectionUp
//                                               animated:YES];






- (IBAction)Addcmtbtn:(id)sender {
    _composecmtview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    _composecmtview.hidden=NO;
    
    //   _composecmtview.frame = CGRectMake(512, 384, 0, 0);
    //    //    CGPoint origin = _hidenview.frame.origin;
    //    [UIView animateWithDuration: 1.0f animations:^{
    //      _composecmtview.frame = CGRectMake(195, 60, 431, 233);
    //        //        _hidenview.center = origin;
    //      _composecmtview.alpha = 1.0;
    //
    //    }];
    
}

- (IBAction)savecmtbtn:(id)sender {
    butnidtfr=3;
   [self SaveFollowUpComment];
    
    
}

- (IBAction)cancelcmtbtn:(id)sender {
    _cmttxtbox.text=@"";
    butnidtfr=0;
    _composecmtview.hidden=YES;
    
}



- (void)localeDidChange {
    [self.calendar setLocale:[NSLocale currentLocale]];
}



#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MM/dd/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:date];
    [_dateBtn setTitle:dateString forState:UIControlStateNormal];
    
}
-(IBAction)selectDate:(id)sender
{
    [self createCalenderPopover];
}

-(void)createPopover
{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorColor=[UIColor cyanColor];
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
            [self.popOverController presentPopoverFromRect:_communictntypeBtn.frame
                                                inView:self.view2
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
        
        
 
}

#pragma mark - web service
/*arvinices*/

-(void)getActivityFollowup{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetActivityFollowup xmlns=\"http://arvin.kontract360.com/\">\n"
                     "<activityid>%d</activityid>\n"
                   "</GetActivityFollowup>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_ActivityId];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/GetActivityFollowup" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)Addfollowup{
   


    
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat: @"MM/dd/yyyy"];
    
    NSDate *dateString = [dateFormat dateFromString:_dateBtn.titleLabel.text];
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc]init];
    [dateFormat1 setDateFormat:@"yyyy-MM-dd"];
    NSString* sqldate=[dateFormat1 stringFromDate:dateString];

    
    recordResults = FALSE;
    NSString *soapMessage;
  
    NSInteger leadlink=0;
    NSInteger followupID=0;
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SaveFollowup xmlns=\"http://arvin.kontract360.com/\">\n"
                   "<HeadLine>%@</HeadLine>\n"
                   "<LeadLink>%d</LeadLink>\n"
                   "<OrgContact>%@</OrgContact>\n"
                   "<CommunicationType>%@</CommunicationType>\n"
                   "<DateContact>%@</DateContact>\n"
                   "<TimeContact>%@</TimeContact>\n"
                   "<Summary>%@</Summary>\n"
                   "<activityId>%d</activityId>\n"
                   "<followupid>%d</followupid>\n"
                   "</SaveFollowup>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_summarytxtfld.text,leadlink,_contacttxtfld.text,_communictntypeBtn.titleLabel.text,sqldate,_cmuntntimetxtfld.text,_detailtxtview.text
                   ,_ActivityId,followupID];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/SaveFollowup" forHTTPHeaderField:@"Soapaction"];
    
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


-(void)Updatefollowup{
    recordResults = FALSE;
    NSString *soapMessage;
    
     NSInteger leadlink=0;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat: @"MM/dd/yyyy"];
    
    NSDate *dateString = [dateFormat dateFromString:_dateBtn.titleLabel.text];
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc]init];
    [dateFormat1 setDateFormat:@"yyyy-MM-dd"];
    NSString* sqldate=[dateFormat1 stringFromDate:dateString];
    


 followupmodel*follwmdl2=(followupmodel*)[_FollowupArray objectAtIndex:_Path.row];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SaveFollowup xmlns=\"http://arvin.kontract360.com/\">\n"
                   "<HeadLine>%@</HeadLine>\n"
                   "<LeadLink>%d</LeadLink>\n"
                   "<OrgContact>%@</OrgContact>\n"
                   "<CommunicationType>%@</CommunicationType>\n"
                   "<DateContact>%@</DateContact>\n"
                   "<TimeContact>%@</TimeContact>\n"
                   "<Summary>%@</Summary>\n"
                   "<activityId>%d</activityId>\n"
                   "<followupid>%d</followupid>\n"
                   "</SaveFollowup>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_summarytxtfld.text,leadlink,_contacttxtfld.text,_communictntypeBtn.titleLabel.text,sqldate,_cmuntntimetxtfld.text,_detailtxtview.text
                   ,_ActivityId,follwmdl2.ComId];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/SaveFollowup" forHTTPHeaderField:@"Soapaction"];
    
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


-(void)DeleteFollowup{
    
    recordResults = FALSE;
    NSString *soapMessage;
      followupmodel*follwmdl1=(followupmodel *)[_FollowupArray objectAtIndex:_Path.row];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DeleteFollowup xmlns=\"http://arvin.kontract360.com/\">\n"
                   "<followupid>%d</followupid>\n"
                   "</DeleteFollowup>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",follwmdl1.ComId];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/DeleteFollowup" forHTTPHeaderField:@"Soapaction"];
    
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



-(void)FollowupCommentsList{
    recordResults = FALSE;
    NSString *soapMessage;
      followupmodel*follwmdl1=(followupmodel *)[_FollowupArray objectAtIndex:_Path.row];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FollowupCommentsList xmlns=\"http://arvin.kontract360.com/\">\n"
                   "<followupid>%d</followupid>\n"
                   
                   "</FollowupCommentsList>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",follwmdl1.ComId];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/FollowupCommentsList" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SaveFollowUpComment{
    
    
    NSDate*curntdate=[NSDate date];
    NSLog(@"%@",curntdate);
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"HH:mm:ss a"];
    NSLog(@"curntdate%@",[dateFormat stringFromDate:curntdate]);
    NSString*time=[dateFormat stringFromDate:curntdate];
    [dateFormat setDateFormat:@"MM/dd/ yyyy"];
    NSString*date1=[dateFormat stringFromDate:curntdate];
    NSString*today=[NSString stringWithFormat:@"%@ %@",date1,time];
    recordResults = FALSE;
    NSString *soapMessage;
    NSInteger userid=100;
    followupmodel*follwmdl1=(followupmodel *)[_FollowupArray objectAtIndex:_Path.row];

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SaveFollowUpComment xmlns=\"http://arvin.kontract360.com/\">\n"
                   "<FollowUpId>%d</FollowUpId>\n"
                   "<Comments>%@</Comments>\n"
                   "<UserId>%d</UserId>\n"
                   "<CommentDate>%@</CommentDate>\n"
                   "</SaveFollowUpComment>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",follwmdl1.ComId,_cmttxtbox.text,userid,today];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/SaveFollowUpComment" forHTTPHeaderField:@"Soapaction"];
    
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
    [_followuptable reloadData];
    [_cmttable reloadData];
    if (butnidtfr==3) {
        [self FollowupCommentsList];
    }
    
}


#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"GetActivityFollowupResponse"])
    {
        _FollowupArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ComId"])
    {
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"HeadLine"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LeadLink"])
    {
               if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"OrgContact"])
    {
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"DateContact"])
    {
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    

    if([elementName isEqualToString:@"TimeContact"])
    {
               if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    

    
    if([elementName isEqualToString:@"Summary"])
    {
      
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"activityId"])
    {
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CommunicationType"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;

    }
    
    if([elementName isEqualToString:@"SaveFollowupResult"])
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
    
    
    
    if([elementName isEqualToString:@"DeleteFollowupResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    

    if([elementName isEqualToString:@"msg"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    

    if([elementName isEqualToString:@"FollowupCommentsListResult"])
    {
        _CommentsArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Comments"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"CommentDate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"UserId"])
    {
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
    
    
    if([elementName isEqualToString:@"ComId"])
    {
        _followupmdl=[[followupmodel alloc]init];
        recordResults = FALSE;
        _followupmdl.ComId=[_soapResults integerValue];
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"HeadLine"])
    {
        recordResults = FALSE;
        _followupmdl.headline=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"LeadLink"])
    {
        recordResults = FALSE;
        _followupmdl.LeadLink=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"OrgContact"])
    {
        recordResults = FALSE;
        _followupmdl.OrgContact=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"DateContact"])
    {
        recordResults = FALSE;
        _followupmdl.DateContact=_soapResults;
        _soapResults = nil;

    }
    
    
    
    if([elementName isEqualToString:@"TimeContact"])
    {
        recordResults = FALSE;
        _followupmdl.TimeContact=_soapResults;
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"CommunicationType"])
    {
        recordResults = FALSE;
        _followupmdl.Communicationtype=_soapResults;
              _soapResults = nil;
    }

    
    if([elementName isEqualToString:@"Summary"])
    {
        recordResults = FALSE;
        _followupmdl.Summary=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"activityId"])
    {
        recordResults = FALSE;
        _followupmdl.activityId=[_soapResults integerValue] ;
        [_FollowupArray addObject:_followupmdl];
        _soapResults = nil;
    }
    
  
    


if([elementName isEqualToString:@"result"]){

     recordResults = FALSE;
    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
         _soapResults = nil;
}


    
    if([elementName isEqualToString:@"msg"])
    {
        recordResults = FALSE;
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        _soapResults = nil;

        
    }
    if([elementName isEqualToString:@"Comments"])
    {
        recordResults = FALSE;
        _cmtmdl.comments=_soapResults;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"CommentDate"])
    {
        recordResults = FALSE;
        _cmtmdl.commentdate=_soapResults;
        [_CommentsArray addObject:_cmtmdl];
        
        _soapResults = nil;    }
    
    
    if([elementName isEqualToString:@"UserId"])
    {
        recordResults = FALSE;
        _cmtmdl.userid=[_soapResults integerValue];
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"commentId"])
    {
        _cmtmdl=[[commentmdl alloc]init];
        recordResults = FALSE;
        _cmtmdl.commentId=[_soapResults integerValue];
        
        _soapResults = nil;
    }
    
    


}






@end
