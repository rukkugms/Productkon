//
//  AllDetailsplandisplayViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 24/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "AllDetailsplandisplayViewController.h"
#define kCellHeight 44
#define kNavBarHeight 30
@interface AllDetailsplandisplayViewController ()

@end

@implementation AllDetailsplandisplayViewController

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
    
    [[self.Destxtfld layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.Destxtfld layer] setBorderWidth:2];
    [[self.Destxtfld layer] setCornerRadius:10];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.tuchgview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    NSLog(@"%@",_Scfldid);
    // Do any additional setup after loading the view from its nib.
    self.subtypetable.layer.borderWidth=3.0;
    self.subtypetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.maintable.layer.borderWidth=3.0;
    self.maintable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    
srcData = [NSMutableArray arrayWithObjects:@"item0", @"item1", @"item2", @"item3", @"item4", nil];
     dstData = [NSMutableArray arrayWithObjects:@"item5", @"item6", nil];
    
    [self setupSourceTableWithFrame:CGRectMake(0, 0, 161,340)];
    [self setupDestinationTableWithFrame:CGRectMake(0, 0, 732, 340)];
    
//    _droptable = [[DroptableViewController alloc] initWithFrame:CGRectMake(100, 100, 600, 500) SourceData:srcData DestinationData:dstData];
//   // [_droptable setSrcTableTitle:@"Bla"];
//    //[_droptable setDstTableTitle:@"Blub"];
//    [[_droptable.view layer] setBorderColor:[[UIColor darkGrayColor] CGColor]];
//    [[_droptable.view layer] setBorderWidth:1];
//    [[_droptable.view layer] setCornerRadius:2];
//    [self.tuchgview addSubview:_droptable.view];
    
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanning:)];
    panGesture.delegate=self;
    [self.tuchgview addGestureRecognizer:panGesture];
    [self ScaffoldingSelectScaffoldsubtype];
    [self Selectcheight];
    
    
    if(_optionidentifier==1)
    {
        _lengthfld.text=_len;
        _widthfld.text=_wid;
        _hightfld.text=_height;
        _elvatnfld.text=_ele;
          }
    else if(_optionidentifier==2)
    {
        _lengthfld.text=_len;
        _widthfld.text=_wid;
        _hightfld.text=_height;
        _elvatnfld.text=_ele;
        if (_upwcheck==1) {
             [_upwbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        }
        else
        {
            [_upwbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }
        if (_ppecheck==1) {
             [_spfbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        }
        else{
            [_spfbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }
        if (_iwfcheck==1) {
            [_iwfbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];

        }
        else
        {
            [_iwfbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }

    }


    


}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self Checknetavailabilty];
  
    
}
-(void)Checknetavailabilty{
    /* for checking Connectivity*/
    
    NSString *URLString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"]];
    _Availablityresult = [[NSString alloc] init];
    _Availablityresult = ( URLString != NULL ) ? @"Yes" : @"No";
    NSLog(@"Internet connection availability : %@", _Availablityresult);
    if([_Availablityresult isEqualToString:@"No"]){
        
      
        [self fetchscaffoldFromDB];
        
        
    }
    else if ([_Availablityresult isEqualToString:@"Yes"])
        
        [self Selectplanfactors];
    if(_optionidentifier==1)
    {
        _lengthfld.text=_len;
        _widthfld.text=_wid;
        _hightfld.text=_height;
        _elvatnfld.text=_ele;
    }
    else if(_optionidentifier==2)
    {
        
        _lengthfld.text=_len;
        _widthfld.text=_wid;
        _hightfld.text=_height;
        _elvatnfld.text=_ele;
        if (_upwcheck==1) {
            [_upwbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        }
        else
        {
            [_upwbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }
        if (_ppecheck==1) {
            [_spfbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        }
        else{
            [_spfbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }
        if (_iwfcheck==1) {
            [_iwfbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
            
        }
        else
        {
            [_iwfbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }
        
        
        
    }
    [self Selectcheight];
    [self ScaffodDetailselect];
    

    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_subtypetable) {
        return[_scfldsubtypearray count];
        
        
    }
    if (tableView==_maintable) {
        
         return[_Maintablescflddetailsarray count];
        
    }
    return YES;

    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_subtypetable) {
            [[NSBundle mainBundle]loadNibNamed:@"Subtypecell" owner:self options:nil];
            cell=_subtypecell;
            
        }
        if (tableView==_maintable) {
            [[NSBundle mainBundle]loadNibNamed:@"maintablecell" owner:self options:nil];

            cell=_maintblecell;
        }

        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];

    }
  if (tableView==_subtypetable) {
      //cell.textLabel.text=[srcData objectAtIndex:indexPath.row];
      
      Scaffoldsubtypemodel *sfmdl=(Scaffoldsubtypemodel *)[_scfldsubtypearray objectAtIndex:indexPath.row];
      
    _scfldtypesublbl=(UILabel *)[cell viewWithTag:1];
      _scfldtypesublbl.text=sfmdl.scaffoldtypename;
    
      
  }
    if (tableView==_maintable) {
        
        NewscfldDetails *scfdetals=(NewscfldDetails *)[_Maintablescflddetailsarray objectAtIndex:indexPath.row];
        
        _scffoldtypemainlbl=(UILabel *)[cell viewWithTag:1];
        NSString *subid=[NSString stringWithFormat:@"%@",scfdetals.subscaffid];
        _scffoldtypemainlbl.text=[_subtypreversedict objectForKey:subid];
        _lngtnlbl=(UILabel *)[cell viewWithTag:2];
        _lngtnlbl.text=scfdetals.length;
        _widthlbl=(UILabel *)[cell viewWithTag:3];
      _widthlbl.text=scfdetals.width;

        _heihtlbl=(UILabel *)[cell viewWithTag:4];
        _heihtlbl.text=scfdetals.height;
        _numbrlbl=(UILabel *)[cell viewWithTag:5];
        _numbrlbl.text=scfdetals.numb;
        _manhrslbl=(UILabel *)[cell viewWithTag:6];
        _manhrslbl.text=scfdetals.ManHoures;
        _ercthrslbl=(UILabel *)[cell viewWithTag:7];
        _ercthrslbl.text=scfdetals.ErectHoures;
        _dismntlehrslbl=(UILabel *)[cell viewWithTag:8];
        _dismntlehrslbl.text=scfdetals.DesmandleHoures;
        
    }
    
   
return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        Deletepath=indexPath.row;
        
        if (tableView==_maintable) {
            [self Scaffoldetaildelete];
            [_Maintablescflddetailsarray removeObject:indexPath];
            
        }
        
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
    }else
    {
        
        //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
        [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
        
        
    }
}



-(IBAction)clsebtn:(id)sender{
//    //[self dismissViewControllerAnimated:YES completion:nil];
//    [UIView transitionWithView:self.view duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
////    [UIView transitionFromView:self.view
////                        toView:self.allctrlr.view
////                      duration:1
////                       options:UIViewAnimationOptionTransitionFlipFromRight
////                    completion:nil];

    if ([self.delegate respondsToSelector:@selector(navgteanimtn)]) {
        [self.delegate navgteanimtn];
    }
    [self.navigationController popViewControllerAnimated:NO];
    _lengthfld.text=@"";
    _widthfld.text=@"";
    _hightfld.text=@"";
    _elvatnfld.text=@"";;
}

#pragma mark -
#pragma mark UIGestureRecognizer

- (void)handlePanning:(UIPanGestureRecognizer *)gestureRecognizer
{
    switch ([gestureRecognizer state]) {
        case UIGestureRecognizerStateBegan:
            [self startDragging:gestureRecognizer];
            break;
        case UIGestureRecognizerStateChanged:
            [self doDrag:gestureRecognizer];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
            [self stopDragging:gestureRecognizer];
            break;
        default:
            break;
    }
}
#pragma mark -
#pragma mark Helper methods for initialization

- (void)setupSourceTableWithFrame:(CGRect)frame
{
   
    [self.tuchgview addSubview:_subtypetable];
}

- (void)setupDestinationTableWithFrame:(CGRect)frame
{
    
    CGRect dropAreaFrame = frame;
    dropAreaFrame.origin.y = kNavBarHeight;
    dropAreaFrame.size.height -= kNavBarHeight;
    
    dropArea = [[UIView alloc] initWithFrame:CGRectMake(242, 63, 732, 340)];
    [dropArea setBackgroundColor:[UIColor whiteColor]];
    [self.tuchgview addSubview:dropArea];
    
    CGRect contentFrame = dropAreaFrame;
    contentFrame.origin = CGPointMake(0, 0);
    
    UILabel* dropAreaLabel = [[UILabel alloc] initWithFrame:contentFrame];
    dropAreaLabel.backgroundColor = [UIColor clearColor];
    dropAreaLabel.font = [UIFont boldSystemFontOfSize:12];
    dropAreaLabel.textAlignment = NSTextAlignmentCenter;
    dropAreaLabel.textColor = [UIColor whiteColor];
   // dropAreaLabel.text = @"Drop items here...";
    [dropArea addSubview:dropAreaLabel];

    [dropArea addSubview:_maintable];
}

- (void)initDraggedCellWithCell:(UITableViewCell*)cell AtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_subtypetable indexPathForRowAtPoint:point];
    //UITableViewCell* cell = [_subtypetable cellForRowAtIndexPath:indexPath];
    // get rid of old cell, if it wasn't disposed already
    if(draggedCell != nil)
    {
        [draggedCell removeFromSuperview];
        // [draggedCell release];
        draggedCell = nil;
    }
    
    CGRect frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
    
    draggedCell = [[UITableViewCell alloc] init];
    draggedCell.selectionStyle = UITableViewCellSelectionStyleGray;
    Scaffoldsubtypemodel *sstypemdl=(Scaffoldsubtypemodel *)[_scfldsubtypearray objectAtIndex:indexPath.row-1];
    draggedCell.textLabel.text =sstypemdl.scaffoldtypename;
    NSLog(@"name1%@",sstypemdl.scaffoldtypename);
     NSLog(@"apath%d",indexPath.row);
    draggedCell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];

    draggedCell.textLabel.textColor = cell.textLabel.textColor;
    draggedCell.highlighted = YES;
    draggedCell.frame = frame;
    draggedCell.alpha = 0.8;
    
    [self.tuchgview addSubview:draggedCell];
}


#pragma mark Helper methods for dragging

- (void)startDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint pointInSrc = [gestureRecognizer locationInView:_subtypetable];
    CGPoint pointInDst = [gestureRecognizer locationInView:_maintable];
    
    if([_subtypetable pointInside:pointInSrc withEvent:nil])
    {
        [self startDraggingFromSrcAtPoint:pointInSrc];
        dragFromSource = YES;
    }
    else if([_maintable pointInside:pointInDst withEvent:nil])
    {
       // [self startDraggingFromDstAtPoint:pointInDst];
        dragFromSource = NO;
    }
}

