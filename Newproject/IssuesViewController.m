//
//  IssuesViewController.m
//  Newproject
//
//  Created by Riya on 6/20/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "IssuesViewController.h"

@interface IssuesViewController ()

@end

@implementation IssuesViewController

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
    [self JobsSelect];
    // Do any additional setup after loading the view from its nib.
      self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _issuetable.rowHeight=60;
    _issuetable.layer.borderWidth=3.0;
    _issuetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _cmmnttable.rowHeight=60;
    _cmmnttable.layer.borderWidth=3.0;
    _cmmnttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;

//    _addview.layer.borderWidth=3.0;
//    _addview.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _statusarray=[[NSMutableArray alloc]initWithObjects:@"In Process",@"Closed" ,nil];
    _Typearray=[[NSMutableArray alloc]initWithObjects:@"Man Power",@"Equipment",@"Materials",@"Fleet",@"Third Party",@"Consumables",@"Small Tools",@"Other Company Assets",@"General" ,nil];
    [[self.cmmttxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.cmmttxtview layer] setBorderWidth:2];
    [[self.cmmttxtview layer] setCornerRadius:10];
    _typedict=[[NSMutableDictionary alloc]init];
    [_typedict setObject:@"MP" forKey:@"Man Power"];
     [_typedict setObject:@"EQ" forKey:@"Equipment"];
      [_typedict setObject:@"MT" forKey:@"Materials"];
      [_typedict setObject:@"FL" forKey:@"Fleet"];
    [_typedict setObject:@"TP" forKey:@"Third Party"];
     [_typedict setObject:@"CO" forKey:@"Consumables"];
       [_typedict setObject:@"ST" forKey:@"Small Tools"];
      [_typedict setObject:@"OC" forKey:@"Other Company Assets"];
     [_typedict setObject:@"GN" forKey:@"General"];
    
    NSArray*keyarray=[_typedict allKeys];
    NSArray*valuearray=[_typedict allValues];
    
    _revtypedict=[[NSMutableDictionary alloc]initWithObjects:keyarray forKeys:valuearray];
    
    /*searchbar*/
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate = (id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];

    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;
     self.issuetable.tableHeaderView =_searchbar;
    [[self.cmmntcelltxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.cmmntcelltxtview layer] setBorderWidth:2];
    [[self.cmmntcelltxtview layer] setCornerRadius:10];

    _newcmntview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self IssueManagementSelect];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    if(tableView==_popOverTableView){
        switch (poptype) {
            case 1:
                 return [_jobarray count];
                break;
            case 2:
                return [_statusarray count];
                break;
            case 3:
                return [_Typearray count];
                break;
           

            default:
                break;
        }
       
    }
   else if (tableView==_cmmnttable){
        return [_commentarray count];
    }

    else if (tableView==_issuetable){
    return [_Issuearray count];
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

         if(tableView==_issuetable){
         [[NSBundle mainBundle]loadNibNamed:@"IssueCell" owner:self options:nil];
         cell=_issuecell;
         }
        if(tableView==_cmmnttable){
            _cmmnttable.rowHeight=120;
            [[NSBundle mainBundle]loadNibNamed:@"Issuecommentcell" owner:self options:nil];
            cell=_cmntcell;
            
              [self.cmmnttable.layer setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
            
            
        }

        
    }
     if(tableView==_popOverTableView){
         switch (poptype) {
             case 1:
                   cell.textLabel.text=[_jobarray objectAtIndex:indexPath.row];
                 break;
             case 2:
                   cell.textLabel.text=[_statusarray objectAtIndex:indexPath.row];
                 break;
             case 3:
                  cell.textLabel.text=[_Typearray objectAtIndex:indexPath.row];
            
                 break;
            
             default:
                 break;
         }
     }
         if(tableView==_cmmnttable){
             commentmdl *cmnt1=(commentmdl *)[_commentarray objectAtIndex:indexPath.row];
             
             
             //                [[self.newcmmnttxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
             //                [[self.newcmmnttxtview layer] setBorderWidth:2];
             //                [[self.newcmmnttxtview layer] setCornerRadius:10];
             _cmmntcelltxtview=(UITextView *)[cell viewWithTag:1];
             

             _cmmntcelltxtview.text=cmnt1.comments;
             _cmntdatelbl=(UILabel *)[cell viewWithTag:2];
             NSArray*ary=[cmnt1.commentdate componentsSeparatedByString:@"T"];
             NSString*news=[ary objectAtIndex:0];
             NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
             [dateFormat setDateFormat:@"yyyy-MM-dd"];
             NSDate *dates = [dateFormat dateFromString:news];
             [dateFormat setDateFormat:@"MM-dd-yyy"];
             NSString *myFormattedDate = [dateFormat stringFromDate:dates];
             NSString *xstring=[[ary objectAtIndex:1] stringByReplacingOccurrencesOfString:@"-" withString:@"."];
             NSArray *tarray=[xstring componentsSeparatedByString:@"."];
             
             _cmntdatelbl.text=[NSString stringWithFormat:@"%@ %@",myFormattedDate,[tarray objectAtIndex:0]];


         }
     
     if(tableView==_issuetable){
    Issuemdl*issues=(Issuemdl *)[_Issuearray objectAtIndex:indexPath.row];
    _numbrlbl=(UILabel *)[cell viewWithTag:1];
    
    _numbrlbl.text=issues.jobnumbr;
  
    _datelbl=(UILabel *)[cell viewWithTag:2];
    _datelbl.text=issues.datetime;
    _typelbl=(UILabel *)[cell viewWithTag:3];
    _typelbl.text=issues.type;
    _cmmtlbl=(UILabel *)[cell viewWithTag:4];
    _cmmtlbl.text=issues.comments;
         _statuslbl=(UILabel *)[cell viewWithTag:5];
         _statuslbl.text=issues.status;
         if([issues.type isEqualToString:@"GN"]){
             _relatedtobtnlbl.enabled=NO;
             [_relatedtobtnlbl setTitle:@"General" forState:UIControlStateDisabled];
             
         }
         else{
             _relatedtobtnlbl.enabled=YES;
             [_relatedtobtnlbl setTitle:@"Related To" forState:UIControlStateDisabled];
             
         }

     }
    return cell;
    
    
}
#pragma mark-Tableview datasouce
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     if(tableView==_popOverTableView){
         switch (poptype) {
             case 1:
                 [_jobsitebtnlbl setTitle:[_jobarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                 break;
             case 2:
                [_statusbtnlbl setTitle:[_statusarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                 break;
             case 3:
                 [_typebtnlbl setTitle:[_Typearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
               
                 
                 break;
             
             default:
                 break;
         }

        
     }
    [self.popOverController dismissPopoverAnimated:YES];
  
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_issuetable)
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


#pragma mark-Web Service
-(void)IssueManagementSelect{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<IssueManagementSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</IssueManagementSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/IssueManagementSelect" forHTTPHeaderField:@"Soapaction"];
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
-(void)IssueManagementInsert{
    recordResults = FALSE;
//    NSArray*array=[_jobsitebtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
//    NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
//  
    _cmmttxtview.text=@"";
    NSString*type=[_typedict objectForKey:_typebtnlbl.titleLabel.text];
    NSString*datetime=[NSString stringWithFormat:@"%@ %@",_datebtnlbl.titleLabel.text,_timebtn.titleLabel.text];
    NSArray*array=[_jobsitebtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
    NSString*job=[NSString stringWithFormat:@"%@-%@", [array objectAtIndex:1], [array objectAtIndex:2]];
   
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<IssueManagementInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<IMJobNumber>%@</IMJobNumber>\n"
                   "<IMDateTime>%@</IMDateTime>\n"
                   "<IMType>%@</IMType>\n"
                   "<IMRelatedTo>%d</IMRelatedTo>\n"
                   "<IMComments>%@</IMComments>\n"
                   "<IMStatus>%@</IMStatus>\n"
                   "</IssueManagementInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",job,datetime,type,0,_cmmttxtview.text,@"Open"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/IssueManagementInsert" forHTTPHeaderField:@"Soapaction"];
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
-(void)IssueManagementUpdate{
    recordResults = FALSE;
     _cmmttxtview.text=@"";
    Issuemdl*ismdl=(Issuemdl*)[_Issuearray objectAtIndex:btnindex];
   // NSArray*array=[_jobsitebtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
   // NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
    
      NSString*datetime=[NSString stringWithFormat:@"%@ %@",_datebtnlbl.titleLabel.text,_timebtn.titleLabel.text];
    NSString*type=[_typedict objectForKey:_typebtnlbl.titleLabel.text];
    NSString *soapMessage;
    NSArray*array=[_jobsitebtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
     NSString*job=[NSString stringWithFormat:@"%@-%@", [array objectAtIndex:1], [array objectAtIndex:2]];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<IssueManagementUpdate xmlns=\"http://ios.kontract360.com/\">\n"
                    "<IMEntryId>%d</IMEntryId>\n"
                   "<IMJobNumber>%@</IMJobNumber>\n"
                   "<IMDateTime>%@</IMDateTime>\n"
                   "<IMType>%@</IMType>\n"
                   "<IMRelatedTo>%d</IMRelatedTo>\n"
                   "<IMComments>%@</IMComments>\n"
                   "<IMStatus>%@</IMStatus>\n"
                   "</IssueManagementUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[ismdl.entryid integerValue],job,datetime,type,0,_cmmttxtview.text,_statusbtnlbl.titleLabel.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/IssueManagementUpdate" forHTTPHeaderField:@"Soapaction"];
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
-(void)IssueManagementSearch{
    
    
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<IssueManagementSearch xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</IssueManagementSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/IssueManagementSearch" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)IssueManagementcommentselect{
    
    Issuemdl *issuemdl=(Issuemdl *)[_Issuearray objectAtIndex:btnindex];
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<IssueManagementcommentselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<IMMItemCode>%@</IMMItemCode>\n"
                   "</IssueManagementcommentselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",issuemdl.itemcode];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/IssueManagementcommentselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)IssueManagementCommentsInsert{
    Issuemdl *issuemdl=(Issuemdl *)[_Issuearray objectAtIndex:btnindex];
    recordResults = FALSE;
    NSDate*curntdate=[NSDate date];
    
    NSLog(@"%@",curntdate);
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"HH:mm:ss a"];
    NSLog(@"curntdate%@",[dateFormat stringFromDate:curntdate]);
    NSString*time=[dateFormat stringFromDate:curntdate];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString*date1=[dateFormat stringFromDate:curntdate];
    NSArray*array1=[time componentsSeparatedByString:@" "];
    NSString*newformat;
    if ([[array1 objectAtIndex:1] isEqualToString:@"PM"]) {
        NSArray*array2=[[array1 objectAtIndex:0]componentsSeparatedByString:@":"];
        NSInteger a=[[array2 objectAtIndex:0]integerValue];
        newformat=[NSString stringWithFormat:@"%d:%@:%@",a,[array2 objectAtIndex:1],[array2 objectAtIndex:2]];
        
        
        
        
    }
    else{
        
        NSArray*array2=[[array1 objectAtIndex:0]componentsSeparatedByString:@":"];
        newformat=[NSString stringWithFormat:@"%@:%@:%@",[array2 objectAtIndex:0],[array2 objectAtIndex:1],[array2 objectAtIndex:2]];
        
    }

    NSString*today=[NSString stringWithFormat:@"%@T%@",date1,newformat];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
   // NSString*usernameid = [defaults objectForKey:@"UserNameId"];
    
    NSString*newstrg=  [_cmmttxtview.text stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
    newstrg=  [newstrg stringByReplacingOccurrencesOfString:@"<" withString:@"&lt;"];
    newstrg=  [newstrg stringByReplacingOccurrencesOfString:@">" withString:@"&gt;"];
    newstrg=  [newstrg stringByReplacingOccurrencesOfString:@"'" withString:@"&#39;"];
    

  
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<IssueManagementCommentsInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<IMMItemCode>%@</IMMItemCode>\n"
                   "<IMMComments>%@</IMMComments>\n"
                  " <IMMDate>%@</IMMDate>\n"
                   "</IssueManagementCommentsInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",issuemdl.itemcode,newstrg,today];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/IssueManagementCommentsInsert" forHTTPHeaderField:@"Soapaction"];
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

-(void)IssueRelationFlag{
    
    Issuemdl *issuemdl=(Issuemdl *)[_Issuearray objectAtIndex:btnindex];
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<IssueRelationFlag xmlns=\"http://ios.kontract360.com/\">\n"
                   "<IMItemcode>%@</IMItemcode>\n"
                   "</IssueRelationFlag>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",issuemdl.itemcode];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/IssueRelationFlag" forHTTPHeaderField:@"Soapaction"];
    
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
    if (webtype==4) {
    
        [_cmmnttable reloadData];
        webtype=0;
    }
    else{
        [_issuetable reloadData];
        [_popOverTableView reloadData];
    }
    
  
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"IssueManagementSelectResponse"])
    {
        _Issuearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMEntryId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMItemCode"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMJobNumber"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMDateTime"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"IMType"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMRelatedTo"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"IMComments"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMStatus"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobsSelectResponse"])
    {
        _jobarray=[[NSMutableArray alloc]init];
        _jobdict=[[NSMutableDictionary alloc]init];
        _revjobdict=[[NSMutableDictionary alloc]init];
        _skilldict=[[NSMutableDictionary alloc]init];
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
    if([elementName isEqualToString:@"JobSiteName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobSkillId"])
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

    if([elementName isEqualToString:@"result"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
   
    if([elementName isEqualToString:@"IssueManagementSearchResponse"])
    {  _Issuearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IssueManagementcommentselectResponse"])
    {_commentarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"IMCEntryId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMMItemCode"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMMComments"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMMDate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IssueManagementCommentsInsertResponse"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"IssueRelationFlagResponse"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Column1"])
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
    if([elementName isEqualToString:@"IMEntryId"])
    {
        
        
        _issuemdl=[[Issuemdl alloc]init];
        recordResults = FALSE;
        _issuemdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"IMItemCode"])
    {
        
        
        recordResults = FALSE;
        _issuemdl.itemcode=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"IMJobNumber"])
    {
        
        
        recordResults = FALSE;
        _issuemdl.jobnumbr=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"IMDateTime"])
    {
        
        
        recordResults = FALSE;
//        NSArray *dateArray=[[NSArray alloc]init];
//        dateArray=[_soapResults componentsSeparatedByString:@" "];
//        NSString *date1 =[dateArray objectAtIndex:0];
//        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//        [dateFormat setDateFormat:@"yyyy-MM-dd"];
//        NSDate *dates = [dateFormat dateFromString:date1];
//        [dateFormat setDateFormat:@"MM-dd-yyy"];
//        NSString *myFormattedDate = [dateFormat stringFromDate:dates];

         _issuemdl.datetime=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"IMType"])
    {
        
        
        recordResults = FALSE;
        _issuemdl.type=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"IMRelatedTo"])
    {
        
        recordResults = FALSE;
        
        
       _issuemdl.relatedto=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"IMComments"])
    {
        
        
        recordResults = FALSE;
        _issuemdl.comments=_soapResults;
        

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"IMStatus"])
    {
        
        
        recordResults = FALSE;
        _issuemdl.status=_soapResults;
        [_Issuearray addObject:_issuemdl];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"id"])
    {
        
        
        recordResults = FALSE;
        
       _soapResults = nil;
    }

    if([elementName isEqualToString:@"JobNumber"])
    {
        recordResults = FALSE;
        jobnumber=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        recordResults = FALSE;
       // [_jobarray addObject:[NSString stringWithFormat:@"%@-%@",jobnumber,_soapResults]];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobSiteName"])
    {
        recordResults = FALSE;
        jobsitename=_soapResults;
        [_jobdict setObject:jobnumber forKey:_soapResults];
        [_revjobdict setObject:_soapResults forKey:jobnumber];
      
       // [_jobarray addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobSkillId"])
    {
        recordResults = FALSE;
          _soapResults = nil;
    }
    if([elementName isEqualToString:@"SkillName"])
    {
        recordResults = FALSE;
         [_jobarray addObject:[NSString stringWithFormat:@"%@-%@-%@",jobsitename,jobnumber,_soapResults]];
        [_skilldict setObject:_soapResults forKey:jobnumber];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"result"])
    {
         recordResults = FALSE;
        if ([resultstring isEqualToString:@"Comment"]) {
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
//            _savecmntbtn.enabled=YES;
//            _newcmntview.hidden=YES;
//            webtype=4;
//            [self IssueManagementcommentselect];
           
        }
        else
        {
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        _updatebtnlbl.enabled=YES;
            [_jobsitebtnlbl setTitle:@"Select Job Site" forState:UIControlStateNormal];
            [_typebtnlbl setTitle:@"Select Type" forState:UIControlStateNormal];
             [_datebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
               [_timebtn setTitle:@"Select" forState:UIControlStateNormal];
            
        
        [self IssueManagementSelect];
        }
         _soapResults = nil;
    }
    if([elementName isEqualToString:@"IMCEntryId"])
    {
        recordResults = FALSE;
        _cmntmdl1=[[commentmdl alloc]init];
        _cmntmdl1.commentId=[_soapResults integerValue];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"IMMItemCode"])
    {
        recordResults = FALSE;
        _cmntmdl1.commentcode=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"IMMComments"])
    {
        recordResults = FALSE;
         _cmntmdl1.comments=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"IMMDate"])
    {
        recordResults = FALSE;
         _cmntmdl1.commentdate=_soapResults;
        [_commentarray addObject:_cmntmdl1];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"Column1"])
    {
         recordResults = FALSE;
        issuerelatnflag=[_soapResults integerValue];
        if([statustype isEqualToString:@"Closed"]){
            _statusbtnlbl.enabled=NO;
            _datebtnlbl.enabled=NO;
            _timebtn.enabled=NO;
        }
        else{
            _statusbtnlbl.enabled=YES;
            //_datebtnlbl.enabled=YES;
            // _timebtn.enabled=YES;
            if(issuerelatnflag==0){
                _datebtnlbl.enabled=YES;
                _timebtn.enabled=YES;
                
            }
            else{
                _datebtnlbl.enabled=NO;
                _timebtn.enabled=NO;
            }
            
            
        }

              _soapResults = nil;
    }


}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if ([alertView.message isEqualToString:@"Inserted Successfully"]) {
        if ([resultstring isEqualToString:@"Comment"]) {
        _savecmntbtn.enabled=YES;
        _newcmntview.hidden=YES;
            _cmmttxtview.text=@"";
        webtype=4;
        [self IssueManagementcommentselect];
            resultstring=@"";
}
    
    }
    if ([alertView.message isEqualToString:@"Updated Successfully"]) {
        _addview.hidden=YES;
        
    }
}

