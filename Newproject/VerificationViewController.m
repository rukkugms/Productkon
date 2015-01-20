    //
//  VerificationViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 9/24/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "VerificationViewController.h"

@interface VerificationViewController ()

@end

@implementation VerificationViewController

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
     self.scroll.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
       [self AllSkills];
   // _userdict=[[NSMutableDictionary alloc]init];
    //[_userdict setObject:@"Admin" forKey:@"1"];
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    //_view1.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
     _navbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
       [_tabbar setSelectedItem:[_tabbar.items objectAtIndex:0]];
    _requirementtable.layer.borderWidth = 2.0;
    _requirementtable.layer.borderColor = [UIColor colorWithRed:0/255.0f green:191/255.0f blue:255.0/255.0f alpha:1.0f].CGColor;
    
    _profileimg.layer.borderWidth = 2.0;
    _profileimg.layer.borderColor = [UIColor colorWithRed:0/255.0f green:191/255.0f blue:255.0/255.0f alpha:1.0f].CGColor;
    
    [[self.cmmnttextview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.cmmnttextview layer] setBorderWidth:2];
    [[self.cmmnttextview layer] setCornerRadius:10];
    
    /*scroll*/
    
   
       _monthArray=[[NSMutableArray alloc]initWithObjects:@"JAN",@"FEB",@"MAR",@"APR",@"MAY",@"JUN",@"JUL",@"AUG",@"SEP",@"OCT",@"NOV",@"DEC",nil];
    _monthdictArray=[[NSMutableArray alloc]initWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12", nil];
    _monthDictionary=[[NSMutableDictionary alloc]initWithObjects:_monthdictArray forKeys:_monthArray];
    _remonthDictionary=[[NSMutableDictionary alloc]initWithObjects:_monthArray forKeys:_monthdictArray];
    _yearArray=[[NSMutableArray alloc]initWithObjects:@"2013",@"2014",@"2015",@"2016",@"2017",@"2018",@"2019",@"2020",@"2021",@"2022",@"2023", nil];
    _remonthDictionary=[[NSMutableDictionary alloc]initWithObjects:_monthArray forKeys:_monthdictArray];
     self.verifctnview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _useridname = [defaults objectForKey:@"Userid"];

    
     }



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _verifybtnlbl.enabled=YES;
    _scroll.frame=CGRectMake(0, 0, 1024,768);
    [_scroll setContentSize:CGSizeMake(1024,1000)];
 
   [_tabbar setSelectedItem:[_tabbar.items objectAtIndex:0]];
    __requirmentview.hidden=NO;

    [_ssnbtnlbl setImage:[UIImage imageNamed:@"RadioButton-UnSelected"] forState:UIControlStateNormal];
    [_i9btnlbl setImage:[UIImage imageNamed:@"RadioButton-UnSelected"] forState:UIControlStateNormal];
    [_bgbtnlbl setImage:[UIImage imageNamed:@"RadioButton-UnSelected"] forState:UIControlStateNormal];
    [self FetchApplicantId];
    NSLog(@"Applicnt %d",_applicantid);
    _segmntbtn.selectedSegmentIndex=0;
    _segmntbtn.userInteractionEnabled=YES;
    _activityview.hidden=NO;
    [_activityview startAnimating];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    if (item.tag==1) {
     __requirmentview.hidden=NO;
        _I9view.hidden=YES;
       
        
    }
    if (item.tag==2) {
       //        [self selectdocs];
        _I9view.hidden=NO;
        
        __requirmentview.hidden=YES;
        
    }
   
    
    //NSLog(@"view");
}

- (IBAction)requrmntactn:(id)sender {
}

- (IBAction)i9action:(id)sender {
    _cmmnttextview.text=@"";
    _verfylbl.text=@"";
    _verifybtnlbl.enabled=YES;
    _segmntbtn.selectedSegmentIndex=0;
     _segmntbtn.userInteractionEnabled=YES;
    Segmntcheck=1;

    i9clck ++;
    if (!i9clck%2) {
        
       [_i9btnlbl setImage:[UIImage imageNamed:@"RadioButton-UnSelected"] forState:UIControlStateNormal];
        
    }
    
    else{
       _type=@"I9";
       
         [_i9btnlbl setImage:[UIImage imageNamed:@"RadioButton-Selected"] forState:UIControlStateNormal];
          [_bgbtnlbl setImage:[UIImage imageNamed:@"RadioButton-UnSelected"] forState:UIControlStateNormal];
          [_ssnbtnlbl setImage:[UIImage imageNamed:@"RadioButton-UnSelected"] forState:UIControlStateNormal];
        _cmmnttextview.editable=YES;
         [self SelectVerificationcomment];
        
    }

}

