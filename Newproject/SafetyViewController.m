//
//  SafetyViewController.m
//  Newproject
//
//  Created by Riya on 2/12/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "SafetyViewController.h"

@interface SafetyViewController ()

@end

@implementation SafetyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
       _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _picimgeview.layer.borderColor=[UIColor blackColor].CGColor;
    
    _picimgeview.layer.borderWidth=2;
    _picimgeview.userInteractionEnabled = YES;
    UITapGestureRecognizer *pgr = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(handlePinch:)];
    pgr.delegate = (id)self;
    [_picimgeview addGestureRecognizer:pgr];
    _saftytable.layer.borderWidth=3.0;
    _saftytable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    /*searchbar*/
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate = (id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.saftytable.tableHeaderView =_searchbar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    imagechecker=1;
    [self ReadSafetyMaterials];
    _activityindictor.hidden=YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)handlePinch:(UITapGestureRecognizer *)pinchGestureRecognizer
{
    //handle pinch...
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        imagechecker=2;
        
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate =(id) self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        imagePicker.showsCameraControls=YES;
        
        imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                  (NSString *) kUTTypeImage,
                                  nil];
        imagePicker.allowsEditing = NO;
        // imagePicker.cameraCaptureMode=YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
        _newMedia = YES;
    }
}
- (BOOL)shouldAutorotate
{
    return NO;
}
- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
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
        
        
        
        
        // Fixing to stick with only one orientation (UIImageOrientationUp in this case)
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
        
        _picimgeview.image=nil;
        
        imagechecker=2;
        
        _picimgeview.image =image;
        //[self dismissViewControllerAnimated:YES completion:nil];
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

#pragma mark- WebService
-(void)ReadSafetyMaterials{
    recordResults = FALSE;
    //webtype=1;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadSafetyMaterials xmlns=\"https://vip.kontract360.com/\">\n"
                   
                   "</ReadSafetyMaterials>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];;
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/ReadSafetyMaterials" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CreateSafetyMaterials{
    recordResults = FALSE;
     webtype=2;
  
    if (imagechecker==1) {
        _picturelocation=@"NoImage.png";
    }
    else
    {
        _picturelocation=@"";
    }

    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CreateSafetyMaterials xmlns=\"https://vip.kontract360.com/\">\n"
                   "<description>%@</description>\n"
                   "<allsubtypes>%d</allsubtypes>\n"
                   "<unitcost>%d</unitcost>\n"
                   "<qty>%d</qty>\n"
                   "<unitofmeasure>%@</unitofmeasure>\n"
                   "<picture>%@</picture>\n"
                   "</CreateSafetyMaterials>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_codedestxtfld.text,subtypevalue,[_unitcosttxtfld.text integerValue],[_stocktxtfld.text integerValue],_unitmeasuretxtfld.text,_picturelocation];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];;
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/CreateSafetyMaterials" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateSafetyMaterials{
    recordResults = FALSE;
    webtype=3;
    
    if (imagechecker==1) {
        _picturelocation=@"NoImage.png";
    }
    else
    {
        _picturelocation=@"";
    }

     Manpwr*saftymdl1=(Manpwr *)[_SafetyArray objectAtIndex:editpath];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateSafetyMaterials xmlns=\"https://vip.kontract360.com/\">\n"
                   "<description>%@</description>\n"
                   "<allsubtypes>%d</allsubtypes>\n"
                   "<unitcost>%d</unitcost>\n"
                   "<qty>%d</qty>\n"
                   "<unitofmeasure>%@</unitofmeasure>\n"
                   "<entryId>%d</entryId>\n"
                   "<picture>%@</picture>\n"
                   "</UpdateSafetyMaterials>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_codedestxtfld.text,subtypevalue,[_unitcosttxtfld.text integerValue],[_stocktxtfld.text integerValue],_unitmeasuretxtfld.text,saftymdl1.entryid,saftymdl1.picturelocation];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];;
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/UpdateSafetyMaterials" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)DestroySafetyMaterials{
    recordResults = FALSE;
     Manpwr*saftymdl1=(Manpwr *)[_SafetyArray objectAtIndex:deletepath];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DestroySafetyMaterials xmlns=\"https://vip.kontract360.com/\">\n"
                   "<ItemCode>%@</ItemCode>\n"
                   "<EntryId>%d</EntryId>\n"
                   "</DestroySafetyMaterials>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",saftymdl1.itemcode,saftymdl1.entryid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];;
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/DestroySafetyMaterials" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SearchSafetyMaterials{
    recordResults = FALSE;
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SearchSafetyMaterials xmlns=\"https://vip.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</SearchSafetyMaterials>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];;
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"https://vip.kontract360.com/SearchSafetyMaterials" forHTTPHeaderField:@"Soapaction"];
    
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
    _activityindictor.hidden=NO;
    [_activityindictor startAnimating];
    _addview.userInteractionEnabled=NO;
    //NSString *imagename=[NSString stringWithFormat:@"Photo_%@.png",_codetxtfld.text];
    NSString *type=@"SafetyMaterials";
    
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
    NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];;
    
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
-(void)UploadAnyImage{
    
    recordResults = FALSE;
    NSString *soapMessage;
    NSString *imagename;
    
    imagename=[NSString stringWithFormat:@"Photo_%@.jpg",_itemcodetxtfld.text];
    
    //NSString *imagename=[NSString stringWithFormat:@"Newimage.jpg"];
    NSString *type=@"SafetyMaterials";
    
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
                   "</soap:Envelope>\n",_encodedString,imagename,type,_itemcodetxtfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];;
    
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
-(void)Insertanyimage{
    recordResults = FALSE;
    NSString *soapMessage;
    
    NSString *imagename=[NSString stringWithFormat:@"Photo_%@.jpg",safetycode];
    // NSString *imagename=[NSString stringWithFormat:@"Newimage.jpg"];
    NSString *type=@"SafetyMaterials";
    
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
                   "</soap:Envelope>\n",_encodedString,imagename,type,safetycode];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];;
    
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
    
    
    [_saftytable reloadData];
    