#pragma mark-Popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 220, 200)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 220, 200)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(220, 200);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popOverController.popoverContentSize=CGSizeMake(220.0f, 220.0f);
    self.popOverController=_popOverController;
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    switch (poptype) {

    case 1:
                [self.popOverController presentPopoverFromRect:_jobsitebtnlbl.frame
                                                    inView:self.addview
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            break;
            
            
    
        case 2:
            [self.popOverController presentPopoverFromRect:_statusbtnlbl.frame
                                                    inView:self.addview
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            break;

        case 3:
            [self.popOverController presentPopoverFromRect:_typebtnlbl.frame
                                                    inView:self.addview
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            break;
            

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
    calendar.maximumDate = [self.dateFormatter dateFromString:@"1/07/2050"];
    calendar.shouldFillCalendar = YES;
    calendar.adaptHeightToNumberOfWeeksInMonth = NO;
    
    calendar.frame = CGRectMake(10, 10, 300, 320);
    [popoverView addSubview:calendar];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
    
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popOverController.popoverContentSize=CGSizeMake(320.0f, 340.0f);
    self.popOverController=_popOverController;
    [self.popOverController presentPopoverFromRect:_datebtnlbl.frame
                                            inView:self.addview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
}



- (void)localeDidChange {
    [self.calendar setLocale:[NSLocale currentLocale]];
}



#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    
    NSString *dateString = [dateFormat stringFromDate:date];
[_datebtnlbl setTitle:dateString forState:UIControlStateNormal];
   // _datetxtfld.text=dateString;
    [self.popOverController dismissPopoverAnimated:YES];
}

#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    [self IssueManagementSearch];
    [searchBar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self IssueManagementSelect];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_searchbar.text length]==0) {
        
        [self IssueManagementSelect];
        // [searchBar resignFirstResponder];
        
        
    }
    //[searchBar resignFirstResponder];
    
    
}