- (IBAction)bgaction:(id)sender {
     _segmntbtn.userInteractionEnabled=YES;
    _verifybtnlbl.enabled=YES;
    _cmmnttextview.text=@"";
    _verfylbl.text=@"";
    _segmntbtn.selectedSegmentIndex=0;
    Segmntcheck=1;

    bgclck++;
    if (!bgclck%2) {
        
        [_bgbtnlbl setImage:[UIImage imageNamed:@"RadioButton-UnSelected"] forState:UIControlStateNormal];
        
    }
    
    else{
        _type=@"BackGround";

        [_bgbtnlbl setImage:[UIImage imageNamed:@"RadioButton-Selected"] forState:UIControlStateNormal];
        [_i9btnlbl setImage:[UIImage imageNamed:@"RadioButton-UnSelected"] forState:UIControlStateNormal];
        [_ssnbtnlbl setImage:[UIImage imageNamed:@"RadioButton-UnSelected"] forState:UIControlStateNormal];
_cmmnttextview.editable=YES;
 [self SelectVerificationcomment];
        
    }

    
}

- (IBAction)ssnaction:(id)sender {
     _segmntbtn.userInteractionEnabled=YES;
    _verifybtnlbl.enabled=YES;
    _cmmnttextview.text=@"";
    _verfylbl.text=@"";
ssnclck++;
    _segmntbtn.selectedSegmentIndex=0;
    Segmntcheck=1;
    if (!ssnclck%2) {
        
        [_ssnbtnlbl setImage:[UIImage imageNamed:@"RadioButton-UnSelected"] forState:UIControlStateNormal];
        
        
    }
    
    else{
        _type=@"SSN";
        
        [_ssnbtnlbl setImage:[UIImage imageNamed:@"RadioButton-Selected"] forState:UIControlStateNormal];
        [_i9btnlbl setImage:[UIImage imageNamed:@"RadioButton-UnSelected"] forState:UIControlStateNormal];
        [_bgbtnlbl setImage:[UIImage imageNamed:@"RadioButton-UnSelected"] forState:UIControlStateNormal];
        _cmmnttextview.editable=YES;
        [self SelectVerificationcomment];
        
    }
 
        
    
    
}
- (IBAction)savebtn:(id)sender {
   
    
    if (_type.length==0) {
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Select Verification" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
      
  }
    else{
        _verifybtnlbl.enabled=NO;
    [self InsertVerificationComments];
    }
    
}

- (IBAction)cancelbtn:(id)sender {
}

- (IBAction)uploadbtn:(id)sender {
    poptype=3;
    [self selectdocs];
    [self createpop];
   
}
-(void)createpop
{
     poptype=3;
        
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 120, 100)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 100)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 100);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popOverController.popoverContentSize=CGSizeMake(120.0f, 100.0f);
    self.popOverController=_popOverController;

    
    
