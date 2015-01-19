//
//  GroupEqupViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 5/23/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "GroupEqupViewController.h"

@interface GroupEqupViewController ()

@end

@implementation GroupEqupViewController
#define kCellHeight 44
#define kNavBarHeight 30

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
    _touchview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _navbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _equpmenttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _equpmenttable.layer.borderWidth=3.0f;
    _crewtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _crewtable.layer.borderWidth=2.0f;
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanning:)];
    panGesture.delegate=self;
    [self.touchview addGestureRecognizer:panGesture];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_crewbtnlbl setTitle:@"Select" forState:UIControlStateNormal ];
        [_servicebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
     
    [self setupSourceTableWithFrame:CGRectMake(0, 0, 266,610)];
    [self setupDestinationTableWithFrame:CGRectMake(0, 0, 460, 533)];
    
    
    [self AllSkills];
    
}
#pragma mark-Popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    self.popOverController.popoverContentSize=CGSizeMake(200.0f, 250.0f);
    self.popOverController=_popOverController;

    
    
    
    
    [self.popOverController presentPopoverFromRect:_servicebtnlbl.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}
-(void)createcrewpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    self.popOverController.popoverContentSize=CGSizeMake(200.0f, 250.0f);
    self.popOverController=_popOverController;

    
    
    
    
    [self.popOverController presentPopoverFromRect:_crewbtnlbl.frame
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
        switch (poptype) {
            case 1:
                return [_skillarray count];
                break;
            case 2:
                return [_crenamearray count];
                break;
                
            default:
                break;
        }
        
        
        
        
    }
    
    if (tableView==_equpmenttable) {
        return [_equipmentarray count];
        
        
    }
    if (tableView==_crewtable) {
        
        return [_crewmembersarray count];
        
    }
    
    return YES;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_equpmenttable) {
            [[NSBundle mainBundle]loadNibNamed:@"GEqupcell" owner:self options:nil];
            cell=_equpcell;
            
        }
        if (tableView==_crewtable) {
            [[NSBundle mainBundle]loadNibNamed:@"ecrewcell" owner:self options:nil];
            
            cell=_crewcell;
        }
        
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        
    }
    
    
    if (tableView==_popOverTableView) {
        switch (poptype) {
            case 1:
                cell.textLabel.text = [_skillarray objectAtIndex:indexPath.row];
                break;
            case 2:
                cell.textLabel.text = [_crenamearray objectAtIndex:indexPath.row];
                break;
            default:
                break;
        }
        
        
        
        
    }
    
    
    if (tableView==_equpmenttable) {
        Manpwr *manpwr=(Manpwr *)[_equipmentarray objectAtIndex:indexPath.row];
        _manpwritmlbl=(UILabel *)[cell viewWithTag:1];
        _manpwritmlbl.text=manpwr.itemcode;
        UITapGestureRecognizer *tapGesture =
        [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap:)];
        [_manpwritmlbl addGestureRecognizer:tapGesture];

        _manpwrdeslbl=(UILabel *)[cell viewWithTag:2];
        _manpwrdeslbl.text=manpwr.itemdescptn;
        _hurlyratelbl=(UILabel *)[cell viewWithTag:3];
        _hurlyratelbl.text=[NSString stringWithFormat:@"$%@",manpwr.unitcost];
        
    }
    
    if (tableView==_crewtable) {
        
        Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:indexPath.row];
        _crwmanpwrlbl=(UILabel *)[cell viewWithTag:1];
        _crwmanpwrlbl.text=crewmdl1.manpower;
        UITapGestureRecognizer *tapGesture =
        [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap1:)];
        [_crwmanpwrlbl addGestureRecognizer:tapGesture];

        _crwdeslbl1=(UILabel *)[cell viewWithTag:2];
        _crwdeslbl1.text=crewmdl1.mandescptn;
        _crwdeslbl2=(UILabel *)[cell viewWithTag:3];
        
        _crwdeslbl2.text=crewmdl1.crewname;
        //NSLog(@"%@",crewmdl1.crewname);
        
        
    }
    return cell;
}
#pragma mark UITableViewDelegate methods
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_crewtable) {
        
    
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        Deletepath=indexPath.row;
        [self UserLogcrewNamedelete];
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        
        if (rightsmodel.DeleteModule==0) {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to delete a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {

            [self Crewdelete];
            [_crewmembersarray removeObject:indexPath];
            
        
        }
    }
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_crewtable||tableView==_equpmenttable)
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
        switch (poptype) {
            case 1:
                
                [_servicebtnlbl setTitle:[_skillarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                [self CrewEquipmentSelect];
                break;
            case 2:
                
                [_crewbtnlbl setTitle:[_crenamearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
               [self Selectcrewname];
                break;
                
            default:
                break;
        }
        
        [self.popOverController dismissPopoverAnimated:YES];
        
        
        
    }
    
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_equpmenttable||tableView==_popOverTableView)
        
    {
        return self.editing ;
    }
    return YES;
    
}
-(void)labelTap:(UITapGestureRecognizer *)sender{
    
    CGPoint location = [sender locationInView:self.view];
    CGPoint locationInTableview = [self.equpmenttable convertPoint:location fromView:self.view];
    NSIndexPath *indexPath = [self.equpmenttable indexPathForRowAtPoint:locationInTableview];
    
    //    if (CGRectContainsPoint([self.view convertRect:self.estmntable.frame fromView:self.estmntable.superview], location))
    //    {
    //        CGPoint locationInTableview = [self.estmntable convertPoint:location fromView:self.view];
    //        NSIndexPath *indexPath = [self.estmntable indexPathForRowAtPoint:locationInTableview];
    //        if (indexPath)
    //            [self tableView:self.estmntable didSelectRowAtIndexPath:indexPath];
    //
    //        return;
    //    }
    
    //    CGPoint rootViewPoint = [label.superview convertPoint:center toView:self.estmntable];
    //    NSIndexPath *textFieldIndexPath = [self.estmntable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",indexPath.row);
    
    Manpwr *manpwr=(Manpwr *)[_equipmentarray objectAtIndex:indexPath.row];
    _equipctrl=[[EqpmViewController alloc]initWithNibName:@"EqpmViewController" bundle:nil];
    _equipctrl.frmplan=1;
    _equipctrl.itemfromgp=manpwr.itemcode;
    _equipctrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_equipctrl animated:YES completion:nil];
}
-(void)labelTap1:(UITapGestureRecognizer *)sender{
    
    CGPoint location = [sender locationInView:self.view];
    CGPoint locationInTableview = [self.crewtable convertPoint:location fromView:self.view];
    NSIndexPath *indexPath = [self.crewtable indexPathForRowAtPoint:locationInTableview];
    
    //    if (CGRectContainsPoint([self.view convertRect:self.estmntable.frame fromView:self.estmntable.superview], location))
    //    {
    //        CGPoint locationInTableview = [self.estmntable convertPoint:location fromView:self.view];
    //        NSIndexPath *indexPath = [self.estmntable indexPathForRowAtPoint:locationInTableview];
    //        if (indexPath)
    //            [self tableView:self.estmntable didSelectRowAtIndexPath:indexPath];
    //
    //        return;
    //    }
    
    //    CGPoint rootViewPoint = [label.superview convertPoint:center toView:self.estmntable];
    //    NSIndexPath *textFieldIndexPath = [self.estmntable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",indexPath.row);
    
    Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:indexPath.row];
    _equipctrl=[[EqpmViewController alloc]initWithNibName:@"EqpmViewController" bundle:nil];
    _equipctrl.frmplan=1;
    _equipctrl.itemfromgp=crewmdl1.manpower;
      _equipctrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_equipctrl animated:YES completion:nil];
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
    
    [self.touchview addSubview:_equpmenttable];
}

