//
//  PSitereqmntViewController.m
//  Newproject
//
//  Created by Riya on 7/2/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "PSitereqmntViewController.h"
#define kCellHeight 44
#define kNavBarHeight 30

@interface PSitereqmntViewController ()

@end

@implementation PSitereqmntViewController

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
    _dropview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
   // _reqtitle.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    //_jobtitle.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _requmnttable.layer.borderWidth=3.0;
    _requmnttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _jobtble.layer.borderWidth=3.0;
    _jobtble.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanning:)];
    panGesture.delegate=self;
    [self.dropview addGestureRecognizer:panGesture];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _jobdisplaylabel.text=@"";
    [self SiteRequirementlistselect];
    [self setupSourceTableWithFrame:CGRectMake(0, 0, 384,489)];
    [self setupDestinationTableWithFrame:CGRectMake(0, 0, 460, 493)];
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
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 250, 200)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 250, 200)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(250, 200);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popOverController.popoverContentSize=CGSizeMake(250.0f, 200.0f);
    self.popOverController=_popOverController;
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_jobsitebtnlbl.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}

#pragma mark-tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        return [_jobarray count];
    }
     if (tableView==_requmnttable) {
        return [_requarray count];
        }
     if (tableView==_jobtble) {
        return [_newjobarray count];
    }

    
    
    return YES;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
         if (tableView==_requmnttable) {
            
            [[NSBundle mainBundle]loadNibNamed:@"Psitereqcell" owner:self options:nil];
            cell=_sitecell;
        }
        if (tableView==_jobtble) {
            
            [[NSBundle mainBundle]loadNibNamed:@"Pjobcell" owner:self options:nil];
            cell=_jobcell;
        }

        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        
    }
       if (tableView==_popOverTableView) {
             jobsitemodel*jobsitemdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:indexPath.row];
           cell.textLabel.text=[NSString stringWithFormat:@"%@-%@-%@",jobsitemdl.jobname,jobsitemdl.jobno,jobsitemdl.skill];
       }
    if (tableView==_requmnttable) {
        
        Manpwr*requrmntmdl1=(Manpwr *)[_requarray objectAtIndex:indexPath.row];
        _codelbl=(UILabel *)[cell viewWithTag:1];
        
        _codelbl.text=requrmntmdl1.itemcode;
        
        _deslbl=(UILabel *)[cell viewWithTag:2];
        _deslbl.text=requrmntmdl1.itemdescptn;

        
    }
    if (tableView==_jobtble) {
        
        jobsitemodel*jobsitemdl=(jobsitemodel *)[_newjobarray objectAtIndex:indexPath.row];
        _jobcodelbl=(UILabel *)[cell viewWithTag:1];
        
        _jobcodelbl.text=jobsitemdl.jobno;
        
        _jobdesclbl=(UILabel *)[cell viewWithTag:2];
        _jobdesclbl.text=jobsitemdl.jobname;
        
        
    }

        return cell;
}
#pragma mark UITableViewDelegate methods
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_requmnttable||tableView==_jobtble)
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView==_popOverTableView) {
        Selectedpath=indexPath.row;
        jobsitemodel*jobsitemdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:indexPath.row];
        [_jobsitebtnlbl setTitle:[NSString stringWithFormat:@"%@-%@-%@",jobsitemdl.jobname,jobsitemdl.jobno,jobsitemdl.skill] forState:UIControlStateNormal];
        _jobdisplaylabel.text=[NSString stringWithFormat:@"%@-%@-%@",jobsitemdl.jobname,jobsitemdl.jobno,jobsitemdl.skill];
         [self SiteRequirementlist2select];
        [_jobtble reloadData];
        [self.popOverController dismissPopoverAnimated:YES];
    }
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    if (editingStyle==UITableViewCellEditingStyleDelete) {
        Deletepath=indexPath.row;

        if (tableView==_jobtble) {
            [self SiterequirementlistDelete];
             [_newjobarray removeObject:indexPath];
            [self SiteRequirementlist2select];

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
    
    [self.dropview addSubview:_requmnttable];
}

- (void)setupDestinationTableWithFrame:(CGRect)frame
{
    
    CGRect dropAreaFrame = frame;
    dropAreaFrame.origin.y = kNavBarHeight;
    dropAreaFrame.size.height -= kNavBarHeight;
    
    dropArea = [[UIView alloc] initWithFrame:CGRectMake(540, 49, 460, 493)];
    [dropArea setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f]];
    [self.dropview addSubview:dropArea];
    
    CGRect contentFrame = dropAreaFrame;
    contentFrame.origin = CGPointMake(0, 0);
    
    UILabel* dropAreaLabel = [[UILabel alloc] initWithFrame:contentFrame];
    dropAreaLabel.backgroundColor = [UIColor clearColor];
    dropAreaLabel.font = [UIFont boldSystemFontOfSize:12];
    dropAreaLabel.textAlignment = NSTextAlignmentCenter;
    dropAreaLabel.textColor = [UIColor whiteColor];
    // dropAreaLabel.text = @"Drop items here...";
    [dropArea addSubview:dropAreaLabel];
    
    [dropArea addSubview:_jobtble];
    
}

