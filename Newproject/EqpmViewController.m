//
//  EqpmViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "EqpmViewController.h"

@interface EqpmViewController ()

@end

@implementation EqpmViewController

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
    _addequipmentview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
_scroll_addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _scroll_addview.frame=CGRectMake(0, 0, 619,713);
    [_scroll_addview setContentSize:CGSizeMake(619,1024)];
    _equipmenttbl.layer.borderWidth = 2.0;
    _equipmenttbl.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    /*searchbar*/
    _SearchingBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
   _SearchingBar.delegate = (id)self;
   _SearchingBar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.equipmenttbl.tableHeaderView =_SearchingBar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_SearchingBar contentsController:self];
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
    _equipmenttbl.userInteractionEnabled=YES;
    //[self SelectAllEquipment];
    _activitybtn.hidden=YES;
     _updatebtn.enabled=YES;
      _addequipmentview.userInteractionEnabled=YES;
  
   
}


- (void)handlePinch:(UITapGestureRecognizer *)pinchGestureRecognizer
{
   
     //handle pinch...
    
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        
       
        _imagePicker =
        [[UIImagePickerController alloc] init];
        _imagePicker.delegate =(id) self;
        _imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        _imagePicker.showsCameraControls=YES;
        
        _imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                  (NSString *) kUTTypeImage,
                                  nil];
        _imagePicker.allowsEditing = NO;
        
        // imagePicker.cameraCaptureMode=YES;
        [self presentViewController:_imagePicker animated:YES completion:nil];
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
        
        
        
        _picimageview.image =image;
        imagechecker=2;

        
              // [self dismissViewControllerAnimated:YES completion:nil];
       [self.navigationController dismissViewControllerAnimated: YES completion: nil];
        //[self.imagePicker dismissViewControllerAnimated:YES completion:nil];
       
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
//camera in lanscapemode

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_subsearchlbl.frame
                                            inView:self.addequipmentview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}



#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_SearchingBar.text;
    //NSLog(@"search%@",searchstring);
    [self SearchEquipment];
    [searchBar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
   // [self Allmanpwrarry];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_SearchingBar.text length]==0) {
        
        [self SelectAllEquipment];
        // [searchBar resignFirstResponder];
        
        
    }
   // [searchBar resignFirstResponder];
    
    
}