- (void)setupDestinationTableWithFrame:(CGRect)frame
{
    
    CGRect dropAreaFrame = frame;
    dropAreaFrame.origin.y = kNavBarHeight;
    dropAreaFrame.size.height -= kNavBarHeight;
    
    dropArea = [[UIView alloc] initWithFrame:CGRectMake(540, 30, 460, 700)];
    [dropArea setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f]];
    [self.touchview addSubview:dropArea];
    
    CGRect contentFrame = dropAreaFrame;
    contentFrame.origin = CGPointMake(0, 0);
    
    UILabel* dropAreaLabel = [[UILabel alloc] initWithFrame:contentFrame];
    dropAreaLabel.backgroundColor = [UIColor clearColor];
    dropAreaLabel.font = [UIFont boldSystemFontOfSize:12];
    dropAreaLabel.textAlignment = NSTextAlignmentCenter;
    dropAreaLabel.textColor = [UIColor whiteColor];
    // dropAreaLabel.text = @"Drop items here...";
    [dropArea addSubview:dropAreaLabel];
    
    [dropArea addSubview:_crewtable];
    
}

- (void)initDraggedCellWithCell:(UITableViewCell*)cell AtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_equpmenttable indexPathForRowAtPoint:point];
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

    
  //  CGRect frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
    
    draggedCell = [[UITableViewCell alloc] init];
    draggedCell.selectionStyle = UITableViewCellSelectionStyleGray;
    Manpwr*manmdl1=(Manpwr *)[_equipmentarray objectAtIndex:indexPath.row];
    draggedCell.textLabel.text =manmdl1.itemcode;
    draggedCell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    draggedCell.textLabel.textColor = cell.textLabel.textColor;
    draggedCell.highlighted = YES;
    draggedCell.frame = frame;
    draggedCell.alpha = 0.8;
    
    [self.touchview addSubview:draggedCell];
}