//    UIButton *button = (UIButton *)sender;
//    
//    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
//    UITableView *table = (UITableView *)[cell superview];
//    NSIndexPath *IndexPath = [table indexPathForCell:cell];
    
    
    
    
    [self.popOverController presentPopoverFromRect:_uploadbtnlbl.frame
                                            inView:_I9view
                          permittedArrowDirections:UIPopoverArrowDirectionLeft
                                          animated:YES];
    

}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_requirementtable) {
        return [_requirementArray count];

        
    }
    
    
    if (tableView==_popOverTableView) {
        switch (poptype) {
            case 1:
                return [_monthArray count];
                break;
            case 2:
                return [_yearArray count];
                break;
            case 3:
                return [_docsarray count];
                break;
            case 4:
                return [_craftarray count];
                break;

            case 5:
                return [_jobsitearray count];
                break;

            default:
                break;
        }
    }
        // Return the number of rows in the section.
    return YES;
    }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
      
            
            
                 
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12.0f];
        
        if (tableView==_requirementtable){
        [[NSBundle mainBundle]loadNibNamed:@"requirmentcell" owner:self options:nil];
        cell=_verifctncell;
        }
    }
    
    if (tableView==_requirementtable){
           NSLog(@"indexPath row: %d",indexPath.row);
    Coursemdl*coursemdl1=(Coursemdl *)[_requirementArray objectAtIndex:indexPath.row];
    _reqiuremntnamelbl=(UILabel *)[cell viewWithTag:1];
   _reqiuremntnamelbl.text=coursemdl1.itemname;
    //NSLog(@"lbl%@",)
    button=(UIButton*)[cell viewWithTag:2];
    [button setTitle:coursemdl1.month forState:UIControlStateNormal];
    yearbutton=(UIButton *)[cell viewWithTag:3];
    
    [yearbutton setTitle:coursemdl1.year forState:UIControlStateNormal];
  
    }
    
    if (tableView==_popOverTableView) {
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
        
        switch (poptype) {
            case 1:
                cell.textLabel.text=[_monthArray objectAtIndex:indexPath.row];
                break;
            case 2:
                cell.textLabel.text=[_yearArray objectAtIndex:indexPath.row];
                break;
            case 3:
                cell.textLabel.text=[_docsarray objectAtIndex:indexPath.row];
                break;
            case 4:
                cell.textLabel.text=[_craftarray objectAtIndex:indexPath.row];
                break;

            case 5:
                cell.textLabel.text=[_jobsitearray objectAtIndex:indexPath.row];
                break;

        }
    }

            return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==_popOverTableView) {
        
        //Coursemdl*coursemdl2=(Coursemdl *)[_requirementArray objectAtIndex:textFieldIndexPath.row];
        
        switch (poptype) {
                
            case 1:
                
                //path=indexPath.row;
                [button setTitle:[_monthArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                
               // coursemdl2.month=button.titleLabel.text;
                
               // NSLog(@"_monthbtn.tag%@",coursemdl2.month);
                
                
                
                break;
            case 2:
                
                [yearbutton setTitle:[_yearArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                
                //coursemdl3.year=yearbutton.titleLabel.text;
                
                
                break;
                case 3:
                _doc=[_docspathDict objectForKey:[_docsarray objectAtIndex:indexPath.row]];
                NSLog(@"%@",_doc);
               // if (!self.webctrl) {
                    _webctrl=[[WebViewController alloc]initWithNibName:@"WebViewController" bundle:nil];
               // }
                _webctrl.docpdf=_doc;
                [self.navigationController pushViewController:_webctrl animated:YES];
                [self.popOverController dismissPopoverAnimated:YES];


                break;
            case 4:
                
                [_craftbtnlbl setTitle:[_craftarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                
                //coursemdl3.year=yearbutton.titleLabel.text;
                
                
                break;

            case 5:
                
                [_jobsitebtnlbl setTitle:[_jobsitearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                
                //coursemdl3.year=yearbutton.titleLabel.text;
                
                
                break;

                default:
                break;
        }
        [self.popOverController dismissPopoverAnimated:YES];
        
    }

    
       
}
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    //alternating cell back ground color
//           if (indexPath.row%2 == 0) {
//            [cell setBackgroundColor:[UIColor whiteColor]];
//            
//        }else
//        {
//            
//            //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
//            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
//            
//            
//        }
//    }
//

- (IBAction)Rsavebtn:(id)sender {
}

- (IBAction)Rcancelbtn:(id)sender {
}
- (void)viewDidUnload {
    [self setReqiuremntnamelbl:nil];
    [self setMonthbtnlbl:nil];
    [self setYearbtnlbl:nil];
    [self setVerifctncell:nil];
    [super viewDidUnload];
}

#pragma mark - Webservice
/*arvinices*/



-(void)FetchApplicantId{
    testint=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FetchApplicantId xmlns=\"http://ios.kontract360.com/\">\n"
                   "<applicant_Id>%d</applicant_Id>\n"
                   "</FetchApplicantId>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/FetchApplicantId" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectVerificationcomment{
      recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectVerificationcomment xmlns=\"http://ios.kontract360.com/\">\n"
                   "<Applicant_Id>%d</Applicant_Id>\n"
                   "<Type>%@</Type>\n"
                   "</SelectVerificationcomment>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_applicantid,_type];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectVerificationcomment" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)InsertVerificationComments{
    recordResults = FALSE;
    NSString *soapMessage;
    
//    if (ssnclck%2!=0) {
//        _type=@"SSN";
//    }
//    if (i9clck%2!=0) {
//        _type=@"I9";
//    }
//    if (bgclck%2!=0) {
//        _type=@"BackGround";
//    }
    NSString*newstrg=  [_cmmnttextview.text stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
    newstrg=  [newstrg stringByReplacingOccurrencesOfString:@"<" withString:@"&lt;"];
    newstrg=  [newstrg stringByReplacingOccurrencesOfString:@">" withString:@"&gt;"];
    newstrg=  [newstrg stringByReplacingOccurrencesOfString:@"'" withString:@"&#39;"];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertVerificationComments xmlns=\"http://ios.kontract360.com/\">\n"
                   "<Applicant_Id>%d</Applicant_Id>\n"
                   "<user_Id>%d</user_Id>\n"
                   "<comment>%@</comment>\n"
                   "<type>%@</type>\n"
                   "<Status>%d</Status>\n"
                   "</InsertVerificationComments>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_applicantid,[_useridname integerValue],newstrg,_type,Segmntcheck];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/InsertVerificationComments" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)selectrequirements{
    recordResults = FALSE;
    NSString *soapMessage;
    NSLog(@"Array%@",_Fetchdetailsarray);
   
    Verfymdl*verfy=(Verfymdl *)[_Fetchdetailsarray objectAtIndex:0];
    NSLog(@"%d",verfy.Selectedapplicantid);
    NSLog(@"%@",verfy.jobsiteid);
    NSLog(@"%@",verfy.craftid);

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertApplicantRequirements xmlns=\"http://arvin.kontract360.com/\">\n"
                   "<JobId>%d</JobId>\n"
                   "<CraftId>%d</CraftId>\n"
                   "<AppId>%d</AppId>\n"
                   "</InsertApplicantRequirements>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[verfy.jobsiteid integerValue],[verfy.craftid integerValue] ,verfy.Selectedapplicantid ];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/InsertApplicantRequirements" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)FetchImage{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
              
        //  NSString *imagename=[NSString stringWithFormat:@"Photo_%@.png",_ssntxtfld.text];
        
        
        // NSString *cmpnyname=@"arvin";
        
        soapMessage = [NSString stringWithFormat:
                       
                       @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                       "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                       
                       
                       "<soap:Body>\n"
                       
                       "<FetchImageHR xmlns=\"http://ios.kontract360.com/\">\n"
                       
                       "<appid>%d</appid>\n"
                       "<photo>%@</photo>\n"
                       "</FetchImageHR>\n"
                       "</soap:Body>\n"
                       "</soap:Envelope>\n",_applicantid,_photostring];
        NSLog(@"soapmsg%@",soapMessage);
        
        
        // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
         NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
        
        NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
        
        NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
        
        [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
        [theRequest addValue: @"http://ios.kontract360.com/FetchImageHR" forHTTPHeaderField:@"Soapaction"];
        
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
-(void)selectdocs
{
    poptype=3;
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   "<soap:Body>\n"
                   "<SelectDocs xmlns=\"http://arvin.kontract360.com/\">\n"
                   "<AppId>%d</AppId>\n"
                   "</SelectDocs>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/SelectDocs" forHTTPHeaderField:@"Soapaction"];
    
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


-(void)SelectAllCraft{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllCraft xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllCraft>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllCraft" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllJobSites{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllJobSites xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllJobSites>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllJobSites" forHTTPHeaderField:@"Soapaction"];
    
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
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
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
-(void)CustEmployeeselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustEmployeeselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</CustEmployeeselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustEmployeeselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EmployeeInsert{
    recordResults = FALSE;
    NSString *soapMessage;
    
    NSDate *daa=[NSDate date];
   
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString*hiredate = [dateFormat stringFromDate:daa];
    
    
    NSArray*array=[_jobsitebtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
    NSString*job=[NSString stringWithFormat:@"%@", [array objectAtIndex:0]];
   // jobsiteno=[[_jobsitedict objectForKey:job]integerValue];
    NSString*jobsiteid=[_jobsitedict objectForKey:job];


    Verfymdl *verfymdl=(Verfymdl *)[_Fetchdetailsarray objectAtIndex:0];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EmployeeInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<applicant_FirstName>%@</applicant_FirstName>\n"
                   "<applicant_LastName>%@</applicant_LastName>\n"
                   "<applicant_SSN>%@</applicant_SSN>\n"
                   "<applicant_Address>%@</applicant_Address>\n"
                   "<applicant_CellPhone>%@</applicant_CellPhone>\n"
                   "<applicant_phone>%@</applicant_phone>\n"
                   "<applicant_City>%@</applicant_City>\n"
                   "<applicant_State>%@</applicant_State>\n"
                   "<applicant_Zip>%@</applicant_Zip>\n"
                   "<applicant_DOB>%@</applicant_DOB>\n"
                   "<applicant_DrivingLicense>%@</applicant_DrivingLicense>\n"
                   "<hiredate>%@</hiredate>\n"
                   "<applicant_Gender>%@</applicant_Gender>\n"
                   "<Country_name>%@</Country_name>\n"
                   "<applicant_Email>%@</applicant_Email>\n"
                   "<NoOfDependence>%f</NoOfDependence>\n"
                   "<MaritalStatusId>%@</MaritalStatusId>\n"
                   "<craftcode>%@</craftcode>\n"
                   "<payrate>%f</payrate>\n"
                   "<notrate>%f</notrate>\n"
                   "<BadgeFlag>%d</BadgeFlag>\n"
                   "<job_id>%@</job_id>\n"
                   "</EmployeeInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",verfymdl.firstname,verfymdl.lastname,verfymdl.ssn,verfymdl.address,verfymdl.cellphone,verfymdl.Phonenumber,verfymdl.city,verfymdl.state,verfymdl.zip,verfymdl.dob,verfymdl.drivinglicence,hiredate,verfymdl.gender,verfymdl.country,verfymdl.email,[verfymdl.noofdependcies floatValue],verfymdl.maritalstatusid,[_craftdict objectForKey:_craftbtnlbl.titleLabel.text],[_payratetxtfld.text floatValue],[@"150" floatValue],0,jobsiteid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EmployeeInsert" forHTTPHeaderField:@"Soapaction"];
    
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
    
    if (testint==1) {
        
     //   [self FetchImage];
       // [self selectrequirements];
        testint=3;
    }
    if (webtype==222) {
        
        if ([verifytype isEqualToString:@"SSN"]) {
            
            _segmntbtn.selectedSegmentIndex=ssnsegmentcheck;
            _segmntbtn.userInteractionEnabled=NO;
        }
       else if ([verifytype isEqualToString:@"I9"]) {
           _segmntbtn.selectedSegmentIndex=I9segmentcheck;
             _segmntbtn.userInteractionEnabled=NO;
        }
       else if ([verifytype isEqualToString:@"BackGround"]) {
             _segmntbtn.selectedSegmentIndex=bgsegmentcheck;
            _segmntbtn.userInteractionEnabled=YES;
           
       }

        webtype=0;
    }
    
    
    [_requirementtable reloadData];
    
    [_popOverTableView reloadData];
    }


#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"FetchApplicantIdResult"])
    {
        _Fetchdetailsarray=[[NSMutableArray alloc]init];
                if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"applicant_Id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_FirstName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_LastName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_SSN"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"applicant_CellPhone"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_Address"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_City"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_State"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_Zip"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_DOB"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_phone"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"applicant_DrivingLicense"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_Gender"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_HiredDate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"country_name"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"applicant_Email"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"NoOfDependents"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"MaritalStatusId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    



    if([elementName isEqualToString:@"applicant_Skill"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }


   if([elementName isEqualToString:@"NameSuffix"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"jobSite_Id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_SafetyCouncilExpiry"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_BackgroundStatus"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_SSNStatus"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"applicant_OtherCrafts"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"applicant_I9Status"])
    {
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SSNStatus"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"BGStatus"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"I9Status"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Code"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"Type"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ApplyToAllCraft"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"applicant_photo"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;

        
    }

    
    if([elementName isEqualToString:@"HaveExpiryDate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"expir_date"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"course_status"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    
    if([elementName isEqualToString:@"FetchImageResult"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    
    if([elementName isEqualToString:@"url"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ApplicantID"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SelectVerificationcommentResult"])
    {
        webtype=222;
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

    if([elementName isEqualToString:@"User_Id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UserName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Comment"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"VerificationSSNStatus"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"VeriI9status"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"VeriBGstatus"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"SelectAllCraftResult"])
    {
        _craftarray=[[NSMutableArray alloc]init];
        _craftdict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    if([elementName isEqualToString:@"id"])
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
    
    if([elementName isEqualToString:@"SelectAllJobSitesResult"])
    {
        _jobsitearray=[[NSMutableArray alloc]init];
        _jobsitedict=[[NSMutableDictionary alloc]init];
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
    
    
    if([elementName isEqualToString:@"JobSiteName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"AllSkillsResult"])
    {
        _skillarray=[[NSMutableArray alloc]init];
        _skilldict=[[NSMutableDictionary alloc]init];
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
    
    if([elementName isEqualToString:@"EmployeeInsertResult"])
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
    if([elementName isEqualToString:@"Vtype"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobsSelectResponse"])
    {
        _jobsitedict=[[NSMutableDictionary alloc]init];
        _jobsitearray=[[NSMutableArray alloc]init];
        
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
    if([elementName isEqualToString:@"applicant_Id"])
    {
        recordResults = FALSE;
          _verfymdl=[[Verfymdl alloc]init];
        _verfymdl.applicantid=[_soapResults integerValue];

//        if (_applicantid==[_soapResults integerValue]) {
//                          _verfymdl=[[Verfymdl alloc]init];
//            _verfymdl.Selectedapplicantid=[_soapResults integerValue];
//            
//_verfymdl.applicantid=[_soapResults integerValue];
//            
//        }
//        else{
//        _verfymdl.applicantid=[_soapResults integerValue];
//        }
                        _soapResults = nil;
    }
       if([elementName isEqualToString:@"applicant_FirstName"])
    {
        recordResults = FALSE;
       
        _verfymdl.firstname=_soapResults;
        _firstnametxtfld.text=_verfymdl.firstname;
        _namefirsttxtfld.text=_verfymdl.firstname;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_LastName"])
    {
        recordResults = FALSE;
             _verfymdl.lastname=_soapResults;
        _lastnametxtfld.text= _verfymdl.lastname;
        _namelasttxtfld.text= _verfymdl.lastname;
        
                _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_SSN"])
    {
        recordResults = FALSE;
                _verfymdl.ssn=_soapResults;
        _ssntxtfld.text=  _verfymdl.ssn;
        _jobssntxtfld.text= _verfymdl.ssn;

        
      
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"applicant_CellPhone"])
    { recordResults = FALSE;
       
        _verfymdl.cellphone=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_Address"])
    {
        recordResults = FALSE;
       
        _verfymdl.address=_soapResults;
        _Addresstxtfld.text=  _verfymdl.address;
        
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"applicant_City"])
    {
        recordResults = FALSE;
        
        _verfymdl.city=_soapResults;
        _citytxtfld.text=_verfymdl.city;
        
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"applicant_photo"])
    {
        recordResults = FALSE;
        _photostring=_soapResults;
          [self FetchImage];
        _soapResults = nil;
        
    }

    if([elementName isEqualToString:@"applicant_State"])
    {
        recordResults = FALSE;
     
        _verfymdl.state=_soapResults;
        _statetxtfld.text= _verfymdl.state;
        
        _soapResults = nil;
        

        
    }
    if([elementName isEqualToString:@"applicant_Zip"])
    {
        recordResults = FALSE;
              _verfymdl.zip=_soapResults;
        _ziptextfld.text=_verfymdl.zip;
        
        _soapResults = nil;
        

        
    }
    if([elementName isEqualToString:@"applicant_DOB"])
    {
        recordResults = FALSE;
        NSArray *array=[_soapResults componentsSeparatedByString:@"T"];
        NSString *date1 =[array objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        
        NSDate *dates = [dateFormat dateFromString:date1];
                [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];
        _verfymdl.dob=_soapResults;
        _jobdobtxtfld.text=myFormattedDate;

          _soapResults = nil;

        
    }
    if([elementName isEqualToString:@"applicant_phone"])
    {
        recordResults = FALSE;
        
        _verfymdl.Phonenumber=_soapResults;
        
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"applicant_DrivingLicense"])
    {
        recordResults = FALSE;
        
        _verfymdl.drivinglicence=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"applicant_Gender"])
    {
        recordResults = FALSE;
        
        _verfymdl.gender=_soapResults;
        
        _soapResults = nil;

        
    }
    if([elementName isEqualToString:@"applicant_HiredDate"])
    {
        recordResults = FALSE;
        
        _verfymdl.hireddate=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"country_name"])
    {
        recordResults = FALSE;
        
        _verfymdl.country=_soapResults;
        
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"applicant_Email"])
    {
        recordResults = FALSE;
        
        _verfymdl.email=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"NoOfDependents"])
    {
        recordResults = FALSE;
        
        _verfymdl.noofdependcies=_soapResults;
        
        _soapResults = nil;

        
    }
    
    if([elementName isEqualToString:@"MaritalStatusId"])
    {
        recordResults = FALSE;
        
        _verfymdl.maritalstatusid=_soapResults;
        
        _soapResults = nil;
        
    }

    if([elementName isEqualToString:@"applicant_Skill"])
    {
      recordResults = FALSE;
    
        _skilltxtfld.text=[_skilldict objectForKey:_soapResults];
        NSLog(@"skillllll%@",[_skilldict objectForKey:_soapResults]);
        _soapResults = nil;

        
    }

        if([elementName isEqualToString:@"NameSuffix"])
    {
        recordResults = FALSE;
             _verfymdl.suffix=_soapResults;
        _suffixtxtfld.text=_verfymdl.suffix;
        
        
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"jobSite_Id"])
    {
        recordResults = FALSE;
             _verfymdl.jobsiteid=_soapResults;
        
        _soapResults = nil;
             
    }
    if([elementName isEqualToString:@"applicant_SafetyCouncilExpiry"])
    {
        recordResults = FALSE;
        
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"applicant_BackgroundStatus"])
    {
        recordResults = FALSE;
        
         _verfymdl.applicantbgstatus=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"applicant_SSNStatus"])
    {
        recordResults = FALSE;
        _verfymdl.applicantssnstatus=_soapResults;
        
        _soapResults = nil;
        
    }


    if([elementName isEqualToString:@"applicant_OtherCrafts"])
    {
       recordResults = FALSE;
           NSLog(@"Appid%d",_verfymdl.applicantid);
          NSLog(@"Appid%d",_applicantid);

       
//        if (_applicantid==  _verfymdl.applicantid) {
//        _verfymdl.craftid=_soapResults;
//       
//              [_Fetchdetailsarray addObject:_verfymdl];
//              NSLog(@"%d",_verfymdl.applicantid);
//              NSLog(@"%d",_verfymdl.Selectedapplicantid);
//              NSLog(@"%@",_verfymdl.jobsiteid);
//             NSLog(@"%@",_verfymdl.craftid);
//            
//            NSLog(@"%@",_Fetchdetailsarray);
//            
//        }
        
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"applicant_I9Status"])
    {
        recordResults = FALSE;
      
     _verfymdl.applicanti9status=_soapResults;
        
         _soapResults = nil;
    
    }
    
    
    if([elementName isEqualToString:@"BGStatus"])
    {
        recordResults = FALSE;
        
        _verfymdl.bgstatus=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SSNStatus"])
    {
        recordResults = FALSE;
        
        _verfymdl.ssnstatus=_soapResults;
      
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"I9Status"])
    {
        
        recordResults = FALSE;
        
        _verfymdl.i9status=_soapResults;
        [_Fetchdetailsarray addObject:_verfymdl];
        if ([_verfymdl.applicantssnstatus isEqualToString:@"true"]&&[_verfymdl.applicantbgstatus isEqualToString:@"true"]&&[_verfymdl.applicanti9status isEqualToString:@"true"]) {
            if ([_verfymdl.ssnstatus isEqualToString:@"true"]&&[_verfymdl.bgstatus isEqualToString:@"true"]&&[_verfymdl.i9status isEqualToString:@"true"]) {
               _veryimgevw.image=[UIImage imageNamed:@"process"];
                
                _veryimgevw.hidden=NO;
                _verifiedcmpldlbl.hidden=NO;
            }
            else{
              
                _veryimgevw.image=[UIImage imageNamed:@"failed"];
                _veryimgevw.hidden=NO;
                _verifiedcmpldlbl.hidden=NO;

            }
            
        }
        else{
            _veryimgevw.hidden=YES;
            _verifiedcmpldlbl.hidden=YES;
        }
        
        _soapResults = nil;
    }


    if([elementName isEqualToString:@"Requirement_Id"])
    {
        _coursemdl=[[Coursemdl alloc]init];
        recordResults = FALSE;
        _coursemdl.reqid=[_soapResults integerValue];
        
        _soapResults=nil;
    }
    
    
    if([elementName isEqualToString:@"ItemName"])
    {
        recordResults = FALSE;
        _coursemdl.itemname=_soapResults;
        _soapResults=nil;
    }
    
    if([elementName isEqualToString:@"Code"])
    {
        recordResults = FALSE;
        _coursemdl.Code=_soapResults;
        
        _soapResults=nil;
    }
    
    if([elementName isEqualToString:@"Type"])
    {
        recordResults = FALSE;
        _coursemdl.Type=_soapResults;
        
        _soapResults=nil;
        
    }
    
   
    if([elementName isEqualToString:@"ApplyToAllCraft"])
    {
        recordResults = FALSE;
        
        _coursemdl.ApplyToAllCraft=_soapResults;
        _soapResults=nil;    }
    
    if([elementName isEqualToString:@"HaveExpiryDate"])
    {
        recordResults = FALSE;
        _coursemdl.HaveExpiryDate=_soapResults;
        
        
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"expir_date"])
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
        // _drugmdl.drugdate=
        
        
        _coursemdl.expdate=myFormattedDate;
        NSArray*newarray=[myFormattedDate componentsSeparatedByString:@"-"];
        //        _coursemdl.month=[newarray objectAtIndex:0];
        //        _coursemdl.year=[newarray objectAtIndex:2];
        _coursemdl.month=[_remonthDictionary objectForKey:[newarray objectAtIndex:0]];
        _coursemdl.year=[newarray objectAtIndex:2];
        
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"course_status"])
    {
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"true"]) {
            _coursemdl.course_status=1;
            
        }
        
        else if ([_soapResults isEqualToString:@"false"]){
            _coursemdl.course_status=0;
            
        }
        
        [_requirementArray addObject:_coursemdl];
        NSLog(@"mdl%@",_requirementArray);
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"ApplicantID"])
    {
        recordResults = FALSE;
        
      //  [_imageArraydict setObject:_newid forKey:_soapResults];
        
        
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"url"])
    {
        
        recordResults = FALSE;
      //  _newid=_soapResults;
        
        
          NSData *data1=[_soapResults base64DecodedData];
        
      
        UIImage *image1=[[UIImage alloc]initWithData:data1];
        
        //[NSData dataWithData:UIImagePNGRepresentation(image.image)];
        CGSize newsize=CGSizeMake(192, 110);
        UIGraphicsBeginImageContext(newsize);
        [image1 drawInRect:CGRectMake(0,0,newsize.width,newsize.height)];
        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        _profileimg.image=newImage;
        _activityview.hidden=YES;
        [_activityview stopAnimating];


        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Column1"])
    {
        recordResults=FALSE;
        NSLog(@"key%@",_soapResults);
        docsstring=_soapResults;

       
        _soapResults=nil;
    }

    if([elementName isEqualToString:@"FolderName"])
    {
        recordResults=FALSE;
        [_docsarray addObject:_soapResults];
         [_docspathDict setObject:docsstring forKey:_soapResults];
        NSLog(@"soap%@",_soapResults);
        _soapResults=nil;
    }

    
    
    if([elementName isEqualToString:@"EntryId"])
    {
        recordResults=FALSE;
        _soapResults=nil;

    }
    if([elementName isEqualToString:@"Applicant_Id"])
    {
        recordResults=FALSE;
        _soapResults=nil;
        
    }

    
    if([elementName isEqualToString:@"User_Id"])
    {
        recordResults=FALSE;
        
       // _verfylbl.text=[_userdict objectForKey:_soapResults];
        
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"UserName"])
    {
        recordResults=FALSE;
        
        _verfylbl.text=_soapResults;
        
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"Vtype"])
    {
        recordResults=FALSE;
        verifytype=_soapResults;
        
       _soapResults=nil;
        
    }

    if([elementName isEqualToString:@"Comment"])
    {
        recordResults=FALSE;
        if ([_type isEqualToString:@"BackGround"]) {
            
            _cmmnttextview.editable=YES;
            _cmmnttextview.text=_soapResults;
            _verifybtnlbl.enabled=YES;

        }
        else{
            _cmmnttextview.editable=NO;
            _cmmnttextview.text=_soapResults;
            _verifybtnlbl.enabled=NO;

        }
        
        
        
        _soapResults=nil;
    }
    
    if([elementName isEqualToString:@"VerificationSSNStatus"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            ssnsegmentcheck=0;
            
        }
        else{
            ssnsegmentcheck=1;
        }
        
        
        
        _soapResults=nil;
        
    }
    
    if([elementName isEqualToString:@"VeriI9status"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            
            I9segmentcheck=0;
            
        }
        else{
            
             I9segmentcheck=1;
        }

        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"VeriBGstatus"])
    {
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"true"]) {
            bgsegmentcheck=0;
            
        }
        else{
            bgsegmentcheck=1;
        }

        
        _soapResults=nil;
        
    }

    if([elementName isEqualToString:@"id"])
    {
        recordResults=FALSE;
        _crftid=_soapResults;
        jobid=_soapResults;
        _soapResults=nil;
    }
    
    
    if([elementName isEqualToString:@"Description"])
    {
        recordResults=FALSE;
        [_craftdict setObject:_crftid forKey:_soapResults];
        [_craftarray addObject:_soapResults];
        _soapResults=nil;
    }
    

//    if([elementName isEqualToString:@"Id"])
//    {
//        recordResults=FALSE;
//        _jobsiteid=_soapResults;
//        _soapResults=nil;
//    }
//    
//    
//    if([elementName isEqualToString:@"JobSiteName"])
//    {
//        recordResults=FALSE;
//        [_jobsitearray addObject:_soapResults];
//        [_jobsitedict setObject:_jobsiteid forKey:_soapResults];
//        _soapResults=nil;
//    }

    if([elementName isEqualToString:@"SkillId"])
    {
        recordResults=FALSE;
        _skillid=_soapResults;
        _soapResults=nil;
    }
    
    if([elementName isEqualToString:@"SkillName"])
    {
        recordResults=FALSE;
        [_skillarray addObject:_soapResults];
        [_skilldict setObject:_soapResults forKey:_skillid];
         [_jobsitearray addObject:[NSString stringWithFormat:@"%@-%@-%@",jobsitename,jobstring,_soapResults]];
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"result"])
    {
          recordResults=FALSE;
        _result=_soapResults;
        UIAlertView*alertview=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertview show];
        
          _soapResults=nil;
    }
//    if([elementName isEqualToString:@"id"])
//    {
//        
//        
//        recordResults = FALSE;
//        
//        
//        _soapResults = nil;
//    }
    
    if([elementName isEqualToString:@"JobNumber"])
    {
        recordResults = FALSE;
        jobstring=_soapResults;
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
        [_jobsitedict setObject:jobid forKey:_soapResults];
        //[_revjobdict setObject:_soapResults forKey:jobstring];
        
        // [_jobarray addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobSkillId"])
    {
        recordResults = FALSE;
        _soapResults = nil;
    }


}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ////NSLog(@"buttonIndex%d",buttonIndex);
    
    if ([alertView.message isEqualToString:@"Verified Successfully"]) {
        
        
        
        if (buttonIndex==0)
        {
            [self SelectVerificationcomment];
            [self FetchApplicantId];
            _verifybtnlbl.enabled=YES;
           
//            if ([self.delegate respondsToSelector:@selector(newaction)])
//            {
//                [self.delegate newaction];
//                //[self dismissViewControllerAnimated:YES completion:NULL];
//                
//                
//            }

        }
    }
    
    else{
         _movebtnlbl.enabled=YES;
        if ([self.delegate respondsToSelector:@selector(newaction)])
        {
            [self.delegate newaction];
            [self dismissViewControllerAnimated:YES completion:NULL];
            
            
        }

        
    }
}


#pragma mark-popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 250, 250)];
    //200,250
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 250, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    //_popOverTableView.separatorColor=[UIColor cyanColor];
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(250, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    self.popOverController.popoverContentSize=CGSizeMake(250.0f, 250.0f);
    self.popOverController=_popOverController;
    
    
    if (poptype==5) {
        
[self.popOverController presentPopoverFromRect:_jobsitebtnlbl.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    }
    
    
    if (poptype==4) {
        
        [self.popOverController presentPopoverFromRect:_craftbtnlbl.frame
                                                inView:self.view
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }
    

}

#pragma mark-Button Actions

- (IBAction)monthbtn:(id)sender {
    poptype=1;
    
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 60, 250)];
    //200,250
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 60, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorColor=[UIColor cyanColor];
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(60, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                               initWithContentViewController:popoverContent];
    self.popOverController.popoverContentSize=CGSizeMake(60.0f, 250.0f);
    self.popOverController=_popOverController;
    
    
    button = (UIButton *)sender;
    
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    
    
    
    [self.popOverController presentPopoverFromRect:_monthbtnlbl.frame
                                             inView:cell
                           permittedArrowDirections:UIPopoverArrowDirectionUp
                                           animated:YES];

    
}

- (IBAction)yearbtn:(id)sender {
    poptype=2;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 60, 250)];
    //200,250
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 60, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorColor=[UIColor cyanColor];
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(60, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                               initWithContentViewController:popoverContent];
    
    self.popOverController.popoverContentSize=CGSizeMake(60.0f, 250.0f);
    self.popOverController=_popOverController;
    yearbutton = (UIButton *)sender;
    
    UITableViewCell *cell = (UITableViewCell *)[[yearbutton superview] superview];
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_yearbtnlbl.frame
                                             inView:cell
                           permittedArrowDirections:UIPopoverArrowDirectionUp
                                           animated:YES];

}


- (IBAction)clsebtn:(id)sender {
    _verifybtnlbl.enabled=YES;
    _movebtnlbl.enabled=YES;
    if ([self.delegate respondsToSelector:@selector(newaction)])
    {
        [self.delegate newaction];
        [self dismissViewControllerAnimated:YES completion:NULL];
        
        
    }

}
- (IBAction)dobbtn:(id)sender {
}

- (IBAction)craftbtn:(id)sender {
    poptype=4;
    [self createpopover];
    [self SelectAllCraft];
}

- (IBAction)jobsitebtn:(id)sender {
     poptype=5;
    [self resignFirstResponder];
    [self createpopover];
    //[self SelectAllJobSites];
    [self JobsSelect];
}

- (IBAction)movebtn:(id)sender {
    
    Validation*val=[[Validation alloc]init];
    int value1=[val isNumeric:_payratetxtfld.text];
    if(value1==0)
    {
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter a valid rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert1 show];
        _payratetxtfld.text=@"";
        
        
    }
    else{
        _movebtnlbl.enabled=NO;
    [self EmployeeInsert];
    }
}
- (IBAction)segmntbtn:(id)sender {
    NSLog(@"%d", _segmntbtn.selectedSegmentIndex);
    if (_segmntbtn.selectedSegmentIndex==0) {
      
        Segmntcheck=1;
        
    }
    else if (_segmntbtn.selectedSegmentIndex==1){
      
        Segmntcheck=0;

    }
}
@end