//    if (webtype==1||webtype==2||webtype==3) {
//        [self SelectAllConsumables];
//        _searchbar.text=@"";
//        
//        webtype=0;
//    }
//    [_consumbleTable reloadData];
//    [_popOverTableView reloadData];
    
    
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ReadSafetyMaterialsResponse"])
    {
        _SafetyArray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"UnitCost"])
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
    if([elementName isEqualToString:@"MatQuantityInStock"])
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
    if([elementName isEqualToString:@"MTAllSubTypes"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"CreateSafetyMaterialsResponse"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"records"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
     if([elementName isEqualToString:@"result"]){
         
         if(!_soapResults)
         {
             _soapResults = [[NSMutableString alloc] init];
         }
         recordResults = TRUE;
     }
    if([elementName isEqualToString:@"SearchSafetyMaterialsResponse"]){
         _SafetyArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
   
    if([elementName isEqualToString:@"FetchAnyImageResponse"]){
        
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
        _SaftyMdl=[[Manpwr alloc]init];
        
        recordResults = FALSE;
        
        _SaftyMdl.entryid=[_soapResults integerValue];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ItemCode"])
    {
        
        
        recordResults = FALSE;
        
        _SaftyMdl.itemcode=_soapResults;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Description"])
    {
        recordResults = FALSE;
        
        _SaftyMdl.itemdescptn=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"UnitCost"])
    {
        recordResults = FALSE;
          _SaftyMdl.unitcost=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"Picture"])
    {
        recordResults = FALSE;
          _SaftyMdl.picturelocation=_soapResults;
        //_uplodpiclctn=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"MatQuantityInStock"])
    {
        recordResults = FALSE;
          _SaftyMdl.stckinhand=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"UnitInMeasure"])
    {
        recordResults = FALSE;
          _SaftyMdl.unitofmeasure=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"MTAllSubTypes"])
    {
        recordResults = FALSE;
          _SaftyMdl.allsubtype=_soapResults;
        [_SafetyArray addObject:_SaftyMdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
      recordResults = FALSE;
        
        if([_soapResults isEqualToString:@"Deleted"]){
             [self ReadSafetyMaterials];
        }
//        else if(webtype==2){
//            
//            safetycode=_soapResults;
//            //[self Insertanyimage];
//            
//            if(imagechecker==1){
//                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [alert show];
//                _activityindictor.hidden=YES;
//                [_activityindictor stopAnimating];
//                _addview.userInteractionEnabled=YES;
//                
//                [self ReadSafetyMaterials];
//            }else{
//                [self Insertanyimage];
//            }
//            
//
//            
//        }
        
    else if ([_soapResults isEqualToString:@"Inserted Successfully"]) {
            msgstrg=_soapResults;
            
            if(imagechecker==1){
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _activityindictor.hidden=YES;
                [_activityindictor stopAnimating];
                _addview.userInteractionEnabled=YES;
                
                [self ReadSafetyMaterials];
            }else{
                [self Insertanyimage];
            }
            
            webtype=0;
            
        }
//        if ([_soapResults isEqualToString:@"Updated Successfully"]) {
//            msgstrg=_soapResults;
//            
//            if(imagechecker==1){
//                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [alert show];
//                _activityindictor.hidden=YES;
//                [_activityindictor stopAnimating];
//                _addview.userInteractionEnabled=YES;
//                
//                [self ReadSafetyMaterials];
//            }else{
//                [self UploadAnyImage];
//            }
//            
//            webtype=0;
//            
//            
//            
//            
//        }
        if ([_soapResults isEqualToString:@"Already Exists"]) {
            
            msgstrg=_soapResults;
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _activityindictor.hidden=YES;
            [_activityindictor stopAnimating];
            _addview.userInteractionEnabled=YES;
            
        }
        if ([_soapResults isEqualToString:@"Already In Use"]) {
            msgstrg=_soapResults;
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
        
//        if (webtype==3) {
//            
//            
//        }
           if ([_soapResults isEqualToString:@"Safety Picture Updated"]) {
            //msgstrg=@"Inserted Succefully";
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            [_activityindictor stopAnimating];
            _activityindictor.hidden=YES;
            _addview.userInteractionEnabled=YES;
            
            [self ReadSafetyMaterials];
        }


//        else{
//            
//    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
//       
////        _updatebtnlbl.enabled=YES;
////        _activityindictor.hidden=YES;
////        [_activityindictor stopAnimating];
////
////        _codedestxtfld.text=@"";
////        _unitcosttxtfld.text=@"";
////        _unitmeasuretxtfld.text=@"";
////        _stocktxtfld.text=@"";
////        [_subtypebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//
//         _soapResults = nil;
//        }
        
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"records"]){
        
        
        if ([_soapResults isEqualToString:@"Updated Successfully"]) {
           
            
            if(imagechecker==1){
                 msgstrg=_soapResults;
                //webtype=2;
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _activityindictor.hidden=YES;
                [_activityindictor stopAnimating];
                _addview.userInteractionEnabled=YES;
                
                [self ReadSafetyMaterials];
            }else{
                msgstrg=_soapResults;
                [self UploadAnyImage];
            }
            
            //webtype=0;
            
            
            _soapResults = nil;
            
        }
        
 
    
    if(webtype==2){
        
        safetycode=_soapResults;
        //[self Insertanyimage];
        
        if(imagechecker==1){
            msgstrg=@"Inserted Succefully";
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _activityindictor.hidden=YES;
            [_activityindictor stopAnimating];
            _addview.userInteractionEnabled=YES;
            
            [self ReadSafetyMaterials];
        }else{
            [self Insertanyimage];
        }
        
         _soapResults = nil;
        webtype=0;
        
    }
        
        
    }

    if([elementName isEqualToString:@"url"])
    {
        recordResults = FALSE;
        
        _activityindictor.hidden=YES;
        [_activityindictor stopAnimating];
        _addview.userInteractionEnabled=YES;
        NSData *data1=[_soapResults base64DecodedData];
        
        UIImage *image1=  [[UIImage alloc]initWithData:data1];
        
        //[NSData dataWithData:UIImagePNGRepresentation(image.image)];
        
        
        CGSize newsize=CGSizeMake(184, 95);
        UIGraphicsBeginImageContext(newsize);
        [image1 drawInRect:CGRectMake(0,0,newsize.width,newsize.height)];
        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        _picimgeview.image=newImage;
        
        NSLog(@"img%@",image1);
        
        
        
        
        
        _soapResults = nil;
        
        
    }


}

#pragma mark - Table View datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
       return [_SafetyArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font=[UIFont systemFontOfSize:12];
        if(tableView==_saftytable){
            [[NSBundle mainBundle]loadNibNamed:@"safetycell" owner:self options:nil];
            cell=_saftycell;
        }
    }
    
    Manpwr*saftymdl1=(Manpwr *)[_SafetyArray objectAtIndex:indexPath.row];
    _itemcodelbl.text=saftymdl1.itemcode;
    _codedeslbl.text=saftymdl1.itemdescptn;
    _costlbl.text=saftymdl1.unitcost;
    if ([saftymdl1.allsubtype isEqualToString:@"true"]) {
        _Cellsubbtnlbl.enabled=NO;
        
        [_Cellsubbtnlbl setTitle:@"All Sub Types" forState:UIControlStateNormal];
    }
    else{
        _Cellsubbtnlbl.enabled=YES;
        
        [_Cellsubbtnlbl setTitle:@"Sub Types" forState:UIControlStateNormal];
    }

      return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   // [self.popOverController dismissPopoverAnimated:YES];
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
       
        deletepath=indexPath.row;
        
        [self DestroySafetyMaterials];
        [_SafetyArray removeObject:indexPath];
        
        
        
}
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_saftytable)
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


