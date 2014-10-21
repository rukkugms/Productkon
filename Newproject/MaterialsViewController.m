//
//  MaterialsViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 18/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "MaterialsViewController.h"

@interface MaterialsViewController ()

@end

@implementation MaterialsViewController

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
    _addmatView.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
          _materialTable.layer.borderWidth = 2.0;
    _materialTable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _titleView.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    /*searchbar*/
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate = (id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.materialTable.tableHeaderView =_searchbar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;
    _picimageview.layer.borderColor=[UIColor blackColor].CGColor;
    _picimageview.layer.borderWidth=2;
    _picimageview.userInteractionEnabled = YES;
    UITapGestureRecognizer *pgr = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(handlePinch:)];
    pgr.delegate = (id)self;
    [_picimageview addGestureRecognizer:pgr];

 
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self AllSkills];
    _activitybtn.hidden=YES;
  
    _addmatView.userInteractionEnabled=YES;
    //[self SelectAllMaterials];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-Popover
-(void)createpopover{
    poptype=1;
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
    
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_subsearchbtnlbl.frame
                                            inView:self.addmatView
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}
-(void)createSearchpopover{
    poptype=2;
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
    
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_measuresrchbtnlbl.frame
                                            inView:self.addmatView
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}

#pragma mark - Table View datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_materialTable) {
                return [_materialarray count];
        
    }
    if (tableView==_popOverTableView) {
        switch (poptype) {
            case 1:
         return [_subtypearray count];
                break;
            case 2:
                return [_unitofmeasurearray count];
                break;

            default:
                break;
        }

        
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

          if (tableView==_materialTable) {
        [[NSBundle mainBundle]loadNibNamed:@"custommaterialcell" owner:self options:nil];
        cell=_materialCell;
          }
    }
    if (tableView==_popOverTableView) {
        switch (poptype) {
            case 1:
                cell.textLabel.text=[_subtypearray objectAtIndex:indexPath.row];
                break;
            case 2:
                 cell.textLabel.text=[_unitofmeasurearray objectAtIndex:indexPath.row];
             
                break;
                
            default:
                break;
        }

       
    }
     if (tableView==_materialTable) {
    Manpwr*materaialmdl=(Manpwr *)[_materialarray objectAtIndex:indexPath.row];
    _codelbl=(UILabel *)[cell viewWithTag:1];
         
    _codelbl.text=materaialmdl.itemcode;
         NSLog(@"%@",materaialmdl.itemcode);
    _deslbl=(UILabel *)[cell viewWithTag:2];
    _deslbl.text=materaialmdl.itemdescptn;
    _typelbl=(UILabel *)[cell viewWithTag:3];
    _typelbl.text=materaialmdl.subtype;
    _costlbl=(UILabel *)[cell viewWithTag:4];
    _costlbl.text=[NSString stringWithFormat:@"$%@",materaialmdl.unitcost];
         if ([materaialmdl.allsubtype isEqualToString:@"true"]) {
             _subtypebtn.enabled=NO;
             // [_allcrftbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
             [_subtypebtn setTitle:@"All Sub Types" forState:UIControlStateNormal];
             
         }
         else if([materaialmdl.allsubtype isEqualToString:@"false"]){
             _subtypebtn.enabled=YES;
             // [_allcrftbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
             [_subtypebtn setTitle:@"Sub Types" forState:UIControlStateNormal];
             
             
         }


     }
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView==_popOverTableView){
        switch (poptype) {
            case 1:
                [_subsearchbtnlbl setTitle:[_subtypearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                break;
            case 2:
                _unitofmesuretxtfld.text=[_unitofmeasurearray objectAtIndex:indexPath.row];
                
                
                break;
                
            default:
                break;
        }

        
        //_subtyptxtfld.text=[_subtypearray objectAtIndex:indexPath.row];
       
    }
    

     [self.popOverController dismissPopoverAnimated:YES];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [self UserLogmaindelete];
        path=indexPath.row;
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        
        
        if (rightsmodel.DeleteModule==0) {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You dont have rights to delete a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        else
        {
            

        [self DeleteMaterials];
        [_materialarray removeObject:indexPath];
        }
        
        
    }
    
        
    }
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_materialTable)
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


