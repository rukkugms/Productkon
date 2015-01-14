//
//  NewCustmrViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 3/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "NewCustmrViewController.h"

@interface NewCustmrViewController ()

@end

@implementation NewCustmrViewController

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
        self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226.0/255.0f blue:226.0/255.0f alpha:1.0f];
    self.addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226.0/255.0f blue:226.0/255.0f alpha:1.0f];

    
        _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.navgtnbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _custmrtable.layer.borderWidth = 2.0;
    _custmrtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.addnavbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _addresstxtview.layer.borderWidth = 2.0;
    _addresstxtview.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
  [[self.addresstxtview layer] setCornerRadius:10];

    
   
    _popoverArry=[[NSMutableArray alloc]initWithObjects:@"Contact Info",@"Sales Rep Info", nil];

    _addview.hidden=YES;

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _SearchingBar.text=@"";
    _addview.hidden=YES;
    if (_frmplan==1) {
        _searchstring=_planorganztn;
        [self Stateselect];
        [self countryselect];
        [self CustomerMaster1Search];
        
        /*searchbar*/
        _SearchingBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
        _SearchingBar.delegate = (id)self;
        _SearchingBar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
        self.custmrtable.tableHeaderView=_SearchingBar;
        
        UISearchDisplayController * searchdisplaycontroller=[[UISearchDisplayController alloc]initWithSearchBar:_SearchingBar contentsController:self];
        searchdisplaycontroller.searchResultsDataSource=(id)self;
        searchdisplaycontroller.searchResultsDelegate=(id)self;
        searchdisplaycontroller.delegate=(id)self;

         searchdisplaycontroller.searchBar.text=_planorganztn;
           }
    else
    {
        [self Stateselect];
        [self countryselect];
         [self CustomerMasterselect];
        /*searchbar*/
        _SearchingBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
        _SearchingBar.delegate = (id)self;
        _SearchingBar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
        self.custmrtable.tableHeaderView=_SearchingBar;
        
        UISearchDisplayController * searchdisplaycontroller=[[UISearchDisplayController alloc]initWithSearchBar:_SearchingBar contentsController:self];
        searchdisplaycontroller.searchResultsDataSource=(id)self;
        searchdisplaycontroller.searchResultsDelegate=(id)self;
        searchdisplaycontroller.delegate=(id)self;
        
       // searchdisplaycontroller.searchBar.text=_planorganztn;

    }

   
    //[_cuntrybtnlbl setTitle:[_countryarray objectAtIndex:214] forState:UIControlStateNormal];

   
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
    if(tableView==_popOverTableView)
    
    {
        switch (poptype) {
            case 1:
                 return [_statearray count];
                break;
            case 2:
                return [_countryarray count];
                break;
            case 3:
                return [_popoverArry count];
                break;

            default:
                break;
        }
       
        
         }
    if(tableView==_custmrtable)
    {
       

    return [_customerarray count];
    }
    
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if(tableView==_custmrtable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"Customercell" owner:self options:nil];
            cell=_custmrcell;
            
            
        }
    }
    //cell.textLabel.text=@"Customer Name";
    if(tableView==_popOverTableView)
    {  cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
      
        switch (poptype) {
            case 1:
             cell.textLabel.text=[_statearray objectAtIndex:indexPath.row];
                break;
            case 2:
                  cell.textLabel.text=[_countryarray objectAtIndex:indexPath.row];
                
                break;
            case 3:
                cell.textLabel.text=[_popoverArry objectAtIndex:indexPath.row];
                
                break;
            default:
                break;

        
    }
    }
    if(tableView==_custmrtable)
    {
        Custmermdl *custmd=(Custmermdl *)[_customerarray objectAtIndex:indexPath.row];
        _namelbl=(UILabel *)[cell viewWithTag:1];
        _namelbl.text=custmd.customername;
        _citylbl= (UILabel *)[cell viewWithTag:2];
        _citylbl.text=custmd.city;
        _statelbl=(UILabel *)[cell viewWithTag:3];
        _statelbl.text=[_revstatedict objectForKey:custmd.state];
        _cuntrylbl=(UILabel *)[cell viewWithTag:4];
        _cuntrylbl.text=[_revcountrydict objectForKey:custmd.country];
        _phonelbl=(UILabel *)[cell viewWithTag:5];
        _phonelbl.text=custmd.phone;
        _emaillbl=(UILabel *)[cell viewWithTag:6];
        _emaillbl.text=custmd.email;
        
        
        
        
        
    }
    
    
    
    
    
      
    

    return cell;

    
}
#pragma mark-Tableview delegates
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
}
    
    

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_custmrtable)
    {
        if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
            
        }else
        {
            
            //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
            [cell setBackgroundColor:[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f]];
        }
    }
    else
    {
        
    }
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [self UserLogmaindelete];
        deletepath=indexPath.row;
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        
        
        if (rightsmodel.DeleteModule==0) {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to delete a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        else
        {

        [self CustomerMaster1Delete];
        [_customerarray removeObject:indexPath];
        }
        
        
        
        
        
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_custmrtable) {
            }
    
    if (tableView==_popOverTableView) {
        
        
        
        switch (poptype) {
            case 1:
                [_statebtnlbl setTitle:[_statearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                //[_cuntrybtnlbl setTitle:[_countryarray objectAtIndex:214] forState:UIControlStateNormal];
               
                break;
            case 2:
                 [_cuntrybtnlbl setTitle:[_countryarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                
                break;
                case 3:
                if (indexPath.row==0) {
                   
                        self.cntctVctrl=[[ContactInfoViewController alloc]initWithNibName:@"ContactInfoViewController" bundle:nil];
                  
                    _cntctVctrl.custmrcode=_custmrcode;
                    [self dismissViewControllerAnimated:YES completion:^{   [self presentViewController:_cntctVctrl
                                                                                                                  animated:YES completion:NULL];
                    
                                       }];
//                    [self presentViewController:_cntctVctrl
//                                       animated:YES completion:NULL];
                }
                
                if (indexPath.row==1) {
                    
                   // if (!self.salesVCtrl) {
                        self.salesVCtrl=[[SalesRepInfoViewController alloc]initWithNibName:@"SalesRepInfoViewController" bundle:nil];
                  //  }
                    _salesVCtrl.ccode=_custmrcode;
                    
                    [self dismissViewControllerAnimated:YES completion:^{   [self presentViewController:_salesVCtrl
                                                                                               animated:YES completion:NULL];
                        
                    }];

//                                      [self presentViewController:_salesVCtrl
//                                       animated:YES completion:NULL];

                    
                    
                }
                
                
                [self.popOverController dismissPopoverAnimated:YES];
                

                break;

                
                
            default:
                break;

        }
        
        
        
    }
     [self.popOverController dismissPopoverAnimated:YES];
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_popOverTableView)
        
    {
        return self.editing ;
    }
    return YES;
    
}


#pragma mark-webservice
-(void)CustomerMasterselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerMasterselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</CustomerMasterselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
   //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerMasterselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Stateselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Stateselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</Stateselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Stateselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)countryselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Countryselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</Countryselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
  //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Countryselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CustomerMasterInsert{
      recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerMasterInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<CustomerName>%@</CustomerName>\n"
                   "<Adress>%@</Adress>\n"
                   "<City>%@</City>\n"
                   "<State>%@</State>\n"
                   "<Zip>%@</Zip>\n"
                   "<Country>%d</Country>\n"
                   "<Phone>%@</Phone>\n"
                   "<Fax>%@</Fax>\n"
                   "<Email>%@</Email>\n"
                   "<Website>%@</Website>\n"
                  
                   "</CustomerMasterInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n", _nametextfld.text,_addresstxtview.text,_citytxtfld.text,[_statedict objectForKey:_statebtnlbl.titleLabel.text],_zipbtnlbl.text,[[_countrydict objectForKey:_cuntrybtnlbl.titleLabel.text]integerValue],_phonetxtfld.text, _faxtxtfld.text, _emailtxtfld.text,_websitetxtfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerMasterInsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CustomerMasterUpdate{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
      Custmermdl *custmd=(Custmermdl *)[_customerarray objectAtIndex:path];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerMasterUpdate xmlns=\"http://ios.kontract360.com/\">\n"
                   "<Id>%d</Id>\n"
                   "<CustomerCode>%@</CustomerCode>\n"
                   "<CustomerName>%@</CustomerName>\n"
                   "<Address>%@</Address>\n"
                   "<City>%@</City>\n"
                   "<State>%@</State>\n"
                   "<Zip>%@</Zip>\n"
                   "<Country>%d</Country>\n"
                   "<Phone>%@</Phone>\n"
                   "<Fax>%@</Fax>\n"
                   "<Email>%@</Email>\n"
                   "<Website>%@</Website>\n"
                    "</CustomerMasterUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n", [custmd.customerid integerValue],custmd.customercode,_nametextfld.text,_addresstxtview.text,_citytxtfld.text,[_statedict objectForKey:_statebtnlbl.titleLabel.text],_zipbtnlbl.text,[[_countrydict objectForKey:_cuntrybtnlbl.titleLabel.text]integerValue],_phonetxtfld.text, _faxtxtfld.text,_emailtxtfld.text,_websitetxtfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerMasterUpdate" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CustomerMaster1Search{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerMaster1Search xmlns=\"http://ios.kontract360.com/\">\n"
                    "<searchtext>%@</searchtext>\n"
                   "</CustomerMaster1Search>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerMaster1Search" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CustomerMaster1Delete{
    webtype=3;
    recordResults = FALSE;
    NSString *soapMessage;
    
     Custmermdl *custmd=(Custmermdl *)[_customerarray objectAtIndex:deletepath];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerMaster1Delete xmlns=\"http://ios.kontract360.com/\">\n"
                    "<Id>%d</Id>\n"
                   "<CustomerId>%@</CustomerId>\n"
                   "</CustomerMaster1Delete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[custmd.customerid integerValue],custmd.customercode];
    NSLog(@"soapmsg%@",soapMessage);
    
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];

    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerMaster1Delete" forHTTPHeaderField:@"Soapaction"];
    
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],38,@"Create",@"iOS",extnalip,intrnalip,Udid,0];
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],38,@"Edit",@"iOS",extnalip,intrnalip,Udid,0];
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],38,@"Delete",@"iOS",extnalip,intrnalip,Udid,0];
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"" message:@"ERROR with theConnection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
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
    
    [_custmrtable reloadData];
    
       [_popOverTableView reloadData];
   

    
}


