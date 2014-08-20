//
//  ManViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "ManViewController.h"

@interface ManViewController ()

@end

@implementation ManViewController

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
    _addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    
  // [self Checknetavailabilty];
    
    [[self.jobtasktextview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.jobtasktextview layer] setBorderWidth:2];
    [[self.jobtasktextview layer] setCornerRadius:10];
    [[self.eduactiontextview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.eduactiontextview layer] setBorderWidth:2];
    [[self.eduactiontextview layer] setCornerRadius:10];
    [[self.trainingtextview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.trainingtextview layer] setBorderWidth:2];
    [[self.trainingtextview layer] setCornerRadius:10];
    [[self.experiencetextview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];    [[self.experiencetextview layer] setBorderWidth:2.3];
    [[self.experiencetextview layer] setCornerRadius:10];
    
    _manpowerTable.layer.borderWidth = 2.0;
    _manpowerTable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    
    /*searchbar*/
    
    _SearchingBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _SearchingBar.delegate = (id)self;
    _SearchingBar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
   // _navitem.titleView.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];

    
    self.manpowerTable.tableHeaderView =_SearchingBar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_SearchingBar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;

    
    _addscrollview.frame=CGRectMake(0, 44, 583,622);
    [_addscrollview setContentSize:CGSizeMake(583,1200)];          // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self AllSkills];

  //  [self Selectallmanpower];

//    NSTimer *timer;
//    timer=[NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(Checknetavailabilty) userInfo:nil repeats:YES];
   
    

    
}