#pragma mark- WebService
-(void)SelectAllMaterials{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllMaterials xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "</SelectAllMaterials>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SelectAllMaterials" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)InserteMaterials{
    webtype=1;
    
    NSString*unitcost=   [_unitcosttxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
 
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InserteMaterials xmlns=\"http://test.kontract360.com/\">\n"
                   "<itemcode>%@</itemcode>\n"
                   "<description>%@</description>\n"
                   
                   "<unitcost>%f</unitcost>\n"
                   "<picture>%@</picture>\n"
                    "<qtyinstock>%f</qtyinstock>\n"
                   "<UnitInMeasure>%@</UnitInMeasure>\n"
                   "<MTAllSubTypes>%d</MTAllSubTypes>\n"
                   "</InserteMaterials>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",@"abc",_destxtfld.text,[unitcost floatValue],@"",[_stockinhandtxtfld.text floatValue],_unitofmesuretxtfld.text,createcheck];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/InserteMaterials" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateMaterials{
    
    
    webtype=2;
    recordResults = FALSE;
       NSString*unitcost=   [_unitcosttxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString *soapMessage;
    
      Manpwr*pwrmdl=(Manpwr *)[_materialarray objectAtIndex:butnpath];
     NSInteger check;
    if([createstring isEqualToString:@"create"])
    {
        if (createcheck==0) {
            check=0;
        }
        else{
            check=1;
            
        }
        createstring=@"";
    }
    else
    {
        if ([pwrmdl.allsubtype isEqualToString:@"true"]) {
            
            check=1;
        }
        else //if([pwrmdl.allsubtype isEqualToString:@"false"])
        {
            
            check=0;
            
        }
        
        
    }

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateMaterials xmlns=\"http://test.kontract360.com/\">\n"
                   "<entryid>%d</entryid>\n"
                   "<itemcode>%@</itemcode>\n"
                   "<description>%@</description>\n"
                   
                   "<unitcost>%f</unitcost>\n"
                   "<picture>%@</picture>\n"
                    "<qtyinstock>%f</qtyinstock>\n"
                   "<UnitInMeasure>%@</UnitInMeasure>\n"
                    "<MTAllSubTypes>%d</MTAllSubTypes>\n"
                   "</UpdateMaterials>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",pwrmdl.entryid,_codetxtfld.text,_destxtfld.text,
                   [unitcost floatValue],@"",[_stockinhandtxtfld.text floatValue],_unitofmesuretxtfld.text,check];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/UpdateMaterials" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)DeleteMaterials{
    webtype=3;
    recordResults = FALSE;
    NSString *soapMessage;
    
    Manpwr*pwrmdl=(Manpwr *)[_materialarray objectAtIndex:path];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DeleteMaterials  xmlns=\"http://test.kontract360.com/\">\n"
                   "<Entryid>%d</Entryid>\n"
                   "</DeleteMaterials >\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",pwrmdl.entryid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/DeleteMaterials" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SearchMaterials{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SearchMaterials xmlns=\"http://test.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</SearchMaterials>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SearchMaterials" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllSubtypeMaterial{
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllSubtypeMaterial xmlns=\"http://test.kontract360.com/\">\n"
                   "</SelectAllSubtypeMaterial>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SelectAllSubtypeMaterial" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Insertanyimage{
    recordResults = FALSE;
    NSString *soapMessage;
    
    NSString *imagename=[NSString stringWithFormat:@"Photo_%@.jpg",matealcode];
    // NSString *imagename=[NSString stringWithFormat:@"Newimage.jpg"];
    NSString *type=@"Materials";
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UploadAnyImage xmlns=\"http://test.kontract360.com/\">\n"
                   "<f>%@</f>\n"
                   "<fileName>%@</fileName>\n"
                   "<type>%@</type>\n"
                   "<itemcode>%@</itemcode>\n"
                   "</UploadAnyImage>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_encodedString,imagename,type,matealcode];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/UploadAnyImage" forHTTPHeaderField:@"Soapaction"];
    
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


-(void)UploadAnyImage{
        recordResults = FALSE;
        NSString *soapMessage;
    
        NSString *imagename=[NSString stringWithFormat:@"Photo_%@.jpg",_codetxtfld.text];
        // NSString *imagename=[NSString stringWithFormat:@"Newimage.jpg"];
        NSString *type=@"Materials";
        
        soapMessage = [NSString stringWithFormat:
                       
                       @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                       "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                       
                       
                       "<soap:Body>\n"
                       
                       "<UploadAnyImage xmlns=\"http://test.kontract360.com/\">\n"
                       "<f>%@</f>\n"
                       "<fileName>%@</fileName>\n"
                       "<type>%@</type>\n"
                       "<itemcode>%@</itemcode>\n"
                       "</UploadAnyImage>\n"
                       "</soap:Body>\n"
                       "</soap:Envelope>\n",_encodedString,imagename,type,_codetxtfld.text];
        NSLog(@"soapmsg%@",soapMessage);
        
        
        // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
        
        NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
        
        NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
        
        [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
        [theRequest addValue: @"http://test.kontract360.com/UploadAnyImage" forHTTPHeaderField:@"Soapaction"];
        
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
    
-(void)FetchAnyImage{
   
        recordResults = FALSE;
        NSString *soapMessage;
    _activitybtn.hidden=NO;
    [_activitybtn startAnimating];
    _addmatView.userInteractionEnabled=NO;
        // NSString *imagename=[NSString stringWithFormat:@"Photo_%@.png",_codetxfld.text];
        NSString *type=@"Materials";
        //NSString*filename=@"818191.jpg";
        
        soapMessage = [NSString stringWithFormat:
                       
                       @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                       "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                       
                       
                       "<soap:Body>\n"
                       
                       "<FetchAnyImage xmlns=\"http://test.kontract360.com/\">\n"
                       "<filename>%@</filename>\n"
                       "<type1>%@</type1>\n"
                       "</FetchAnyImage>\n"
                       "</soap:Body>\n"
                       "</soap:Envelope>\n",_uplodpiclctn,type];
        NSLog(@"soapmsg%@",soapMessage);
       
        
        
        
        // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
        
        NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
        
        NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
        
        [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
        [theRequest addValue: @"http://test.kontract360.com/FetchAnyImage" forHTTPHeaderField:@"Soapaction"];
        
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
                   
                   "<AllSkills xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "</AllSkills>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/AllSkills" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)UnitOfMeasureSelect{
   
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UnitOfMeasureSelect xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "</UnitOfMeasureSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/UnitOfMeasureSelect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)UnitOfMeasureInsert{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UnitOfMeasureInsert xmlns=\"http://test.kontract360.com/\">\n"
                   "<UnitInMeasure>%@</UnitInMeasure>\n"
                   "</UnitOfMeasureInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_unitofmesuretxtfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/UnitOfMeasureInsert" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<UserLogmaininsert xmlns=\"http://test.kontract360.com/\">\n"
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],28,@"Create",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/UserLogmaininsert" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<UserLogmaininsert xmlns=\"http://test.kontract360.com/\">\n"
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],28,@"Edit",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/UserLogmaininsert" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<UserLogmaininsert xmlns=\"http://test.kontract360.com/\">\n"
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],28,@"Delete",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/UserLogmaininsert" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please Check Your Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
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
    if (webtype==1||webtype==2||webtype==3) {
        [self SelectAllMaterials];
        _searchbar.text=@"";

        webtype=0;
    }
    [_materialTable reloadData];
    [_popOverTableView reloadData];
  
    
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectAllMaterialsResult"])
    {
        _materialarray=[[NSMutableArray alloc]init];
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
//    if([elementName isEqualToString:@"entryid"])
//    {
//        
//        if(!_soapResults)
//        {
//            _soapResults = [[NSMutableString alloc] init];
//        }
//        recordResults = TRUE;
//    }

    if([elementName isEqualToString:@"ItemCode"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"itemcode"])
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
    if([elementName isEqualToString:@"MTAllSubTypes"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"SearchMaterialsResponse"])
    {
         _materialarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"SelectAllSubtypeMaterialResult"])
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
    if([elementName isEqualToString:@"picture"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"qtyinstock"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"asUnitInMeasurement"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"InserteMaterialsResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Picture"])
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
    
    if([elementName isEqualToString:@"UploadAnyImageResult"])
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
    if([elementName isEqualToString:@"InserteMaterialsResult"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"MateCode"])
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
    
    if([elementName isEqualToString:@"UnitOfMeasureSelectResponse"])
    {
        _unitofmeasurearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"UnitId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"UnitInMeasure"])
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
        _materialmdl=[[Manpwr alloc]init];
        
        recordResults = FALSE;
        
        _materialmdl.entryid=[_soapResults integerValue];
        _soapResults = nil;
    }
//    if([elementName isEqualToString:@"entryid"])
//    {
//        _materialmdl=[[Manpwr alloc]init];
//        
//        recordResults = FALSE;
//        
//        _materialmdl.entryid=[_soapResults integerValue];
//        _soapResults = nil;
//    }

    if([elementName isEqualToString:@"ItemCode"])
    { recordResults = FALSE;
 _materialmdl.itemcode=_soapResults;
        _soapResults = nil;

        
    }
    if([elementName isEqualToString:@"itemcode"])
    {
        
        recordResults = FALSE;
      _materialmdl.itemcode=_soapResults;
        NSLog(@"%@",_materialmdl.itemcode);

        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
        
       _materialmdl.itemdescptn=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SubType"])
    {
        
        recordResults = FALSE;
       _materialmdl.subtype=[_revskilldict objectForKey:_soapResults];;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"picture"])
    {
        recordResults=FALSE;
        _materialmdl.picturelocation=_soapResults;
         _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"Picture"])
    {
        recordResults=FALSE;
        _materialmdl.picturelocation=_soapResults;
        _soapResults = nil;
        
    }

    if([elementName isEqualToString:@"UnitCost"])
    {
        
        recordResults = FALSE;
        
         _materialmdl.unitcost=_soapResults;
    
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"qtyinstock"])
    {
        
        recordResults = FALSE;
        
        _materialmdl.stckinhand=_soapResults;
       
        _soapResults = nil;


    }
    if([elementName isEqualToString:@"asUnitInMeasurement"])
    {  recordResults = FALSE;
        
        _materialmdl.unitofmeasure=_soapResults;
        
        _soapResults = nil;


    }
    if([elementName isEqualToString:@"MTAllSubTypes"])
    {
        
        recordResults = FALSE;
        
        _materialmdl.allsubtype=_soapResults;
        [_materialarray addObject:_materialmdl];
        _soapResults = nil;
        
        
    }

    if([elementName isEqualToString:@"subtype"])
    {
        recordResults = FALSE;
        [_subtypearray addObject:_soapResults];
 _soapResults = nil;
    
    
}
    if([elementName isEqualToString:@"MateCode"])
    {
        recordResults = FALSE;
        matealcode=_soapResults;
               _soapResults = nil;
        
        
    }

    
    if([elementName isEqualToString:@"result"])
    {
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"Already In Use"]) {
            msgstrg=_soapResults;
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
        if ([_soapResults isEqualToString:@"Inserted Successfully"]) {
            msgstrg=_soapResults;
            if(imagechecker==1){
                
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _activitybtn.hidden=YES;
                [_activitybtn stopAnimating];
                 _addmatView.userInteractionEnabled=YES;
                [self SelectAllMaterials];

                
                
            }
            else{
                [self Insertanyimage];
                
            }
           
            webtype=0;

        }
        
        if ([_soapResults isEqualToString:@"Updated Successfully"]) {
              msgstrg=_soapResults;
            
            if(imagechecker==1){
               
                
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _activitybtn.hidden=YES;
                [_activitybtn stopAnimating];
                 _addmatView.userInteractionEnabled=YES;
                [self SelectAllMaterials];
                
               
                
            }
            else{
                [self UploadAnyImage];

           
                
            }

             webtype=0;
           
            
        }
        if ([_soapResults isEqualToString:@"Material Picture Updated"]){
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _activitybtn.hidden=YES;
            [_activitybtn stopAnimating];
             _addmatView.userInteractionEnabled=YES;
            [self SelectAllMaterials];
        }
       else if ([_soapResults isEqualToString:@"Already Exists"])
        {
            msgstrg=_soapResults;
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _activitybtn.hidden=YES;
            [_activitybtn stopAnimating];
             _addmatView.userInteractionEnabled=YES;
        }

        
        
        
        _soapResults = nil;
        
    }
    
    
    if([elementName isEqualToString:@"url"])
    {
        recordResults = FALSE;
        NSData *data1=[_soapResults base64DecodedData];
        UIImage *image1=  [[UIImage alloc]initWithData:data1];
        
        //[NSData dataWithData:UIImagePNGRepresentation(image.image)];
        CGSize newsize=CGSizeMake(192, 110);
        UIGraphicsBeginImageContext(newsize);
        [image1 drawInRect:CGRectMake(0,0,newsize.width,newsize.height)];
        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        _picimageview.image=newImage;

        
       
        NSLog(@"img%@",image1);
        _activitybtn.hidden=YES;
        [_activitybtn stopAnimating];
        _addmatView.userInteractionEnabled=YES;
        // _picturelocation=_soapResults;
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
    if([elementName isEqualToString:@"UnitId"])
    {
       recordResults =FALSE;
         _soapResults = nil;
        
    }

    if([elementName isEqualToString:@"UnitInMeasure"])
    {
        recordResults =FALSE;
        [_unitofmeasurearray addObject:_soapResults];
        
         _soapResults = nil;

        
    }


}