#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    
    if([elementName isEqualToString:@"CustomerMasterselectResult"])
    {
        _customerarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"CustomerCode"])
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
    if([elementName isEqualToString:@"Address"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"City"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"State"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Zip"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"Country"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Phone"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Fax"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Email"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Website"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Location"])
    {
      if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    
    if([elementName isEqualToString:@"StateselectResult"])
    {_statearray=[[NSMutableArray alloc]init];
        _statedict=[[NSMutableDictionary alloc]init];
        _revstatedict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"state_id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"state_name"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CountryselectResult"])
    {
        _countryarray=[[NSMutableArray alloc]init];
        _countrydict=[[NSMutableDictionary alloc]init];
         _revcountrydict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CountryCode"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CountryName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"CustomerMasterUpdateResult"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CustomerMaster1SearchResponse"])
    {  _customerarray=[[NSMutableArray alloc]init];

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
    if([elementName isEqualToString:@"CustomerId"])
    {
        _custmdl=[[Custmermdl alloc]init];
        recordResults = FALSE;
        _custmdl.customerid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Id"])
    {
        _custmdl=[[Custmermdl alloc]init];
        recordResults = FALSE;
        
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"CustomerCode"])
    {
        recordResults = FALSE;
         _custmdl.customercode=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CustomerName"])
    {
        recordResults = FALSE;
         _custmdl.customername=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Address"])
    {
        recordResults = FALSE;
         _custmdl.custmraddress=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"City"])
    {
        recordResults = FALSE;
         _custmdl.city=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"State"])
    {
        recordResults = FALSE;
          _custmdl.state=_soapResults;
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"Zip"])
    {
        recordResults = FALSE;
        _custmdl.zip=_soapResults;
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"Country"])
    {
        recordResults = FALSE;
        _custmdl.country=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"Phone"])
    {
        recordResults = FALSE;
          _custmdl.phone=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Fax"])
    {
        recordResults = FALSE;
          _custmdl.fax=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Email"])
    {
        recordResults = FALSE;
          _custmdl.email=_soapResults;
        
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"Website"])
    {
        recordResults = FALSE;
        _custmdl.website=_soapResults;
              _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"Location"])
    {
        recordResults = FALSE;
        _custmdl.locatn=_soapResults;
        [_customerarray addObject:_custmdl];
        _soapResults = nil;
        
    }
    


 
    if([elementName isEqualToString:@"state_id"])
    {
        recordResults = FALSE;
        stateid=_soapResults;
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"state_name"])
    {
        recordResults = FALSE;
        [_statearray addObject:_soapResults];
        [_statedict setObject:stateid forKey:_soapResults];
        [_revstatedict setObject:_soapResults forKey:stateid];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CountryCode"])
    {
        recordResults = FALSE;
        cuntryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CountryName"])
    {
        recordResults = FALSE;
        [_countryarray addObject:_soapResults];
        [_countrydict setObject:cuntryid forKey:_soapResults];
        [_revcountrydict setObject:_soapResults forKey:cuntryid];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        
      recordResults = FALSE;
        
        if (webtype==1||webtype==2) {
            msgstrg=_soapResults;
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            [self CustomerMasterselect];
            _SearchingBar.text=@"";
        }
        if(webtype==3){
            if ( [_soapResults isEqualToString:@"Already In Use"]) {
                msgstrg=_soapResults;
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            }
            [self CustomerMasterselect];
            _SearchingBar.text=@"";
        }

        _soapResults = nil;
        
    }



}
#pragma mark-popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 220, 300)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 220, 300)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(220, 300);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    self.popOverController.popoverContentSize=CGSizeMake(220.0f, 300.0f);
    self.popOverController=_popOverController;

    
    if(poptype==1){
        
     [self.popOverController presentPopoverFromRect:_statebtnlbl.frame
                                             inView:self.addview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    }
    if(poptype==2){
        [self.popOverController presentPopoverFromRect:_cuntrybtnlbl.frame
                                                inView:self.addview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        
    }
        

    
}

#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_SearchingBar.text;
    //NSLog(@"search%@",searchstring);
    [self CustomerMaster1Search];
    [searchBar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    // _searchstring=@"";
      //[searchBar resignFirstResponder];
    [self CustomerMasterselect];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    
    if ([_SearchingBar.text length]==0) {
        
         [self CustomerMasterselect];
        // [searchBar resignFirstResponder];
        
        
    }
    //[searchBar resignFirstResponder];
    
    }

#pragma mark-Button Actions

- (IBAction)clsebtn:(id)sender {
    _updatebtn.enabled=YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addcustmrbtn:(id)sender {
    _updatebtn.enabled=YES;
    webtype=1;
    [self Stateselect];
    [self countryselect];

    optionidentifier=1;
    _cancelbtnlbl.enabled=YES;
    // [_custmrtable setEditing:NO animated:NO];
    _custmrtable.userInteractionEnabled=NO;
    _cancelbtnlbl.titleLabel.textColor=[UIColor colorWithRed:70/255.0f green:130.0/255.0f blue:170.0/255.0f alpha:1.0f];
       _navtitle.title=@"Create";
    _nametextfld.text=@"";
    _addresstxtview.text=@"";
    _citytxtfld.text=@"";
    [_statebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    [_cuntrybtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    _websitetxtfld.text=@"";
    _zipbtnlbl.text=@"";
    _emailtxtfld.text=@"";
    _phonetxtfld.text=@"";
    _faxtxtfld.text=@"";

    _addview.hidden=NO;
   
   }

- (IBAction)deletecustmrbtn:(id)sender {
  
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_custmrtable setEditing:NO animated:NO];
        [_custmrtable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_custmrtable setEditing:YES animated:YES];
        [_custmrtable reloadData];
        
        
        
        
    
    }

}

- (IBAction)statebtn:(id)sender {
    poptype=1;
    [self createpopover];
    //[self Stateselect];
    [_popOverTableView reloadData];
}

- (IBAction)cuntrybtn:(id)sender {
    poptype=2;
    [self createpopover];
   // [self countryselect];
    [_popOverTableView reloadData];

}

- (IBAction)updatebtn:(id)sender {
    
     if (optionidentifier==1) {
         [self UserLogmaininsert];
     }
     else if(optionidentifier==2)
     {
         [self UserLogmainupdate];
     }
    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    if (rightsmodel.EditModule==0) {
        if (optionidentifier==1) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to add a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }else if(optionidentifier==2)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to edit this record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }
    else
    {

    if ([_nametextfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        _nametextfld.text=@"";
    }

   else  if ([_addresstxtview.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Address is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
   else  if ([_statebtnlbl.titleLabel.text isEqualToString:@"Select"]||[_statebtnlbl.titleLabel.text isEqualToString:@""]) {
       UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"State is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
       [alert show];
   }
   else  if ([_cuntrybtnlbl.titleLabel.text isEqualToString:@"Select"]||[_cuntrybtnlbl.titleLabel.text isEqualToString:@""]) {
       UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Country is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
       [alert show];
   }
          else  if ([_phonetxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Phone Number is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
              _phonetxtfld.text=@"";
    }
    else if (([_emailtxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Email is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        _emailtxtfld.text=@"";
    }
       else{
           
        if (optionidentifier==1) {
            webtype=1;

            _updatebtn.enabled=NO;
        [self CustomerMasterInsert];

    }
    else  if (optionidentifier==2){
        webtype=1;

        _updatebtn.enabled=NO;
        [self CustomerMasterUpdate];
    }
    }
    }
  
}

- (IBAction)cancelbtn:(id)sender {
    _nametextfld.text=@"";
    _addresstxtview.text=@"";
    _citytxtfld.text=@"";
    [_statebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    [_cuntrybtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    _websitetxtfld.text=@"";
    _zipbtnlbl.text=@"";
    _emailtxtfld.text=@"";
    _phonetxtfld.text=@"";
    _faxtxtfld.text=@"";

}

- (IBAction)clseviewbtn:(id)sender {
    _updatebtn.enabled=YES;
    _addview.hidden=YES;
    
    _custmrtable.userInteractionEnabled=YES;

}

- (IBAction)editbtn:(id)sender {
    [self Stateselect];
    [self countryselect];

    _updatebtn.enabled=YES;
    //[_custmrtable setEditing:NO animated:NO];
    _custmrtable.userInteractionEnabled=NO;
    _cancelbtnlbl.enabled=NO;
    optionidentifier=2;
    [_cancelbtnlbl setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    webtype=2;
    _navtitle.title=@"Edit";
     _addview.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.custmrtable];
    NSIndexPath *textFieldIndexPath = [self.custmrtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    path=textFieldIndexPath.row;
    Custmermdl *custmd=(Custmermdl *)[_customerarray objectAtIndex:path];
    _nametextfld.text=custmd.customername;
    _addresstxtview.text=custmd.custmraddress;
    _citytxtfld.text=custmd.city;
    NSLog(@"%@",custmd.state);
    [_statebtnlbl setTitle:[_revstatedict objectForKey:custmd.state] forState:UIControlStateNormal];
    [_cuntrybtnlbl setTitle:[_revcountrydict objectForKey:custmd.country] forState:UIControlStateNormal];
    _websitetxtfld.text=custmd.website;
    _zipbtnlbl.text=custmd.zip;
    _emailtxtfld.text=custmd.email;
    _phonetxtfld.text=custmd.phone;
    _faxtxtfld.text=custmd.fax;
    
    
    

}

- (IBAction)disclurebtn:(id)sender {
    poptype=3;
    
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 120, 80)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 80)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 42;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 80);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popOverController.popoverContentSize=CGSizeMake(120.0f, 80.0f);
    self.popOverController=_popOverController;

    
    
    button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.custmrtable];
    NSIndexPath *textFieldIndexPath = [self.custmrtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    
    Custmermdl *custmd=(Custmermdl *)[_customerarray objectAtIndex:textFieldIndexPath.row];
    _custmrcode=custmd.customercode;
    [self.popOverController presentPopoverFromRect:_disclurebtnlbl.frame inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    

}

#pragma mark-textfld delegates
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField==_nametextfld)
    {
        NSUInteger newLength = [_nametextfld.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
//    if(textField==_addresstxtview)
//    {
//        NSUInteger newLength = [_addresstxtview.text length] + [string length] - range.length;
//        return (newLength > 200) ? NO : YES;
//    }
    if(textField==_citytxtfld)
    {
        NSUInteger newLength = [_citytxtfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
    
       if(textField==_zipbtnlbl)
    {
        NSUInteger newLength = [_zipbtnlbl.text length] + [string length] - range.length;
        return (newLength > 10) ? NO : YES;
    }
    
    if(textField==_faxtxtfld)
    {
        NSUInteger newLength = [_faxtxtfld.text length] + [string length] - range.length;
        return (newLength > 12) ? NO : YES;
    }
       if(textField==_phonetxtfld)
    {
        NSUInteger newLength = [_phonetxtfld.text length] + [string length] - range.length;
        return (newLength > 12) ? NO : YES;
    }
    if(textField==_emailtxtfld)
    {
        NSUInteger newLength = [_emailtxtfld.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    
    if(textField==_websitetxtfld)
    {
        NSUInteger newLength = [_websitetxtfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
      
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if(textField==_faxtxtfld)
    {
        faxnoString=_faxtxtfld.text;
        if ([faxnoString length]<10) {
            if([faxnoString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
            {
               _faxtxtfld.text=@"";
            }
            else
            {
                fmt=1;
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Fax Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                
                [alert show];
                
            }
            
        }
        else
        {
            
            
            Validation*val=[[Validation alloc]init];
            int value1=[val isdataformat:_faxtxtfld.text];
            if(value1==0)
            {
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Fax Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert1 show];
                
                
            }
            else
                
            {
                faxnoString=_faxtxtfld.text;
                
                //checking a particular charector
                // NSString *connectstring;
                NSString*new=[faxnoString substringWithRange:NSMakeRange(3, 1)];
                NSString*new1=[faxnoString substringWithRange:NSMakeRange(7, 1)];
                
                
                
                NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
                NSString *resultString = [[faxnoString componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
                NSLog (@"Result: %@", resultString);
                if ([resultString length]==9){
                    
                    fmt=1;
                    
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Fax Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
                
                if ([faxnoString length]==12) {
                    
                    
                    
                    
                    
                    
                    if ([new  isEqualToString:@"-"]&&[new1  isEqualToString:@"-"]) {
                        _faxfmtstring=faxnoString;
                        fmt=2;
                    }
                    else
                    {
                        fmt=1;
                        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Fax Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                        
                        [alert show];
                    }
                    
                }
                
                
                
                if ([resultString length]==10){
                    
                    
                    fmt=2;
                    
                    NSString *subString = [resultString substringWithRange:NSMakeRange(0,3)];
                    NSLog(@"%@",subString);
                    NSString *substring2=[resultString  substringWithRange:NSMakeRange(3,3)];
                    NSLog(@"%@",substring2);
                    NSString *substring3=[resultString  substringWithRange:NSMakeRange(6,4)];
                    NSLog(@"%@",substring3);
                    _faxfmtstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
                    NSLog(@"%@",_faxfmtstring);
                    
                    
                    
                    
                    _faxtxtfld.text=_faxfmtstring;
                    
                }
                
                
                
                
                
                if ([resultString length]==11){
                    
                    fmt=1;
                    
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Fax Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
            }
        }
        
    }
    if(textField==_phonetxtfld)
    {
        
        phnnostring=_phonetxtfld.text;
        
        
        if ([phnnostring length]<10) {
            if([phnnostring stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
            {
                _phonetxtfld.text=@"";
            }
            else
            {
                fmt=1;
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                
                [alert show];
                
            }
            
            
            
        }
        else
        {
            
            Validation*val=[[Validation alloc]init];
            int value1=[val isdataformat:_phonetxtfld.text];
            if(value1==0)
            {
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert1 show];
                
                
            }
            else
            {
                
                phnnostring=_phonetxtfld.text;
                //checking a particular charector
                // NSString *connectstring;
                NSString*new=[phnnostring substringWithRange:NSMakeRange(3, 1)];
                NSString*new1=[phnnostring substringWithRange:NSMakeRange(7, 1)];
                
                
                
                NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
                NSString *resultString = [[phnnostring componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
                NSLog (@"Result: %@", resultString);
                if ([resultString length]==9){
                    
                    
                    fmt=1;
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
                
                if ([phnnostring length]==12) {
                    
                    
                    
                    
                    
                    
                    if ([new  isEqualToString:@"-"]&&[new1  isEqualToString:@"-"]) {
                        _phnnofmtstring=phnnostring;
                        fmt=2;
                    }
                    else
                    { fmt=1;
                        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                        
                        [alert show];
                    }
                    
                }
                
                
                
                if ([resultString length]==10){
                    
                    
                    fmt=2;
                    
                    NSString *subString = [resultString substringWithRange:NSMakeRange(0,3)];
                    NSLog(@"%@",subString);
                    NSString *substring2=[resultString  substringWithRange:NSMakeRange(3,3)];
                    NSLog(@"%@",substring2);
                    NSString *substring3=[resultString  substringWithRange:NSMakeRange(6,4)];
                    NSLog(@"%@",substring3);
                    _phnnofmtstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
                    NSLog(@"%@",_phnnofmtstring);
                    
                    
                    
                    
                    _phonetxtfld.text=_phnnofmtstring;
                    
                }
                
                
                
                
                
                if ([resultString length]==11){
                    
                    
                    fmt=1;
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Phone Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
            }
        }
    }
    if(textField==_zipbtnlbl)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_zipbtnlbl.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Zip" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }
    
    
        if(textField==_emailtxtfld){
        
     if(![_emailtxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0){
        Validation *val=[[Validation alloc]init];
        BOOL bEmailValid = [val validEmailAddress:[_emailtxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
            
        if(bEmailValid)
        {
            // email valid, other validations in the form
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
            }
        
    }
    
    if(textField==_websitetxtfld){
        
        if ([_websitetxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
            
        }
        else
        {
        
        Validation *val=[[Validation alloc]init];
        BOOL webval=[val validateUrl:_websitetxtfld.text];
        if(webval)
        {
            // email valid, other validations in the form
            
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Website" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        }
    }
    if(textField==_nametextfld){
        
        
        
        Validation *val=[[Validation alloc]init];
        int value1=[val validatespecialcharacters:_nametextfld.text];
        if(value1==0)
        {
            
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Company Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }
    if(textField==_citytxtfld){
        
        
        
        Validation *val=[[Validation alloc]init];
        int value1=[val validatespecialcharacters:_citytxtfld.text];
        if(value1==0)
        {
            
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid City Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }


    
    
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ////NSLog(@"buttonIndex%d",buttonIndex);
    if ([alertView.message isEqualToString:msgstrg]) {
        
        
        
        if (buttonIndex==0) {
            if (optionidentifier==2)
            {
                _addview.hidden=YES;
                _custmrtable.userInteractionEnabled=YES;
                _updatebtn.enabled=YES;
                
            }
            _updatebtn.enabled=YES;
            
            _nametextfld.text=@"";
            _addresstxtview.text=@"";
            _citytxtfld.text=@"";
            [_statebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            [_cuntrybtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            _websitetxtfld.text=@"";
            _zipbtnlbl.text=@"";
            _emailtxtfld.text=@"";
            _phonetxtfld.text=@"";
            _faxtxtfld.text=@"";
             _SearchingBar.text=@"";
            
            
        }
    }

    
    if ([alertView.message isEqualToString:@"Invalid Website"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _websitetxtfld.text=@"";
            
            
        }
    }
    
    if ([alertView.message isEqualToString:@"Invalid Fax Number"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _faxtxtfld.text=@"";
            
            
        }
    }
    
    
    
    
    if ([alertView.message isEqualToString:@"Invalid Email"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _emailtxtfld.text=@"";
            
            
        }
    }
    
    
    
    if ([alertView.message isEqualToString:@"Invalid Zip"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _zipbtnlbl.text=@"";
            
        }
    }
    if ([alertView.message isEqualToString:@"Invalid Phone Number"])
    {
        if (buttonIndex==0) {
            
            _phonetxtfld.text=@"";
            
        }
        
    }
    if ([alertView.message isEqualToString:@"Invalid Company Name"])
    {
        if (buttonIndex==0) {
            
            _nametextfld.text=@"";
            
        }
        
    }
    if ([alertView.message isEqualToString:@"Invalid City Name"])
    {
        if (buttonIndex==0) {
            
            _citytxtfld.text=@"";
            
        }
        
    }
        
    
    
    
}


@end