- (void)startDraggingFromSrcAtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_subtypetable indexPathForRowAtPoint:point];
        UITableViewCell* cell = [_subtypetable cellForRowAtIndexPath:indexPath];
 
    if(cell != nil)
    {
        CGPoint origin = cell.frame.origin;
        origin.x += _subtypetable.frame.origin.x;
        origin.y += _subtypetable.frame.origin.y;
        
        [self initDraggedCellWithCell:cell AtPoint:origin];
        cell.highlighted = NO;
        
        if(draggedData != nil)
        {
            //[draggedData release];
            draggedData = nil;
        }
        
        path=indexPath.row;

        Scaffoldsubtypemodel *sstypemdl=(Scaffoldsubtypemodel *)[_scfldsubtypearray objectAtIndex:path];

        draggedData = sstypemdl.scaffoldtypename;
          NSLog(@"name2%@",sstypemdl.scaffoldtypename);
         NSLog(@"apath%d",path);
    }
}

- (void)startDraggingFromDstAtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_maintable indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_maintable cellForRowAtIndexPath:indexPath];
    if(cell != nil)
    {
        CGPoint origin = cell.frame.origin;
        origin.x += dropArea.frame.origin.x;
        origin.y += dropArea.frame.origin.y;
        
        [self initDraggedCellWithCell:cell AtPoint:origin];
        cell.highlighted = NO;
        
        if(draggedData != nil)
        {
            //[draggedData release];
            draggedData = nil;
        }
        Scaffoldsubtypemodel *sstypemdl=(Scaffoldsubtypemodel *)[_scfldsubtypearray objectAtIndex:indexPath.row];
        
        draggedData = sstypemdl.scaffoldtypename;
          NSLog(@"name3%@",sstypemdl.scaffoldtypename);
        // remove old cell
        [_Maintablescflddetailsarray removeObjectAtIndex:indexPath.row];
        [_maintable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        pathFromDstTable = indexPath;
        
        [UIView animateWithDuration:0.2 animations:^
         {
             CGRect frame = _maintable.frame;
             frame.size.height = kCellHeight * [_Maintablescflddetailsarray count];
             _maintable.frame = frame;
         }];
        
    }
}