-(void)Checknetavailabilty{
    /* for checking Connectivity*/
    
    NSString *URLString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"]];
    _Availablityresult = [[NSString alloc] init];
    _Availablityresult = ( URLString != NULL ) ? @"Yes" : @"No";
    NSLog(@"Internet connection availability : %@", _Availablityresult);
    if ([_Availablityresult isEqualToString:@"Yes"]) {
    //[self FetchManapowerdatasfromDB];

        if ([_Sqlitearry count]>0) {
             [self SynManpowertoserver];
        }
        else{
        //[self Selectallmanpower];
            [self AllSkills];
        }
    
        
    }
    else if([_Availablityresult isEqualToString:@"No"]){
        [self Createdatabase];
        
        //[self FetchManapowerdatasfromDB];
        
        
    }
    

    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closemanpower:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    _addview.hidden=YES;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_manpowerTable) {
        return [_Allmanpwrarry count];
        
//        if ([_Availablityresult isEqualToString:@"Yes"]) {
//            
//            return [_Allmanpwrarry count];
//        }
//        else if([_Availablityresult isEqualToString:@"No"]){
//             return [_Sqlitearry count];
//        }
        
    }
    
    else if (tableView==_popOverTableView) {
        return [_subtypearray count];
    }
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
          cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
           cell.textLabel.font=[UIFont systemFontOfSize:12];
        if(tableView==_manpowerTable){
        [[NSBundle mainBundle]loadNibNamed:@"custommanapowercell" owner:self options:nil];
        cell=_manpowecell;
        }
    }
    
    if (tableView==_popOverTableView) {
        cell.textLabel.text=[_subtypearray objectAtIndex:indexPath.row];
        
    }
     if(tableView==_manpowerTable){
         Manpwr*pwrmdl;
         //if ([_Availablityresult isEqualToString:@"Yes"]) {
             
               pwrmdl=(Manpwr *)[_Allmanpwrarry objectAtIndex:indexPath.row];
             _codelbl=(UILabel *)[cell viewWithTag:1];
             _codelbl.text=pwrmdl.itemcode;
             _deslbl=(UILabel *)[cell viewWithTag:2];
             _deslbl.text=pwrmdl.itemdescptn;
             _typelbl=(UILabel *)[cell viewWithTag:3];
             _typelbl.text=pwrmdl.subtype;
             _costlbl=(UILabel *)[cell viewWithTag:4];
             _costlbl.text=[NSString stringWithFormat:@"$%@",pwrmdl.unitcost];
             _craftlabel=(UILabel *)[cell viewWithTag:5];
             _craftlabel.text=pwrmdl.craftcode;
             _billabel=(UILabel *)[cell viewWithTag:6];
             _billabel.text=[NSString stringWithFormat:@"$%@",pwrmdl.billingrate];
             _paylabel=(UILabel *)[cell viewWithTag:7];
             _paylabel.text=[NSString stringWithFormat:@"$%@",pwrmdl.payrate];
             
             
             
             if (pwrmdl.overhead==0) {
                 [_overhdchecklbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
                 
             }
             else if(pwrmdl.overhead==1){
                 [_overhdchecklbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
                 
             }

        // }
//         else if([_Availablityresult isEqualToString:@"No"]){
//              pwrmdl=(Manpwr *)[_Sqlitearry objectAtIndex:indexPath.row];
//             _codelbl=(UILabel *)[cell viewWithTag:1];
//             _codelbl.text=pwrmdl.itemcode;
//             _deslbl=(UILabel *)[cell viewWithTag:2];
//             _deslbl.text=pwrmdl.itemdescptn;
//             _typelbl=(UILabel *)[cell viewWithTag:3];
//             _typelbl.text=pwrmdl.subtype;
//             _costlbl=(UILabel *)[cell viewWithTag:4];
//             _costlbl.text=pwrmdl.unitcost;
//             
//             NSLog(@"OVERHEAD%d",pwrmdl.overhead);
//             
//             if (pwrmdl.overhead==0) {
//                 [_overhdchecklbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//                 
//             }
//             else if(pwrmdl.overhead==1){
//                 [_overhdchecklbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//                 
//             }
//
//         }

  
      
     }
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_popOverTableView) {
        
        //_subtypetxtfld.text=[_subtypearray objectAtIndex:indexPath.row];
          [_searchbtnlbl setTitle:[_subtypearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
    
    if (tableView==_manpowerTable) {
      
            }
   [self.popOverController dismissPopoverAnimated:YES];
    
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
         path=indexPath.row;
        
        [self DeleteManpower];
        [_Allmanpwrarry removeObject:indexPath];
        
        
        
        
        
    }
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_manpowerTable)
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


#pragma mark-Popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 120);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_searchbtnlbl.frame
                                            inView:self.addscrollview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    

}

#pragma mark- WebService
-(void)Selectallmanpower{
    webtype=0;
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
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
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
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
   
}
-(void)SearchManpower{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SearchManpower xmlns=\"http://ios.kontract360.com/\">\n"
                    "<searchtext>%@</searchtext>\n"
                   "</SearchManpower>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SearchManpower" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SelectAllSubtype{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllSubtype xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllSubtype>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllSubtype" forHTTPHeaderField:@"Soapaction"];
    
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


-(void)SynManpowertoserver{
    webtype=11;
    
    recordResults = FALSE;
    NSString *soapMessage;
    _keyarray=[[NSMutableArray alloc]init];
    
    for (int i=0;i<[_Sqlitearry count];i++) {
        
        
        Manpwr*manpwr1=(Manpwr *)[_Sqlitearry objectAtIndex:i];
        Newprimarykey=manpwr1.primarykey;
        
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertManpower xmlns=\"http://ios.kontract360.com/\">\n"
                   "<itemcode>%@</itemcode>\n"
                   "<description>%@</description>\n"
                   "<subtype>%@</subtype>\n"
                   "<unitcost>%f</unitcost>\n"
                   "<overhead>%d</overhead>\n"
                   "</InsertManpower>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",manpwr1.itemcode,manpwr1.itemdescptn,manpwr1.subtype,[manpwr1.unitcost floatValue],manpwr1.overhead];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/InsertManpower" forHTTPHeaderField:@"Soapaction"];
    
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
}

-(void)InsertManpower{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    NSInteger overhead;
     if (checkbtnclick==0) {
        overhead=0;
    }
    else{
        overhead=1;
        
    }

   NSString *jobdesc=@"";
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertManpower xmlns=\"http://ios.kontract360.com/\">\n"
                   "<itemcode>%@</itemcode>\n"
                   "<description>%@</description>\n"
                   "<subtype>%@</subtype>\n"
                   "<unitcost>%f</unitcost>\n"
                   "<overhead>%d</overhead>\n"
                   "<craftcode>%@</craftcode>\n"
                   "<billingrate>%f</billingrate>\n"
                   "<payrate>%f</payrate>\n"
                   "<JobDescription>%@</JobDescription>\n"
                   "<TrainingReq>%@</TrainingReq>\n"
                   "<Experiance>%@</Experiance>\n"
                   "<JobTasks>%@</JobTasks>\n"
                   "<EducationReq>%@</EducationReq>\n"
                   "</InsertManpower>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",@"abc",_itemdestxtfld.text,[_skilldict objectForKey:_searchbtnlbl.titleLabel.text],[_unitcosttxtfld.text floatValue],overhead,_craftcodetextfld.text,[_billingratetextfield.text floatValue],[_payratetextfield.text floatValue],jobdesc,_trainingtextview.text,_experiencetextview.text,_jobtasktextview.text,_eduactiontextview.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/InsertManpower" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)DeleteManpower{
    webtype=1;
    newtype=3;
    recordResults = FALSE;
    NSString *soapMessage;
    
    Manpwr*pwrmdl=(Manpwr *)[_Allmanpwrarry objectAtIndex:path];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DeleteManpower xmlns=\"http://ios.kontract360.com/\">\n"
                   
                    "<entryid>%d</entryid>\n"
                   "</DeleteManpower>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",pwrmdl.entryid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/DeleteManpower" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)UpdateManpower{
    webtype=1;
    
     Manpwr*pwrmdl=(Manpwr *)[_Allmanpwrarry objectAtIndex:btnindex];
    recordResults = FALSE;
    NSString *soapMessage;
     NSInteger overhead;
    if (checkbtnclick==0) {
        overhead=0;
    }
    else{
         overhead=1;
        
    }
    
 //  NSString*unitcost=    [_unitcosttxtfld.text substringFromIndex:1];
   NSString*unitcost=   [_unitcosttxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
//    NSString*billrate=    [_billingratetextfield.text substringFromIndex:1];
//    NSString*payrate=    [_payratetextfield.text substringFromIndex:1];
    NSString *jobdesc=@"";
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateManpower xmlns=\"http://ios.kontract360.com/\">\n"
                    "<entryid>%d</entryid>\n"
                    "<itemcode>%@</itemcode>\n"
                    "<description>%@</description>\n"
                    "<subtype>%@</subtype>\n"
                    "<unitcost>%f</unitcost>\n"
                    "<overhead>%d</overhead>\n"
                    "<craftcode>%@</craftcode>\n"
                    "<billingrate>%f</billingrate>\n"
                    "<payrate>%f</payrate>\n"
                    "<JobDescription>%@</JobDescription>\n"
                    "<TrainingReq>%@</TrainingReq>\n"
                    "<Experiance>%@</Experiance>\n"
                    "<JobTasks>%@</JobTasks>\n"
                    "<EducationReq>%@</EducationReq>\n"
                    "</UpdateManpower>\n"
                    "</soap:Body>\n"
                    "</soap:Envelope>\n",pwrmdl.entryid,_itemcodetxtfld.text,_itemdestxtfld.text,[_skilldict objectForKey:_searchbtnlbl.titleLabel.text],[unitcost floatValue],overhead,_craftcodetextfld.text,[_billingratetextfield.text floatValue],[_payratetextfield.text floatValue],jobdesc,_trainingtextview.text,_experiencetextview.text,_jobtasktextview.text,_eduactiontextview.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateManpower" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)AllSkills{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<AllSkills xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</AllSkills>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/AllSkills" forHTTPHeaderField:@"Soapaction"];
    
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
    
    if (webtype==1) {
        [self Selectallmanpower];
        webtype=0;
    }
    [_manpowerTable reloadData];
    [_popOverTableView reloadData];
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectAllManpowerResult"])
    {
        _Allmanpwrarry=[[NSMutableArray alloc]init];
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

    if([elementName isEqualToString:@"ItemCode"])
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
    if([elementName isEqualToString:@"SubType"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UnitCost"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Overhead"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CraftCode"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"BillingRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"PayRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobDescription"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TrainingReq"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Experiance"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"JobTasks"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EducationReq"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    


    if([elementName isEqualToString:@"SelectAllSubtypeResult"])
    {
        _subtypearray=[[NSMutableArray alloc]init];

        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"subtype"])
    {
                if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SearchManpowerResponse"])
    {
          _Allmanpwrarry=[[NSMutableArray alloc]init];
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"UpdateManpowerResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"InsertManpowerResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"AllSkillsResult"])
    {
        _skilldict=[[NSMutableDictionary alloc]init];
        _subtypearray=[[NSMutableArray alloc]init];
        _revskilldict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"SkillId"])
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
    if([elementName isEqualToString:@"EntryId"])
    {
        _manpwrmdl=[[Manpwr alloc]init];
        
        recordResults = FALSE;
        
        _manpwrmdl.entryid=[_soapResults integerValue];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ItemCode"])
    {
        
        recordResults = FALSE;
        _manpwrmdl.itemcode=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
        
        _manpwrmdl.itemdescptn=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SubType"])
    {
        
        recordResults = FALSE;
        _manpwrmdl.subtype=[_revskilldict objectForKey:_soapResults];;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"UnitCost"])
    {
        
        recordResults = FALSE;
        
        _manpwrmdl.unitcost=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Overhead"])
    {
        
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"false"]) {
            _manpwrmdl.overhead=0;
              checkbtnclick=0;
            
        }
        else{
            _manpwrmdl.overhead=1;
              checkbtnclick=1;
        }
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CraftCode"])
    {
        
        recordResults = FALSE;
        
        _manpwrmdl.craftcode=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"BillingRate"])
    {
        
        recordResults = FALSE;
        
        _manpwrmdl.billingrate=_soapResults;
       
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PayRate"])
    {
        
        recordResults = FALSE;
        
        _manpwrmdl.payrate=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobDescription"])
    {
        
        recordResults = FALSE;
        
        _manpwrmdl.JobDescription=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TrainingReq"])
    {
        
        recordResults = FALSE;
        
        _manpwrmdl.TrainingReq=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"Experiance"])
    {
        
        recordResults = FALSE;
        
        _manpwrmdl.Experiance=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"JobTasks"])
    {
        
        recordResults = FALSE;
        
        _manpwrmdl.JobTasks=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"EducationReq"])
    {
        
        recordResults = FALSE;
        
        _manpwrmdl.EducationReq=_soapResults;
         [_Allmanpwrarry addObject:_manpwrmdl];
        _soapResults = nil;
    }



    if([elementName isEqualToString:@"subtype"])
    {
        
        recordResults = FALSE;
        [_subtypearray addObject:_soapResults];
         _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        
        recordResults = FALSE;
        if (webtype==11) {
            
            [self DeleteDBtable];
            
          
        }
        if (newtype==3) {
            newtype=0;
            
        }
        else{
        msgstrg=_soapResults;
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        }
        
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"SkillId"])
    {
        recordResults = FALSE;
        skill=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SkillName"])
    {        recordResults =FALSE;
        
        [_skilldict setObject:skill forKey:_soapResults];
        [_revskilldict setObject:_soapResults forKey:skill];
        [_subtypearray addObject:_soapResults];
        _soapResults = nil;
        
        
    }

}
#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_SearchingBar.text;
    //NSLog(@"search%@",searchstring);
    [self SearchManpower];
    [searchBar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
     [self Selectallmanpower];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_SearchingBar.text length]==0) {
        
        [self Selectallmanpower];
        // [searchBar resignFirstResponder];
        
        
    }
    //[searchBar resignFirstResponder];
    
    
}

#pragma mark-Action
- (IBAction)addmanpwer:(id)sender {
  
    _itemcodetxtfld.text=@"";
    
    _itemdestxtfld.text=@"";
    _subtypetxtfld.text=@"";
    _unitcosttxtfld.text=@"";

    btnidtfr=22;
    _navitem.title=@"Create";
    _addview.hidden=NO;
    _cancelbtnlbl.enabled=YES;
    _eduactiontextview.text=@"";
    _experiencetextview.text=@"";
    _jobtasktextview.text=@"";
    _trainingtextview.text=@"";
    _payratetextfield.text=@"";
    _billingratetextfield.text=@"";
    _craftcodetextfld.text=@"";
    [_checkbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_searchbtnlbl setTitle:@"Select" forState:UIControlStateNormal];

    checkbtnclick=0;
}
- (IBAction)clsebtn:(id)sender {
    _addview.hidden=YES;
    
}
-(IBAction)editmanpower:(id)sender
{
    btnidtfr=11;
     _cancelbtnlbl.enabled=NO;
    _resultdisplaylabel.hidden=YES;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.manpowerTable];
    NSIndexPath *textFieldIndexPath = [self.manpowerTable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    Manpwr*pwrmdl=(Manpwr *)[_Allmanpwrarry objectAtIndex:textFieldIndexPath.row];
    
    _itemcodetxtfld.text=pwrmdl.itemcode;
    
    _itemdestxtfld.text=pwrmdl.itemdescptn;
    _subtypetxtfld.text=pwrmdl.subtype;
    [_searchbtnlbl setTitle:pwrmdl.subtype forState:UIControlStateNormal];
    _unitcosttxtfld.text=[NSString stringWithFormat:@"$%@",pwrmdl.unitcost];
    _payratetextfield.text=[NSString stringWithFormat:@"$%@",pwrmdl.payrate];
    _billingratetextfield.text=[NSString stringWithFormat:@"$%@",pwrmdl.billingrate];
    _craftcodetextfld.text=[NSString stringWithFormat:@"%@",pwrmdl.craftcode];
    _eduactiontextview.text=pwrmdl.EducationReq;
    _experiencetextview.text=pwrmdl.Experiance;
    _jobtasktextview.text=pwrmdl.JobTasks;
    _trainingtextview.text=pwrmdl.TrainingReq;

    //_unitcosttxtfld.text=pwrmdl.unitcost;

    if (pwrmdl.overhead==0) {
        [_checkbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else if(pwrmdl.overhead==1){
        [_checkbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
    

    //webtype=2;
    _addview.hidden=NO;
    _navitem.title=@"Edit";
    
    
}
- (IBAction)overhdcheck:(id)sender {
    
    
    if (checkbtnclick==0) {
         [_checkbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        checkbtnclick=1;
        
    }
    
    else{
         [_checkbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        checkbtnclick=0;
        
    }

    
    
    
}

- (IBAction)searchbtn:(id)sender {
    [self createpopover];
    [self AllSkills];
}

- (IBAction)update:(id)sender {
    if (btnidtfr==11) {
        if([_itemdestxtfld.text isEqualToString:@""])
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Classification  is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if ([_searchbtnlbl.titleLabel.text isEqualToString:@""]||[_searchbtnlbl.titleLabel.text isEqualToString:@"Select"]){
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Subtype is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            
        }

        else
        {
        [self UpdateManpower];
    }
    }
    else if (btnidtfr==22){
        if([_itemdestxtfld.text isEqualToString:@""])
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Classification  is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if ([_searchbtnlbl.titleLabel.text isEqualToString:@""]||[_searchbtnlbl.titleLabel.text isEqualToString:@"Select"]){
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Subtype is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            
        }

        else
        {
            [self InsertManpower];
        }

        
//        if ([_Availablityresult isEqualToString:@"Yes"]) {
//            
//             [self InsertManpower];
//        }
//        else if([_Availablityresult isEqualToString:@"No"]){
//           [self InsertManpowerDatastoDB];
//        }

  
      
    
    }
}

- (IBAction)cancel:(id)sender {
    _itemcodetxtfld.text=@"";
    
    _itemdestxtfld.text=@"";
    _subtypetxtfld.text=@"";
    _unitcosttxtfld.text=@"";
       [_checkbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    checkbtnclick=0;
    _payratetextfield.text=@"";
    _billingratetextfield.text=@"";
    _craftcodetextfld.text=@"";
    _eduactiontextview.text=@"";
    _trainingtextview.text=@"";
    _experiencetextview.text=@"";
    _jobtasktextview.text=@"";
    [_searchbtnlbl setTitle:@"Select" forState:UIControlStateNormal];


}

- (IBAction)deletebtn:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_manpowerTable setEditing:NO animated:NO];
        [_manpowerTable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_manpowerTable setEditing:YES animated:YES];
        [_manpowerTable reloadData];
        
        
        
        
    }

    
}
- (IBAction)selectQualificatin:(id)sender
{
    //_qualificationview.hidden=NO;
}
- (IBAction)closeQualificatin:(id)sender
{
    //_qualificationview.hidden=YES;
}
- (IBAction)saveQualificatin:(id)sender
{
    
}

#pragma mark-Textfield Delegate


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    Validation*val=[[Validation alloc]init];
    if (textField==_unitcosttxtfld) {
        int value2=[val isNumeric:_unitcosttxtfld.text];
        if (value2==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Hourly Rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }
    
    if (textField==_stockinhandtxtfld) {
        int value12=[val isNumeric:_stockinhandtxtfld.text];
        if (value12==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid stock in hand" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }}
    if (textField==_billingratetextfield) {
        int values=[val isNumeric:_billingratetextfield.text];
        if (values==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Billing Rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }
    if (textField==_payratetextfield) {
        int values1=[val isNumeric:_payratetextfield.text];
        if (values1==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil  message:@"Invalid Pay Rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }


    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
if ([alertView.message isEqualToString:msgstrg]) {
    _itemcodetxtfld.text=@"";
    
    _itemdestxtfld.text=@"";
    _subtypetxtfld.text=@"";
    _unitcosttxtfld.text=@"";
    [_checkbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    checkbtnclick=0;
    _eduactiontextview.text=@"";
    _experiencetextview.text=@"";
    _jobtasktextview.text=@"";
    _trainingtextview.text=@"";
    _craftcodetextfld.text=@"";
    _payratetextfield.text=@"";
    _billingratetextfield.text=@"";
    [_searchbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    
           }

    if ([alertView.message isEqualToString:@"Invalid Billing Rate"]) {
        
        
        _billingratetextfield.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Invalid Pay Rate"]) {
        
        
        _payratetextfield.text=@"";
        
    }

    if ([alertView.message isEqualToString:@"Invalid Hourly Rate"]) {
        
        
        _unitcosttxtfld.text=@"";
        
    }

    
    
    if ([alertView.message isEqualToString:@"Invalid stock in hand"]) {
        
        
        _stockinhandtxtfld.text=@"";
        
    }}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField==_itemcodetxtfld)
    {
        NSUInteger newLength = [_itemcodetxtfld.text length] + [string length] - range.length;
        return (newLength > 10) ? NO : YES;
    }
    if(textField==_itemdestxtfld)
    {
        NSUInteger newLength = [_itemdestxtfld.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    if(textField==_unitcosttxtfld)
    {
        NSUInteger newLength = [_unitcosttxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    
    if(textField==_stockinhandtxtfld)
    {
        NSUInteger newLength = [_stockinhandtxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_billingratetextfield)
    {
        NSUInteger newLength = [_billingratetextfield.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_payratetextfield)
    {
        NSUInteger newLength = [_payratetextfield.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_craftcodetextfld)
    {
        NSUInteger newLength = [_craftcodetextfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }

    
    
    return YES;
}

#pragma mark-Sqlite Database

-(void)Createdatabase{
    
    _dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _docsDir = [_dirPaths objectAtIndex:0];
    
    /* Build the path to the database file*/
    
    _databasePath = [[NSString alloc] initWithString: [_docsDir stringByAppendingPathComponent: @"ResourcesList.db"]];
     NSLog(@"Path %@",_databasePath);
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: _databasePath ] == NO)
    {
        const char *dbpath = [_databasePath UTF8String];
        if (sqlite3_open(dbpath, &_newResourcesListDB) == SQLITE_OK)
        {
            char *errMsg;
             const char *sql_stmt = "CREATE TABLE IF NOT EXISTS ManpowerList (ID INTEGER PRIMARY KEY AUTOINCREMENT, ItemCode TEXT, ItemDescrptn TEXT,Subtype TEXT,Unitcost TEXT,Overhead TEXT)";
            
            
            if (sqlite3_exec(_newResourcesListDB, sql_stmt, NULL, NULL, &errMsg)
                != SQLITE_OK)
            {
                
                NSLog(@"Failed to create table");
                 NSLog( @"Error while inserting '%s'", sqlite3_errmsg(_newResourcesListDB));
            }
            sqlite3_close(_newResourcesListDB);
           
        }
        
        else {
            NSLog( @"Failed to open/create database");
            
        }
        
    }
}

-(void)InsertManpowerDatastoDB{
     sqlite3_stmt    *statement;
      const char *dbpath = [_databasePath UTF8String];
    
    NSInteger overhead;
    if (checkbtnclick==0) {
        overhead=0;
    }
    else{
        overhead=1;
        
    }

    if (sqlite3_open(dbpath, &_newResourcesListDB) == SQLITE_OK)
    {
        NSString *InsertSQl=[NSString stringWithFormat:@"INSERT INTO ManpowerList(ItemCode,ItemDescrptn,Subtype,Unitcost,Overhead) VALUES (\"%@\",\"%@\",\"%@\",\"%f\",\"%d\")",_itemcodetxtfld.text,_itemdestxtfld.text,_subtypetxtfld.text,[_unitcosttxtfld.text floatValue],overhead];
        
        const char *insert_stmt = [InsertSQl UTF8String];
         sqlite3_prepare_v2(_newResourcesListDB, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            
            NSLog( @"ManpowerData's added");
            
        } else {
            //status.text = @"Failed to add contact";
            NSLog( @"Failed to add ManpowerData's ");
        }
        sqlite3_finalize(statement);
        sqlite3_close(_newResourcesListDB);

    }
    [self FetchManapowerdatasfromDB];
    
}

-(void)FetchManapowerdatasfromDB{
    
    _dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _docsDir = [_dirPaths objectAtIndex:0];
    
    /* Build the path to the database file*/
    
    _databasePath = [[NSString alloc] initWithString: [_docsDir stringByAppendingPathComponent: @"ResourcesList.db"]];
    NSLog(@"Path %@",_databasePath);

    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &_newResourcesListDB) == SQLITE_OK)
    {
        
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM ManpowerList"];
        // NSLog(@"Sql%@",querySQL);
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(_newResourcesListDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            // NSLog(@"sqlite %@",sqlite3_step(statement));
             _Sqlitearry=[[NSMutableArray alloc]init];
            while (sqlite3_step(statement) == SQLITE_ROW)
                
                
            {
                _manpwrmdl=[[Manpwr alloc]init];
                const char* key = (const char*)sqlite3_column_text(statement, 0);
                 NSString *pkey= key == NULL ? nil : [[NSString alloc] initWithUTF8String:key];
                _manpwrmdl.primarykey=[pkey integerValue];
                
                const char* itmcode = (const char*)sqlite3_column_text(statement, 1);
                _manpwrmdl.itemcode= itmcode == NULL ? nil : [[NSString alloc] initWithUTF8String:itmcode];
                
                
                const char*itmdescptn = (const char*)sqlite3_column_text(statement, 2);
                _manpwrmdl.itemdescptn= itmdescptn== NULL ? nil : [[NSString alloc] initWithUTF8String:itmdescptn];
                
                
                const char* subtype = (const char*)sqlite3_column_text(statement, 3);
                _manpwrmdl.subtype = subtype== NULL ? nil : [[NSString alloc] initWithUTF8String:subtype];
                
                
                const char* unitcost = (const char*)sqlite3_column_text(statement, 4);
                _manpwrmdl.unitcost= unitcost == NULL ? nil : [[NSString alloc] initWithUTF8String:unitcost];
                
                
                const char* overhead = (const char*)sqlite3_column_text(statement, 5);
                 NSString *newoverhead= overhead  == NULL ? nil : [[NSString alloc] initWithUTF8String:overhead ];
                
                
                _manpwrmdl.overhead=[newoverhead integerValue];
                
                [_Sqlitearry addObject:_manpwrmdl];
              
                
            }
            
            
            
            
            
        }
        sqlite3_finalize(statement);
        
    }
    sqlite3_close(_newResourcesListDB);
    [_manpowerTable reloadData];

}

-(void)DeleteDBtable{
    
    
    sqlite3_stmt *statement;
    const char *dbPath=[_databasePath UTF8String];
    if(sqlite3_open(dbPath, &_newResourcesListDB)==SQLITE_OK)
    {
        NSString *deleteSql=[NSString stringWithFormat:@"DELETE FROM ManpowerList"];
        
           const char *delete_stmt=[deleteSql UTF8String];
        
     
        sqlite3_prepare_v2(_newResourcesListDB, delete_stmt, -1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE) {
            
            NSLog(@"List Deleted");
            
            
        }else{
            
            
            NSLog(@"Failed to Delete");
        }
        sqlite3_finalize(statement);
        sqlite3_close(_newResourcesListDB);
    }
    

}

- (IBAction)servicebtn:(id)sender {
    if(!self.serviceVCtrl){
        _serviceVCtrl=[[ServiceViewController alloc]initWithNibName:@"ServiceViewController" bundle:nil];
    }
    _serviceVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_serviceVCtrl
                       animated:YES completion:NULL];}
@end
