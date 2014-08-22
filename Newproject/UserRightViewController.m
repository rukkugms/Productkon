//
//  UserRightViewController.m
//  Newproject
//
//  Created by Riya on 8/21/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "UserRightViewController.h"

@interface UserRightViewController ()

@end

@implementation UserRightViewController

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
    _usertable.layer.borderWidth=3.0;
    _usertable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
 
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-popover
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
    
    
    
    
    
    switch (popover) {
        case 1:
            [self.popOverController presentPopoverFromRect:_userbtn.frame
                                                    inView:self.view
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];

            break;
        case 2:
            [self.popOverController presentPopoverFromRect:_masterbtn.frame
                                                    inView:self.view
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            break;
        case 3:
            [self.popOverController presentPopoverFromRect:_subbtnlbl.frame
                                                    inView:self.view
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            break;
        case 4:
            [self.popOverController presentPopoverFromRect:_subsubbtnlbl.frame
                                                    inView:self.view
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            break;

        default:
            break;
            
            }
    
    
    
    
}

#pragma mark-WebServices
-(void)AllUsersselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<AllUsersselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</AllUsersselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/AllUsersselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)Mainmoduleselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Mainmoduleselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</Mainmoduleselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Mainmoduleselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)Submoduleselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Submoduleselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<subof>%d</subof>\n"
                   "</Submoduleselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_maintiledict objectForKey:[_maintilearray objectAtIndex:path]]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Submoduleselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)SubSubmoduleselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SubSubmoduleselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<subof>%d</subof>\n"
                   "</SubSubmoduleselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_subtiledict objectForKey:[_subtilearray objectAtIndex:path]]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SubSubmoduleselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)UserRightsselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserRightsselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "</UserRightsselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_userdict objectForKey:[_userarray objectAtIndex:userpath]]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserRightsselect" forHTTPHeaderField:@"Soapaction"];
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
    [_popOverTableView reloadData];
    [_usertable reloadData];
    
}