#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    [self SearchMaterials];
    [_searchbar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    // [self Allmanpwrarry];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_searchbar.text length]==0) {
        
        [self SelectAllMaterials];
        // [searchBar resignFirstResponder];
        
        
    }
  //  [searchBar resignFirstResponder];
    
    
}

//IBActions

- (IBAction)subsearchbtn:(id)sender {
    [self createpopover];
    [self AllSkills ];
    
    
}

- (IBAction)updatebtn:(id)sender {
    
    if (butntype==1) {
        [self UserLogmaininsert];
    }else if(butntype==2){
         [self UserLogmainupdate];
    }
    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    if (rightsmodel.EditModule==0) {
        if (butntype==1) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You dont have rights to add a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }else if(butntype==2)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You dont have rights to edit this record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }
    else
    {

       
    UIImage *imagename =_picimageview.image;
    // NSData *data = UIImagePNGRepresentation(imagename);
    
    NSData *data = UIImageJPEGRepresentation(imagename, 1.0);
    
    
    _encodedString = [data base64EncodedString];

    
    if (butntype==1) {
        if([_destxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet] ].length==0)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Description field is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
             _destxtfld.text=@"";
        }
//        else if ([_subsearchbtnlbl.titleLabel.text isEqualToString:@""]||[_subsearchbtnlbl.titleLabel.text isEqualToString:@"Select"]){
//            
//            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Subtype field is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            
//            [alert show];
//            
//        }

        else
        {
            _activitybtn.hidden=NO;
            [_activitybtn startAnimating];
            _addmatView.userInteractionEnabled=NO;
             _updatebtn.enabled=NO;
        [self InserteMaterials];
            [self UnitOfMeasureInsert];

    }
    }
    else if (butntype==2){
        if([_destxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet] ].length==0)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Description field is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
             _destxtfld.text=@"";
        }