- (void)initDraggedCellWithCell:(UITableViewCell*)cell AtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_requmnttable indexPathForRowAtPoint:point];
    //UITableViewCell* cell = [_subtypetable cellForRowAtIndexPath:indexPath];
    // get rid of old cell, if it wasn't disposed already
    if(draggedCell != nil)
    {
        [draggedCell removeFromSuperview];
        // [draggedCell release];
        draggedCell = nil;
    }
    CGRect frame;
    if(point.y>=489){
        
        frame= CGRectMake(point.x, 250, cell.frame.size.width-5, cell.frame.size.height-10);
    }
    else{
        frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
    }

    //CGRect frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
    
    draggedCell = [[UITableViewCell alloc] init];
    draggedCell.selectionStyle = UITableViewCellSelectionStyleGray;
     Manpwr*req1=(Manpwr *)[_requarray objectAtIndex:indexPath.row];
    draggedCell.textLabel.text =req1.itemcode;
    draggedCell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    draggedCell.textLabel.textColor = cell.textLabel.textColor;
    draggedCell.highlighted = YES;
    draggedCell.frame = frame;
    draggedCell.alpha = 0.8;
    
    [self.dropview addSubview:draggedCell];
}


#pragma mark Helper methods for dragging

- (void)startDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    
    CGPoint pointInSrc = [gestureRecognizer locationInView:_requmnttable];
    CGPoint pointInDst = [gestureRecognizer locationInView:_jobtble];
    
    if([_requmnttable pointInside:pointInSrc withEvent:nil])
    {
        [self startDraggingFromSrcAtPoint:pointInSrc];
        dragFromSource = YES;
    }
    else if([_jobtble pointInside:pointInDst withEvent:nil])
    {
        //[self startDraggingFromDstAtPoint:pointInDst];
        dragFromSource = NO;
    }
    
}

- (void)startDraggingFromSrcAtPoint:(CGPoint)point
{
    
    if ([_jobsitebtnlbl.titleLabel.text isEqualToString:@"Select"]) {
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please select Job Site" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else{

    NSIndexPath* indexPath = [_requmnttable indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_requmnttable cellForRowAtIndexPath:indexPath];
    
    if(cell != nil)
    {
        CGPoint origin = cell.frame.origin;
        origin.x += _requmnttable.frame.origin.x;
        origin.y += _requmnttable.frame.origin.y;
        
        [self initDraggedCellWithCell:cell AtPoint:origin];
        cell.highlighted = NO;
        
        if(draggedData != nil)
        {
            //[draggedData release];
            draggedData = nil;
        }
        
        reqpath=indexPath.row;
        
        Manpwr*req1=(Manpwr *)[_requarray objectAtIndex:reqpath];
        
        draggedData = req1.itemcode;
       // NSLog(@"%@",manmdl1.itemdescptn);
    }
    }
    
}