#pragma mark - Table View datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        return [_Subtypearray count];
    }
    else if(tableView==_equipmenttbl){
        
    return [_Equpntarray count];
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
        if(tableView==_equipmenttbl){
        [[NSBundle mainBundle]loadNibNamed:@"customequipcell" owner:self options:nil];
        cell=_equipcell;
           }
    }
    if (tableView==_popOverTableView){
        cell.textLabel.text=[_Subtypearray objectAtIndex:indexPath.row];
    }
    if(tableView==_equipmenttbl){
  Equpmntmdl *eqmdl=(Equpmntmdl*)[_Equpntarray objectAtIndex:indexPath.row];
    _codelbl=(UILabel *)[cell viewWithTag:1];
    _codelbl.text=eqmdl.itemcode;
    _desclbl=(UILabel *)[cell viewWithTag:2];
    _desclbl.text=eqmdl.itemdescptn;
    _typelbl=(UILabel *)[cell viewWithTag:3];
    _typelbl.text=eqmdl.subtype;
        if ([eqmdl.EqAllSubTypes isEqualToString:@"true"]) {
            _cellsubtypebtn.enabled=NO;
            // [_allcrftbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_cellsubtypebtn setTitle:@"All Sub Types" forState:UIControlStateNormal];
            
        }
        else if([eqmdl.EqAllSubTypes isEqualToString:@"false"]){
            _cellsubtypebtn.enabled=YES;
            // [_allcrftbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
            [_cellsubtypebtn setTitle:@"Sub Types" forState:UIControlStateNormal];
            
            
        }

    }
       return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView==_popOverTableView){
        
        //_subtypetxtfld.text=[_Subtypearray objectAtIndex:indexPath.row];
        [_subsearchlbl setTitle:[_Subtypearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
    
     [self.popOverController dismissPopoverAnimated:YES];
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        deltepath=indexPath.row;
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        
        
        if (rightsmodel.DeleteModule==0) {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You dont have rights to delete a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        else
        {

        [self DeleteEquipment];
        [_Equpntarray removeObject:indexPath];
        }
        
        
        
        
        
    }
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_equipmenttbl)
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
-(void)SelectAllSubtypeEquipment{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllSubtypeEquipment xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "</SelectAllSubtypeEquipment>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SelectAllSubtypeEquipment" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllEquipment{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllEquipment xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "</SelectAllEquipment>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
     //NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SelectAllEquipment" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)InsertEquipment{
    webtype=1;
    _picturelocation=@"";
    recordResults = FALSE;
  //  NSString*picturelocatn=@"";
    NSString*Purchase=   [_purchasetxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*insured=   [_insuredtxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*shiftwise=   [_shiftwisetxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*hourly=   [_hurlytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*daily=   [_dailytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*weekly=   [_weeklytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*monthly=   [_monthlytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];

    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                    "<InsertEquipment xmlns=\"http://test.kontract360.com/\">\n"
                   "<ItemCode>%@</ItemCode>\n"
                   "<Description>%@</Description>\n"
                  
                   "<PurchaseValue>%f</PurchaseValue>\n"
                   "<SerialNo>%@</SerialNo>\n"
                   "<ManufacturedYear>%d</ManufacturedYear>\n"
                   "<PictureLocation>%@</PictureLocation>\n"
                   "<InsuredValue>%f</InsuredValue>\n"
                   "<HoursUsed>%f</HoursUsed>\n"
                   "<FuelConsumptionPerHour>%f</FuelConsumptionPerHour>\n"
                   "<Condition>%@</Condition>\n"
                   "<HourlyRate>%f</HourlyRate>\n"
                   "<DailyRate>%f</DailyRate>\n"
                   "<ShiftwiseRate>%f</ShiftwiseRate>\n"
                   "<WeeklyRate>%f</WeeklyRate>\n"
                   "<MonthlyRate>%f</MonthlyRate>\n"
                   "<YearlyRate>%f</YearlyRate>\n"
                   "<qtyinstock>%f</qtyinstock>\n"
                   "<EqAllSubTypes>%d</EqAllSubTypes>\n"
                   "</InsertEquipment>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",@"abc",_destxtfld.text,[Purchase floatValue],_serialtxtfld.text,[_manufattxtfld.text integerValue],_picturelocation,[insured floatValue],[_hurstxtfld.text floatValue],[_fueltxtfld.text floatValue],_condtntxtfld.text,[hourly floatValue],[daily floatValue],[shiftwise floatValue],[weekly floatValue],[monthly floatValue],[_yearlytxtfld.text floatValue],[_stockinhndtxtfld.text floatValue],createcheck];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/InsertEquipment" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateEquipment{
    webtype=2;
    recordResults = FALSE;
    _picturelocation=@"";

     NSString*Purchase=   [_purchasetxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*insured=   [_insuredtxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*shiftwise=   [_shiftwisetxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*hourly=   [_hurlytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
     NSString*daily=   [_dailytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*weekly=   [_weeklytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
     NSString*monthly=   [_monthlytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];

    
    //NSString*picturelocatn=@"";
    NSString *soapMessage;
    Equpmntmdl*eqmdl=(Equpmntmdl *)[_Equpntarray objectAtIndex:path];
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
        if ([eqmdl.EqAllSubTypes isEqualToString:@"true"]) {
            
            check=1;
        }
        else //if([eqmdl.EqAllSubTypes isEqualToString:@"false"])
        {
           
             check=0;
            
        }

        
    }

    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateEquipment xmlns=\"http://test.kontract360.com/\">\n"
                   "<ItemCode>%@</ItemCode>\n"
                   "<Description>%@</Description>\n"
                  
                   "<PurchaseValue>%f</PurchaseValue>\n"
                   "<SerialNo>%@</SerialNo>\n"
                   "<ManufacturedYear>%d</ManufacturedYear>\n"
                   "<PictureLocation>%@</PictureLocation>\n"
                   "<InsuredValue>%f</InsuredValue>\n"
                   "<HoursUsed>%f</HoursUsed>\n"
                   "<FuelConsumptionPerHour>%f</FuelConsumptionPerHour>\n"
                   "<Condition>%@</Condition>\n"
                   "<HourlyRate>%f</HourlyRate>\n"
                   "<DailyRate>%f</DailyRate>\n"
                   "<ShiftwiseRate>%f</ShiftwiseRate>\n"
                   "<WeeklyRate>%f</WeeklyRate>\n"
                   "<MonthlyRate>%f</MonthlyRate>\n"
                   "<YearlyRate>%f</YearlyRate>\n"
                      "<entryid>%d</entryid>\n"
                     "<qtyinstock>%f</qtyinstock>\n"
                   "<EqAllSubTypes>%d</EqAllSubTypes>\n"
                   "</UpdateEquipment>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_codetxfld.text,_destxtfld.text,[Purchase floatValue],_serialtxtfld.text,[_manufattxtfld.text integerValue],_picturelocation,[insured floatValue],[_hurstxtfld.text floatValue],[_fueltxtfld.text floatValue],_condtntxtfld.text,[hourly floatValue],[daily floatValue],[shiftwise floatValue],[weekly floatValue],[monthly floatValue],[_yearlytxtfld.text floatValue],eqmdl.entryid,[_stockinhndtxtfld.text floatValue],check];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/UpdateEquipment" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)DeleteEquipment{
    webtype=3;
    recordResults = FALSE;
    NSString *soapMessage;
    
  Equpmntmdl*eqmdl=(Equpmntmdl *)[_Equpntarray objectAtIndex:deltepath];

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DeleteEquipment xmlns=\"http://test.kontract360.com/\">\n"
                   "<entryid>%d</entryid>\n"
                   "</DeleteEquipment>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",eqmdl.entryid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/DeleteEquipment" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SearchEquipment{
    recordResults = FALSE;
    NSString *soapMessage;
    
   
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SearchEquipment xmlns=\"http://test.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</SearchEquipment>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SearchEquipment" forHTTPHeaderField:@"Soapaction"];
    
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
    NSString *imagename;
    
    imagename=[NSString stringWithFormat:@"Photo_%@.jpg",newequcode];
    
    // NSString *imagename=[NSString stringWithFormat:@"Newimage.jpg"];
    NSString *type=@"Equipments";
    
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
                   "</soap:Envelope>\n",_encodedString,imagename,type,newequcode];
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
    NSString *imagename;
    
    imagename=[NSString stringWithFormat:@"Photo_%@.jpg",_codetxfld.text];
    
   // NSString *imagename=[NSString stringWithFormat:@"Newimage.jpg"];
    NSString *type=@"Equipments";
    
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
                   "</soap:Envelope>\n",_encodedString,imagename,type,_codetxfld.text];
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
    _addequipmentview.userInteractionEnabled=NO;
   // NSString *imagename=[NSString stringWithFormat:@"Photo_%@.png",_codetxfld.text];
    NSString *type=@"Equipments";
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
    //UIAlertView *alert=[ui]
    
    
    
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
        [self SelectAllEquipment];
        _SearchingBar.text=@"";
      webtype=0;
    }
    [_equipmenttbl reloadData];
    [_popOverTableView reloadData];
    
    
}

#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    
   
    if([elementName isEqualToString:@"SelectAllSubtypeEquipmentResult"])
    {
        _Subtypearray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"SelectAllEquipmentResult"])
    {
        _Equpntarray=[[NSMutableArray alloc]init];
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
    
    if([elementName isEqualToString:@"PurchaseValue"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SerialNo"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ManufacturedYear"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PictureLocation"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"InsuredValue"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"HoursUsed"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FuelConsumptionPerHour"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    if([elementName isEqualToString:@"Condition"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"HourlyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"DailyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ShiftwiseRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"WeeklyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"MonthlyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EqAllSubTypes"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"YearlyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"SearchEquipmentResponse"])
    {
        _Equpntarray=[[NSMutableArray alloc]init];
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



    if([elementName isEqualToString:@"InsertEquipmentResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UpdateEquipmentResult"])
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
    if([elementName isEqualToString:@"InsertEquipmentResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    
    if([elementName isEqualToString:@"EqpCode"])
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
        _Subtypearray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"subtype"])
    {
       
        
        recordResults = FALSE;
        [_Subtypearray addObject:_soapResults];

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryId"])
    {
        
        _eqmdl=[[Equpmntmdl alloc]init];
        recordResults = FALSE;
        
        _eqmdl.entryid=[_soapResults integerValue];
        
        _soapResults = nil;    }
    if([elementName isEqualToString:@"ItemCode"])
    {
        
        recordResults = FALSE;
        _eqmdl.itemcode=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
        _eqmdl.itemdescptn=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"SubType"])
    {
        
        recordResults = FALSE;
        
        _eqmdl.subtype=[_revskilldict objectForKey:_soapResults];
        
        _soapResults = nil;    }
    
    if([elementName isEqualToString:@"PurchaseValue"])
    {
        
        recordResults = FALSE;
        _eqmdl.PurchaseValue=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SerialNo"])
    {
        
        recordResults = FALSE;
        _eqmdl.SerialNo=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ManufacturedYear"])
    {
        
        recordResults = FALSE;
        _eqmdl.ManufacturedYear=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PictureLocation"])
    {
        
        recordResults = FALSE;
        _eqmdl.PictureLocation=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"InsuredValue"])
    {
        
        recordResults = FALSE;
        _eqmdl.InsuredValue=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"HoursUsed"])
    {
        
        recordResults = FALSE;
        _eqmdl.HoursUsed=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FuelConsumptionPerHour"])
    {
        
        recordResults = FALSE;
        _eqmdl.FuelConsumptionPerHour=_soapResults;
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"Condition"])
    {
        
        recordResults = FALSE;
        _eqmdl.Condition=_soapResults;
        _soapResults = nil;    }
    
    if([elementName isEqualToString:@"HourlyRate"])
    {
        
        recordResults = FALSE;
        _eqmdl.HourlyRate=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"DailyRate"])
    {
        
        recordResults = FALSE;
        _eqmdl.DailyRate=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ShiftwiseRate"])
    {
        
        recordResults = FALSE;
        _eqmdl.ShiftwiseRate=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"WeeklyRate"])
    {
        
        recordResults = FALSE;
        _eqmdl.WeeklyRate=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"MonthlyRate"])
    {
        
        recordResults = FALSE;
        _eqmdl.MonthlyRate=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"YearlyRate"])
    {
        
        recordResults = FALSE;
        _eqmdl.YearlyRate=_soapResults;
              _soapResults = nil;
    }
    if([elementName isEqualToString:@"qtyinstock"])
    {
        recordResults = FALSE;
        _eqmdl.stockinhand=_soapResults;
       

        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"EqpCode"])
    {
          recordResults = FALSE;
        newequcode=_soapResults;
        _soapResults = nil;

      
    }
    if([elementName isEqualToString:@"EqAllSubTypes"])
    {
        recordResults = FALSE;
        _eqmdl.EqAllSubTypes=_soapResults;
         [_Equpntarray addObject:_eqmdl];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"result"])
    {
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"Inserted Successfully"]) {
            
          
            
            if (imagechecker==1) {
                 mesgstrg=_soapResults;
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:mesgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _activitybtn.hidden=YES;
                
                [_activitybtn stopAnimating];
                _addequipmentview.userInteractionEnabled=YES;
                [self SelectAllEquipment];

            }
            else if (imagechecker==2){
                  mesgstrg=_soapResults;
                 [self Insertanyimage];
            }
            // [self Insertanyimage];
            webtype=0;
           

                   }
        if ([_soapResults isEqualToString:@"Updated Successfully"]) {
            mesgstrg=_soapResults;
           
           // [self UploadAnyImage];
            if (imagechecker==1) {
                
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:mesgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _activitybtn.hidden=YES;
                
                [_activitybtn stopAnimating];
                _addequipmentview.userInteractionEnabled=YES;
                [self SelectAllEquipment];
                
            }
            else if (imagechecker==2){
               [self UploadAnyImage];
            }

            webtype=0;
            
        }
        if ([_soapResults isEqualToString:@"Already In Use"]) {
            mesgstrg=_soapResults;
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:mesgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }

        else if ([_soapResults isEqualToString:@"Eqp Picture Updated"]){
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:mesgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _activitybtn.hidden=YES;

              [_activitybtn stopAnimating];
              _addequipmentview.userInteractionEnabled=YES;
            [self SelectAllEquipment];
        }
         if ([_soapResults isEqualToString:@"Already Exists"])
             {
                  mesgstrg=_soapResults;
                  _activitybtn.hidden=YES;
                   [_activitybtn stopAnimating];
                   _addequipmentview.userInteractionEnabled=YES;
                 UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:mesgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                 [alert show];
                 
             }
        
        
      _soapResults = nil;
        
    }

    
    if([elementName isEqualToString:@"url"])
    {
        recordResults = FALSE;
        NSData *data1=[_soapResults base64DecodedData];
        UIImage *image1=  [[UIImage alloc]initWithData:data1];
        
        //[NSData dataWithData:UIImagePNGRepresentation(image.image)];
        _activitybtn.hidden=YES;
        [_activitybtn stopAnimating];
         _addequipmentview.userInteractionEnabled=YES;
        
        _picimageview.image=image1;
        NSLog(@"img%@",image1);

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
        [_Subtypearray addObject:_soapResults];
        _soapResults = nil;
        
        
    }

}
#pragma mark-IBActions

- (IBAction)subsearch:(id)sender {
    [self createpopover];
    [self AllSkills];
}
- (IBAction)checksubtypebtn:(id)sender
{  createstring=@"create";
    if (createcheck==0) {
        [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        createcheck=1;
        
    }
    
    else{
        [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        createcheck=0;
        
    }

}

- (IBAction)deletebtn:(id)sender {
    btntype=3;
   
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_equipmenttbl setEditing:NO animated:NO];
        [_equipmenttbl reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_equipmenttbl setEditing:YES animated:YES];
        [_equipmenttbl reloadData];
        
        
        
        
    }
    
    

}

-(IBAction)closeEqupment:(id)sender
{
     _updatebtn.enabled=YES;
    _addequipmentview.hidden=YES;
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)addEquipment:(id)sender
{
     imagechecker=1;
     _updatebtn.enabled=YES;
    [_equipmenttbl setEditing:NO animated:NO];
    _codetxfld.text=@"";
    _destxtfld.text=@"";
    _subtypetxtfld.text=@"";
    _purchasetxtfld.text=@"";
    _serialtxtfld.text=@"";
    _manufattxtfld.text =@"";
    _insuredtxtfld.text=@"";
    _hurstxtfld.text=@"";
    _fueltxtfld.text=@"";
    _condtntxtfld.text=@"";
    _hurlytxtfld.text=@"";
    _dailytxtfld.text=@"";
    _shiftwisetxtfld.text=@"";
    _weeklytxtfld.text=@"";
    _monthlytxtfld.text=@"";
    _yearlytxtfld.text=@"";
    _stockinhndtxtfld.text=@"";
  _picimageview.image=[UIImage imageNamed:@"mNoImage"];
    [_subsearchlbl setTitle:@"Select" forState:UIControlStateNormal];
    [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    _equipmenttbl.userInteractionEnabled=NO;
    _cancelbtnlbl.enabled=YES;

    btntype=1;
    _addequipmentview.hidden=NO;
    _navItem.title=@"Create";
}
-(IBAction)closeaddview:(id)sender
{
     _updatebtn.enabled=YES;
    _addequipmentview.hidden=YES;
     _equipmenttbl.userInteractionEnabled=YES;
      _addequipmentview.userInteractionEnabled=YES;
      _updatelbl.hidden=YES;

}
-(IBAction)editequipview:(id)sender
{
    _picimageview.image=[UIImage imageNamed:@"mNoImage"];
    btntype=2;
     imagechecker=1;
     _updatebtn.enabled=YES;
     _equipmenttbl.userInteractionEnabled=NO;
    [_equipmenttbl setEditing:NO animated:NO];
    _cancelbtnlbl.enabled=NO;
    _cancelbtnlbl.titleLabel.textColor=[UIColor grayColor];
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.equipmenttbl];
    NSIndexPath *textFieldIndexPath = [self.equipmenttbl indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
   path=textFieldIndexPath.row;
 Equpmntmdl*eqmdl=(Equpmntmdl *)[_Equpntarray objectAtIndex:textFieldIndexPath.row];
    _codetxfld.text=eqmdl.itemcode;
    
    _destxtfld.text=eqmdl.itemdescptn;
    //_subtypetxtfld.text=eqmdl.subtype;
    [_subsearchlbl setTitle:eqmdl.subtype forState:UIControlStateNormal];
    _purchasetxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.PurchaseValue];
    _serialtxtfld.text=eqmdl.SerialNo;
    _manufattxtfld.text =eqmdl.ManufacturedYear;
    _insuredtxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.InsuredValue];
    _hurstxtfld.text=eqmdl.HoursUsed;
    _fueltxtfld.text=eqmdl.FuelConsumptionPerHour;
    _condtntxtfld.text=eqmdl.Condition;
    _hurlytxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.HourlyRate];
    _dailytxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.DailyRate];
    _shiftwisetxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.ShiftwiseRate];
    _weeklytxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.WeeklyRate];
    _monthlytxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.MonthlyRate];
    _yearlytxtfld.text=[NSString stringWithFormat:@"%@",eqmdl.YearlyRate];
    _stockinhndtxtfld.text=[NSString stringWithFormat:@"%@",eqmdl.stockinhand];
    _uplodpiclctn=[NSString stringWithFormat:@"%@",eqmdl.PictureLocation];
    [_picimageview setImage:[UIImage imageNamed:@"mNoImage"]];
    if ([eqmdl.EqAllSubTypes isEqualToString:@"true"]) {
        
        [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        createcheck=1;
        
    }
    else if([eqmdl.EqAllSubTypes isEqualToString:@"false"]){
        
         [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        createcheck=0;
        
        
        
    }

    if(eqmdl.PictureLocation.length==0){
         imagechecker=1;
        
    }
    else{
        imagechecker=2;
          [self FetchAnyImage];
    }
  

_addequipmentview.hidden=NO;
    _navItem.title=@"Edit";

}


- (IBAction)updatebtn:(id)sender {
    
    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    if (rightsmodel.EditModule==0) {
        if (btntype==1) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You dont have rights to add a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }else if(btntype==2)
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
        
        //NSLog(@"result%@",_encodedString);

        
         // [self UploadAnyImage];
    
    if([_destxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Description field is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
    }
    
    else if ([_subsearchlbl.titleLabel.text isEqualToString:@""]||[_subsearchlbl.titleLabel.text isEqualToString:@"Select"]){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Subtype field is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];

    }
    else{
        
        _activitybtn.hidden=NO;
        [_activitybtn startAnimating];
        _addequipmentview.userInteractionEnabled=NO;
    if (btntype==1) {
        _updatebtn.enabled=NO;
               [self InsertEquipment];
        //[self UploadAnyImage];
    }
    if (btntype==2) {
         _updatebtn.enabled=NO;
     
        [self UpdateEquipment];
       // [self UploadAnyImage];
    }
    }
    }
}

