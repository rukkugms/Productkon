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
    _updatebtn.enabled=YES;
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
    [self Employeeselect];

    _cancelbtnlbl.enabled=NO;
    _updatebtn.enabled=YES;
    _salesRepTable.userInteractionEnabled=NO;
   // [_salesRepTable setEditing:NO animated:NO];
      [_cancelbtnlbl setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
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
    [_namebtn setTitle:rmdl.EmpName forState:UIControlStateNormal];
    _nametextfield.text=rmdl.EmpName;
    [_namebtn setTitle:[NSString stringWithFormat:@"%@-%@",rmdl.EmpId,rmdl.EmpName] forState:UIControlStateNormal];
    _phoneofficetextfield.text=rmdl.PhoneOffice;
    _emailtextfield.text=rmdl.Email;
    _mobiletextfield.text=rmdl.Mobile;
    _extensiontextfield.text=rmdl.Extension;

}
- (IBAction)addsalesaction:(id)sender
{   [self Employeeselect];

    _cancelbtnlbl.enabled=YES;
    _updatebtn.enabled=YES;
    _salesRepTable.userInteractionEnabled=NO;
   // [_salesRepTable setEditing:NO animated:NO];
   _cancelbtnlbl.titleLabel.textColor=[UIColor colorWithRed:70/255.0f green:130.0/255.0f blue:180.0/255.0f alpha:1.0f];
    _addView.hidden=NO;
     _navbar.title=@"Create";
    optionidentifier=1;
    _custcodetextfield.text=@"";
    _emailtextfield.text=@"";
    _extensiontextfield.text=@"";
    _mobiletextfield.text=@"";
    _phoneofficetextfield.text=@"";
    [_namebtn setTitle:@"Select" forState:UIControlStateNormal];
    _empidtextfield.text=@"";

}
- (IBAction)selectnameaction:(id)sender
{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 220, 300)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 220, 300)];
    
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight= 32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popovertableview];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(220, 300);
    
    //create a popover controller
    
    self.popovercontroller = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    self.popovercontroller.popoverContentSize=CGSizeMake(220.0f, 300.0f);
    self.popovercontroller=_popovercontroller;

        
        [self.popovercontroller presentPopoverFromRect:_namebtn.frame
                                                inView:self.addView permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
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
    if (tableView==_salesRepTable) {
        
    
    return [_salesarray count];
    }
    if (tableView==_popovertableview) {
        return [_employeedct count];
    }
    return YES;
    // Return the number of rows in the section.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if (tableView==_salesRepTable) {
            
        
        
                   [[NSBundle mainBundle]loadNibNamed:@"Srepcell" owner:self options:nil];
                    cell=_salescell;
        }
        
        
        
    }
    if (tableView==_salesRepTable) {
        
    
    
    Rsalesmdl*rmdl=(Rsalesmdl *)[_salesarray objectAtIndex:indexPath.row];
    _custcodelabel=(UILabel*)[cell viewWithTag:1];
    _custcodelabel.text=rmdl.CustomerCode;
    _empidlabel=(UILabel*)[cell viewWithTag:2];
    _empidlabel.text=rmdl.EmpId;
    _namelabel=(UILabel*)[cell viewWithTag:3];
        _namelabel.text=rmdl.EmpName;
        //[_reversedict objectForKey:rmdl.EmpName];

    _phonelabel=(UILabel*)[cell viewWithTag:4];
    _phonelabel.text=rmdl.PhoneOffice;
    _extensionlabel=(UILabel*)[cell viewWithTag:5];
    _extensionlabel.text=rmdl.Extension;
    _mobilelabel=(UILabel*)[cell viewWithTag:6];
    _mobilelabel.text=rmdl.Mobile;
    _email=(UILabel*)[cell viewWithTag:7];
    _email.text=rmdl.Email;
    }
    if (tableView==_popovertableview) {
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
        _namelistarray=[_employeedct allKeys];
       // cell.textLabel.text=[_namelistarray objectAtIndex:indexPath.row];
        cell.textLabel.text=[NSString stringWithFormat:@"%@-%@",[_employeedct objectForKey:[_namelistarray objectAtIndex:indexPath.row]],[_namelistarray objectAtIndex:indexPath.row]];

    }
    
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    if (tableView==_popovertableview) {
        
        
        
       
                [_namebtn setTitle:[NSString stringWithFormat:@"%@-%@",[_employeedct objectForKey:[_namelistarray objectAtIndex:indexPath.row]],[_namelistarray objectAtIndex:indexPath.row]] forState:UIControlStateNormal];
        _empidtextfield.text=[_employeedct objectForKey:[_namelistarray objectAtIndex:indexPath.row]];
        
        
    }
    
    
    [self.popovercontroller dismissPopoverAnimated:YES];
    
}