//        else if ([_subsearchbtnlbl.titleLabel.text isEqualToString:@""]||[_subsearchbtnlbl.titleLabel.text isEqualToString:@"Select"]){
//            
//            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Subtype field is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            
//            [alert show];
//            
//        }

else
{
    _activitybtn.hidden=NO;
    [_activitybtn startAnimating];
     _updatebtn.enabled=NO;
        [self UpdateMaterials];
     [self UnitOfMeasureInsert];
    
}
    }
    }
}

- (IBAction)cancelbtn:(id)sender {
    _codetxtfld.text=@"";
    
    _destxtfld.text=@"";
    _subtyptxtfld.text=@"";
    _unitcosttxtfld.text=@"";
    _stockinhandtxtfld.text=@"";
    _picimageview.image=[UIImage imageNamed:@"mNoImage"];
    [_subsearchbtnlbl setTitle:@"Select" forState:UIControlStateNormal];

}

- (IBAction)deletebtn:(id)sender {
    butntype=3;
    
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_materialTable setEditing:NO animated:NO];
        [_materialTable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_materialTable setEditing:YES animated:YES];
        [_materialTable reloadData];
        
        
        
        
    
    }

    
}

-(IBAction)closeMaterials:(id)sender
{
      _updatebtn.enabled=YES;
    _addmatView.hidden=YES;
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)addmaterial:(id)sender
{
      _updatebtn.enabled=YES;
    _materialTable.userInteractionEnabled=NO;
    _resultdispalylabel.hidden=YES;
    _codetxtfld.text=@"";
    imagechecker=1;
    _destxtfld.text=@"";
    _subtyptxtfld.text=@"";
    _unitcosttxtfld.text=@"";
    _stockinhandtxtfld.text=@"";
        _picimageview.image=[UIImage imageNamed:@"mNoImage"];
    [_subsearchbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
   _unitofmesuretxtfld.text=@"";

    butntype=1;
    _cancelbtnlbl.enabled=YES;
    _addmatView.hidden=NO;
    _navItem.title=@"Create";
}
-(IBAction)editmaterial:(id)sender
{
    _picimageview.image=[UIImage imageNamed:@"mNoImage"];
    imagechecker=1;
      _updatebtn.enabled=YES;
     _materialTable.userInteractionEnabled=NO;
    butntype=2;
    _resultdispalylabel.hidden=YES;
    _cancelbtnlbl.enabled=NO;
    _cancelbtnlbl.titleLabel.textColor=[UIColor grayColor];
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.materialTable];
    NSIndexPath *textFieldIndexPath = [self.materialTable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
   butnpath=textFieldIndexPath.row;
    Manpwr*pwrmdl=(Manpwr *)[_materialarray objectAtIndex:textFieldIndexPath.row];
    
    _codetxtfld.text=pwrmdl.itemcode;
    
    _destxtfld.text=pwrmdl.itemdescptn;
    //_subtyptxtfld.text=pwrmdl.subtype;
    
     [_subsearchbtnlbl setTitle:pwrmdl.subtype forState:UIControlStateNormal];
    _unitcosttxtfld.text=[NSString stringWithFormat:@"$%@",pwrmdl.unitcost];
    _stockinhandtxtfld.text=pwrmdl.stckinhand;
    _uplodpiclctn=pwrmdl.picturelocation;
    _unitofmesuretxtfld.text=pwrmdl.unitofmeasure;
      [_picimageview setImage:[UIImage imageNamed:@"mNoImage"]];
    if ([pwrmdl.allsubtype isEqualToString:@"true"]) {
        
        [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        createcheck=1;
        
    }
    else if([pwrmdl.allsubtype isEqualToString:@"false"]){
        
        [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        createcheck=1;
        
        
    }

    if(pwrmdl.picturelocation.length==0||[pwrmdl.picturelocation isEqualToString:@"NoImage.png"]){
         imagechecker=1;
    }
    else{
         imagechecker=2;
         [self FetchAnyImage];
    }
   


    _addmatView.hidden=NO;
    _navItem.title=@"Edit";
}
-(IBAction)closeaddview:(id)sender
{
      _updatebtn.enabled=YES;
    _addmatView.hidden=YES;
     _materialTable.userInteractionEnabled=YES;
   }

- (IBAction)mesuresechbtn:(id)sender {
    [self createSearchpopover];
    [self UnitOfMeasureSelect];
}

#pragma mark-Textfield Delegate


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    Validation*val=[[Validation alloc]init];
      if (textField==_unitcosttxtfld) {
        int value2=[val isNumeric:_unitcosttxtfld.text];
        if (value2==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid unit cost" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }
    
    if (textField==_stockinhandtxtfld) {
        int value12=[val isNumeric:_stockinhandtxtfld.text];
        if (value12==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid stock in hand" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }}
    if(textField==_unitofmesuretxtfld){
        
        int value13=[val validatespecialcharacters:_unitofmesuretxtfld.text];
        if(value13==0)
        {
            
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Unit" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
        
        
    }

    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([alertView.message isEqualToString:msgstrg]) {
        
        if(butntype==2){
             _updatebtn.enabled=YES;
            _addmatView.hidden=YES;
             _materialTable.userInteractionEnabled=YES;
        }
        _codetxtfld.text=@"";
          _updatebtn.enabled=YES;
        _destxtfld.text=@"";
        _subtyptxtfld.text=@"";
        _unitcosttxtfld.text=@"";
        _stockinhandtxtfld.text=@"";
        _picimageview.image=[UIImage imageNamed:@"mNoImage"];
        [_subsearchbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        _searchbar.text=@"";
        
    }

    if ([alertView.message isEqualToString:@"Invalid unit cost"]) {
        
        
        _unitcosttxtfld.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Invalid unit cost"]) {
        
        
        _unitcosttxtfld.text=@"";
        
    }
    

    
    if ([alertView.message isEqualToString:@"Invalid Unit"]) {
        
        
        _unitofmesuretxtfld.text=@"";
        
    }}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
//    if(textField==_unitcosttxtfld){
//    static NSCharacterSet *charsr=nil;
//    if (!charsr) {
//        charsr=[NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
//    }
//    
//    NSRange location=[string rangeOfCharacterFromSet:charsr];
//    
//    return (location.location==NSNotFound);
//    }
    
    if(textField==_codetxtfld)
    {
        NSUInteger newLength = [_codetxtfld.text length] + [string length] - range.length;
        return (newLength > 10) ? NO : YES;
    }
    if(textField==_destxtfld)
    {
        NSUInteger newLength = [_destxtfld.text length] + [string length] - range.length;
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
    
    
    return YES;
}
- (void)handlePinch:(UITapGestureRecognizer *)pinchGestureRecognizer
{
    //handle pinch...
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        imagechecker=2;
        
        _imagepicker =
        [[UIImagePickerController alloc] init];
        _imagepicker.delegate =(id) self;
        _imagepicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        _imagepicker.showsCameraControls=YES;
        
        _imagepicker.mediaTypes = [NSArray arrayWithObjects:
                                  (NSString *) kUTTypeImage,
                                  nil];
        _imagepicker.allowsEditing = NO;
        // imagePicker.cameraCaptureMode=YES;
        [self presentViewController:_imagepicker animated:YES completion:nil];
        _newMedia = YES;
    }
}

#pragma mark-ImagePicker
-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // [self.popoverController dismissPopoverAnimated:true];
    NSString *mediaType = [info
                           objectForKey:UIImagePickerControllerMediaType];
    
    
    
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = [info
                          objectForKey:UIImagePickerControllerOriginalImage];
        NSLog(@"dict%@",info);
        switch (image.imageOrientation) {
            case UIImageOrientationDown:
            case UIImageOrientationDownMirrored:
            case UIImageOrientationLeft:
            case UIImageOrientationLeftMirrored:
            case UIImageOrientationRight:
            case UIImageOrientationRightMirrored:
                image = [UIImage imageWithCGImage:image.CGImage
                                            scale:image.scale
                                      orientation:UIImageOrientationUp]; // change this if you need another orientation
                break;
            case UIImageOrientationUp:
            case UIImageOrientationUpMirrored:
                // The image is already in correct orientation
                break;
        }
        

        _picimageview.image=nil;
        
         imagechecker=2;
        
        _picimageview.image =image;
       // [self dismissViewControllerAnimated:YES completion:nil];
          [self.navigationController dismissViewControllerAnimated: YES completion: nil];
        if (_newMedia)
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    
    
    
}

-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
    
    else{
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(IBAction)cellsubtypeselection:(id)sender
{
    _moduleid=28;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.materialTable];
    NSIndexPath *textFieldIndexPath = [self.materialTable indexPathForRowAtPoint:rootViewPoint];
    
    Manpwr*matmodel=(Manpwr *)[_materialarray objectAtIndex:textFieldIndexPath.row];
    
    self.rstctrlr=[[RSTViewController alloc]initWithNibName:@"RSTViewController" bundle:nil];
    
    
    self.rstctrlr.modalPresentationStyle = UIModalPresentationFormSheet;
    _rstctrlr.materialmainid=matmodel.entryid;
    _rstctrlr.moduleid=_moduleid;
    [self presentViewController:self.rstctrlr
                       animated:YES completion:NULL];
}
- (IBAction)checksubtypebtn:(id)sender
{
    createstring=@"create";
    if (createcheck==0) {
        [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        createcheck=1;
        
    }
    
    else{
        [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        createcheck=0;
        
    }
    
}



@end
