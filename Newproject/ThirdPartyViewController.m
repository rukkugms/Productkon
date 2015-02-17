//
//  ThirdPartyViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 1/1/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "ThirdPartyViewController.h"


@interface ThirdPartyViewController ()
@end



@implementation ThirdPartyViewController
@synthesize sectionArray, openSectionIndex;

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
    moduleid=34;
    // Do any additional setup after loading the view from its nib.
    _scroll.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];

_scroll.frame=CGRectMake(0, 0, 619,713);
   [_scroll setContentSize:CGSizeMake(619,1024)];
    _thirdprtyTable.layer.borderWidth = 2.0;
   _thirdprtyTable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _view1.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    /*searchbar*/
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
 _searchbar.delegate = (id)self;
_searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.thirdprtyTable.tableHeaderView =_searchbar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;
    _Typearray=[[NSMutableArray alloc]initWithObjects:@"Equipment",@"Fleet", nil];
    _pictureimgvw.layer.borderColor=[UIColor blackColor].CGColor;
    _pictureimgvw.layer.borderWidth=2;
    _pictureimgvw.userInteractionEnabled = YES;
    UITapGestureRecognizer *pgr = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(handlePinch:)];
    pgr.delegate = (id)self;
    [_pictureimgvw addGestureRecognizer:pgr];

}
- (void)handlePinch:(UITapGestureRecognizer *)pinchGestureRecognizer
{
    //handle pinch...
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        
        
       _imagePicker
        =
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

        _pictureimgvw.image=nil;
        
         imagechecker=2;
        
        _pictureimgvw.image =image;
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-Popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
//    UIView* popoverView = [[UIView alloc]
//                           initWithFrame:CGRectMake(0, 0, 200, 120)];
    popoverContent.view.bounds=CGRectMake(10, 20, 20, 10);
    //popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    
    // CGRect rect = frame;
   // [popoverView addSubview:_popOverTableView];
    popoverContent.view = _popOverTableView;
    
    //resize the popover view shown
    //in the current view to the view's size
    //popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 120);
    
    [popoverContent setContentSizeForViewInPopover: CGSizeMake(20, 0)];
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popOverController.popoverContentSize=CGSizeMake(200.0f, 120.0f);
    self.popOverController=_popOverController;
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    
    if (popvr==1) {
        
    
    
    [self.popOverController presentPopoverFromRect:_suserachbtnlbl.frame
                                            inView:self.scroll
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    }
    if (popvr==2) {
        [self.popOverController presentPopoverFromRect:_typesearchlbl.frame
                                                inView:self.scroll
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];

        
    }
}


-(void)viewWillAppear:(BOOL)animated{
     _updatebtn.enabled=YES;
    [super viewWillAppear:animated];
    
         if (_frmplan==1) {
        /*searchbar*/
        _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
        _searchbar.delegate = (id)self;
        _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
        
        self.thirdprtyTable.tableHeaderView =_searchbar;
        
        UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
        searchController.searchResultsDataSource = (id)self;
        searchController.searchResultsDelegate =(id)self;
        searchController.delegate = (id)self;
        
        _searchstring=[_itemfromgp stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        _searchbar.text=[_itemfromgp stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        [self SearchThirdParty];
    }
    else
    {
        /*searchbar*/
        _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
        _searchbar.delegate = (id)self;
        _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
        
        self.thirdprtyTable.tableHeaderView =_searchbar;
        
        UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
        searchController.searchResultsDataSource = (id)self;
        searchController.searchResultsDelegate =(id)self;
        searchController.delegate = (id)self;
        _searchbar.text=@"";
       
   [self AllSkills];
    }
    

    
       //[self SelectAllThirdParty];
    _activitybtn.hidden=YES;
}
#pragma mark- WebService
-(void)SelectAllSubtypeThirdParty{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllSubtypeThirdParty xmlns=\"https://vip.kontract360.com/\">\n"
                   
                   "</SelectAllSubtypeThirdParty>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/SelectAllSubtypeThirdParty" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllThirdParty{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllThirdParty xmlns=\"https://vip.kontract360.com/\">\n"
                   
                   "</SelectAllThirdParty>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/SelectAllThirdParty" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)InsertThirdParty{
    webtype=1;
    recordResults = FALSE;
    if (imagechecker==1) {
        _picturelocation=@"NoImage.png";
    }
    else
    {
        _picturelocation=@"";
    }
    
    
    NSString*Purchase=   [_purchasetxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*insured=   [_insuredtxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*shiftwise=   [_shiftwisetxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*hourly=   [_hurlytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*daily=   [_dailytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*weekly=   [_weeklytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*monthly=   [_monthlytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*unitcost=[_unitcsttxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*yearly=[_yearlytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];

    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   "<soap:Body>\n"
                   
                   "<InsertThirdParty xmlns=\"https://vip.kontract360.com/\">\n"
                   "<ItemCode>%@</ItemCode>\n"
                    "<unitcost>%f</unitcost>\n"
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
                   "<type>%@</type>\n"
                   "<qtyinstock>%f</qtyinstock>\n"
                   "<TPAllSubTypes>%d</TPAllSubTypes>\n"
                   "</InsertThirdParty>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",@"abc",[unitcost floatValue],_destxtfld.text,[Purchase floatValue],_serialtxtfld.text,[_manufattxtfld.text integerValue],_picturelocation,[insured floatValue],[_hurstxtfld.text floatValue],[_fueltxtfld.text floatValue],_condtntxtfld.text,[hourly floatValue],[daily floatValue],[shiftwise floatValue],[weekly floatValue],[monthly floatValue],[yearly floatValue],_typesearchlbl.titleLabel.text,[_stckinhandtxtdfld.text floatValue],checksub];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/InsertThirdParty" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateThirdParty {
    webtype=2;
    recordResults = FALSE;
    if (imagechecker==1) {
        _picturelocation=@"NoImage.png";
    }
    else
    {
        _picturelocation=@"";
    }

    NSString *soapMessage;
    
    NSString*Purchase=   [_purchasetxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*insured=   [_insuredtxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*shiftwise=   [_shiftwisetxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*hourly=   [_hurlytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*daily=   [_dailytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*weekly=   [_weeklytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*monthly=   [_monthlytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSString*unitcost=[_unitcsttxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
       NSString*yearly=[_yearlytxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];

      Equpmntmdl*Thrdprty=(Equpmntmdl *)[_thirdprtyarray objectAtIndex:btnpath];
    NSInteger check;
    if([checkstring isEqualToString:@"Check"])
    {
        if (checksub==0) {
            check=0;
        }
        else{
            check=1;
            
        }
        checkstring=@"";
    }
    else
    {
        if ([Thrdprty.EqAllSubTypes isEqualToString:@"true"]) {
            
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
                   
                   "<UpdateThirdParty  xmlns=\"https://vip.kontract360.com/\">\n"
                   "<entryid>%d</entryid>\n"
                   "<ItemCode>%@</ItemCode>\n"
                     "<unitcost>%f</unitcost>\n"
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
                   "<type>%@</type>\n"
                   "<qtyinstock>%f</qtyinstock>\n"
                   "<TPAllSubTypes>%d</TPAllSubTypes>\n"
                   "</UpdateThirdParty>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Thrdprty.entryid,_codetxtfld.text,[unitcost floatValue],_destxtfld.text,[Purchase floatValue],_serialtxtfld.text,[_manufattxtfld.text integerValue],_picturelocation,[insured floatValue],[_hurstxtfld.text floatValue],[_fueltxtfld.text floatValue],_condtntxtfld.text,[hourly floatValue],[daily floatValue],[shiftwise floatValue],[weekly floatValue],[monthly floatValue],[yearly floatValue],_typesearchlbl.titleLabel.text,[_stckinhandtxtdfld.text floatValue],check];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/UpdateThirdParty" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)DeleteThirdParty{
    webtype=3;
    recordResults = FALSE;
    NSString *soapMessage;
    
   Equpmntmdl*eqmdl=(Equpmntmdl *)[_thirdprtyarray objectAtIndex:deltepath];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DeleteThirdParty xmlns=\"https://vip.kontract360.com/\">\n"
                   "<entryid>%d</entryid>\n"
                   "</DeleteThirdParty>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",eqmdl.entryid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/DeleteThirdParty" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SearchThirdParty {
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SearchThirdParty  xmlns=\"https://vip.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</SearchThirdParty>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/SearchThirdParty" forHTTPHeaderField:@"Soapaction"];
    
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
    
    imagename=[NSString stringWithFormat:@"Photo_%@.jpg",_codetxtfld.text];
    
    //NSString *imagename=[NSString stringWithFormat:@"Newimage.jpg"];
    NSString *type=@"ThirdParty";
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UploadAnyImage xmlns=\"https://vip.kontract360.com/\">\n"
                   "<f>%@</f>\n"
                   "<fileName>%@</fileName>\n"
                   "<type>%@</type>\n"
                   "<itemcode>%@</itemcode>\n"
                   "</UploadAnyImage>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_encodedString,imagename,type,_codetxtfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/UploadAnyImage" forHTTPHeaderField:@"Soapaction"];
    
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
    _addview.userInteractionEnabled=NO;
    //NSString *imagename=[NSString stringWithFormat:@"Photo_%@.png",_codetxtfld.text];
    NSString *type=@"ThirdParty";
    
    //Equpmntmdl*eqmdl=(Equpmntmdl *)[_Assetarray objectAtIndex:path];
    //NSString*filename=eqmdl.PictureLocation;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FetchAnyImage xmlns=\"https://vip.kontract360.com/\">\n"
                   "<filename>%@</filename>\n"
                   "<type1>%@</type1>\n"
                   "</FetchAnyImage>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_uplodpiclctn,type];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/FetchAnyImage" forHTTPHeaderField:@"Soapaction"];
    
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
    
    NSString *imagename=[NSString stringWithFormat:@"Photo_%@.jpg",thirdpatrycode];
    // NSString *imagename=[NSString stringWithFormat:@"Newimage.jpg"];
    NSString *type=@"ThirdParty";
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UploadAnyImage xmlns=\"https://vip.kontract360.com/\">\n"
                   "<f>%@</f>\n"
                   "<fileName>%@</fileName>\n"
                   "<type>%@</type>\n"
                   "<itemcode>%@</itemcode>\n"
                   "</UploadAnyImage>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_encodedString,imagename,type,thirdpatrycode];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/UploadAnyImage" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<AllSkills xmlns=\"https://vip.kontract360.com/\">\n"
                   
                   "</AllSkills>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/AllSkills" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<UserLogmaininsert xmlns=\"https://vip.kontract360.com/\">\n"
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],34,@"Create",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/UserLogmaininsert" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<UserLogmaininsert xmlns=\"https://vip.kontract360.com/\">\n"
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],34,@"Edit",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/UserLogmaininsert" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<UserLogmaininsert xmlns=\"https://vip.kontract360.com/\">\n"
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],34,@"Delete",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/UserLogmaininsert" forHTTPHeaderField:@"Soapaction"];
    
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
    if (webtype==1||webtype==2||webtype==3) {
        [self SelectAllThirdParty];
        _searchbar.text=@"";

        webtype=0;
    }
    [_thirdprtyTable reloadData];
    [_popOverTableView reloadData];
    
    
}

#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"faultcode"])
    {
        [_activitybtn stopAnimating];
        _activitybtn.hidden=YES;
        _addview.userInteractionEnabled=YES;
        
    }
    
    if([elementName isEqualToString:@"SelectAllSubtypeThirdPartyResult"])
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
    if([elementName isEqualToString:@"SelectAllThirdPartyResponse"])
    {
        _thirdprtyarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"YearlyRate"])
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
    if([elementName isEqualToString:@"qtyinstock"])
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
    if([elementName isEqualToString:@"TPAllSubTypes"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"SearchThirdPartyResponse"])
    {
        _thirdprtyarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"UpdateThirdPartyResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    
    if([elementName isEqualToString:@"InsertThirdPartyResult"])
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
    if([elementName isEqualToString:@"ThirdpartyCode"])
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
    if([elementName isEqualToString:@"subtype"])
    {
        
        
        recordResults = FALSE;
        [_subtypearray addObject:_soapResults];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryId"])
    {
        
        _thirdpartymdl=[[Equpmntmdl alloc]init];
        recordResults = FALSE;
        
        _thirdpartymdl.entryid=[_soapResults integerValue];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ItemCode"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.itemcode=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.itemdescptn=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"SubType"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.subtype=[_revskilldict objectForKey:_soapResults];;
        
        _soapResults = nil;    }
    
    if([elementName isEqualToString:@"PurchaseValue"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.PurchaseValue=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SerialNo"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.SerialNo=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ManufacturedYear"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.ManufacturedYear=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PictureLocation"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.PictureLocation=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"InsuredValue"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.InsuredValue=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"HoursUsed"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.HoursUsed=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FuelConsumptionPerHour"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.FuelConsumptionPerHour=_soapResults;
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"Condition"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.Condition=_soapResults;
        _soapResults = nil;    }
    
    if([elementName isEqualToString:@"HourlyRate"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.HourlyRate=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"DailyRate"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.DailyRate=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ShiftwiseRate"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.ShiftwiseRate=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"WeeklyRate"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.WeeklyRate=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"MonthlyRate"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.MonthlyRate=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"YearlyRate"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.YearlyRate=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"UnitCost"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.unitcost=_soapResults;
        
        _soapResults = nil;    }
    
    if([elementName isEqualToString:@"Type"])
    {
        recordResults = FALSE;
        
        _thirdpartymdl.type=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"qtyinstock"])
    {
        recordResults = FALSE;
        
        _thirdpartymdl.stockinhand=_soapResults;
       
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"TPAllSubTypes"])
    {
        
        recordResults = FALSE;
        
        _thirdpartymdl.EqAllSubTypes=_soapResults;
        [_thirdprtyarray addObject:_thirdpartymdl];
        _soapResults = nil;

    }

    if([elementName isEqualToString:@"ThirdpartyCode"])
    {
        recordResults = FALSE;
        thirdpatrycode=_soapResults;
     _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"result"])
    {  recordResults = FALSE;
        
        
        if ([_soapResults isEqualToString:@"Inserted Successfully"]) {
             msgstrg=_soapResults;
            if(imagechecker==1){
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _activitybtn.hidden=YES;
                [_activitybtn stopAnimating];
                _addview.userInteractionEnabled=YES;
                //[self Insertanyimage];
                [self SelectAllThirdParty];

            }else{
                   [self Insertanyimage];
           }
         
            webtype=0;
           
            
        }
        else if ([_soapResults isEqualToString:@"Updated Successfully"]) {
             msgstrg=_soapResults;
             if(imagechecker==1){
                 UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                 [alert show];
                 _activitybtn.hidden=YES;
                 [_activitybtn stopAnimating];
                 _addview.userInteractionEnabled=YES;
                 
                 [self SelectAllThirdParty];
                 
             }else{
                  [self UploadAnyImage];
             }
             
             webtype=0;

           
             
        }
      else  if ([_soapResults isEqualToString:@"Already In Use"]) {
            msgstrg=_soapResults;
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
      else if ([_soapResults isEqualToString:@"Already Exists"]) {
            
            msgstrg=_soapResults;
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _activitybtn.hidden=YES;
            [_activitybtn stopAnimating];
           _addview.userInteractionEnabled=YES;
            
        }


                else if ([_soapResults isEqualToString:@"ThirdParty Picture Updated"]) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
                    _activitybtn.hidden=YES;
                    [_activitybtn stopAnimating];
                      _addview.userInteractionEnabled=YES;

            [self SelectAllThirdParty];
        }
        
                else{
                     [self SelectAllThirdParty];
                }
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"url"])
    {
        recordResults = FALSE;
        
        _activitybtn.hidden=YES;
        [_activitybtn stopAnimating];
        _addview.userInteractionEnabled=YES;
        NSData *data1=[_soapResults base64DecodedData];
        
        UIImage *image1=  [[UIImage alloc]initWithData:data1];
        
        //[NSData dataWithData:UIImagePNGRepresentation(image.image)];
        
        
        CGSize newsize=CGSizeMake(184, 95);
        UIGraphicsBeginImageContext(newsize);
        [image1 drawInRect:CGRectMake(0,0,newsize.width,newsize.height)];
        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        _pictureimgvw.image=newImage;

        NSLog(@"img%@",image1);
        
        
        
        
        
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

#pragma mark - Table View datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        if (popvr==1) {
            return [_subtypearray count];
        }
        else  if (popvr==2) {
            return [_Typearray count];
        }
        
    }
    else if(tableView==_thirdprtyTable){
        
        
        return [_thirdprtyarray count];
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
        
        if(tableView==_thirdprtyTable){
            [[NSBundle mainBundle]loadNibNamed:@"Thirdpartycell" owner:self options:nil];
            cell=_thirdpartycell;
        }
    }
    if (tableView==_popOverTableView){
        //cell.textLabel.textAlignment=NSTextAlignmentCenter;
        if (popvr==1) {
            cell.textLabel.text=[_subtypearray objectAtIndex:indexPath.row];
        }
        if (popvr==2) {
            cell.textLabel.text=[_Typearray objectAtIndex:indexPath.row];
        }
    }
    if(tableView==_thirdprtyTable){
        Equpmntmdl*eqmdl=(Equpmntmdl *)[_thirdprtyarray objectAtIndex:indexPath.row];
        _codelbl=(UILabel *)[cell viewWithTag:1];
        _codelbl.text=eqmdl.itemcode;
        _deslbl=(UILabel *)[cell viewWithTag:2];
        _deslbl.text=eqmdl.itemdescptn;
       // _typelbl=(UILabel *)[cell viewWithTag:3];
        //_typelbl.text=eqmdl.subtype;
        _costlbl=(UILabel *)[cell viewWithTag:4];
        _costlbl.text=[NSString stringWithFormat:@"$%@",eqmdl.unitcost];
        if ([eqmdl.EqAllSubTypes isEqualToString:@"true"]) {
            _subtypebtnlbl.enabled=NO;
          
            [_subtypebtnlbl setTitle:@"All Sub Types" forState:UIControlStateNormal];
        }
        else{
            _subtypebtnlbl.enabled=YES;
            
            [_subtypebtnlbl setTitle:@"Sub Types" forState:UIControlStateNormal];
        }
    }
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView==_popOverTableView){
        if (popvr==1) {
            //_subtypetxtfld.text=[_subtypearray objectAtIndex:indexPath.row];
            [_suserachbtnlbl setTitle:[_subtypearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];

        }
        if (popvr==2) {
            
       [_typesearchlbl setTitle:[_Typearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        }
        
    }
     [self.popOverController dismissPopoverAnimated:YES];
    
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [self UserLogmaindelete];
        deltepath=indexPath.row;
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        
        
        if (rightsmodel.DeleteModule==0) {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to delete a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        else
        {

        [self DeleteThirdParty];
        [_thirdprtyarray removeObject:indexPath];
        
        
        
        
        }
    }
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_thirdprtyTable)
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
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_popOverTableView)
        
    {
        return self.editing ;
    }
    return YES;
    
}


#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    [self SearchThirdParty];
    [_searchbar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
  [self SelectAllThirdParty];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_searchbar.text length]==0) {
        
        [self SelectAllThirdParty];
        // [searchBar resignFirstResponder];
        
        
    }
   // [searchBar resignFirstResponder];
    
    
}



#pragma mark-Actions
- (IBAction)deletebtn:(id)sender {
    btntype=3;
  
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_thirdprtyTable setEditing:NO animated:NO];
        [_thirdprtyTable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_thirdprtyTable setEditing:YES animated:YES];
        [_thirdprtyTable reloadData];
        
        
        
        
    }
    
    
    
}

- (IBAction)typesearchbtn:(id)sender {
    popvr=2;
    [self createpopover];
    [_thirdprtyTable reloadData];
    
}

- (IBAction)closebtn:(id)sender {
     _updatebtn.enabled=YES;
      _addview.hidden=YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)Addclosebtn:(id)sender {
     _updatebtn.enabled=YES;
    _addview.hidden=YES;
    _updatelbl.hidden=YES;
    _thirdprtyTable.userInteractionEnabled=YES;

}

- (IBAction)updatebtn:(id)sender {
    
     if (btntype==1) {
         [self UserLogmaininsert];
     }
     else if(btntype==2)
     {
         [self UserLogmainupdate];
     }
    
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
      
    UIImage *imagename =_pictureimgvw.image;
    // NSData *data = UIImagePNGRepresentation(imagename);
    
    NSData *data = UIImageJPEGRepresentation(imagename, 1.0);
    
    
    _encodedString = [data base64EncodedString];
    NSLog(@"%@",_encodedString);

    if([_destxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet] ].length==0){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Description field is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
         _destxtfld.text=@"";
    }
//    else if ([_suserachbtnlbl.titleLabel.text isEqualToString:@""]||[_suserachbtnlbl.titleLabel.text isEqualToString:@"Select"]){
//        
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Subtype field is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        
//        [alert show];
//        
//    }

    else{
        _activitybtn.hidden=NO;
        [_activitybtn startAnimating];


    if (btntype==1) {
        _updatebtn.enabled=NO;
        [self InsertThirdParty];
    }
    else if (btntype==2){
         _updatebtn.enabled=NO;
        [self UpdateThirdParty];
    }
    }
    }
}

- (IBAction)cancelbtn:(id)sender {
    _codetxtfld.text=@"";
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
    _typetxtfld.text=@"";
    _unitcsttxtfld.text=@"";
    _stckinhandtxtdfld.text=@"";
    _pictureimgvw.image=[UIImage imageNamed:@"mNoImage"];
    [_suserachbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    [_typesearchlbl setTitle:@"Select" forState:UIControlStateNormal];
    [_checksubtypebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];




    
}
-(IBAction)closeimage:(id)sender
{   UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Are you sure you want to delete this picture?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    [alert show];
//    imagechecker=1;
//  
//    _pictureimgvw.image=[UIImage imageNamed:@"mNoImage"];
}

- (IBAction)subsearchbtn:(id)sender {
    popvr=1;
    [self createpopover];
    //[self SelectAllSubtypeThirdParty];
    [self AllSkills];
}

- (IBAction)addbtn:(id)sender {
    [_checksubtypebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];

    imagechecker=1;
     _updatebtn.enabled=YES;
       _thirdprtyTable.userInteractionEnabled=NO;
    _cancelbtn.enabled=YES;
    _codetxtfld.text=@"";
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
    _typetxtfld.text=@"";
    _unitcsttxtfld.text=@"";
    _stckinhandtxtdfld.text=@"";
    _pictureimgvw.image=[UIImage imageNamed:@"mNoImage"];
    [_suserachbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        [_typesearchlbl setTitle:@"Select" forState:UIControlStateNormal];


    btntype=1;
    _addview.hidden=NO;
     _navitem.title=@"Create";
}

- (IBAction)editbtn:(id)sender {
    _pictureimgvw.image=[UIImage imageNamed:@"mNoImage"];
    imagechecker=1;
     _updatebtn.enabled=YES;
    btntype=2;
 _thirdprtyTable.userInteractionEnabled=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.thirdprtyTable];
    NSIndexPath *textFieldIndexPath = [self.thirdprtyTable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnpath=textFieldIndexPath.row;
  
  Equpmntmdl*eqmdl=(Equpmntmdl *)[_thirdprtyarray objectAtIndex:textFieldIndexPath.row];
    
    _codetxtfld.text=eqmdl.itemcode;
    NSLog(@"%@",eqmdl.itemcode);
    _destxtfld.text=eqmdl.itemdescptn;
    _subtypetxtfld.text=eqmdl.subtype;
     [_suserachbtnlbl setTitle:eqmdl.subtype forState:UIControlStateNormal];
         _purchasetxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.PurchaseValue];
    _serialtxtfld.text=eqmdl.SerialNo;
    _manufattxtfld.text =eqmdl.ManufacturedYear;
    _insuredtxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.InsuredValue];
    _hurstxtfld.text=eqmdl.HoursUsed;
    _fueltxtfld.text=eqmdl.FuelConsumptionPerHour;
    _condtntxtfld.text=eqmdl.Condition;
       [_typesearchlbl setTitle:eqmdl.type forState:UIControlStateNormal];
    _hurlytxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.HourlyRate];
    _dailytxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.DailyRate];
    _shiftwisetxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.ShiftwiseRate];
    _weeklytxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.WeeklyRate];
    _monthlytxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.MonthlyRate];
    _yearlytxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.YearlyRate];
    _typetxtfld.text=eqmdl.type;
   _unitcsttxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.unitcost];
    _stckinhandtxtdfld.text=eqmdl.stockinhand;
    _uplodpiclctn=eqmdl.PictureLocation;
    if ([eqmdl.EqAllSubTypes isEqualToString:@"true"]) {
        
        [_checksubtypebtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        checksub=1;
    }
    else{
        [_checksubtypebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        checksub=0;
    }
   // [_picimageview setImage:[UIImage imageNamed:@"ios7-camera-icon"]];
    if(eqmdl.PictureLocation.length==0||[eqmdl.PictureLocation isEqualToString:@"NoImage.png"]){
        imagechecker=1;
    }
    else{
        imagechecker=2;
         [self FetchAnyImage];
    }
  
    _addview.hidden=NO;
    _navitem.title=@"Edit";
    _cancelbtn.enabled=NO;
   [_cancelbtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    

   }
- (IBAction)subtypebtn:(id)sender {
    moduleid=34;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.thirdprtyTable];
    NSIndexPath *textFieldIndexPath = [self.thirdprtyTable indexPathForRowAtPoint:rootViewPoint];
    
    Equpmntmdl*eqmdl=(Equpmntmdl *)[_thirdprtyarray objectAtIndex:textFieldIndexPath.row];
    
    self.subtypctrlr=[[RSTViewController alloc]initWithNibName:@"RSTViewController" bundle:nil];
    
    
    self.subtypctrlr.modalPresentationStyle = UIModalPresentationFormSheet;
    _subtypctrlr.equipmainid=eqmdl.entryid;
    _subtypctrlr.moduleid=moduleid;
    [self presentViewController:self.subtypctrlr
                       animated:YES completion:NULL];
    
    
    
}
- (IBAction)checksubtype:(id)sender {
    checkstring=@"Check";
    if (checksub==0) {
        [_checksubtypebtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        checksub=1;
        
    }
    
    else{
        [_checksubtypebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        checksub=0;
        
    }
    
}

#pragma mark-textfield delegate
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    Validation*val=[[Validation alloc]init];
    if (textField==_purchasetxtfld) {
        int value1=[val isNumeric:_purchasetxtfld.text];
        if (value1==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@""  message:@"Invalid purchase value"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }
    if (textField==_manufattxtfld) {
        int value2=[val isIntegerValue:_manufattxtfld.text];
        if (value2==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid year" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }
    if (textField==_insuredtxtfld) {
        int value3=[val isNumeric:_insuredtxtfld.text];
        if (value3==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid insured value" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }
    
    if (textField==_hurstxtfld) {
//        int value4=[val isNumeric:_hurstxtfld.text];
//        if (value4==0) {
//            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid used hours value" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//            [alert1 show];
//            
//        }
        
    }
    
    if (textField==_fueltxtfld) {
        int value5=[val isNumeric:_fueltxtfld.text];
        if (value5==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid fuel consumption" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
        
    }
    if (textField==_hurlytxtfld) {
        int value6=[val isNumeric:_hurlytxtfld.text];
        if (value6==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid hourly rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        else{
            float daily=8*[_hurlytxtfld.text integerValue];
            _dailytxtfld.text=[NSString stringWithFormat:@"%g",daily];
            float weekly=24*[_hurlytxtfld.text integerValue];
            _weeklytxtfld.text=[NSString stringWithFormat:@"%g",weekly];
            float monthly=72*[_hurlytxtfld.text integerValue];
            _monthlytxtfld.text=[NSString stringWithFormat:@"%g",monthly];
            
        }

        
    }
    if (textField==_dailytxtfld) {
        int value7=[val isNumeric:_dailytxtfld.text];
        if (value7==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid daily rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        else{
            
            float hourly=[_dailytxtfld.text floatValue]/8;
           // _hurlytxtfld.text=[NSString stringWithFormat:@"%g",hourly];
            float weekly=24*hourly;
            _weeklytxtfld.text=[NSString stringWithFormat:@"%g",weekly];
            float monthly=72*hourly;
            _monthlytxtfld.text=[NSString stringWithFormat:@"%g",monthly];
            
        }

        
    }
    if (textField==_shiftwisetxtfld) {
        int value8=[val isNumeric:_shiftwisetxtfld.text];
        if (value8==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid shiftwise rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
        
    }
    if (textField==_weeklytxtfld) {
        int value9=[val isNumeric:_weeklytxtfld.text];
        if (value9==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid weekly rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
        else{
            
            float hourly=[_weeklytxtfld.text floatValue]/24;
           // _hurlytxtfld.text=[NSString stringWithFormat:@"%g",hourly];
            //float daily=8*hourly;
            //_dailytxtfld.text=[NSString stringWithFormat:@"%g",daily];
            float monthly=72*hourly;
            _monthlytxtfld.text=[NSString stringWithFormat:@"%g",monthly];
            
        }

    }
    
    if (textField==_monthlytxtfld) {
        int value10=[val isNumeric:_monthlytxtfld.text];
        if (value10==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid monthly rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        else{
            
//            float hourly=[_monthlytxtfld.text floatValue]/72;
//            _hurlytxtfld.text=[NSString stringWithFormat:@"%g",hourly];
//            float daily=8*hourly;
//            _dailytxtfld.text=[NSString stringWithFormat:@"%g",daily];
//            float weekly=72*hourly;
//            _weeklytxtfld.text=[NSString stringWithFormat:@"%g",weekly];
            
        }

        
    }
    
    if (textField==_yearlytxtfld) {
        int value11=[val isNumeric:_yearlytxtfld.text];
        if (value11==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid yearly rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
        
    }
    if (textField==_unitcsttxtfld) {
        int value11=[val isNumeric:_unitcsttxtfld.text];
        if (value11==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid unit cost"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
        
    }

    
    if (textField==_stckinhandtxtdfld) {
        int value12=[val isNumeric:_stckinhandtxtdfld.text];
        if (value12==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid stock in hand" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
        
        
    }
    return YES;
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
     if ([alertView.message isEqualToString:msgstrg])
     {
         if(btntype==2){
              _updatebtn.enabled=YES;
             _addview.hidden=YES;
             _thirdprtyTable.userInteractionEnabled=YES;
         }
         _updatebtn.enabled=YES;
         _codetxtfld.text=@"";
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
         _stckinhandtxtdfld.text=@"";
         _pictureimgvw.image=[UIImage imageNamed:@"mNoImage"];
         [_suserachbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
         _searchbar.text=@"";

    }
    if ([alertView.message isEqualToString:@"Are you sure you want to delete this picture?"])
    {
        
        if (buttonIndex==[alertView cancelButtonIndex]) {
            imagechecker=1;
            _pictureimgvw.image=[UIImage imageNamed:@"mNoImage"];
        }
        else
        {
            
        }
    }


    if ([alertView.message isEqualToString:@"Invalid purchase value"]) {
        
        
        _purchasetxtfld.text=@"";
        
    }
    
    if ([alertView.message isEqualToString:@"Invalid year"]) {
        
        
        _manufattxtfld.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Invalid insured value"]) {
        
        
        _insuredtxtfld.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Invalid used hours value"]) {
        
        
        _hurstxtfld.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Invalid hurly rate"]) {
        
        
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
    
    
    if ([alertView.message isEqualToString:@"Invalid yearly rate"]) {
        
        
        _yearlytxtfld.text=@"";
        
    }
    
    if ([alertView.message isEqualToString:@"Invalid stock in hand"]) {
        
        
        _stckinhandtxtdfld.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Invalid unit cost"]) {
        
        
        _unitcsttxtfld.text=@"";
        
    }
    
    
    
    
}




- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
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
        return (newLength > 9) ? NO : YES;
    }
    
    if(textField==_hurstxtfld)
    {
        NSUInteger newLength = [_hurstxtfld.text length] + [string length] - range.length;
        return (newLength > 9) ? NO : YES;
    }
    if(textField==_fueltxtfld)
    {
        NSUInteger newLength = [_fueltxtfld.text length] + [string length] - range.length;
        return (newLength > 9) ? NO : YES;
    }
    if(textField==_condtntxtfld)
    {
        NSUInteger newLength = [_condtntxtfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
    if(textField==_hurlytxtfld)
    {
        NSUInteger newLength = [_hurlytxtfld.text length] + [string length] - range.length;
        return (newLength > 9) ? NO : YES;
    }
    if(textField==_dailytxtfld)
    {
        NSUInteger newLength = [_dailytxtfld.text length] + [string length] - range.length;
        return (newLength > 9) ? NO : YES;
    }
    
    if(textField==_shiftwisetxtfld)
    {
        NSUInteger newLength = [_shiftwisetxtfld.text length] + [string length] - range.length;
        return (newLength > 9) ? NO : YES;
    }
    if(textField==_weeklytxtfld)
    {
        NSUInteger newLength = [_weeklytxtfld.text length] + [string length] - range.length;
        return (newLength > 9) ? NO : YES;
    }
    
    if(textField==_monthlytxtfld)
    {
        NSUInteger newLength = [_monthlytxtfld.text length] + [string length] - range.length;
        return (newLength > 9) ? NO : YES;
    }
    if(textField==_yearlytxtfld)
    {
        NSUInteger newLength = [_yearlytxtfld.text length] + [string length] - range.length;
        return (newLength > 9) ? NO : YES;
    }
    if(textField==_stckinhandtxtdfld)
    {
        NSUInteger newLength = [_stckinhandtxtdfld.text length] + [string length] - range.length;
        return (newLength > 9) ? NO : YES;
    }
    if(textField==_unitcsttxtfld)
    {
        NSUInteger newLength = [_unitcsttxtfld.text length] + [string length] - range.length;
        return (newLength > 9) ? NO : YES;
    }
    
    //_picker.hidden=YES;
    return YES;
}



@end