#pragma mark Helper methods for dragging

- (void)startDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    
    CGPoint pointInSrc = [gestureRecognizer locationInView:_equpmenttable];
    CGPoint pointInDst = [gestureRecognizer locationInView:_crewtable];
    
    if([_equpmenttable pointInside:pointInSrc withEvent:nil])
    {
        [self startDraggingFromSrcAtPoint:pointInSrc];
        dragFromSource = YES;
    }
    else if([_crewtable pointInside:pointInDst withEvent:nil])
    {
        //[self startDraggingFromDstAtPoint:pointInDst];
        dragFromSource = NO;
    }
    
}

- (void)startDraggingFromSrcAtPoint:(CGPoint)point
{
    
    if ([_crewbtnlbl.titleLabel.text isEqualToString:@"Select"]) {
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please select Group Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else{

    NSIndexPath* indexPath = [_equpmenttable indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_equpmenttable cellForRowAtIndexPath:indexPath];
    
    if(cell != nil)
    {
        CGPoint origin = cell.frame.origin;
        origin.x += _equpmenttable.frame.origin.x;
        origin.y += _equpmenttable.frame.origin.y;
        
        [self initDraggedCellWithCell:cell AtPoint:origin];
        cell.highlighted = NO;
        
        if(draggedData != nil)
        {
            //[draggedData release];
            draggedData = nil;
        }
        
        crewpath=indexPath.row;
        
       Manpwr*manmdl1=(Manpwr *)[_equipmentarray objectAtIndex:crewpath];
        
       draggedData = manmdl1.itemcode;
        NSLog(@"%@",manmdl1.itemdescptn);
    }
    }
    
}

- (void)startDraggingFromDstAtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_crewtable indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_crewtable cellForRowAtIndexPath:indexPath];
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
        Manpwr*manmdl1=(Manpwr *)[_equipmentarray objectAtIndex:indexPath.row];
        draggedData = manmdl1.itemcode;
        
        // remove old cell
        [_crewmembersarray removeObjectAtIndex:indexPath.row];
        [_crewtable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        pathFromDstTable = indexPath;
        
        [UIView animateWithDuration:0.2 animations:^
         {
             CGRect frame = _crewtable.frame;
             //frame.size.height = kCellHeight * [dstData count];
             _crewtable.frame = frame;
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
    _existstring=@"";
    if(draggedCell != nil && draggedData != nil)
    {
        
        //NSLog(@"%d",[gestureRecognizer state]);
        //NSLog(@"%hhd",[dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil]);
        
        
        if([gestureRecognizer state] == UIGestureRecognizerStateEnded
           && [dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil])
        {
            NSIndexPath* indexPath = [_crewtable indexPathForRowAtPoint:[gestureRecognizer locationInView:_crewtable]];
            if(indexPath != nil)
            {
                Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:indexPath.row];
                crewmdl1.manpower=draggedData;
               [_crewmembersarray addObject:crewmdl1];
                
                //  [_crewmembersarray insertObject:draggedData atIndex:indexPath.row];
                [_crewtable insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
                [self UserLogcrewMove];
                Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
                
                if (rightsmodel.EditModule==0) {
                    
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to drag this item" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                }
                else
                {
                    
                    
                    [self crewinsert];
                }

            }
            else
            {
                if ([_crewmembersarray count]==0) {
                    Crewmodel *crewmdl1=[[Crewmodel alloc]init];
                   crewmdl1.manpower=draggedData;
                    [_crewmembersarray addObject:crewmdl1];
                    
                }
                else{
                   Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:indexPath.row];
                    crewmdl1.manpower=draggedData;
                    [_crewmembersarray addObject:crewmdl1];
                }
                 [self UserLogcrewMove];
                Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
                
                if (rightsmodel.EditModule==0) {
                    
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to drag this item" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                }
                else
                {

                
                [self crewinsert];
                }
            }
        }
        else if(!dragFromSource && pathFromDstTable != nil)
        {
            // insert cell back where it came from
            [_crewmembersarray insertObject:draggedData atIndex:pathFromDstTable.row];
            [_crewtable insertRowsAtIndexPaths:[NSArray arrayWithObject:pathFromDstTable] withRowAnimation:UITableViewRowAnimationMiddle];
            
            //[pathFromDstTable release];
            pathFromDstTable = nil;
        }
        if ([_existstring isEqualToString:@"This Equipment is  Already Exists"]) {
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
             CGRect frame = _crewtable.frame;
             //frame.size.height = kCellHeight * [_Maintablescflddetailsarray count];
             _crewtable.frame = frame;
         }];
        
        [draggedCell removeFromSuperview];
        //[draggedCell release];
        draggedCell = nil;
        
        //[draggedData release];
        draggedData = nil;
        }
    }
}
#pragma mark- WebService
-(void)CrewEquipmentSelect{
    webpath=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CrewEquipmentSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<EqStSubTypeId>%d</EqStSubTypeId>\n"
                   "</CrewEquipmentSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_skilldict objectForKey:_servicebtnlbl.titleLabel.text]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CrewEquipmentSelect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)CrewSave{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CrewEquipmentSave xmlns=\"http://ios.kontract360.com/\">\n"
                   "<EquipmentCrewName>%@</EquipmentCrewName>\n"
                   "</CrewEquipmentSave>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_crewnametxtfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CrewEquipmentSave" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)CrewSetUpSelect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EquipmentCrewSetUpSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</EquipmentCrewSetUpSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EquipmentCrewSetUpSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Selectcrewname{
    
    webpath=2;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EquipmentCrewNameSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<CrewId>%d</CrewId>\n"
                   "</EquipmentCrewNameSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_crewdict objectForKey:_crewbtnlbl.titleLabel.text]integerValue ]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
   //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EquipmentCrewNameSelect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)crewinsert{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    Manpwr *manpwr=(Manpwr *)[_equipmentarray objectAtIndex:crewpath];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Equipmentcrewinsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<Equipment>%@</Equipment>\n"
                   "<Description>%@</Description>\n"
                   "<Type>%@</Type>\n"
                   "<HourlyRate>%f</HourlyRate>\n"
                   "<Name>%@</Name>\n"
                   "<CrewId>%d</CrewId>\n"
                   "</Equipmentcrewinsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",manpwr.itemcode,manpwr.itemdescptn,@"EQ",[manpwr.unitcost floatValue],@"Equipment",[[_crewdict objectForKey:_crewbtnlbl.titleLabel.text]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
   //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Equipmentcrewinsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Crewdelete{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:Deletepath];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EquipmentCrewdelete xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ID>%d</ID>\n"
                   "</EquipmentCrewdelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[crewmdl1.ID integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EquipmentCrewdelete" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CrewSetUpDelete{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    //  Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:path];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EquipmentCrewSetUpDelete xmlns=\"http://ios.kontract360.com/\">\n"
                   "<EquipmentCrewId>%d</EquipmentCrewId>\n"
                   "</EquipmentCrewSetUpDelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_crewdict objectForKey:_crewbtnlbl.titleLabel.text]integerValue ]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EquipmentCrewSetUpDelete" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)AllCrewDelete{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    //  Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:path];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<AllEquipmentCrewDelete xmlns=\"http://ios.kontract360.com/\">\n"
                   "<CrewId>%d</CrewId>\n"
                   "</AllEquipmentCrewDelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_crewdict objectForKey:_crewbtnlbl.titleLabel.text]integerValue ]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/AllEquipmentCrewDelete" forHTTPHeaderField:@"Soapaction"];
    
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
    
    NSString*userid = [defaults objectForKey:@"Userid"];
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
                   "</UserLogmaininsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",curntdate,[userid integerValue],32,@"Create",@"iOS",extnalip,intrnalip,Udid];
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
-(void)UserLogcrewMove{
    recordResults = FALSE;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // NSLog(@"Date %@",[formatter stringFromDate:date]);
    NSString*curntdate=[formatter stringFromDate:date];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*userid = [defaults objectForKey:@"Userid"];
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
                   "</UserLogmaininsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",curntdate,[userid integerValue],32,@"Move",@"iOS",extnalip,intrnalip,Udid];
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

-(void)UserLogcrewNamedelete{
    recordResults = FALSE;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // NSLog(@"Date %@",[formatter stringFromDate:date]);
    NSString*curntdate=[formatter stringFromDate:date];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*userid = [defaults objectForKey:@"Userid"];
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
                   "</UserLogmaininsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",curntdate,[userid integerValue],32,@"Crewname Delete",@"iOS",extnalip,intrnalip,Udid];
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
-(void)UserLogcrewdelete{
    recordResults = FALSE;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // NSLog(@"Date %@",[formatter stringFromDate:date]);
    NSString*curntdate=[formatter stringFromDate:date];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*userid = [defaults objectForKey:@"Userid"];
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
                   "</UserLogmaininsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",curntdate,[userid integerValue],32,@"Crew Delete",@"iOS",extnalip,intrnalip,Udid];
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
-(void)UserLogcrewitemdelete{
    recordResults = FALSE;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // NSLog(@"Date %@",[formatter stringFromDate:date]);
    NSString*curntdate=[formatter stringFromDate:date];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*userid = [defaults objectForKey:@"Userid"];
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
                   "</UserLogmaininsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",curntdate,[userid integerValue],32,@"CrewItems Delete",@"iOS",extnalip,intrnalip,Udid];
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
    if (webpath==1) {
        [_equpmenttable reloadData];
        webpath=0;
    }
    
    if (webpath==2) {
        [_crewtable reloadData];
        
    }
    // [_autocompleteTableView reloadData];
    [_popOverTableView reloadData];
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"CrewEquipmentSelectResponse"])
    {
        _equipmentarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"HourlyRate"])
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
    
    
    if([elementName isEqualToString:@"EquipmentCrewSetUpSelectResponse"])
    {
        if (setuptype==1) {
            setuptype=2;
        }
        _crenamearray=[[NSMutableArray alloc]init];
        _crewdict=[[NSMutableDictionary alloc]init];
        _revcrewdict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EquipmentCrewId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"EquipmentCrewName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EquipmentCrewNameSelectResponse"])
    {
        _crewmembersarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ID"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Equipment"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"EqDescription"])
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
    if([elementName isEqualToString:@"HourlyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"Name"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"EqCrewName"])
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
        _skillarray=[[NSMutableArray alloc]init];
        //_revskilldict=[[NSMutableDictionary alloc]init];
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
        [_equipmentarray addObject:_manpwrmdl];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
        
        _manpwrmdl.itemdescptn=_soapResults;
        NSLog(@"%@",_manpwrmdl.itemdescptn);
        
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SubType"])
    {
        
        recordResults = FALSE;
        _manpwrmdl.subtype=_soapResults;
        _soapResults = nil;;
    }
    
    if([elementName isEqualToString:@"HourlyRate"])
    {
        
        recordResults = FALSE;
        _manpwrmdl.unitcost=_soapResults;
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EquipmentCrewId"])
    {
        recordResults =FALSE;
        crewid=_soapResults;
        _soapResults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"EquipmentCrewName"])
    {
        
        recordResults = FALSE;
        [_crenamearray addObject:_soapResults];
        [_crewdict setObject:crewid forKey:_soapResults];
        [_revcrewdict setObject:_soapResults forKey:crewid];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ID"])
    {
        _crewmdl1=[[Crewmodel alloc]init];
        recordResults = FALSE;
        _crewmdl1.ID=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Equipment"])
    {
        recordResults = FALSE;
        _crewmdl1.manpower=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EqCrewName"])
    {
        
        recordResults = FALSE;
        _crewmdl1.crewname=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"EqDescription"])
    {
        recordResults = FALSE;
        _crewmdl1.mandescptn=_soapResults;
        
        _soapResults = nil;
    }
    
    
    //    if([elementName isEqualToString:@"Description"])
    //    {
    //        recordResults = FALSE;
    //
    //        _soapResults = nil;
    //    }
    
    if([elementName isEqualToString:@"Type"])
    {
        
        recordResults = FALSE;
        _crewmdl1.type=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"HourlyRate"])
    {
        
        recordResults = FALSE;
        _crewmdl1.unitcost=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Name"])
    {
        
        recordResults = FALSE;
        _crewmdl1.name=_soapResults;
        [_crewmembersarray addObject:_crewmdl1];

        _soapResults = nil;
    }
    
       if([elementName isEqualToString:@"result"])
    {
        
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"Deleted All Members"]) {
            if (clear==1) {
                [self CrewSetUpDelete];
                [_crewbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
                clear=0;
            }
            else if(clear==0)
            {
                [self Selectcrewname];
            }
           
            
            
            
        }
        
       else  if ([_soapResults isEqualToString:@"Inserted Crew"]||[_soapResults isEqualToString:@"Deleted CrewSetUp"]||[_soapResults isEqualToString:@"deletedcrew"]) {
           if ([_soapResults isEqualToString:@"Inserted Crew"]){
               
//               UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//               [alert show];
               setuptype=1;
               [self CrewSetUpSelect];
                _crewnametxtfld.text=@"";
               // [_crewbtnlbl setTitle:_crewnametxtfld.text forState:UIControlStateNormal];
           }
           else
           {

            _crewnametxtfld.text=@"";
            [self Selectcrewname];
           }
        }
       else if ([_soapResults isEqualToString:@"This Equipment is  Already Exists"]) {
           _existstring=@"This Equipment is  Already Exists";
           UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
           [alert show];
           [self Selectcrewname];
           
           }
       else if ([_soapResults isEqualToString:@"Inserted"]){
            [self Selectcrewname];
       }

        else{
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _crewnametxtfld.text=@"";
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
        //  [_revskilldict setObject:_soapResults forKey:skill];
        [_skillarray addObject:_soapResults];
        _soapResults = nil;
        
        
    }
    
    
}
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
    if (setuptype==2) {
        [_crewbtnlbl setTitle:[_crenamearray lastObject] forState:UIControlStateNormal];
        [self Selectcrewname];
        setuptype=0;
    }
    
}

#pragma mark-buttons

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clearbtn:(id)sender {
    [self UserLogcrewdelete];
    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    if (rightsmodel.DeleteModule==0) {
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to delete a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {

    if([_crewbtnlbl.titleLabel.text isEqualToString:@"Select"]){
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please select equipment group" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else{
        NSString*alertstrg=[NSString stringWithFormat:@"Are you sure you want to delete %@ group",_crewbtnlbl.titleLabel.text];
        _deletegpstring=alertstrg;
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:alertstrg delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
        [alert show];
    }
    }
    
}

- (IBAction)deletebtn:(id)sender {
   
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_crewtable setEditing:NO animated:NO];
        [_crewtable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_crewtable setEditing:YES animated:YES];
        [_crewtable reloadData];
        
        
    }
    
    
}

- (IBAction)servicebtn:(id)sender {
    poptype=1;
    [self createpopover];
}

- (IBAction)savebtn:(id)sender {
    [self UserLogmaininsert];
    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    if (rightsmodel.EditModule==0) {
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to add a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {

    if ([_crewnametxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
        
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Group name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{

    [self CrewSave];
    }
    }
}

- (IBAction)crewbtn:(id)sender {
    poptype=2;
    [self createcrewpopover];
    [self CrewSetUpSelect];
}

- (IBAction)alldeletebtn:(id)sender {
    [self UserLogcrewitemdelete];
    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    if (rightsmodel.DeleteModule==0) {
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to delete a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {

    if([_crewbtnlbl.titleLabel.text isEqualToString:@"Select"]){
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please select equipment group" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else{

        NSString*alertstrg=[NSString stringWithFormat:@"Are you sure you want to delete all items in %@ group",_crewbtnlbl.titleLabel.text];
        _deleteitemstring=alertstrg;
    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:alertstrg delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    [alert show];
    }
    }
}
#pragma mark-alert
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    if ([alertView.message isEqualToString:_deletegpstring]) {
        
        
        if (buttonIndex==[alertView cancelButtonIndex]){
            clear=1;
            [self AllCrewDelete];
            
        }
        
        else{
            
            
        }
    }
    if ([alertView.message isEqualToString:_deleteitemstring]) {
        
        
        if (buttonIndex==[alertView cancelButtonIndex]){
            [self AllCrewDelete];
            
        }
        
        else{
            
            
        }
    }

   
   
}


@end