- (void)doDrag:(UIPanGestureRecognizer *)gestureRecognizer
{
    if(draggedCell != nil && draggedData != nil)
    {
        CGPoint translation = [gestureRecognizer translationInView:[draggedCell superview]];
        [draggedCell setCenter:CGPointMake([draggedCell center].x + translation.x,
                                           [draggedCell center].y + translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:[draggedCell superview]];
    }
}

- (void)stopDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    if(draggedCell != nil && draggedData != nil)
    {
        
        NSLog(@"%d",[gestureRecognizer state]);
        NSLog(@"%hhd",[dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil]);

        if([gestureRecognizer state] == UIGestureRecognizerStateEnded
           && [dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil])
        {
            NSIndexPath* indexPath = [_maintable indexPathForRowAtPoint:[gestureRecognizer locationInView:_maintable]];
            if(indexPath != nil)
            {
                NewscfldDetails *dmdl=(NewscfldDetails *)[_Maintablescflddetailsarray objectAtIndex:indexPath.row];
                dmdl.scaffolddetailid=[[_subtypdict objectForKey:draggedData]integerValue];
               // [_Maintablescflddetailsarray addObject:dmdl];
               // [_Maintablescflddetailsarray insertObject:draggedData atIndex:indexPath.row];
               // [_maintable insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
            }
            else
            {
                if ([_Maintablescflddetailsarray count]==0)
                {
                    NewscfldDetails*nwscfld1=[[NewscfldDetails alloc]init];
                    nwscfld1.scaffolddetailid=[[_subtypdict objectForKey:draggedData]integerValue];
                    NSLog(@"%d",nwscfld1.scaffolddetailid);
                    
                    [_Maintablescflddetailsarray addObject:nwscfld1];
                    
                }
                else
                {
                    NewscfldDetails *dmdl=(NewscfldDetails *)[_Maintablescflddetailsarray objectAtIndex:indexPath.row];
                     dmdl.scaffolddetailid=[[_subtypdict objectForKey:draggedData]integerValue];
                    [_Maintablescflddetailsarray addObject:dmdl];
                }
                 [_maintable reloadData];
                [self manhoursfordetail];

               
            }
        }
        else if(!dragFromSource && pathFromDstTable != nil)
        {
            // insert cell back where it came from
            [_Maintablescflddetailsarray insertObject:draggedData atIndex:pathFromDstTable.row];
            [_maintable insertRowsAtIndexPaths:[NSArray arrayWithObject:pathFromDstTable] withRowAnimation:UITableViewRowAnimationMiddle];
            
            //[pathFromDstTable release];
            pathFromDstTable = nil;
        }
        
        [UIView animateWithDuration:0.3 animations:^
         {
             CGRect frame = _maintable.frame;
             frame.size.height = kCellHeight * [_Maintablescflddetailsarray count];
             _maintable.frame = frame;
         }];
        
        [draggedCell removeFromSuperview];
        //[draggedCell release];
        draggedCell = nil;
        
        //[draggedData release];
        draggedData = nil;
    }
}




#pragma mark-WebService