#pragma mark- IBActions
- (IBAction)cellSubtypebtnlbl:(id)sender {
    
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.saftytable];
    NSIndexPath *textFieldIndexPath = [self.saftytable indexPathForRowAtPoint:rootViewPoint];
    
    Manpwr*safty=(Manpwr *)[_SafetyArray objectAtIndex:textFieldIndexPath.row];
    
    self.subtypctrlr=[[RSTViewController alloc]initWithNibName:@"RSTViewController" bundle:nil];
    
    
    self.subtypctrlr.modalPresentationStyle = UIModalPresentationFormSheet;
_subtypctrlr.equipmainid=safty.entryid;
    //_subtypctrlr.moduleid=moduleid;
    [self presentViewController:self.subtypctrlr
                       animated:YES completion:NULL];

}

- (IBAction)editbtn:(id)sender {
    btninfr=2;
     _searchbar.text=@"";
    _addview.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.saftytable];
    NSIndexPath *textFieldIndexPath = [self.saftytable indexPathForRowAtPoint:rootViewPoint];
    editpath=textFieldIndexPath.row;
    
    Manpwr*saftymdl2=(Manpwr *)[_SafetyArray objectAtIndex:editpath];
    _itemcodetxtfld.text=saftymdl2.itemcode;
         _codedestxtfld.text=saftymdl2.itemdescptn;
    _unitcosttxtfld.text=saftymdl2.unitcost;
    _unitmeasuretxtfld.text=saftymdl2.unitofmeasure;
    _stocktxtfld.text=saftymdl2.stckinhand;
    _uplodpiclctn=saftymdl2.picturelocation;
    _picimgeview.image=[UIImage imageNamed:@"mNoImage"];
    
    if ([saftymdl2.allsubtype isEqualToString:@"true"]) {
        
        [_subtypebtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        subtypevalue=1;
    }
    else{
        [_subtypebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        subtypevalue=0;
    }
    
    
    if(saftymdl2.picturelocation.length==0||[saftymdl2.picturelocation isEqualToString:@"NoImage.png"]){
        
        imagechecker=1;
    }
    else{
        imagechecker=2;
        [self FetchAnyImage];
        
        
    }



}

- (IBAction)clsebtn:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)Addbtn:(id)sender {
    _searchbar.text=@"";
    btninfr=1;
    _addview.hidden=NO;
    _subtypebtnlbl.enabled=YES;
    _updatebtnlbl.enabled=YES;
    _activityindictor.hidden=YES;
    [_activityindictor stopAnimating];
    
    _codedestxtfld.text=@"";
    _unitcosttxtfld.text=@"";
    _unitmeasuretxtfld.text=@"";
    _stocktxtfld.text=@"";
    [_subtypebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
}

- (IBAction)Deletebtn:(id)sender {
    
    webtype=4;
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_saftytable setEditing:NO animated:NO];
        [_saftytable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_saftytable setEditing:YES animated:YES];
        [_saftytable reloadData];
        
        
        
    }

}