#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        switch (popover) {
            case 1:
                 return [_userarray count];
                break;
            case 2:
                return [_maintilearray count];
                break;
            case 3:
                return [_subtilearray count];
                break;
                
            case 4:
                return [_subsubtilearray count];
                break;


            default:
                break;
        }
       
    }
    else{
        return [_usertablearray count];
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
         if (tableView==_usertable) {
        [[NSBundle mainBundle]loadNibNamed:@"Userrightscell" owner:self options:nil];
        cell=_usercell;
         }
    }
    
    if (tableView==_popOverTableView) {
        switch (popover) {
            case 1:
                 cell.textLabel.text=[_userarray objectAtIndex:indexPath.row];
                break;
            case 2:
                cell.textLabel.text=[_maintilearray objectAtIndex:indexPath.row];
                break;
            case 3:
                cell.textLabel.text=[_subtilearray objectAtIndex:indexPath.row];
                break;
            case 4:
                cell.textLabel.text=[_subsubtilearray objectAtIndex:indexPath.row];
                break;
            default:
                break;
        }
       
    }
    
      if (tableView==_usertable) {
          UserRightsmdl*usrmdl=(UserRightsmdl *)[_usertablearray objectAtIndex:indexPath.row];
            _namelbl=(UILabel *)[cell viewWithTag:1];
          _namelbl.text=[_revuserdict objectForKey:usrmdl.userid];
          _companylbl=(UILabel *)[cell viewWithTag:2];
          _companylbl.text=[_revmaintiledict objectForKey:usrmdl.moduleid];
          
          if ([usrmdl.viewrights isEqualToString:@"true"]) {
              
               [_viewbtnlbl setImage:[UIImage imageNamed:@"RadioButton-Selected"] forState:UIControlStateNormal];
          }
          else{
                [_viewbtnlbl setImage:[UIImage imageNamed:@"RadioButton-Unselected"] forState:UIControlStateNormal];
          }
          if ([usrmdl.editrights isEqualToString:@"true"]) {
              [_editbtnlbl setImage:[UIImage imageNamed:@"RadioButton-Selected"] forState:UIControlStateNormal];
          }
          else{
              [_editbtnlbl setImage:[UIImage imageNamed:@"RadioButton-Unselected"] forState:UIControlStateNormal];
          }
          if ([usrmdl.deleterights isEqualToString:@"true"]) {
              [_deletebtnlbl setImage:[UIImage imageNamed:@"RadioButton-Selected"] forState:UIControlStateNormal];
          }
          else{
              [_deletebtnlbl setImage:[UIImage imageNamed:@"RadioButton-Unselected"] forState:UIControlStateNormal];
          }
          if ([usrmdl.printrightes isEqualToString:@"true"]) {
              [_printbtnlbl setImage:[UIImage imageNamed:@"RadioButton-Selected"] forState:UIControlStateNormal];
          }
          else{
              [_printbtnlbl setImage:[UIImage imageNamed:@"RadioButton-Unselected"] forState:UIControlStateNormal];
          }


          
      }
    
    
    return cell;
    
    
}
#pragma mark-Tableview datasources
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
   
    if (tableView==_usertable) {
        
    
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
    
     path=indexPath.row;
    
    if (tableView==_popOverTableView) {
        switch (popover) {
            case 1:
                userpath=indexPath.row;
                [_userbtn setTitle:[_userarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
               
                break;
            case 2:
               [_masterbtn setTitle:[_maintilearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                 [self UserRightsselect];
                break;
            case 3:
                 [_subbtnlbl setTitle:[_subtilearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                break;
            case 4:
                [_subsubbtnlbl setTitle:[_subsubtilearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                break;

            default:
                break;

        
        
}
    [self.popOverController dismissPopoverAnimated:YES];
}
}

#pragma mark - XML Parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"AllUsersselectResponse"])
    {
        _userarray=[[NSMutableArray alloc]init];
        _userdict=[[NSMutableDictionary alloc]init];
        _revuserdict=[[NSMutableDictionary alloc]init];
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
    if([elementName isEqualToString:@"UserName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"MainmoduleselectResponse"])
    {
        _maintilearray=[[NSMutableArray alloc]init];
        _maintiledict=[[NSMutableDictionary alloc]init];
         _revmaintiledict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ModuleId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ModuleName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ModuleName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SubmoduleselectResponse"])
    {
        _subtilearray=[[NSMutableArray alloc]init];
        _subtiledict=[[NSMutableDictionary alloc]init];
        _revsubtiledict=[[NSMutableDictionary alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"submoduleId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"submodulename"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SubSubmoduleselectResponse"])
    {
        _subsubtilearray=[[NSMutableArray alloc]init];
        _subsubtiledict=[[NSMutableDictionary alloc]init];
         _revsubsubtiledict=[[NSMutableDictionary alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"subsubmoduleId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"subsubmodulename"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UserRightsselectResponse"])
    {
        _usertablearray=[[NSMutableArray alloc]init];
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
    
    if([elementName isEqualToString:@"UserUserId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UserModuleId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ViewModule"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EditModule"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DeleteModule"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PrintModule"])
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
    if([elementName isEqualToString:@"UserId"])
    {
        
        recordResults = FALSE;
        userid=_soapResults;
        
       _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"UserName"])
    {
        
        recordResults = FALSE;
        [_userdict setObject:userid forKey:_soapResults];
        [_revuserdict setObject:_soapResults forKey:userid];
        [_userarray addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ModuleId"])
    {
        
        recordResults = FALSE;
        mainid=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"ModuleName"])
    {
        
         recordResults = FALSE;
        [_maintiledict setObject:mainid forKey:_soapResults];
        [_revmaintiledict setObject:_soapResults forKey:mainid];
        [_maintilearray addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"submoduleId"])
    {
        
       recordResults = FALSE;
        subid=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"submodulename"])
    {
        
        recordResults = FALSE;
        NSArray*array=[_soapResults componentsSeparatedByString:@"->"];
        
        [_subtilearray addObject:[array objectAtIndex:1]];
        [_subtiledict setObject:subid forKey:[array objectAtIndex:1]];
        [_revsubtiledict setObject:[array objectAtIndex:1] forKey:subid];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"subsubmoduleId"])
    {
        
        recordResults = FALSE;
        subsubid=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"subsubmodulename"])
    {
        
        recordResults = FALSE;
        NSArray*array=[_soapResults componentsSeparatedByString:@"->"];
        
        [_subsubtilearray addObject:[array objectAtIndex:2]];
        [_subsubtiledict setObject:subid forKey:[array objectAtIndex:2]];
          [_revsubsubtiledict setObject:[array objectAtIndex:2] forKey:subid];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryId"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"UserUserId"])
    {
        _usermdl=[[UserRightsmdl alloc]init];
        recordResults = FALSE;
        _usermdl.userid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"UserModuleId"])
    {
        recordResults = FALSE;
        _usermdl.moduleid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ViewModule"])
    {
        
        recordResults = FALSE;
        _usermdl.viewrights=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EditModule"])
    {
        
        recordResults = FALSE;
        _usermdl.editrights=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"DeleteModule"])
    {
        
        recordResults = FALSE;
        _usermdl.deleterights=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"PrintModule"])
    {
        
        recordResults = FALSE;
        _usermdl.printrightes=_soapResults;
        [_usertablearray addObject:_usermdl];
        
        _soapResults = nil;

    }

    
}
#pragma mark-IBActions
- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)userbtn:(id)sender {
     popover=1;
    [self createpopover];
    [self AllUsersselect];
}

- (IBAction)masterbtn:(id)sender {
    popover=2;
    [self createpopover];
    [self Mainmoduleselect];
}

- (IBAction)subbtn:(id)sender {
    popover=3;
    [self createpopover];
    [self Submoduleselect];

}

- (IBAction)subsubbtn:(id)sender {
    popover=4;
    [self createpopover];
    [self SubSubmoduleselect];
}

- (IBAction)allviewcheckbtn:(id)sender {
}

- (IBAction)alleditcheckbtn:(id)sender {
}

- (IBAction)Alldeletecheckbtn:(id)sender {
}

- (IBAction)Allprintcheckbtn:(id)sender {
}

- (IBAction)viewbtn:(id)sender {
}

- (IBAction)editbtn:(id)sender {
}

- (IBAction)deletebtn:(id)sender {
}

- (IBAction)printbtn:(id)sender {
}
@end