-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_salesRepTable) {
        
    
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        
    }else
    {
        
        //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
        [cell setBackgroundColor:[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f]];
    }
    }
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [self UserLogmaindelete];
        path=indexPath.row;
        
        [self CustomerSalesRepInfodelete];
        [_salesarray removeObject:indexPath];
        
        
        
        
        
    }
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_popovertableview)
        
    {
        return self.editing ;
    }
    return YES;
    
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
                   
                   "<CustomerSalesRepInfoselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<CustomerCode>%@</CustomerCode>\n"
                   "</CustomerSalesRepInfoselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_ccode];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerSalesRepInfoselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Employeeselect
{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Employeeselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "</Employeeselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Employeeselect" forHTTPHeaderField:@"Soapaction"];
    
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
{
    NSArray *array=[_namebtn.titleLabel.text componentsSeparatedByString:@"-"];
    NSString *namestring=[array objectAtIndex:1];
    NSLog(@"%@",namestring);
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerSalesRepInfoInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<CustomerCode>%@</CustomerCode>\n"
                   "<EmpId>%@</EmpId>\n"
                   "<EmpName>%@</EmpName>\n"
                   "<PhoneOffice>%@</PhoneOffice>\n"
                   "<Extension>%@</Extension>\n"
                   "<Mobile>%@</Mobile>\n"
                   "<Email>%@</Email>\n"
                   "</CustomerSalesRepInfoInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_ccode,_empidtextfield.text,_empidtextfield.text,_phoneofficetextfield.text,_extensiontextfield.text,_mobiletextfield.text,_emailtextfield.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerSalesRepInfoInsert" forHTTPHeaderField:@"Soapaction"];
    
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
    NSArray *array=[_namebtn.titleLabel.text componentsSeparatedByString:@"-"];
    NSString *namestring=[array objectAtIndex:1];
    NSLog(@"%@",namestring);

    webtype=1;
    recordResults = FALSE;
    Rsalesmdl*rmdl=(Rsalesmdl *)[_salesarray objectAtIndex:btnindex];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerSalesRepInfoUpdate xmlns=\"http://ios.kontract360.com/\">\n"
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
                   "</soap:Envelope>\n",rmdl.entryid,rmdl.CustomerCode,_empidtextfield.text,_empidtextfield.text,_phoneofficetextfield.text,_extensiontextfield.text,_mobiletextfield.text,_emailtextfield.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerSalesRepInfoUpdate" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<CustomerSalesRepInfodelete xmlns=\"http://ios.kontract360.com/\">\n"
                   "<EntryId>%d</EntryId>\n"
                   "</CustomerSalesRepInfodelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",rmdl.entryid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerSalesRepInfodelete" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<CustomerSalesRepInfoSearch xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "<CustomerCode>%@</CustomerCode>\n"
                   "</CustomerSalesRepInfoSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring,_ccode];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerSalesRepInfoSearch" forHTTPHeaderField:@"Soapaction"];
    
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