- (IBAction)addclsebtn:(id)sender {
    
     _addview.hidden=YES;
}

- (IBAction)subtypebtn:(id)sender {
    
    if (subtypevalue==0) {
        [_subtypebtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        subtypevalue=1;
        
    }
    
    else{
        [_subtypebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        subtypevalue=0;
        
    }

}

- (IBAction)picclsebtn:(id)sender {
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Are you sure you want to delete this picture?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    [alert show];
    
}
- (IBAction)updatebtn:(id)sender {
    
    UIImage *imagename =_picimgeview.image;
    NSData *data = UIImageJPEGRepresentation(imagename, 1.0);
    _encodedString = [data base64EncodedString];
   
    if([_codedestxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet] ].length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Description Field Is Required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        _codedestxtfld.text=@"";
    }
    
    else
    {
        _activityindictor.hidden=NO;
        [_activityindictor startAnimating];
        _updatebtnlbl.enabled=NO;
        if(btninfr==1){
            
   [self CreateSafetyMaterials];
    }
    else if(btninfr==2){
        
        if([_codedestxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Description Field Is Required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _codedestxtfld.text=@"";
            }
            else if ([_Cellsubbtnlbl.titleLabel.text isEqualToString:@""]||[_Cellsubbtnlbl.titleLabel.text isEqualToString:@"Select"]){
                
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Subtype field is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                [alert show];
                
            }
            
            else
            {
                _activityindictor.hidden=NO;
                [_activityindictor startAnimating];
                _updatebtnlbl.enabled=NO;
                
                [self UpdateSafetyMaterials];
            }
        }

        
       
    
        
    }
}

- (IBAction)cancelbtn:(id)sender {
     _itemcodetxtfld.text=@"";
    _codedestxtfld.text=@"";
    _unitcosttxtfld.text=@"";
    _unitmeasuretxtfld.text=@"";
    _stocktxtfld.text=@"";
    [_subtypebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];

}
#pragma mark-textfield delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView.message isEqualToString:msgstrg]) {
        if (webtype==3){
            _addview.hidden=YES;
            _saftytable.userInteractionEnabled=YES;
            _updatebtnlbl.enabled=YES;
        }
        _updatebtnlbl.enabled=YES;
        _activityindictor.hidden=YES;
        [_activityindictor stopAnimating];
          _itemcodetxtfld.text=@"";
        _codedestxtfld.text=@"";
        _unitcosttxtfld.text=@"";
        _unitmeasuretxtfld.text=@"";
        _stocktxtfld.text=@"";
        [_subtypebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];

        
        
    }
    if ([alertView.message isEqualToString:@"Are you sure you want to delete this picture?"])
    {
        
        if (buttonIndex==[alertView cancelButtonIndex]) {
            imagechecker=1;
            _picimgeview.image=[UIImage imageNamed:@"mNoImage"];
        }
        else
        {
            
        }
    }
    
    
    if ([alertView.message isEqualToString:@"Invalid unit cost"]) {
        
        
        _unitcosttxtfld.text=@"";
        
    }
    
    
    if ([alertView.message isEqualToString:@"Invalid stock in hand"]) {
        
        
        _stocktxtfld.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Invalid unit of measure"]) {
        
        
        _stocktxtfld.text=@"";
        
    }

}
#pragma mark-Alertview delegate
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    
    Validation*val=[[Validation alloc]init];
    if (textField==_unitcosttxtfld) {
        int value2=[val isNumeric:_unitcosttxtfld.text];
        if (value2==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid unit cost" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }
    
    if (textField==_stocktxtfld) {
        int value12=[val isNumeric:_stocktxtfld.text];
        if (value12==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid stock in hand" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
    }
    if (textField==_unitmeasuretxtfld) {
        int value15=[val isNumeric:_unitmeasuretxtfld.text];
        if (value15==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid unit of measure" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
    }

    return YES;
    
}
#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    [self SearchSafetyMaterials];
    [_searchbar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self ReadSafetyMaterials];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_searchbar.text length]==0) {
        
        [self ReadSafetyMaterials];
        // [searchBar resignFirstResponder];
        
        
    }
    //  [searchBar resignFirstResponder];
    
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
   
    if(textField==_itemcodetxtfld)
    {
        NSUInteger newLength = [_itemcodetxtfld.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    if(textField==_unitcosttxtfld)
    {
        NSUInteger newLength = [_unitcosttxtfld.text length] + [string length] - range.length;
        return (newLength > 9) ? NO : YES;
    }
    
    if(textField==_stocktxtfld)
    {
        NSUInteger newLength = [_stocktxtfld.text length] + [string length] - range.length;
        return (newLength > 9) ? NO : YES;
    }
    if(textField==_unitmeasuretxtfld)
    {
        NSUInteger newLength = [_unitmeasuretxtfld.text length] + [string length] - range.length;
        return (newLength > 9) ? NO : YES;
    }

    
    return YES;
}

@end