-(void)Selectcheight{
    recordResults = FALSE;
    NSString *soapMessage;
    
    _customsccfldmdl=(Customscaffoldingplan *)[_Scafldarry objectAtIndex:_btnindx];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Selectcheight xmlns=\"http://test.kontract360.com/\">\n"
                   "<ht>%d</ht>\n"
                   "</Selectcheight>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_customsccfldmdl.elevation integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Selectcheight" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Selectplanfactors{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Selectplanfactors xmlns=\"http://test.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</Selectplanfactors>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Selectplanfactors" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)ScaffoldingSelectScaffoldsubtype{
    recordResults = FALSE;
    NSString *soapMessage;
  
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ScaffoldingSelectScaffoldsubtype xmlns=\"http://test.kontract360.com/\">\n"
                                 "</ScaffoldingSelectScaffoldsubtype>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/ScaffoldingSelectScaffoldsubtype" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ScaffoldDetailinsert{
    recordResults = FALSE;
    NSString *soapMessage;
    // _sccfldtypemdl=(Scaffoldtypemdl *)[];
    
    NSInteger mainscffldid;
    
    if (_optionidentifier==1) {
        mainscffldid=[_Scfldid integerValue];
    }
    else{
        _customsccfldmdl=(Customscaffoldingplan *)[_Scafldarry objectAtIndex:_btnindx];
        
        mainscffldid=_customsccfldmdl.idvalue;
    }

    
    Scaffoldsubtypemodel *sstypemdl=(Scaffoldsubtypemodel *)[_scfldsubtypearray objectAtIndex:path];
      NSInteger l;
    NSInteger w;
    NSInteger h;
       if ([sstypemdl.lbit isEqualToString:@"true"]) {
        l=[_lengthfld.text integerValue];
        
    }
    else{
        l=0;
    }
    
    
    
    if ([sstypemdl.wbit isEqualToString:@"true"]) {
        w=[_widthfld.text integerValue];
        
    }
    else{
        w=0;
    }
    
    if ([sstypemdl.hbit isEqualToString:@"true"]) {
        h=[_hightfld.text integerValue];
        
    }
    else{
        h=0;
    }
    

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ScaffoldDetailinsert xmlns=\"http://test.kontract360.com/\">\n"
                   "<mainscaffid>%d</mainscaffid>\n"
                   "<subscaffid>%d</subscaffid>\n"
                   "<length>%d</length>\n"
                   "<width>%d</width>\n"
                   "<height>%d</height>\n"
                   "<numb>%d</numb>\n"
                   "<ManHours>%f</ManHours>\n"
                   "<ErectHours>%f</ErectHours>\n"
                   "<DismantleHours>%f</DismantleHours>\n"
                   "</ScaffoldDetailinsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",mainscffldid,[sstypemdl.scaffoldsubtypeId integerValue],l,w,h,1,_sstmanpwr,_ssterecrhr,_sstdishr];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/ScaffoldDetailinsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Planfactorsinsert{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
      _customsccfldmdl=(Customscaffoldingplan *)[_Scafldarry objectAtIndex:path];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Planfactorsinsert xmlns=\"http://test.kontract360.com/\">\n"
                   "<sitefactor>%f</sitefactor>\n"
                   "<planId>%@</planId>\n"
                   "</Planfactorsinsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_sitefctrfld.text doubleValue],_planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Planfactorsinsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Scaffoldinsert{
    recordResults = FALSE;
    NSString *soapMessage;
    if (_optionidentifier==1) {
        
       // _customsccfldmdl=(Customscaffoldingplan *)[_Scafldarry objectAtIndex:0];
        int iwf;
        int spf;
        int upw;
        if (btntouch%2) {
            iwf=1;
        }
        else{
            iwf=0;
        }
        
        if (chektouch%2) {
            spf=1;
        }
        else{
            spf=0;
        }
        if (ticktouch%2) {
            upw=1;
        }
        else{
            upw=0;
        }
        
        soapMessage = [NSString stringWithFormat:
                       
                       @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                       "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                       
                       
                       "<soap:Body>\n"
                       
                       "<Scaffoldinsert xmlns=\"http://test.kontract360.com/\">\n"
                       "<id>%d</id>\n"
                       "<length>%@</length>\n"
                       "<width>%@</width>\n"
                       "<height>%@</height>\n"
                       "<qty>%@</qty>\n"
                       "<elevation>%@</elevation>\n"
                       "<unit>%@</unit>\n"
                       "<equp>%@</equp>\n"
                       "<description>%@</description>\n"
                       "<typeofscaffold>%d</typeofscaffold>\n"
                       "<ManHours>%f</ManHours>\n"
                       "<ErectHours>%f</ErectHours>\n"
                       "<DismantleHours>%f</DismantleHours>\n"
                       "<planId>%@</planId>\n"
                       "<InternalWorkFactor>%d</InternalWorkFactor>\n"
                       "<PPE>%d</PPE>\n"
                       "<UnplannedWork>%d</UnplannedWork>\n"
                       "<ph>%@</ph>\n"
                       "<Sequence>%d</Sequence>\n"
                       "<Phase>%d</Phase>\n"
                       "<SubUnit>%@</SubUnit>\n"
                       "</Scaffoldinsert>\n"
                       "</soap:Body>\n"
                       "</soap:Envelope>\n",[_Scfldid integerValue],_len,_wid,_height,_qty,_ele,_unit,
                       _equip,_Destxtfld.text,[_sid integerValue],_manpwr,_erecrhr,_dishr,_planid,iwf,spf,upw,_ph,[_sequenceid integerValue],[_phaseid integerValue],_subunit];
        NSLog(@"soapmsg%@",soapMessage);

    }
    else if(_optionidentifier==2)
    {
    
   
    _customsccfldmdl=(Customscaffoldingplan *)[_Scafldarry objectAtIndex:_btnindx];
        NSLog(@"%d",_customsccfldmdl.idvalue);
    int iwf;
    int spf;
    int upw;
    if (btntouch%2) {
        iwf=1;
    }
    else{
        iwf=0;
    }
    
    if (chektouch%2) {
        spf=1;
    }
    else{
        spf=0;
    }
    if (ticktouch%2) {
        upw=1;
    }
    else{
        upw=0;
    }

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Scaffoldinsert xmlns=\"http://test.kontract360.com/\">\n"
                   "<id>%d</id>\n"
                   "<length>%@</length>\n"
                   "<width>%@</width>\n"
                   "<height>%@</height>\n"
                   "<qty>%@</qty>\n"
                   "<elevation>%@</elevation>\n"
                   "<unit>%@</unit>\n"
                   "<equp>%@</equp>\n"
                   "<description>%@</description>\n"
                   "<typeofscaffold>%d</typeofscaffold>\n"
                   "<ManHours>%f</ManHours>\n"
                   "<ErectHours>%f</ErectHours>\n"
                   "<DismantleHours>%f</DismantleHours>\n"
                   "<planId>%@</planId>\n"
                   "<InternalWorkFactor>%d</InternalWorkFactor>\n"
                   "<PPE>%d</PPE>\n"
                   "<UnplannedWork>%d</UnplannedWork>\n"
                   "<ph>%@</ph>\n"
                   "<Sequence>%d</Sequence>\n"
                   "<Phase>%d</Phase>\n"
                   "<SubUnit>%@</SubUnit>\n"
                   "</Scaffoldinsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_customsccfldmdl.idvalue,_len,_wid,_height,_qty,_ele,_unit,
                   _equip,_Destxtfld.text,[_sid integerValue],_manpwr,_erecrhr,_dishr,_planid,iwf,spf,upw,_ph,[_sequenceid integerValue],[_phaseid integerValue],_subunit];
    NSLog(@"soapmsg%@",soapMessage);
    }
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Scaffoldinsert" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)ScaffodDetailselect{
    recordResults = FALSE;
    NSString *soapMessage;
    NSInteger mainscffldid;
    
    if (_optionidentifier==1) {
        mainscffldid=[_Scfldid integerValue];
    }
    else{
        _customsccfldmdl=(Customscaffoldingplan *)[_Scafldarry objectAtIndex:_btnindx];
      
        mainscffldid=_customsccfldmdl.idvalue;
    }
     // Scaffoldsubtypemodel *sstypemdl=(Scaffoldsubtypemodel *)[_scfldsubtypearray objectAtIndex:path];
    
    //_customsccfldmdl=(Customscaffoldingplan *)[_Scafldarry objectAtIndex:path];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ScaffodDetailselect xmlns=\"http://test.kontract360.com/\">\n"
                   "<mainscaffid>%d</mainscaffid>\n"
                   "</ScaffodDetailselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",mainscffldid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/ScaffodDetailselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Scaffoldetaildelete{
    recordResults = FALSE;
    NSString *soapMessage;
    NewscfldDetails *newscfdetals=(NewscfldDetails *)[_Maintablescflddetailsarray objectAtIndex:Deletepath];
      soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Scaffoldetaildelete xmlns=\"http://test.kontract360.com/\">\n"
                   "<mainscaafid>%d</mainscaafid>\n"
                   "<subscaffid>%d</subscaffid>\n"
                   "<ManHours>%f</ManHours>\n"
                   "<ErectHours>%f</ErectHours>\n"
                   "<DismantleHours>%f</DismantleHours>\n"
                   "</Scaffoldetaildelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[newscfdetals.scfldprevious integerValue],newscfdetals.scaffolddetailid,[newscfdetals.ManHoures doubleValue],[newscfdetals.ErectHoures doubleValue],[newscfdetals.DesmandleHoures doubleValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Scaffoldetaildelete" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response
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
	
	
	if( _xmlparser )
	{
		
	}
	
	_xmlparser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlparser setDelegate:(id)self];
	[_xmlparser setShouldResolveExternalEntities: YES];
	[_xmlparser parse];
    [_subtypetable reloadData];
    [_maintable reloadData];
       
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ScaffoldingSelectScaffoldsubtypeResult"])
    {
         _scfldsubtypearray=[[NSMutableArray alloc]init];
        _subtypdict=[[NSMutableDictionary alloc]init];
        _subtypreversedict=[[NSMutableDictionary alloc]init];
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
        if([elementName isEqualToString:@"SelectcheightResult"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"rate"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ScaffodDetailselectResponse"])
    {
        _Maintablescflddetailsarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"scaffolddetailid"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"mainscaffid"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"subscaffid"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"length"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"width"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"height"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"numb"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ManHoures"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ErectHoures"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DesmandleHoures"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ScaffoldingSelectScaffoldsubtypeResult"])
    {
        
       
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"scaffoldsubtypeId"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Scaffoldtypename"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"lbit"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"wbit"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"hbit"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"nbit"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"sf"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Rate"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"result"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SelectplanfactorsResult"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"sitefactor"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    


}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults )
        
	{
        [_soapresults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    if([elementName isEqualToString:@"rate"])
    {
        
        recordResults = FALSE;
        chrate=[_soapresults integerValue];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"scaffolddetailid"])
    {
        
        recordResults = FALSE;
        _newscflddetails=[[NewscfldDetails alloc]init];
        _newscflddetails.scaffolddetailid=[_soapresults integerValue];
        _soapresults = nil;

    }
    if([elementName isEqualToString:@"mainscaffid"])
    {
        
        recordResults = FALSE;
        _newscflddetails.scfldprevious=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"subscaffid"])
    {
        
        recordResults = FALSE;
        _newscflddetails.subscaffid=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"length"])
    {
        
        recordResults = FALSE;
        _newscflddetails.length=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"width"])
    {
        
        recordResults = FALSE;
        _newscflddetails.width=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"height"])
    {
        
        recordResults = FALSE;
        _newscflddetails.height=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"numb"])
    {
        
        recordResults = FALSE;
        _newscflddetails.numb=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ManHoures"])
    {
        
        recordResults = FALSE;
        _newscflddetails.ManHoures=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"ErectHoures"])
    {
        
        recordResults = FALSE;
        _newscflddetails.ErectHoures=_soapresults;
        _soapresults = nil;

    }
    if([elementName isEqualToString:@"DesmandleHoures"])
    {
        
        recordResults = FALSE;
        _newscflddetails.DesmandleHoures=_soapresults;
        [_Maintablescflddetailsarray addObject:_newscflddetails];
        _soapresults = nil;

    }
    
    if([elementName isEqualToString:@"scaffoldsubtypeId"])
    {
        recordResults = FALSE;
        scfldid=_soapresults;
        _scfldsubtypemdl=[[Scaffoldsubtypemodel alloc]init];
        _scfldsubtypemdl.scaffoldsubtypeId=_soapresults;
        
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"Scaffoldtypename"])
    {
        recordResults = FALSE;
        _scfldsubtypemdl.scaffoldtypename=_soapresults;
        
        [_subtypdict setObject:scfldid forKey:_soapresults];
        [_subtypreversedict setObject:_soapresults forKey:scfldid];
        
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"lbit"])
    {
        
        recordResults = FALSE;
        
        _scfldsubtypemdl.lbit=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"wbit"])
    {
        
        recordResults = FALSE;
        
        _scfldsubtypemdl.wbit=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"hbit"])
    {
        
        recordResults = FALSE;
        
        _scfldsubtypemdl.hbit=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"nbit"])
    {
        
        recordResults = FALSE;
        
        _scfldsubtypemdl.nbit=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"sf"])
    {
        
        recordResults = FALSE;
        
        _scfldsubtypemdl.sf=_soapresults;
        _soapresults = nil;

    }
    if([elementName isEqualToString:@"Rate"])
    {
        recordResults = FALSE;
        
        _scfldsubtypemdl.rate=_soapresults;
        [_scfldsubtypearray addObject:_scfldsubtypemdl];
        _soapresults = nil;
        
    }
    if([elementName isEqualToString:@"result"])
    {
        recordResults = FALSE;
        if ([_soapresults isEqualToString:@"InsertedScaffoldDetail"]||[_soapresults isEqualToString:@"DeletedScaffoldDetail"]) {
            [self ScaffodDetailselect];

        }

          _soapresults = nil;
    }
    if([elementName isEqualToString:@"sitefactor"])
    {
         recordResults = FALSE;
        _sitefctrfld.text=_soapresults;
        _soapresults = nil;

        }

}
#pragma mark-Equatn
-(void)calulatemanhrs{
    NSString *rate;
    NSInteger l=[_lengthfld.text integerValue];
    NSInteger w=[_widthfld.text integerValue];
    NSInteger h=[_hightfld.text integerValue];
    NSInteger sf=[_sitefctrfld.text integerValue];
   Scaffoldtypemdl*typmdl=(Scaffoldtypemdl *)[_newscfoldtypearry objectAtIndex:_scaffoldtypeindex];

    NSLog(@"%d",[_sid integerValue]);
    if([_sid integerValue]==1)
    {
        if(h<=33)
        {
            rate=typmdl.ftupto33;
            NSLog(@"%@",typmdl.ftupto33);
            NSLog(@"%@",rate);
        }
        else if(h>33 && h<=100)
        {
            rate=typmdl.ftupto100;
        }
        else if(h>100 && h<=165)
        {
            rate=typmdl.ftupto165;
        }
        else if(h>165)
        {
            rate=typmdl.ftg165;
        }

    }
   else if([_sid integerValue]==2)
    {
        
        rate=typmdl.rate;
    }
   else if([_sid integerValue]==3)
   {
    rate=typmdl.rate;
       NSLog(@"%@",typmdl.rate);

   }
   else if([_sid integerValue]==4)
   {
       NSInteger result=l*w*h;
       if(result<=1750)
       {
           rate=typmdl.ft3upto1750;
       }
       else if(result>1750 && result<=1750)
       {
           rate=typmdl.ft3upto7000;
       }
       else if(result>7000 && result<=18000)
       {
           rate=typmdl.ft3upto18000;
       }
       else if(result>18000)
       {
           rate=typmdl.ft3g18000;
       }


   }
   else
   {
       rate=typmdl.rate;

   }



    
    int iwf;
    int spf;
    int upw;
    if (btntouch%2) {
        iwf=1;
    }
    else{
        iwf=0;
    }
    
    if (chektouch%2) {
        spf=1;
    }
    else{
        spf=0;
    }
    if (ticktouch%2) {
        upw=1;
    }
    else{
        upw=0;
    }
    _manpwr=((chrate+iwf+spf+upw+1)*sf)*l*w*h*1*[rate doubleValue];
     _dishr=_manpwr*0.33;
    _erecrhr=_manpwr*0.67;
    if([_Availablityresult isEqualToString:@"No"]){
        [self UpdateScaffold];
    }
    else if([_Availablityresult isEqualToString:@"Yes"]){
      [self Scaffoldinsert];
      [self Planfactorsinsert];
    }
    
}