#pragma mark-picker method
-(void)dateChanged1{
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *currentTime = [dateFormatter stringFromDate:timePick.date];
    NSLog(@"%@", currentTime);
   
    [_timebtn setTitle:currentTime forState:UIControlStateNormal];
    
}

#pragma mark-Button Action
- (IBAction)datebtn:(id)sender {
    [self createCalenderPopover];
}

- (IBAction)tymbtn:(id)sender {
    // _datepicker.hidden=NO;
    UIViewController *viewCon = [[UIViewController alloc] init];
    timePick = [[UIDatePicker alloc]initWithFrame:CGRectMake(5, 0, 0, 0)];
    timePick.datePickerMode =UIDatePickerModeTime;
    [timePick addTarget:self action:@selector(dateChanged1) forControlEvents:UIControlEventValueChanged];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm dd MMM yyyy"];
    [viewCon.view addSubview:timePick];
    viewCon.preferredContentSize = timePick.bounds.size ; // Set the content size
    
    _popOverController = [[UIPopoverController alloc] initWithContentViewController:viewCon];
    
    
    [_popOverController presentPopoverFromRect:_timebtn.frame
                                        inView:self.addview
                      permittedArrowDirections:UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown
                                      animated:YES];

}

- (IBAction)jobsitebtn:(id)sender {
    poptype=1;
    [self createpopover];
    [self JobsSelect];
}