- (void)startDraggingFromDstAtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_jobtble indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_jobtble cellForRowAtIndexPath:indexPath];
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
       // Manpwr*manmdl1=(Manpwr *)[_manpwrarray objectAtIndex:indexPath.row];
          Manpwr*req1=(Manpwr *)[_requarray objectAtIndex:reqpath];
        draggedData = req1.itemcode;
        
        // remove old cell
        //[_crewmembersarray removeObjectAtIndex:indexPath.row];
        [_jobtble deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        pathFromDstTable = indexPath;
        
        [UIView animateWithDuration:0.2 animations:^
         {
             CGRect frame = _jobtble.frame;
             //frame.size.height = kCellHeight * [dstData count];
             _jobtble.frame = frame;
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
{   _existstring=@"";
    if(draggedCell != nil && draggedData != nil)
    {
        
        //NSLog(@"%d",[gestureRecognizer state]);
        //NSLog(@"%hhd",[dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil]);
        
        
        if([gestureRecognizer state] == UIGestureRecognizerStateEnded
           && [dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil])
        {
            NSIndexPath* indexPath = [_jobtble indexPathForRowAtPoint:[gestureRecognizer locationInView:_jobtble]];
            if(indexPath != nil)
            {
                  jobsitemodel*jobsitemdl=(jobsitemodel *)[_newjobarray objectAtIndex:indexPath.row];
                jobsitemdl.jobno=draggedData;
                
                             [_newjobarray addObject:jobsitemdl];
                
                //  [_crewmembersarray insertObject:draggedData atIndex:indexPath.row];
                [_jobtble insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
                Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
                
                
                if (rightsmodel.EditModule==0) {
                    
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to drag this record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                    
                    
                }
                
                
                else
                {
                    
                    
                    [self SiteRequirementlistInsert];
                }

            }
            else
            {
                if ([_newjobarray count]==0) {
                   jobsitemodel*jobsitemdl1=[[jobsitemodel alloc]init];
                      jobsitemdl1.jobno=draggedData;
                     [_newjobarray addObject:jobsitemdl1];
                    
                }
                else{
                    jobsitemodel*jobsitemdl=(jobsitemodel *)[_newjobarray objectAtIndex:indexPath.row];
                    jobsitemdl.jobno=draggedData;
                    
                    [_newjobarray addObject:jobsitemdl];
                }
                Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
                
                
                if (rightsmodel.EditModule==0) {
                   
                        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to drag this record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        [alert show];
                    
                    
                    }
                    
                
                else
                {

                
                [self SiteRequirementlistInsert];
                }
            }
        }
        else if(!dragFromSource && pathFromDstTable != nil)
        {
            // insert cell back where it came from
            [_newjobarray insertObject:draggedData atIndex:pathFromDstTable.row];
            [_jobtble insertRowsAtIndexPaths:[NSArray arrayWithObject:pathFromDstTable] withRowAnimation:UITableViewRowAnimationMiddle];
            
            //[pathFromDstTable release];
            pathFromDstTable = nil;
        }
        if ([_existstring isEqualToString:@"Already Exists"]) {
            [draggedCell removeFromSuperview];
            //[draggedCell release];
            draggedCell = nil;
            
            //[draggedData release];
            draggedData = nil;
        }
        else
        {
        [UIView animateWithDuration:0.3 animations:^
         {
             CGRect frame = _jobtble.frame;
             //frame.size.height = kCellHeight * [_Maintablescflddetailsarray count];
             _jobtble.frame = frame;
         }];
        
        [draggedCell removeFromSuperview];
        //[draggedCell release];
        draggedCell = nil;
        
        //[draggedData release];
        draggedData = nil;
        }
    }
}




#pragma mark-Webservice
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
-(void)SiteRequirementlistselect{
    webpath=1;
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SiteRequirementlistselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   
                   "</SiteRequirementlistselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SiteRequirementlistselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SiteRequirementlist2select{
     webpath=2;
    recordResults=FALSE;
    
    jobsitemodel*jobsitemdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:Selectedpath];
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SiteRequirementlist2select xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<EntryId>%d</EntryId>\n"
                   "</SiteRequirementlist2select>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",jobsitemdl.jobid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SiteRequirementlist2select" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SiteRequirementlistInsert{
       recordResults=FALSE;
    
    Manpwr*req1=(Manpwr *)[_requarray objectAtIndex:reqpath];
    jobsitemodel*jobsitemdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:Selectedpath];
//    NSArray*array1=[_jobsitebtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
//    NSString*jobid=[NSString stringWithFormat:@"%@-%@",[array1 objectAtIndex:0],[array1 objectAtIndex:1]];
  NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SiteRequirementlistInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<JSRJobId>%d</JSRJobId>\n"
                   "<JSRRequirementId>%d</JSRRequirementId>\n"
                   "</SiteRequirementlistInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",jobsitemdl.jobid,req1.entryid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SiteRequirementlistInsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SiterequirementlistDelete{
    webtype=1;
       recordResults=FALSE;
    NSString *soapMessage;
    
    
     jobsitemodel*jobsitemdl=(jobsitemodel *)[_newjobarray objectAtIndex:Deletepath];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SiterequirementlistDelete xmlns=\"http://ios.kontract360.com/\">\n"
                    "<JSRID>%d</JSRID>\n"
                   
                   "</SiterequirementlistDelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",jobsitemdl.jobid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SiterequirementlistDelete" forHTTPHeaderField:@"Soapaction"];
    
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
    //NSDictionary *dictionary=[_xmlParser dictionaryWithValuesForKeys:[[NSArray alloc]initWithObjects:@"JobNumber", nil]];
    
    //  NSLog(@"dictioanry is %@",dictionary);
    
    
	[_xmlParser parse];
    
    [_popOverTableView reloadData];
    switch (webpath) {
        case 1:
             [_requmnttable reloadData];
            break;
        case 2:
            [_jobtble reloadData];
            break;
            
        default:
            break;
    }
    if (webtype==1) {
        [self SiteRequirementlist2select];
        webtype=0;
    }
   
    
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"JobsSelectResponse"])
    {
        _jobarray=[[NSMutableArray alloc]init];
        _jobmdlarray=[[NSMutableArray alloc]init];

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
    if([elementName isEqualToString:@"SiteRequirementlistselectResponse"])
    {
        _requarray=[[NSMutableArray alloc]init];
       
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
    if([elementName isEqualToString:@"ItemName"])
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
    if([elementName isEqualToString:@"SiteRequirementlist2selectResponse"])
    {
        _newjobarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JSRID"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"JSRJobId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JSRRequirementId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"siteItemName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"siteCode"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SiteRequirementlistInsertResponse"])
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
    if([elementName isEqualToString:@"id"])
    {_jobmdl=[[jobsitemodel alloc]init];
        recordResults = FALSE;
        _jobmdl.jobid=[_soapResults integerValue];
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"JobNumber"])
    {
        recordResults = FALSE;
         _jobmdl.jobno=_soapResults;
        jobnumber=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        recordResults = FALSE;
      
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SkillName"])
    {
        recordResults = FALSE;
        _jobmdl.skill=_soapResults;
        _soapResults = nil;
    }


    if([elementName isEqualToString:@"JobSiteName"])
    {
        recordResults = FALSE;
        _jobmdl.jobname=_soapResults;

        [_jobarray addObject:[NSString stringWithFormat:@"%@",_soapResults]];
        [_jobmdlarray addObject:_jobmdl];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryId"])
    {
        recordResults = FALSE;
        _requmdl=[[Manpwr alloc]init];
        _requmdl.entryid=[_soapResults integerValue];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ItemName"])
    {
        recordResults = FALSE;
         _requmdl.itemdescptn=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Code"])
    {
        recordResults = FALSE;
           _requmdl.itemcode=_soapResults;
        [_requarray addObject:_requmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JSRID"])
    {
        _jobmdl=[[jobsitemodel alloc]init];
        recordResults = FALSE;
         _jobmdl.jobid=[_soapResults integerValue];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"JSRJobId"])
    {
                recordResults = FALSE;
        
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"JSRRequirementId"])
    {
        recordResults = FALSE;
       
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"siteItemName"])
    {
        recordResults = FALSE;
        _jobmdl.jobname=_soapResults;

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"siteCode"])
    {
        recordResults = FALSE;
         _jobmdl.jobno=_soapResults;
        [_newjobarray addObject:_jobmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"Inserted Successfully"]) {
            
        }
        else{
        _existstring=_soapResults;
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        }
        [self SiteRequirementlist2select];
        _soapResults = nil;
    }

}
#pragma mark-Button Action
- (IBAction)tobasicrequirement:(id)sender
{
    _basicctrl=[[BasicReqViewController alloc]initWithNibName:@"BasicReqViewController" bundle:nil];
    [self presentViewController:_basicctrl animated:YES completion:nil];
}

- (IBAction)deletebtn:(id)sender {
    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    
    if (rightsmodel.DeleteModule==0) {
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to delete a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else
    {

    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_jobtble setEditing:NO animated:NO];
        [_jobtble reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_jobtble setEditing:YES animated:YES];
        [_jobtble reloadData];
        
        
    }
    }
}

- (IBAction)jobsitebtn:(id)sender {
    [self createpopover];
    [self JobsSelect];
}

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