- (IBAction)cancelbtn:(id)sender {
    
    _codetxfld.text=@"";
    _destxtfld.text=@"";
    _subtypetxtfld.text=@"";
    _purchasetxtfld.text=@"";
    _serialtxtfld.text=@"";
    _manufattxtfld.text =@"";
    _insuredtxtfld.text=@"";
    _hurstxtfld.text=@"";
    _fueltxtfld.text=@"";
    _condtntxtfld.text=@"";
    _hurlytxtfld.text=@"";
    _dailytxtfld.text=@"";
    _shiftwisetxtfld.text=@"";
    _weeklytxtfld.text=@"";
    _monthlytxtfld.text=@"";
    _yearlytxtfld.text=@"";
    _stockinhndtxtfld.text=@"";
      _picimageview.image=[UIImage imageNamed:@"mNoImage"];
[_subsearchlbl setTitle:@"Select" forState:UIControlStateNormal];
}

#pragma mark-Textfield Delegate


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    Validation*val=[[Validation alloc]init];
    if (textField==_purchasetxtfld) {
          int value1=[val isNumeric:_purchasetxtfld.text];
        if (value1==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid purchase value" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];

        }
        
    }
    if (textField==_manufattxtfld) {
          int value2=[val isIntegerValue:_manufattxtfld.text];
        if (value2==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid year"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }

    }
    if (textField==_insuredtxtfld) {
          int value3=[val isNumeric:_insuredtxtfld.text];
        if (value3==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid insured value" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }

    }
    
    if (textField==_hurstxtfld) {
         int value4=[val isNumeric:_hurstxtfld.text];
        if (value4==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid used hours value" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }

    }
  
    if (textField==_fueltxtfld) {
        int value5=[val isNumeric:_fueltxtfld.text];
        if (value5==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid fuel consumption" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }

        
    }
    if (textField==_hurlytxtfld) {
          int value6=[val isNumeric:_hurlytxtfld.text];
        if (value6==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid hourly rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        else{
            
        float daily=8*[_hurlytxtfld.text floatValue];
        _dailytxtfld.text=[NSString stringWithFormat:@"%g",daily];
            float weekly=24*[_hurlytxtfld.text floatValue];
            _weeklytxtfld.text=[NSString stringWithFormat:@"%g",weekly];
            float monthly=72*[_hurlytxtfld.text floatValue];
            _monthlytxtfld.text=[NSString stringWithFormat:@"%g",monthly];
            
        }

        
        
    }
    if (textField==_dailytxtfld) {
      int value7=[val isNumeric:_dailytxtfld.text];
        if (value7==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid daily rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        else{
            
            float hourly=[_dailytxtfld.text floatValue]/8;
            _hurlytxtfld.text=[NSString stringWithFormat:@"%g",hourly];
            float weekly=24*hourly;
            _weeklytxtfld.text=[NSString stringWithFormat:@"%g",weekly];
            float monthly=72*hourly;
            _monthlytxtfld.text=[NSString stringWithFormat:@"%g",monthly];
            
            }

        
    }
    if (textField==_shiftwisetxtfld) {
        
        int value8=[val isNumeric:_shiftwisetxtfld.text];
        if (value8==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid shiftwise rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
       


    }
    if (textField==_weeklytxtfld) {
       int value9=[val isNumeric:_weeklytxtfld.text];
        if (value9==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid weekly rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        else{
            
            float hourly=[_weeklytxtfld.text floatValue]/24;
            _hurlytxtfld.text=[NSString stringWithFormat:@"%g",hourly];
            float daily=8*hourly;
            _dailytxtfld.text=[NSString stringWithFormat:@"%g",daily];
            float monthly=72*hourly;
            _monthlytxtfld.text=[NSString stringWithFormat:@"%g",monthly];
            
        }

        
    }

      if (textField==_monthlytxtfld) {
        int value10=[val isNumeric:_monthlytxtfld.text];
          if (value10==0) {
              UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid monthly rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
              [alert1 show];
              
          }
          else{
              
              float hourly=[_monthlytxtfld.text floatValue]/72;
              _hurlytxtfld.text=[NSString stringWithFormat:@"%g",hourly];
              float daily=8*hourly;
              _dailytxtfld.text=[NSString stringWithFormat:@"%g",daily];
              float weekly=72*hourly;
              _weeklytxtfld.text=[NSString stringWithFormat:@"%g",weekly];
              
          }


        
    }

    if (textField==_yearlytxtfld) {
         int value11=[val isNumeric:_yearlytxtfld.text];
        if (value11==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Weight" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }

        
    }
    
    if (textField==_stockinhndtxtfld) {
        int value12=[val isNumeric:_stockinhndtxtfld.text];
        if (value12==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid stock in hand" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }

    
        
    }
    if(textField==_serialtxtfld){
        Validation *val=[[Validation alloc]init];
        int value1=[val validatespecialcharacters:_serialtxtfld.text];
        if(value1==0)
        {
            
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Serial Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
        
        
    }

    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([alertView.message isEqualToString:mesgstrg]) {
        if (btntype==1) {
            
         _updatebtn.enabled=YES;
        _codetxfld.text=@"";
        _destxtfld.text=@"";
        _subtypetxtfld.text=@"";
        _purchasetxtfld.text=@"";
        _serialtxtfld.text=@"";
        _manufattxtfld.text =@"";
        _insuredtxtfld.text=@"";
        _hurstxtfld.text=@"";
        _fueltxtfld.text=@"";
        _condtntxtfld.text=@"";
        _hurlytxtfld.text=@"";
        _dailytxtfld.text=@"";
        _shiftwisetxtfld.text=@"";
        _weeklytxtfld.text=@"";
        _monthlytxtfld.text=@"";
        _yearlytxtfld.text=@"";
        _stockinhndtxtfld.text=@"";
        _picimageview.image=[UIImage imageNamed:@"mNoImage"];
        [_subsearchlbl setTitle:@"Select" forState:UIControlStateNormal];
         _SearchingBar.text=@"";
        }
        else if (btntype==2)
        {_codetxfld.text=@"";
            _destxtfld.text=@"";
            _subtypetxtfld.text=@"";
            _purchasetxtfld.text=@"";
            _serialtxtfld.text=@"";
            _manufattxtfld.text =@"";
            _insuredtxtfld.text=@"";
            _hurstxtfld.text=@"";
            _fueltxtfld.text=@"";
            _condtntxtfld.text=@"";
            _hurlytxtfld.text=@"";
            _dailytxtfld.text=@"";
            _shiftwisetxtfld.text=@"";
            _weeklytxtfld.text=@"";
            _monthlytxtfld.text=@"";
            _yearlytxtfld.text=@"";
            _stockinhndtxtfld.text=@"";
            _picimageview.image=[UIImage imageNamed:@"mNoImage"];
            [_subsearchlbl setTitle:@"Select" forState:UIControlStateNormal];
            _addequipmentview.hidden=YES;
             _equipmenttbl.userInteractionEnabled=YES;
            _SearchingBar.text=@"";
             _updatebtn.enabled=YES;
            
        }

        
    }
    if ([alertView.message isEqualToString:@"Invalid purchase value"]) {
        
        
        _purchasetxtfld.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Description field is required"]) {
        
        
        _destxtfld.text=@"";
        
    }
    
    if ([alertView.message isEqualToString:@"Invalid year"]) {
        
        
        _manufattxtfld.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Invalid Serial Number"]) {
        
        
        _serialtxtfld.text=@"";
        
    }
    
    if ([alertView.message isEqualToString:@"Invalid insured value"]) {
        
        
        _insuredtxtfld.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Invalid used hours value"]) {
        
        
        _hurstxtfld.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Invalid  hourly rate"]) {
        
        
        _hurlytxtfld.text=@"";
        
    }

    if ([alertView.message isEqualToString:@"Invalid daily rate"]) {
        
        
        _dailytxtfld.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Invalid shiftwise rate"]) {
        
        
_shiftwisetxtfld.text=@"";
        
    }

    if ([alertView.message isEqualToString:@"Invalid weekly rate"]) {
        
        
        _weeklytxtfld.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Invalid monthly rate"]) {
        
        
        _monthlytxtfld.text=@"";
        
    }
    

    if ([alertView.message isEqualToString:@"Invalid Weight"]) {
        
        
        _yearlytxtfld.text=@"";
        
    }
    
    if ([alertView.message isEqualToString:@"Invalid stock in hand"]) {
        
        
        _stockinhndtxtfld.text=@"";
        
    }
    


    
}




- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
       if(textField==_codetxfld)
    {
        NSUInteger newLength = [_codetxfld.text length] + [string length] - range.length;
        return (newLength > 10) ? NO : YES;
    }
    if(textField==_destxtfld)
    {
        NSUInteger newLength = [_destxtfld.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    if(textField==_serialtxtfld)
    {
        NSUInteger newLength = [_serialtxtfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
    
    if(textField==_manufattxtfld)
    {
        NSUInteger newLength = [_manufattxtfld.text length] + [string length] - range.length;
        return (newLength > 4) ? NO : YES;
    }
    if(textField==_insuredtxtfld)
    {
        NSUInteger newLength = [_insuredtxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    
    if(textField==_hurstxtfld)
    {
        NSUInteger newLength = [_hurstxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_fueltxtfld)
    {
        NSUInteger newLength = [_fueltxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_condtntxtfld)
    {
        NSUInteger newLength = [_condtntxtfld.text length] + [string length] - range.length;
        return (newLength > 200) ? NO : YES;
    }
    if(textField==_hurlytxtfld)
    {
        NSUInteger newLength = [_hurlytxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_dailytxtfld)
    {
        NSUInteger newLength = [_dailytxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    
    if(textField==_shiftwisetxtfld)
    {
        NSUInteger newLength = [_shiftwisetxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_weeklytxtfld)
    {
        NSUInteger newLength = [_weeklytxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    
    if(textField==_monthlytxtfld)
    {
        NSUInteger newLength = [_monthlytxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
       if(textField==_yearlytxtfld)
    {
        NSUInteger newLength = [_yearlytxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_stockinhndtxtfld)
    {
        NSUInteger newLength = [_stockinhndtxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
       
    
    
    
    //_picker.hidden=YES;
    return YES;
}
-(IBAction)cellsubtypeselection:(id)sender
{
    _moduleid=27;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.equipmenttbl];
    NSIndexPath *textFieldIndexPath = [self.equipmenttbl indexPathForRowAtPoint:rootViewPoint];

    Equpmntmdl*eqmdl=(Equpmntmdl *)[_Equpntarray objectAtIndex:textFieldIndexPath.row];

    self.subtypctrlr=[[RSTViewController alloc]initWithNibName:@"RSTViewController" bundle:nil];


    self.subtypctrlr.modalPresentationStyle = UIModalPresentationFormSheet;
    _subtypctrlr.equipmainid=eqmdl.entryid;
    _subtypctrlr.moduleid=_moduleid;
    [self presentViewController:self.subtypctrlr
                   animated:YES completion:NULL];
}



@end