- (IBAction)typebtn:(id)sender {
    poptype=3;
    [self createpopover];
    [_popOverTableView reloadData];
  }

- (IBAction)addbtn:(id)sender {
    btntype=1;
    
     //[_statusbtnlbl setTitle:[_statusarray objectAtIndex:0] forState:UIControlStateNormal];
     _statusbtnlbl.enabled=NO;
     _addview.hidden=NO;
      _cancelbtnlbl.enabled=YES;
    _jobsitebtnlbl.enabled=YES;
    _typebtnlbl.enabled=YES;
    _datetxtfld.enabled=YES;
    _timebtn.enabled=YES;
    _datebtnlbl.enabled=YES;
    
    
}

- (IBAction)deletebtn:(id)sender {
}

- (IBAction)editbtn:(id)sender {
    _navtitle.title=@"Edit";
    _cancelbtnlbl.enabled=NO;
   
    _cancelbtnlbl.titleLabel.textColor=[UIColor grayColor];
     btntype=2;
    _addview.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.issuetable];
    NSIndexPath *textFieldIndexPath = [self.issuetable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    Issuemdl*ismdl=(Issuemdl*)[_Issuearray objectAtIndex:textFieldIndexPath.row];
    //[_jobsitebtnlbl setTitle:[_revjobdict objectForKey:ismdl.jobnumbr] forState:UIControlStateNormal];
    _jobsitebtnlbl.enabled=NO;
    _typebtnlbl.enabled=NO;
    [self IssueRelationFlag];
    
    NSString*jobtxt=[NSString stringWithFormat:@"%@-%@-%@",[_revjobdict objectForKey:ismdl.jobnumbr],ismdl.jobnumbr,[_skilldict objectForKey:ismdl.jobnumbr]];
    
    [_jobsitebtnlbl setTitle:jobtxt forState:UIControlStateNormal];
    [_typebtnlbl setTitle:[_revtypedict objectForKey:ismdl.type]forState:UIControlStateNormal];
    
    
     [_statusbtnlbl setTitle:ismdl.status forState:UIControlStateNormal];
    _cmmttxtview.text=ismdl.comments;
    
    NSArray*arry=[ismdl.datetime componentsSeparatedByString:@" "];
     [_datebtnlbl setTitle:[arry objectAtIndex:0] forState:UIControlStateNormal];
  
    [_timebtn setTitle:  [NSString stringWithFormat:@"%@ %@",[arry objectAtIndex:1],[arry objectAtIndex:2]] forState:UIControlStateNormal];

    //_datetxtfld.text=ismdl.datetime;
    statustype=ismdl.status;
    
    
 

}