-(void)UserLogmaininsert{
   
    recordResults = FALSE;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // NSLog(@"Date %@",[formatter stringFromDate:date]);
    NSString*curntdate=[formatter stringFromDate:date];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*useridname = [defaults objectForKey:@"Userid"];
    NSString*extnalip=[defaults objectForKey:@"Externalip"];
    NSString*intrnalip=[defaults objectForKey:@"Internalip"];
    NSString*Udid=[defaults objectForKey:@"UDID"];
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserLogmaininsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<dateandtime>%@</dateandtime>\n"
                   "<userid>%d</userid>\n"
                   "<moduleid>%d</moduleid>\n"
                   "<Action>%@</Action>\n"
                   "<platform>%@</platform>\n"
                   "<externalip>%@</externalip>\n"
                   "<internalip>%@</internalip>\n"
                   "<devicenumber>%@</devicenumber>\n"
                   "<documentId>%d</documentId>\n"
                   "</UserLogmaininsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],0,@"Create",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserLogmaininsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UserLogmainupdate{
    
    recordResults = FALSE;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // NSLog(@"Date %@",[formatter stringFromDate:date]);
    NSString*curntdate=[formatter stringFromDate:date];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*useridname = [defaults objectForKey:@"Userid"];
    NSString*extnalip=[defaults objectForKey:@"Externalip"];
    NSString*intrnalip=[defaults objectForKey:@"Internalip"];
    NSString*Udid=[defaults objectForKey:@"UDID"];
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserLogmaininsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<dateandtime>%@</dateandtime>\n"
                   "<userid>%d</userid>\n"
                   "<moduleid>%d</moduleid>\n"
                   "<Action>%@</Action>\n"
                   "<platform>%@</platform>\n"
                   "<externalip>%@</externalip>\n"
                   "<internalip>%@</internalip>\n"
                   "<devicenumber>%@</devicenumber>\n"
                   "<documentId>%d</documentId>\n"
                   "</UserLogmaininsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],0,@"Edit",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserLogmaininsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UserLogmaindelete{
    
    recordResults = FALSE;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // NSLog(@"Date %@",[formatter stringFromDate:date]);
    NSString*curntdate=[formatter stringFromDate:date];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*useridname = [defaults objectForKey:@"Userid"];
    NSString*extnalip=[defaults objectForKey:@"Externalip"];
    NSString*intrnalip=[defaults objectForKey:@"Internalip"];
    NSString*Udid=[defaults objectForKey:@"UDID"];
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserLogmaininsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<dateandtime>%@</dateandtime>\n"
                   "<userid>%d</userid>\n"
                   "<moduleid>%d</moduleid>\n"
                   "<Action>%@</Action>\n"
                   "<platform>%@</platform>\n"
                   "<externalip>%@</externalip>\n"
                   "<internalip>%@</internalip>\n"
                   "<devicenumber>%@</devicenumber>\n"
                   "<documentId>%d</documentId>\n"
                   "</UserLogmaininsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],0,@"Delete",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserLogmaininsert" forHTTPHeaderField:@"Soapaction"];
    
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
	
	
	if( _xmlparser )
	{
		
	}
	
	_xmlparser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlparser setDelegate:(id)self];
	[_xmlparser setShouldResolveExternalEntities: YES];
	[_xmlparser parse];
    [_salesRepTable reloadData];
        [_popovertableview reloadData];
    
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
    
    if ([elementName isEqualToString:@"name"]) {
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
    if([elementName isEqualToString:@"EmployeeselectResponse"])
    {
        _employeedct=[[NSMutableDictionary alloc]init];
        _reversedict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"cemp_id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"vf_name"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"vl_name"])
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
        _rmodel.EmpId=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"name"]) {
        
        recordResults=FALSE;
        _rmodel.EmpName=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"EmpName"]) {
        
        recordResults=FALSE;
       // _rmodel.EmpName=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        _soapResults=nil;
    }

    if ([elementName isEqualToString:@"PhoneOffice"]) {
    
        recordResults=FALSE;
        _rmodel.PhoneOffice=_soapResults;
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"Extension"]) {
        
        recordResults=FALSE;
        _rmodel.Extension=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
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
            
              UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_resultstring delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
               
                    [self CustomerSalesRepInfoselect];
                    _searchbar.text=@"";
                
                

            
        
        }
         if (webtype==2) {
             if ([_resultstring isEqualToString:@"deleted"]) {
                 [self CustomerSalesRepInfoselect];
                 _searchbar.text=@"";

             }
             else
             {
                 UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_resultstring delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                 [alert show];
                 [self CustomerSalesRepInfoselect];
                 _searchbar.text=@"";
             }

         }
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"cemp_id"])
    {
        recordResults = FALSE;
        empid=_soapResults;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"vf_name"])
    {
        recordResults = FALSE;
        empname=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"vl_name"])
    {
        recordResults = FALSE;
        [_employeedct setObject:empid forKey:[NSString stringWithFormat:@"%@ %@",empname,_soapResults]];
        [_reversedict setObject:[NSString stringWithFormat:@"%@ %@",empname,_soapResults]forKey:empid];
        _soapResults = nil;
    }


    





}
-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView.message isEqualToString:_resultstring]) {
        if (optionidentifier==2) {
            _addView.hidden=YES;
            _salesRepTable.userInteractionEnabled=YES;
            _updatebtn.enabled=YES;
            _searchbar.text=@"";
        }
        _custcodetextfield.text=@"";
        _emailtextfield.text=@"";
        _extensiontextfield.text=@"";
        _mobiletextfield.text=@"";
        _phoneofficetextfield.text=@"";
        _nametextfield.text=@"";
        _empidtextfield.text=@"";
         _updatebtn.enabled=YES;
        _searchbar.text=@"";
        [_namebtn setTitle:@"Select" forState:UIControlStateNormal];
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
    if (optionidentifier==1)
    {
        [self UserLogmaininsert];
    }
    else{
        [self UserLogmainupdate];
        
    }
   
        if([_namebtn.titleLabel.text isEqualToString:@"Select"]||[_namebtn.titleLabel.text isEqualToString:@""])
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([_phoneofficetextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Phone Number is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([_mobiletextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Mobile Number is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    
        else if([_emailtextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length!=0)
        {
            Validation *val=[[Validation alloc]init];
            int value2 = [val validEmailAddress:_emailtextfield.text];
            if(value2==0)
            {
                
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert1 show];
            }
            else
            {
                if (optionidentifier==1)
                {
                    _updatebtn.enabled=NO;
                [self CustomerSalesRepInfoInsert];
                }
                else
                {
                    _updatebtn.enabled=NO;
                     [self CustomerSalesRepInfoUpdate];
                }
            }

        }
    else
    {
        if (optionidentifier==1)
        {
            _updatebtn.enabled=NO;
            [self CustomerSalesRepInfoInsert];
        }
        else
        {
            _updatebtn.enabled=NO;
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
//                    UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
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
//                    UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
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
            if([phonenostring stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
            {
                
            }
            else
            {
                //fmt=1;
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                
                [alert show];
                
            }
            
            
            
        }
        else
        {
            
            Validation*val=[[Validation alloc]init];
            int value1=[val isdataformat:_phoneofficetextfield.text];
            if(value1==0)
            {
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
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
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
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
                        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                        
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
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
            }
        }
    }
    if (textField==_mobiletextfield) {
        
    
    
        
        mobilestring=_mobiletextfield.text;
        
        
        if ([mobilestring length]<10) {
            if([mobilestring stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
            {
                
            }
            else
            {
                //fmt=1;
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                
                [alert show];
                
            }
            
            
            
        }
        else
        {
            
            Validation*val=[[Validation alloc]init];
            int value1=[val isdataformat:_mobiletextfield.text];
            if(value1==0)
            {
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
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
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
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
                        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                        
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
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
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
                
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
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
                
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Extension" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert1 show];
            }
            
            
        }
        
        
    }

    
    
    
    if(textField==_nametextfield){
        
        
        
        Validation *val=[[Validation alloc]init];
        int value1=[val validatespecialcharacters:_nametextfield.text];
        if(value1==0)
        {
            
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Company Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
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