-(void)manhoursfordetail{
    NSLog(@"path%d",path);
    Scaffoldsubtypemodel *sstypemdl=(Scaffoldsubtypemodel *)[_scfldsubtypearray objectAtIndex:path];
    NSLog(@"name%@",sstypemdl.scaffoldtypename);
    NSString *rate;
    NSInteger l;
    NSInteger w;
    NSInteger h;
    NSInteger sf;
    if ([sstypemdl.lbit isEqualToString:@"true"]) {
        l=[_lengthfld.text integerValue];
        
    }
    else{
        l=1;
    }
    
    
    
    if ([sstypemdl.wbit isEqualToString:@"true"]) {
        w=[_widthfld.text integerValue];
        
    }
    else{
        w=1;
    }
    
    if ([sstypemdl.hbit isEqualToString:@"true"]) {
        h=[_hightfld.text integerValue];
        
    }
    else{
        h=1;
    }
    
    
    sf=[_sitefctrfld.text integerValue];
        
    

    rate=sstypemdl.rate;
    
    int iwf;
    int spf;
    int upw;
    if (btntouch%2) {
        iwf=1;
    }
    else{
        iwf=0;
    }
    
    if (chektouch%2) {
        spf=1;
    }
    else{
        spf=0;
    }
    if (ticktouch%2) {
        upw=1;
    }
    else{
        upw=0;
    }
    _sstmanpwr=((chrate+iwf+spf+upw+1)*sf)*l*w*h*1*[rate doubleValue];
    _sstdishr=_sstmanpwr*0.33;
    _ssterecrhr=_sstmanpwr*0.67;
//    NewscfldDetails *scfd1=(NewscfldDetails *)[_Maintablescflddetailsarray objectAtIndex:0];
//    NSLog(@"main%@",scfd1.scfldprevious);
//    firstscfldid=[scfd1.scfldprevious integerValue];
    [self ScaffoldDetailinsert];
    
}
#pragma mark-Buttons