- (IBAction)addclsebtn:(id)sender {
    _updatebtnlbl.enabled=YES;
       _navtitle.title=@"Create";
    _cancelbtnlbl.enabled=YES;
    _cancelbtnlbl.titleLabel.textColor=[UIColor colorWithRed:0/255.0f green:122.0/255.0f blue:255.0/255.0f alpha:1.0f];
     _addview.hidden=YES;
    [_jobsitebtnlbl setTitle:@"Select Job Site" forState:UIControlStateNormal];
    [_typebtnlbl setTitle:@"Select Type" forState:UIControlStateNormal];
    [_statusbtnlbl setTitle:@"Select Status" forState:UIControlStateNormal];
    [_datebtnlbl setTitle:@"Select" forState:UIControlStateNormal];

    [_timebtn setTitle:@"Select" forState:UIControlStateNormal];

    
    _cmmttxtview.text=@"";
    _datetxtfld.text=@"";
   }

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)savebtn:(id)sender {
    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    
    if (rightsmodel.EditModule==0) {
        if (btntype==1) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to add a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }else if(btntype==2)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to edit this record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }
    else
    {

    if ([_jobsitebtnlbl.titleLabel.text isEqualToString:@"Select Job Site"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Jobsite is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_typebtnlbl.titleLabel.text isEqualToString:@"Select Type"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Type is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
//    else if([_statusbtnlbl.titleLabel.text isEqualToString:@"Select Status"])
//    {
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Status is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
//    }
    else if([_datebtnlbl.titleLabel.text isEqualToString:@"Select"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Date is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_timebtn.titleLabel.text isEqualToString:@"Select"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Time is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        _updatebtnlbl.enabled=NO;

    if (btntype==1) {
         [self IssueManagementInsert];
    }
    if (btntype==2) {
        if([statustype isEqualToString:@"Closed"]){
            
            _addview.hidden=YES;
        }
        else{
            [self IssueManagementUpdate];
        }
        
    }
    }
    }
}

- (IBAction)cancelbtn:(id)sender {
    
    
}

- (IBAction)statusbtn:(id)sender {
    poptype=2;
    [self createpopover];
    [_popOverTableView reloadData];

}

- (IBAction)relatedtobtn:(id)sender {
    
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.issuetable];
    NSIndexPath *textFieldIndexPath = [self.issuetable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    Issuemdl*ismdl=(Issuemdl*)[_Issuearray objectAtIndex:textFieldIndexPath.row];


   // if (!_relatedtoVCtrl) {
        _relatedtoVCtrl=[[RelatedtoViewController alloc]initWithNibName:@"RelatedtoViewController" bundle:nil];
   // }
    _relatedtoVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _relatedtoVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    _relatedtoVCtrl.itemcode=ismdl.itemcode;
    _relatedtoVCtrl.jobnumber=ismdl.jobnumbr;
    _relatedtoVCtrl.type=ismdl.type;
    _relatedtoVCtrl.issueid=ismdl.entryid;
    _relatedtoVCtrl.status=ismdl.status;
    [self presentViewController:_relatedtoVCtrl
                       animated:YES completion:NULL];

}
- (IBAction)cmntbtn:(id)sender {
   // poptype=4;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.issuetable];
    NSIndexPath *textFieldIndexPath = [self.issuetable indexPathForRowAtPoint:rootViewPoint];
    
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
     Issuemdl*ismdl=(Issuemdl*)[_Issuearray objectAtIndex:textFieldIndexPath.row];
    _issueid=ismdl.entryid;
    statustype=ismdl.status;
    [self IssueManagementcommentselect];
    [self commentpopover];
    
   
    
   
   
}
-(void)commentpopover{
    webtype=4;
    _newcmntview.hidden=YES;
    _cmmnttable.rowHeight=120;
   // poptype=4;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 520, 530)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    
    
    [popoverView addSubview:self.cmmntview];
    self.cmmntview.hidden=NO;
    // CGRect rect = frame;
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(520, 530);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    self.popOverController.popoverContentSize=CGSizeMake(520.0f, 530.0f);
    self.popOverController=_popOverController;
    
    
    [self.popOverController presentPopoverFromRect: CGRectMake(350, 210, 300, 500)
                                            inView:self.view
                          permittedArrowDirections:nil
                                          animated:YES];
    
    
    
}

- (IBAction)closecmnt:(id)sender
{
    [self.popOverController dismissPopoverAnimated:YES];
}
- (IBAction)addcmt:(id)sender
{
    
    if([statustype isEqualToString:@"Closed"]){
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Already Closed issue" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        
    
    _cmmttxtview.text=@"";
    _savecmntbtn.enabled=YES;
    _newcmntview.hidden=NO;
    }
    

}
- (IBAction)cmntsavebtn:(id)sender
{
    if ([_cmmttxtview.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Comment is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        resultstring=@"Comment";
    [self IssueManagementCommentsInsert];
        _savecmntbtn.enabled=NO;
    }
}
- (IBAction)cancelcmnt:(id)sender
{
    _newcmntview.hidden=YES;
}


@end