- (IBAction)updatebtn:(id)sender {
    Validation*val=[[Validation alloc]init];
    int value1=[val isNumeric:_sitefctrfld.text];
    if(value1==0)
    {
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Please enter a valid sitefactor" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert1 show];
        _sitefctrfld.text=@"";
        
        
    }
    else{
        
        if(_sitefctrfld.text.length==0){
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Sitefactor is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];

        }
        else{
        [self calulatemanhrs];
        }
    }

}

- (IBAction)iwfbtn:(id)sender {
    btntouch++;
    if (btntouch%2) {
        
        [_iwfbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
     
        
    }
    
    else{
        [_iwfbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
        
    }

    
}

- (IBAction)spfbtn:(id)sender {
    chektouch ++;
    if (chektouch%2) {
        
        [_spfbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
    
    else{
        [_spfbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
        
    }

}

- (IBAction)upwbtn:(id)sender {
    ticktouch ++;
    if (ticktouch%2) {
        
        [_upwbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
    
    else{
        [_upwbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
              
    }

}

- (IBAction)deletebtn:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_maintable setEditing:NO animated:NO];
        [_maintable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_maintable setEditing:YES animated:YES];
        [_maintable reloadData];
        
        
    }

}
-(void)UpdateScaffold{
    
    sqlite3_stmt *statement;
    const char *dbpath=[_ScaffoldPath UTF8String];
    NSString *des=_Destxtfld.text;
    int iwf;
    int spf;
    int upw;
    if (btntouch%2) {
        iwf=1;
    }
    else{
        iwf=0;
    }
    
    if (chektouch%2) {
        spf=1;
    }
    else{
        spf=0;
    }
    if (ticktouch%2) {
        upw=1;
    }
    else{
        upw=0;
    }

    if(sqlite3_open(dbpath, &_AllscaffoldDB)==SQLITE_OK)
    {
        
        NSString *updateSql=[NSString stringWithFormat:@"UPDATE AllScaffoldList SET Description=\"%@\",IWF= \"%d\",PPE=\"%d\",UPW=\"%d\",Manhour=\"%f\",DismantileHour=\"%f\",ErectHour=\"%f\",PlanFactor=\"%@\" WHERE ID= %@",des,iwf,spf,upw,_manpwr,_erecrhr,_dishr,_sitefctrfld.text,_lastID];
        
        const char *update_stmt=[updateSql UTF8String];
        
        sqlite3_prepare(_AllscaffoldDB, update_stmt, -1, &statement, NULL);
        if(sqlite3_step(statement)==SQLITE_DONE)
        {
            
            NSLog( @"UserDetail's updated");
        }
        
        else{
            
            NSLog( @"Failed to add update");
        }
        
        
        sqlite3_finalize(statement);
        sqlite3_close(_AllscaffoldDB);
        
    }
    
}
-(void)fetchscaffoldFromDB
{
    
    _dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _docsDir = [_dirPaths objectAtIndex:0];
    
    /* Build the path to the database file*/
    
    _ScaffoldPath = [[NSString alloc] initWithString: [_docsDir stringByAppendingPathComponent: @"AllScaffold.db"]];
    NSLog(@"Path %@",_ScaffoldPath);
    
    const char *dbpath = [_ScaffoldPath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &_AllscaffoldDB) == SQLITE_OK)
    {
        
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM AllScaffoldList"];
        
        const char *query_stmt = [querySQL UTF8String];
       
        if (sqlite3_prepare_v2(_AllscaffoldDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            // NSLog(@"sqlite %@",sqlite3_step(statement));
            _DBScaffoldarry=[[NSMutableArray alloc]init];
            
            // _phasedict=[[NSMutableDictionary alloc]init];
            while (sqlite3_step(statement) == SQLITE_ROW)
                
                
            {
              //  _typemdl=[[Scaffoldtypemdl alloc]init];
                const char* key = (const char*)sqlite3_column_text(statement, 0);
                NSString *pkey= key == NULL ? nil : [[NSString alloc] initWithUTF8String:key];
                _lastID=pkey;
                
                const char* len = (const char*)sqlite3_column_text(statement, 6);
                NSString *length = len == NULL ? nil : [[NSString alloc] initWithUTF8String:len];
                _lengthfld.text=length;
               
                
                const char*wid = (const char*)sqlite3_column_text(statement, 7);
                NSString *width= wid== NULL ? nil : [[NSString alloc] initWithUTF8String:wid];
                _widthfld.text=width;
                
                const char*hei = (const char*)sqlite3_column_text(statement, 8);
                NSString *height= hei== NULL ? nil : [[NSString alloc] initWithUTF8String:hei];
                _hightfld.text=height;
                
                const char*ele = (const char*)sqlite3_column_text(statement, 10);
                NSString *elevation= ele== NULL ? nil : [[NSString alloc] initWithUTF8String:ele];
                _elvatnfld.text=elevation;
                
                
            }
            
            
            
            
            
        }
        sqlite3_finalize(statement);
        
    }
    sqlite3_close(_AllscaffoldDB);
   
    
    
}
-(void)fetchScaffoldType{
    
    _dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _docsDir = [_dirPaths objectAtIndex:0];
    
    /* Build the path to the database file*/
    
    _scaffoldtypepath = [[NSString alloc] initWithString: [_docsDir stringByAppendingPathComponent: @"ScaffoldType.db"]];
    NSLog(@"Path %@",_scaffoldtypepath);
    
    const char *dbpath = [_scaffoldtypepath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &_scaffoldTypeDB) == SQLITE_OK)
    {
        
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM ScaffoldTypeList"];
        // NSLog(@"Sql%@",querySQL);
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(_scaffoldTypeDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            // NSLog(@"sqlite %@",sqlite3_step(statement));
            _scaffoldtyperesultarray=[[NSMutableArray alloc]init];
            
            // _phasedict=[[NSMutableDictionary alloc]init];
            while (sqlite3_step(statement) == SQLITE_ROW)
                
                
            {
               _sccfldtypemdl =[[Scaffoldtypemdl alloc]init];
                const char* key = (const char*)sqlite3_column_text(statement, 0);
                NSString *pkey= key == NULL ? nil : [[NSString alloc] initWithUTF8String:key];
                
                const char* sid = (const char*)sqlite3_column_text(statement, 1);
                NSString *typeid = sid == NULL ? nil : [[NSString alloc] initWithUTF8String:sid];
                _sccfldtypemdl.scaffoldid=[typeid integerValue];
                
                const char*sname = (const char*)sqlite3_column_text(statement, 2);
                NSString *typename= sname== NULL ? nil : [[NSString alloc] initWithUTF8String:sname];
                _sccfldtypemdl.typeName=typename;
               
                const char*Rate = (const char*)sqlite3_column_text(statement, 3);
                NSString *rate= Rate== NULL ? nil : [[NSString alloc] initWithUTF8String:Rate];
                _sccfldtypemdl.rate=rate;
                
                const char*upto33 = (const char*)sqlite3_column_text(statement, 4);
                NSString *ftupto33= upto33== NULL ? nil : [[NSString alloc] initWithUTF8String:upto33];
                _sccfldtypemdl.ftupto33=ftupto33;

                const char*upto100 = (const char*)sqlite3_column_text(statement, 4);
                NSString *Ftupto100= upto100== NULL ? nil : [[NSString alloc] initWithUTF8String:upto100];
                _sccfldtypemdl.Ftupto100=Ftupto100;
               
                const char*upto165 = (const char*)sqlite3_column_text(statement, 4);
                NSString *Ftupto165= upto165== NULL ? nil : [[NSString alloc] initWithUTF8String:upto165];
                _sccfldtypemdl.Ftupto165=Ftupto165;
               
                const char*g165 = (const char*)sqlite3_column_text(statement, 4);
                NSString *Ftg165= g165== NULL ? nil : [[NSString alloc] initWithUTF8String:g165];
                _sccfldtypemdl.Ftg165=Ftg165;
                
                const char*upto1750 = (const char*)sqlite3_column_text(statement, 4);
                NSString *ft3upto1750= upto1750== NULL ? nil : [[NSString alloc] initWithUTF8String:upto1750];
                _sccfldtypemdl.ft3upto1750=ft3upto1750;
               
                const char*upto7000 = (const char*)sqlite3_column_text(statement, 4);
                NSString *Ft3upto7000= upto7000== NULL ? nil : [[NSString alloc] initWithUTF8String:upto7000];
                _sccfldtypemdl.Ft3upto7000=Ft3upto7000;

                const char*g18000 = (const char*)sqlite3_column_text(statement, 4);
                NSString *Ft3g18000= g18000== NULL ? nil : [[NSString alloc] initWithUTF8String:g18000];
                _sccfldtypemdl.Ft3g18000=Ft3g18000;
                
                
                [_scaffoldtyperesultarray addObject:_sccfldtypemdl];
                
                
            }
            
            
            
            
            
        }
        sqlite3_finalize(statement);
        
    }
    sqlite3_close(_scaffoldTypeDB);
    
    
}


@end
