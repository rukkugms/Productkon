//
//  DetailplanViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "DetailplanViewController.h"

@interface DetailplanViewController ()

@end

@implementation DetailplanViewController

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
    searchtype=1;
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.generalview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.scaffoldview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.scroll.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _scaffoldview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     _addscaffoldrecordview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _scaffoldtable.layer.borderWidth=4.0f;
    _scaffoldtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _generaltable.layer.borderWidth=4.0f;
    _generaltable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _scaffoldtabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _genearaltabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
    _generalview.hidden=NO;
    _generalbtn.tintColor=[UIColor whiteColor];
    _scaffoldbtn.tintColor=[UIColor blackColor];
     _fireproofingbtn.tintColor=[UIColor blackColor];
     _insulationbtn.tintColor=[UIColor blackColor];
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate = (id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    UISearchDisplayController *searchctrlr=[[UISearchDisplayController alloc]initWithSearchBar:_searchbar contentsController:self];
    searchctrlr.searchResultsDelegate=(id)self;
    searchctrlr.searchResultsDataSource=(id)self;
    searchctrlr.delegate=(id)self;
    self.generaltable.tableHeaderView=_searchbar;
   

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
    [self GeneralSelect];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _scaffoldview.hidden=YES;
 _generalview.hidden=NO;
     _generalbtn.tintColor=[UIColor whiteColor];
    _scaffoldbtn.tintColor=[UIColor blackColor];
    _fireproofingbtn.tintColor=[UIColor blackColor];
    _insulationbtn.tintColor=[UIColor blackColor];
        _navabar.title=[NSString stringWithFormat:@"Plan-%@",_planid];
      [self GeneralSelect];
    [self TotalManHoursSelect];
    searchtype=1;
}
-(void)Checknetavailabilty{
    /* for checking Connectivity*/
    
    NSString *URLString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"]];
    _Availablityresult = [[NSString alloc] init];
    _Availablityresult = ( URLString != NULL ) ? @"Yes" : @"No";
    NSLog(@"Internet connection availability : %@", _Availablityresult);
    if([_Availablityresult isEqualToString:@"No"]){
       
        [self createDatabase];
        [self fetchScaffoldType];
        [self fetchsequencedata];
        [self fetchphase];
        
        
    }
    else if ([_Availablityresult isEqualToString:@"Yes"])
        
         [self ScaffoldingSelectScaffoldtype];
    
}


#pragma mark-Actions
-(IBAction)addplan:(id)sender
{
        _addscaffoldrecordview.hidden=NO;
    optionidentifier=1;
    _unittextfield.text=@"";
    _equipmenttextfield.text=@"";
    _proheadertextfield.text=@"";
    [_scaffoldtyprbtn setTitle:@"Select" forState:UIControlStateNormal];
    [_sequencebtn setTitle:@"Select" forState:UIControlStateNormal];
    [_phasebtn setTitle:@"Select" forState:UIControlStateNormal];
    _lengthtextfield.text=@"";
    _widthtextfield.text=@"";
    _heighttextfield.text=@"";
    _qtytextfield.text=@"";
    _elevationtextfield.text=@"";
    _subunittextfld.text=@"";
    _navitem.title=@"Create New Record";

}
-(IBAction)editscaffoldaction:(id)sender
{
    optionidentifier=2;
     _addscaffoldrecordview.hidden=NO;
    _navitem.title=@"Edit";
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.scaffoldtable];
    NSIndexPath *textFieldIndexPath = [self.scaffoldtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;

    Customscaffoldingplan*scaffldingplan=(Customscaffoldingplan *)[_scaffoldingplanlistarray objectAtIndex:btnindex];
    //Scaffoldtypemdl*typemdl=(Scaffoldtypemdl *)[_scaffoldtyperesultarray objectAtIndex:btnindex];
    _unittextfield.text=scaffldingplan.unit;
    _equipmenttextfield.text=scaffldingplan.equp;
    _proheadertextfield.text=scaffldingplan.ph;
    [_scaffoldtyprbtn setTitle:scaffldingplan.scaffoldname forState:UIControlStateNormal];
    _lengthtextfield.text=scaffldingplan.length;
    _widthtextfield.text=scaffldingplan.width;
    _heighttextfield.text=scaffldingplan.height;
    _qtytextfield.text=scaffldingplan.qty;
    _elevationtextfield.text=scaffldingplan.elevation;
    _subunittextfld.text=scaffldingplan.subunit;
    NSLog(@"%@",[_sequencedict objectForKey:scaffldingplan.sequencename]);
    NSLog(@"%@",[_phaseiddict objectForKey:scaffldingplan.phasename]);
    NSLog(@"ujuy%@",scaffldingplan.subunit);
    searchtype=1;
    [_sequencebtn setTitle:[_sequencedict objectForKey:scaffldingplan.sequencename] forState:UIControlStateNormal];
   [_phasebtn setTitle:[_phaseiddict objectForKey:scaffldingplan.phasename] forState:UIControlStateNormal];
    first=scaffldingplan.internalworkfactor;
    sec=scaffldingplan.ppe;
    third=scaffldingplan.unplannedwork;
//    [_sequencebtn setTitle:scaffldingplan.sequencename forState:UIControlStateNormal];
//    [_phasebtn setTitle:scaffldingplan.phasename forState:UIControlStateNormal];
}
-(IBAction)closeplan:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)closescaffoldview:(id)sender
{
   _addscaffoldrecordview.hidden=YES;
}
- (IBAction)generalselection:(id)sender
{   [self GeneralSelect];
    searchtype=1;
    _generalview.hidden=NO;
    _scaffoldview.hidden=YES;
    _generalbtn.tintColor=[UIColor whiteColor];
    _scaffoldbtn.tintColor=[UIColor blackColor];
    _insulationbtn.tintColor=[UIColor blackColor];
    _fireproofingbtn.tintColor=[UIColor blackColor];
}
- (IBAction)Scaffoldslection:(id)sender
{
    searchtype=2;
    _searchbar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate=(id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.scaffoldtable.tableHeaderView=_searchbar;
    UISearchDisplayController *searchctrlr=[[UISearchDisplayController alloc]initWithSearchBar:_searchbar contentsController:self];
    searchctrlr.searchResultsDelegate=(id)self;
    searchctrlr.searchResultsDataSource=(id)self;
    searchctrlr.delegate=(id)self;

    
    _scaffoldbtn.tintColor=[UIColor whiteColor];
     _fireproofingbtn.tintColor=[UIColor blackColor];
       _insulationbtn.tintColor=[UIColor blackColor];
    _generalbtn.tintColor=[UIColor blackColor];
    _scaffoldview.hidden=NO;
    _generalview.hidden=YES;
    [self Checknetavailabilty];
//    _fireproofingview.hidden=YES;
//    _insulationview.hidden=YES;
}
-(IBAction)selectscaffoldtype:(id)sender
{
    poptype=1;
       UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(210, 200);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_scaffoldtyprbtn.frame inView:self.addscaffoldrecordview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    

}

-(IBAction)nextbtnaction:(id)sender
{
    if ([_scaffoldtyprbtn.titleLabel.text isEqualToString:@""]||[_scaffoldtyprbtn.titleLabel.text isEqualToString:@"Select"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Scaffold Type is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_sequencebtn.titleLabel.text isEqualToString:@""]||[_sequencebtn.titleLabel.text isEqualToString:@"Select"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Sequence is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_phasebtn.titleLabel.text isEqualToString:@""]||[_phasebtn.titleLabel.text isEqualToString:@"Select"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Phase is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{

    if([_Availablityresult isEqualToString:@"No"])
    {
        [self insertScaffoldToDB];
    }
    else if([_Availablityresult isEqualToString:@"Yes"])
    {
        [self Scaffoldinsert];
    }
    }
    
//   if (optionidentifier==1)
//   {
//        [self Scaffoldinsert];
////        if (!self.allctrlr)
////        {
////        self.allctrlr=[[AllDetailsplandisplayViewController alloc]initWithNibName:@"AllDetailsplandisplayViewController" bundle:nil];
////        }
////        _allctrlr.len=_lengthtextfield.text;
////        _allctrlr.wid=_widthtextfield.text;
////        _allctrlr.height=_heighttextfield.text;
////        _allctrlr.ele=_heighttextfield.text;
////        _allctrlr.unit=_unittextfield.text;
////        _allctrlr.equip=_equipmenttextfield.text;
////        _allctrlr.sid=[_scaffoldidDict objectForKey:_scaffoldtyprbtn.titleLabel.text];
////        _allctrlr.qty=_qtytextfield.text;
////        _allctrlr.planid=_planid;
////        _allctrlr.optionidentifier=optionidentifier;
////       _allctrlr.modalPresentationStyle=UIModalPresentationFullScreen;
////       _allctrlr.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
////       [self presentViewController:_allctrlr
////                       animated:YES completion:NULL];
//   }
//   else if(optionidentifier==2)
//    {
////        if (!self.allctrlr)
////        {
////            self.allctrlr=[[AllDetailsplandisplayViewController alloc]initWithNibName:@"AllDetailsplandisplayViewController" bundle:nil];
////        }
////        _allctrlr.Scafldarry=_scaffoldingplanlistarray;
////        _allctrlr.btnindx=btnindex;
////        _allctrlr.optionidentifier=optionidentifier;
////        _allctrlr.len=_lengthtextfield.text;
////        _allctrlr.wid=_widthtextfield.text;
////        _allctrlr.height=_heighttextfield.text;
////        _allctrlr.ele=_heighttextfield.text;
////        _allctrlr.unit=_unittextfield.text;
////        _allctrlr.equip=_equipmenttextfield.text;
////        _allctrlr.sid=[_scaffoldidDict objectForKey:_scaffoldtyprbtn.titleLabel.text];
////        _allctrlr.qty=_qtytextfield.text;
////        _allctrlr.planid=_planid;
////        _allctrlr.modalPresentationStyle=UIModalPresentationFullScreen;
////        _allctrlr.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
////        [self presentViewController:_allctrlr
////                           animated:YES completion:NULL];
//
//    }
    
   
}
- (IBAction)InsulationSelection:(id)sender
{
    _insulationbtn.tintColor=[UIColor blackColor];
//     _scaffoldbtn.tintColor=[UIColor blackColor];
//     _fireproofingbtn.tintColor=[UIColor blackColor];
//     _generalbtn.tintColor=[UIColor blackColor];
   
//    _scaffoldview.hidden=YES;
//    _fireproofingview.hidden=YES;
//     _insulationview.hidden=NO;
}
- (IBAction)fireproofingselection:(id)sender
{
    _fireproofingbtn.tintColor=[UIColor blackColor];
//    _insulationbtn.tintColor=[UIColor blackColor];
//     _scaffoldbtn.tintColor=[UIColor blackColor];
//    _generalbtn.tintColor=[UIColor blackColor];
//    _fireproofingview.hidden=NO;
//    _scaffoldview.hidden=YES;
//    _insulationview.hidden=YES;
}
-(IBAction)addnewworkaction:(id)sender
{
    optionidentifier=1;
    self.generalworkctrlr=[[GeneralViewController alloc]initWithNibName:@"GeneralViewController" bundle:nil];
    _generalworkctrlr.Planid=_planid;
    _generalworkctrlr.optionidentfr=optionidentifier;
    _generalworkctrlr.delegate=self;
    self.generalworkctrlr.modalPresentationStyle=UIModalPresentationPageSheet;
    [self presentViewController:_generalworkctrlr
                       animated:YES completion:NULL];
    
}
-(IBAction)editgeneralaction:(id)sender
{
    optionidentifier=2;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.generaltable];
    NSIndexPath *textFieldIndexPath = [self.generaltable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    
    Generalmodel*gmodel=(Generalmodel *)[_generallistarray objectAtIndex:btnindex];
    NSMutableArray *garray=[[NSMutableArray alloc]initWithObjects:gmodel, nil];
    self.generalworkctrlr=[[GeneralViewController alloc]initWithNibName:@"GeneralViewController" bundle:nil];
    _generalworkctrlr.Planid=_planid;
    _generalworkctrlr.genralid=gmodel.gid;
    _generalworkctrlr.optionidentfr=optionidentifier;
    _generalworkctrlr.generalarray=garray;
    _generalworkctrlr.delegate=self;

    NSLog(@"textFieldIndexPath%d",_generalworkctrlr.optionidentfr);
    self.generalworkctrlr.modalPresentationStyle=UIModalPresentationPageSheet;
    [self presentViewController:_generalworkctrlr
                       animated:YES completion:NULL];
    
}
- (IBAction)SelectPhaseaction:(id)sender
{
    poptype=2;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(210, 200);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_phasebtn.frame inView:self.addscaffoldrecordview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
}

- (IBAction)Sequenceselectaction:(id)sender
{
    poptype=3;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(210, 200);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_sequencebtn.frame inView:self.addscaffoldrecordview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}


#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_scaffoldtable)
    {
        return [_scaffoldingplanlistarray count];
    }
    if(tableView==_popovertableview)
    {
        switch (poptype) {
            case 1:
                return [_scaffoldtyperesultarray count];
                break;
            case 2:
                return [_phasearray count];
                break;
            case 3:
                return [_sequencearray count];
                break;
            default:
                break;
        }
        
        
    }
    if(tableView==_generaltable)
    {
        return [_generallistarray count];
    }

       return YES;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        
        if(tableView==_scaffoldtable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"scaffoldcell" owner:self options:nil];
            cell=_scaffoldcell;
        }
        if(tableView==_generaltable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"PGcell" owner:self options:nil];
            cell=_generalcell;
        }

        
        
    }
     if(tableView==_scaffoldtable)
     {
         Customscaffoldingplan*scaffmdl=(Customscaffoldingplan *)[_scaffoldingplanlistarray objectAtIndex:indexPath.row];
         _unitcelllabel=(UILabel*)[cell viewWithTag:1];
         _unitcelllabel.text=scaffmdl.unit;
        _equipcelllabel=(UILabel*)[cell viewWithTag:2];
         _equipcelllabel.text=scaffmdl.equp;

         _pjctheadercelllabel=(UILabel*)[cell viewWithTag:3];
         _pjctheadercelllabel.text=scaffmdl.ph;

         _scaffoldcellalbel=(UILabel*)[cell viewWithTag:4];
         _scaffoldcellalbel.text=scaffmdl.scaffoldname;
         //[NSString stringWithFormat:@"%d",scaffmdl.typescaffold];

         _lengthcelllabel=(UILabel*)[cell viewWithTag:5];
        _lengthcelllabel.text=scaffmdl.length;

         _widthcelllabel=(UILabel*)[cell viewWithTag:6];
         _widthcelllabel.text=scaffmdl.width;
         _heightcelllabel=(UILabel*)[cell viewWithTag:7];
        _heightcelllabel.text=scaffmdl.height;
         
         _quantitycelllabel=(UILabel*)[cell viewWithTag:8];
         _quantitycelllabel.text=scaffmdl.qty;
         
         _elevationcelllabel=(UILabel*)[cell viewWithTag:9];
         _elevationcelllabel.text=scaffmdl.elevation;
         _manhourslabel=(UILabel*)[cell viewWithTag:10];
         _manhourslabel.text=scaffmdl.manhours;
         


     }
    if(tableView==_generaltable)
    {
        Generalmodel*genmdl=(Generalmodel *)[_generallistarray objectAtIndex:indexPath.row];
        _generalunitlabel=(UILabel*)[cell viewWithTag:1];
        _generalunitlabel.text=genmdl.Unit;
        _generalsubunitlabel=(UILabel*)[cell viewWithTag:2];
        _generalsubunitlabel.text=genmdl.SubUnit;
        
        _generalequiplabel=(UILabel*)[cell viewWithTag:3];
        _generalequiplabel.text=genmdl.Equipment;
        
        _generalphlabel=(UILabel*)[cell viewWithTag:4];
        _generalphlabel.text=genmdl.ProjectHeader;
        //[NSString stringWithFormat:@"%d",scaffmdl.typescaffold];
        
        _generalquanitylabel=(UILabel*)[cell viewWithTag:5];
        _generalquanitylabel.text=genmdl.TotalHoures;
        
        _generalphaselabel=(UILabel*)[cell viewWithTag:6];
        _generalphaselabel.text=genmdl.Phase;
        _generalseqlabel=(UILabel*)[cell viewWithTag:7];
        _generalseqlabel.text=genmdl.sequence;
        
        _eqhourlabel=(UILabel*)[cell viewWithTag:8];
        _eqhourlabel.text=genmdl.EquipmentHours;
    }

    if(tableView==_popovertableview)
    {
        //Scaffoldtypemdl*typmdl=(Scaffoldtypemdl *)[_scaffoldtyperesultarray objectAtIndex:indexPath.row];
            cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
            cell.textLabel.font = [UIFont systemFontOfSize:12.0];
        switch (poptype) {
                
            case 1:
                _typemdl=(Scaffoldtypemdl *)[_scaffoldtyperesultarray objectAtIndex:indexPath.row];
               cell.textLabel.text=_typemdl.typeName;
                break;
                
            case 2:
                cell.textLabel.text=[_phasearray objectAtIndex:indexPath.row];
                break;
           
            case 3:
                cell.textLabel.text=[_sequencearray objectAtIndex:indexPath.row];
                break;
            
            default:
                break;
        }
        
        
    }
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_popovertableview)
    {
        switch (poptype) {
            case 1:
               _typemdl=(Scaffoldtypemdl *)[_scaffoldtyperesultarray objectAtIndex:indexPath.row];
                scaffoldtypeindex=indexPath.row;
                // cell.textLabel.text=typmdl.typeName;
                [_scaffoldtyprbtn setTitle:_typemdl.typeName forState:UIControlStateNormal];

                break;
            case 2:
                [_phasebtn setTitle:[_phasearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                break;
            default:
                case 3:
                [_sequencebtn setTitle:[_sequencearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                break;
        }
            }
    [self.popovercontroller dismissPopoverAnimated:YES];
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_generaltable||tableView==_scaffoldtable)
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

#pragma mark-webservices
-(void)ScaffoldingSelectScaffoldtype{
    webtype=1;
     poptype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ScaffoldingSelectScaffoldtype xmlns=\"http://ios.kontract360.com/\">\n"
                  "</ScaffoldingSelectScaffoldtype>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ScaffoldingSelectScaffoldtype" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)ScaffoldingSelectplan{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ScaffoldingSelectplan xmlns=\"http://ios.kontract360.com/\">\n"
                    "<planid>%@</planid>\n"
                   "</ScaffoldingSelectplan>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ScaffoldingSelectplan" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)JobsequenceSelect{
    // webtype=2;
    poptype=3;
    recordResults = FALSE;
    NSInteger skillid=8040;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ServiceJobSequenceselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<SkillId>%d</SkillId>\n"
                   "</ServiceJobSequenceselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",skillid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ServiceJobSequenceselect" forHTTPHeaderField:@"Soapaction"];
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


-(void)GeneralSelect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<PlanId>%@</PlanId>\n"
                   "</GeneralSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralSelect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)GeneralSearch{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralSearch xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</GeneralSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralSearch" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ScaffoldSearch
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ScaffoldSearch xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</ScaffoldSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ScaffoldSearch" forHTTPHeaderField:@"Soapaction"];
    
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

//-(void)Selectcheight{
//    recordResults = FALSE;
//    NSString *soapMessage;
//    
//    
//    soapMessage = [NSString stringWithFormat:
//                   
//                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
//                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
//                   
//                   
//                   "<soap:Body>\n"
//                   
//                   "<Selectcheight xmlns=\"http://ios.kontract360.com/\">\n"
//                   "<ht>%d</ht>\n"
//                   "</Selectcheight>\n"
//                   "</soap:Body>\n"
//                   "</soap:Envelope>\n",[_elevationtextfield.text integerValue]];
//    NSLog(@"soapmsg%@",soapMessage);
//    
//    
//    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
//    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
//    
//    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
//    
//    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
//    
//    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    
//    [theRequest addValue: @"http://ios.kontract360.com/Selectcheight" forHTTPHeaderField:@"Soapaction"];
//    
//    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
//    [theRequest setHTTPMethod:@"POST"];
//    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    
//    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
//    
//    if( theConnection )
//    {
//        _webData = [NSMutableData data];
//    }
//    else
//    {
//        ////NSLog(@"theConnection is NULL");
//    }
//    
//}
-(void)Scaffoldinsert{
    recordResults = FALSE;
    NSString *soapMessage;
    if(optionidentifier==1){
    NSString *scaffoldid=[_scaffoldidDict objectForKey:_scaffoldtyprbtn.titleLabel.text];
    NSString *phaseid=[_phasedict objectForKey:_phasebtn.titleLabel.text];
        NSString *sequenceid=[_sequenceiddict objectForKey:_sequencebtn.titleLabel.text];
        NSLog(@"%@",_sequencebtn.titleLabel.text);
    NSLog(@"%@",scaffoldid);
    NSString *desc=@"";
     NSString *manhours=@"0";
     NSString *erecthours=@"0";
     NSString *dismantilehours=@"0";
    NSString *insertid=@"0";

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Scaffoldinsert xmlns=\"http://ios.kontract360.com/\">\n"
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
                   "</soap:Envelope>\n",[insertid integerValue],_lengthtextfield.text,_widthtextfield.text,_heighttextfield.text,_qtytextfield.text,_elevationtextfield.text,_unittextfield.text,_equipmenttextfield.text,desc,[scaffoldid integerValue],[manhours doubleValue],[erecthours doubleValue],[dismantilehours doubleValue],_planid,0,0,0,_proheadertextfield.text,[sequenceid integerValue],[phaseid integerValue],_subunittextfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    }
    else if (optionidentifier==2)
    {
        NSString *scaffoldid=[_scaffoldidDict objectForKey:_scaffoldtyprbtn.titleLabel.text];
        NSLog(@"%@",scaffoldid);
        NSString *phaseid=[_phasedict objectForKey:_phasebtn.titleLabel.text];
        NSString *sequenceid=[_sequenceiddict objectForKey:_sequencebtn.titleLabel.text];
       // NSString *insertid=@"0";
         Customscaffoldingplan*scaffldingplan=(Customscaffoldingplan *)[_scaffoldingplanlistarray objectAtIndex:btnindex];
        NSString *manhours=scaffldingplan.manhours;
        NSString *erecthours=scaffldingplan.erecthours;
        NSString *dismantilehours=scaffldingplan.dismantlehours;
    
        soapMessage = [NSString stringWithFormat:
                       
                       @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                       "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                       
                       
                       "<soap:Body>\n"
                       
                       "<Scaffoldinsert xmlns=\"http://ios.kontract360.com/\">\n"
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
                       "<UnplannedWork>%d</UnplannedWork>"
                       "<ph>%@</ph>\n"
                       "<Sequence>%d</Sequence>\n"
                       "<Phase>%d</Phase>\n"
                       "<SubUnit>%@</SubUnit>\n"
                       "</Scaffoldinsert>\n"
                       "</soap:Body>\n"
                       "</soap:Envelope>\n",scaffldingplan.idvalue,_lengthtextfield.text,_widthtextfield.text,_heighttextfield.text,_qtytextfield.text,_elevationtextfield.text,_unittextfield.text,_equipmenttextfield.text,scaffldingplan.desc,[scaffoldid integerValue],[manhours doubleValue],[erecthours doubleValue],[dismantilehours doubleValue],_planid,first,sec,third,_proheadertextfield.text,[sequenceid integerValue],[phaseid integerValue],_subunittextfld.text];
        NSLog(@"soapmsg%@",soapMessage);

    }
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Scaffoldinsert" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)TotalManHoursSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<TotalManHoursSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<PlanId>%@</PlanId>\n"
                   "</TotalManHoursSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/TotalManHoursSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllPhases{
    webtype=3;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<PlanPhasesSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "</PlanPhasesSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/PlanPhasesSelect" forHTTPHeaderField:@"Soapaction"];
    
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
    [_scaffoldtable reloadData];
    [_generaltable reloadData];
    
}
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    if (webtype==1) {
        [self CreateScaffoldTypeDB];
        [self JobsequenceSelect];
        
        
    }
    if (webtype==2)
    {
        [self createscaffsequenceDB];
        [self SelectAllPhases];
        
        
    }
    if (webtype==3)
    {
        [self createphasedata];
        [self ScaffoldingSelectplan];
        webtype=0;
        
        
        
    }

}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ScaffoldingSelectplanResult"])
    {
        _scaffoldingplanlistarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ScaffoldSearchResponse"])
    {
        _scaffoldingplanlistarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"id"])
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
    if([elementName isEqualToString:@"qty"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"elevation"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"unit"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"equp"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ph"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"typeofscaffold"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"description"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Decking"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"HandRail"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Tarpaulin"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Plasticsheet"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"InternalWorkFactor"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"PPE"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UnplannedWork"])
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
    if([elementName isEqualToString:@"planid"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SubUnit"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Sequence"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Phase"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"ScaffoldingSelectScaffoldtypeResult"])
    {
        _scaffoldtyperesultarray=[[NSMutableArray alloc]init];
        _scaffoldtypeDict=[[NSMutableDictionary alloc]init];
        _scaffoldidDict=[[NSMutableDictionary alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"scaffoldId"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"typename"])
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
    if([elementName isEqualToString:@"ftupto33"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ftupto100"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ftupto165"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ftg165"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ft3upto1750"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ft3upto7000"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ft3upto18000"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ft3g18000"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ScaffoldinsertResult"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Column1"])
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
    if([elementName isEqualToString:@"GeneralSelectResponse"])
    {
        _generallistarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Unit"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"generalSubUnit"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Equipment"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ProjectHeader"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PHASE"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Quantity"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TotalHoures"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"PlanId"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"sequence"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EquipmentHours"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"GeneralSearchResponse"])
    {
          _generallistarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TotalManHoursSelectResult"])
    {
       
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"MANHOURQuantity"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ServiceJobSequenceselectResult"])
    {
        _sequencearray=[[NSMutableArray alloc]init];
        _sequencedict=[[NSMutableDictionary alloc]init];
        _sequenceiddict=[[NSMutableDictionary alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobSequenceId"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobTask"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"SkillId"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SequenceNumber"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PlanPhasesSelectResult"])
    { webtype=3;
        _phasearray=[[NSMutableArray alloc]init];
        _phasedict=[[NSMutableDictionary alloc]init];
        _phaseiddict=[[NSMutableDictionary alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"PhaseID"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"PhaseName"])
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
    if([elementName isEqualToString:@"ScaffoldingSelectplanResult"])
    {
               recordResults = FALSE;
        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"id"])
    {
        _scfldmdl=[[Customscaffoldingplan alloc]init];
        recordResults = FALSE;
        _scfldmdl.idvalue=[_soapresults integerValue];;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"length"])
    {
        
        recordResults = FALSE;
        _scfldmdl.length=[_soapresults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"width"])
    {
        
        recordResults = FALSE;
        _scfldmdl.width=[_soapresults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"height"])
    {
        
        recordResults = FALSE;
        _scfldmdl.height=[_soapresults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"qty"])
    {
        
        recordResults = FALSE;
        _scfldmdl.qty=[_soapresults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"elevation"])
    {
        
        recordResults = FALSE;
        _scfldmdl.elevation=[_soapresults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"unit"])
    {
        
        recordResults = FALSE;
        _scfldmdl.unit=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"equp"])
    {
        
        recordResults = FALSE;
        _scfldmdl.equp=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ph"])
    {
        
        recordResults = FALSE;
        _scfldmdl.ph=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"typeofscaffold"])
    {
        
        recordResults = FALSE;
         NSString *scaffoldname=[_scaffoldtypeDict objectForKey:_soapresults];
        _scfldmdl.typescaffold=[_soapresults integerValue];
        _scfldmdl.scaffoldname=scaffoldname;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"description"])
    {
        
        recordResults = FALSE;
        _scfldmdl.desc=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"Decking"])
    {
        
        recordResults = FALSE;
        _scfldmdl.decking=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"HandRail"])
    {
        
        recordResults = FALSE;
        _scfldmdl.handrail=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"Tarpaulin"])
    {
        
        recordResults = FALSE;
        _scfldmdl.tarpaulin=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"Plasticsheet"])
    {
        
        recordResults = FALSE;
        _scfldmdl.Plasticsheet=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"InternalWorkFactor"])
    {
        
        recordResults = FALSE;
        if ([_soapresults isEqualToString:@"true"]) {
            _scfldmdl.internalworkfactor=1;
        }
        else
        {
            _scfldmdl.internalworkfactor=0;
        }
        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"PPE"])
    {
        
        recordResults = FALSE;
        if ([_soapresults isEqualToString:@"true"]) {
            _scfldmdl.ppe=1;
        }
        else
        {
            _scfldmdl.ppe=0;
        }

       
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"UnplannedWork"])
    {
        
        recordResults = FALSE;
        if ([_soapresults isEqualToString:@"true"]) {
            _scfldmdl.unplannedwork=1;
        }
        else
        {
            _scfldmdl.unplannedwork=0;
        }
        

        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ManHoures"])
    {
        
        recordResults = FALSE;
        _scfldmdl.manhours=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ErectHoures"])
    {
        
        recordResults = FALSE;
        _scfldmdl.erecthours=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"DesmandleHoures"])
    {
        
        recordResults = FALSE;
        _scfldmdl.dismantlehours=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"planid"])
    {
        
        recordResults = FALSE;
        _scfldmdl.pid=_soapresults;
        //[_scaffoldingplanlistarray addObject:_scfldmdl];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"SubUnit"])
    {
        
        recordResults = FALSE;
        _scfldmdl.subunit=_soapresults;
        //[_scaffoldingplanlistarray addObject:_scfldmdl];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"Sequence"])
    {
        
        recordResults = FALSE;
        _scfldmdl.sequencename=_soapresults;
//        NSString *sequence=[_sequenceiddict objectForKey:_soapresults];
//        _scfldmdl.sequencename=sequence;
        //[_scaffoldingplanlistarray addObject:_scfldmdl];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"Phase"])
    {
        
        recordResults = FALSE;
        _scfldmdl.phasename=_soapresults;
//        NSString *phase=[_phaseiddict objectForKey:_soapresults];
//        _scfldmdl.phasename=phase;
        [_scaffoldingplanlistarray addObject:_scfldmdl];
        _soapresults = nil;
    }

    
    if([elementName isEqualToString:@"ScaffoldingSelectScaffoldtypeResult"])
    {
        
        recordResults = FALSE;
       
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"scaffoldId"])
    {
        _typemdl=[[Scaffoldtypemdl alloc]init];
        recordResults = FALSE;
        _scaffoldtypestring=_soapresults;
        _typemdl.scaffoldid=[_soapresults integerValue];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"typename"])
    {
       
        recordResults = FALSE;
        _typemdl.typeName=_soapresults;
        [_scaffoldtypeDict setObject:_soapresults forKey:_scaffoldtypestring];
        [_scaffoldidDict setObject:_scaffoldtypestring forKey:_soapresults];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"rate"])
    {
        
        recordResults = FALSE;
        _typemdl.rate=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ftupto33"])
    {
        
        recordResults = FALSE;
        _typemdl.ftupto33=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ftupto100"])
    {
        
        recordResults = FALSE;
        _typemdl.ftupto100=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ftupto165"])
    {
        
        recordResults = FALSE;
        _typemdl.ftupto165=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ftg165"])
    {
        
        recordResults = FALSE;
        _typemdl.ftg165=_soapresults;
        _soapresults = nil;
    }


    if([elementName isEqualToString:@"ft3upto1750"])
    {
        
        recordResults = FALSE;
        _typemdl.ft3upto1750=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ft3upto7000"])
    {
        
        recordResults = FALSE;
        _typemdl.ft3upto7000=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ft3upto18000"])
    {
        
        recordResults = FALSE;
        _typemdl.ft3upto18000=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ft3g18000"])
    {
        
        recordResults = FALSE;
        _typemdl.ft3g18000=_soapresults;
        [_scaffoldtyperesultarray addObject:_typemdl];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"Column1"])
    {
        
        recordResults = FALSE;
        _insertresultvalue=_soapresults;
        if(optionidentifier==1)
        {
        if (!self.allctrlr)
        {
            self.allctrlr=[[AllDetailsplandisplayViewController alloc]initWithNibName:@"AllDetailsplandisplayViewController" bundle:nil];
        }
        _allctrlr.newscfoldtypearry=_scaffoldtyperesultarray;
        _allctrlr.len=_lengthtextfield.text;
        _allctrlr.wid=_widthtextfield.text;
        _allctrlr.height=_heighttextfield.text;
        _allctrlr.ele=_elevationtextfield.text;
        _allctrlr.unit=_unittextfield.text;
        _allctrlr.equip=_equipmenttextfield.text;
        _allctrlr.sid=[_scaffoldidDict objectForKey:_scaffoldtyprbtn.titleLabel.text];
        _allctrlr.qty=_qtytextfield.text;
        _allctrlr.ph=_proheadertextfield.text;
        _allctrlr.planid=_planid;
        _allctrlr.Scfldid=_insertresultvalue;
        _allctrlr.phaseid=[_phasedict objectForKey:_phasebtn.titleLabel.text];
        _allctrlr.sequenceid=[_sequenceiddict objectForKey:_sequencebtn.titleLabel.text];
            _allctrlr.subunit=_subunittextfld.text;
        _allctrlr.optionidentifier=optionidentifier;
            NSInteger scfid= [_allctrlr.sid integerValue];
            switch (scfid) {
                case 1:
                    _allctrlr.scaffoldtypeindex=0;
                    
                    break;
                case 2:
                    _allctrlr.scaffoldtypeindex=1;
                    
                    break;
                case 3:
                    _allctrlr.scaffoldtypeindex=2;
                    
                    break;
                case 4:
                    _allctrlr.scaffoldtypeindex=3;
                    
                    break;
                case 5:
                    _allctrlr.scaffoldtypeindex=4;
                    
                    break;
                    
                default:
                    
                    break;
            }

//        _allctrlr.modalPresentationStyle=UIModalPresentationFullScreen;
//        _allctrlr.modalTransitionStyle=UIModalTransitionStylePartialCurl;
            _allctrlr.delegate=self;

            [UIView transitionFromView:self.addscaffoldrecordview
                                toView:self.allctrlr.view
                              duration:1
                               options:UIViewAnimationOptionTransitionFlipFromRight
                            completion:nil];
            
            [self.navigationController pushViewController:_allctrlr animated:NO];

            _addscaffoldrecordview.hidden=YES;
//                 [self presentViewController:_allctrlr
//                           animated:YES completion:NULL];
        }
       
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        
        recordResults = FALSE;
        if([_soapresults isEqualToString:@"updatedscaffold"])
        {
//                if (!self.allctrlr)
//                        {
//                            self.allctrlr=[[AllDetailsplandisplayViewController alloc]initWithNibName:@"AllDetailsplandisplayViewController" bundle:nil];
//                        }
            self.allctrlr=[[AllDetailsplandisplayViewController alloc]initWithNibName:@"AllDetailsplandisplayViewController" bundle:nil];
            _allctrlr.Scafldarry=_scaffoldingplanlistarray;
            _allctrlr.newscfoldtypearry=_scaffoldtyperesultarray;
            _allctrlr.btnindx=btnindex;
            _allctrlr.optionidentifier=optionidentifier;
            _allctrlr.len=_lengthtextfield.text;
            _allctrlr.wid=_widthtextfield.text;
            _allctrlr.height=_heighttextfield.text;
            _allctrlr.ele=_elevationtextfield.text;
            _allctrlr.unit=_unittextfield.text;
             _allctrlr.ph=_proheadertextfield.text;
            _allctrlr.equip=_equipmenttextfield.text;
            _allctrlr.sid=[_scaffoldidDict objectForKey:_scaffoldtyprbtn.titleLabel.text];
            _allctrlr.qty=_qtytextfield.text;
            _allctrlr.planid=_planid;
            _allctrlr.phaseid=[_phasedict objectForKey:_phasebtn.titleLabel.text];
            _allctrlr.sequenceid=[_sequenceiddict objectForKey:_sequencebtn.titleLabel.text];
            _allctrlr.subunit=_subunittextfld.text;
            _allctrlr.iwfcheck=first;
            _allctrlr.ppecheck=sec;
            _allctrlr.upwcheck=third;
            NSInteger scfid= [_allctrlr.sid integerValue];
            switch (scfid) {
                case 1:
                    _allctrlr.scaffoldtypeindex=0;
                    
                    break;
                case 2:
                    _allctrlr.scaffoldtypeindex=1;
                    
                    break;
                case 3:
                    _allctrlr.scaffoldtypeindex=2;
                    
                    break;
                case 4:
                    _allctrlr.scaffoldtypeindex=3;
                    
                    break;
                case 5:
                    _allctrlr.scaffoldtypeindex=4;
                    
                    break;
                    
                default:
                    
                    break;
            }

//            _allctrlr.modalPresentationStyle=UIModalPresentationFullScreen;
//            _allctrlr.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
             _allctrlr.delegate=self;
           
            //[self presentViewController:_allctrlr
                               //animated:YES completion:NULL];
            
                      [UIView transitionFromView:self.addscaffoldrecordview
                                toView:self.allctrlr.view
                              duration:1
                               options:UIViewAnimationOptionTransitionFlipFromRight
                            completion:nil];
            
            [self.navigationController pushViewController:_allctrlr animated:NO];
            
           // [self presentViewController:_allctrlr
            //animated:NO completion:NULL];

            _addscaffoldrecordview.hidden=YES;

//            CATransition *animation = [CATransition animation];
//            [animation setDelegate:self];
//            [animation setDuration:1.0f];
//            animation.startProgress = 0;
//            animation.endProgress   = 1;
//            [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//            animation.type = @"pageCurl";
//            animation.subtype=@"fromRight";
//            animation.fillMode = kCAFillModeForwards;
//            
//            [animation setRemovedOnCompletion:NO];
//            [animation setFillMode: @"extended"];
//            [animation setRemovedOnCompletion: NO];
//            //[lyr addAnimation:animation forKey:@"WebPageCurl"];
//            
//            [self.navigationController.view.layer addAnimation:animation forKey:@"WebPageCurl"];
//            [self.navigationController pushViewController:_allctrlr animated:NO];
        }
        

        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"GeneralSelectResult"])
    {
        
        recordResults = FALSE;
       
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        recordResults = FALSE;
        _gmodel=[[Generalmodel alloc]init];
        _gmodel.gid=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"Unit"])
    {
        
        recordResults = FALSE;
        _gmodel.Unit=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"generalSubUnit"])
    {
        
        recordResults = FALSE;
        _gmodel.SubUnit=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"Equipment"])
    {
        
        recordResults = FALSE;
        _gmodel.Equipment=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ProjectHeader"])
    {
        
        recordResults = FALSE;
        _gmodel.ProjectHeader=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"PHASE"])
    {
        
        recordResults = FALSE;
        _gmodel.Phase=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
        _gmodel.genDescription=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"Quantity"])
    {
        
        recordResults = FALSE;
        _gmodel.Quantity=_soapresults;
        
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"TotalHoures"])
    {
        
        recordResults = FALSE;
        _gmodel.TotalHoures=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"PlanId"])
    {
        
        recordResults = FALSE;
        _gmodel.PlanId=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"sequence"])
    {
        
        recordResults = FALSE;
        _gmodel.sequence=_soapresults;
       
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"EquipmentHours"])
    {
        
        recordResults = FALSE;
        _gmodel.EquipmentHours=_soapresults;
         [_generallistarray addObject:_gmodel];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"MANHOURQuantity"])
    {
        
        recordResults = FALSE;
        _totalmanhourlabel.text=[_soapresults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ServiceJobSequenceselectResult"])
    {
        
        recordResults = FALSE;
        
        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"SkillId"])
    {
        
        recordResults = FALSE;
        
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"JobSequenceId"])
    {
        
        recordResults = FALSE;
        _sequencestring=_soapresults;
        
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"JobTask"])
    {
        
        recordResults = FALSE;
        [_sequencearray addObject:_soapresults];
        [_sequencedict setObject:_soapresults forKey:_sequencestring];
        [_sequenceiddict setObject:_sequencestring forKey:_soapresults];
        webtype=2;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"SequenceNumber"])
    {
        
        recordResults = FALSE;
        
        
        _soapresults = nil;
    }



    if([elementName isEqualToString:@"PhaseID"])
    {
         webtype=3;
        recordResults = FALSE;
        _phasestring=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"PhaseName"])
    {
        
        recordResults = FALSE;
        [_phasearray addObject:_soapresults];
        [_phasedict setObject:_phasestring forKey:_soapresults];
        [_phaseiddict setObject:_soapresults forKey:_phasestring];
        _soapresults = nil;
        
        
    }





}
#pragma mark-delegate

-(void)navgteanimtn{
    [UIView transitionFromView:self.allctrlr.view
                        toView:self.addscaffoldrecordview
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    completion:nil];
    [self ScaffoldingSelectplan];

}
-(void)updatedata
{
    [self GeneralSelect];
    [self TotalManHoursSelect];
}
#pragma mark - SearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    if (searchtype==1) {
        [self GeneralSearch];
    }
    else if(searchtype==2)
    {
        [self ScaffoldSearch];
    }

    
    [searchBar resignFirstResponder];
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    if (searchtype==1) {
        [self GeneralSelect];
    }
    else if(searchtype==2)
    {
        [self ScaffoldingSelectplan];
    }

    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([_searchbar.text length]==0) {
        if (searchtype==1) {
        [self GeneralSelect];
        }
        else if(searchtype==2)
        {
            [self ScaffoldingSelectplan];
        }
        

        // [searchBar resignFirstResponder];
        
        
    }
    //[searchBar resignFirstResponder];
    
}
#pragma mark-SqliteDB

-(void)CreateScaffoldTypeDB
{
    
    _dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _docsDir = [_dirPaths objectAtIndex:0];
    
    /* Build the path to the database file*/
    
    _scaffoldtypepath = [[NSString alloc] initWithString: [_docsDir stringByAppendingPathComponent:@"ScaffoldType.db"]];
    NSLog(@"Path %@",_scaffoldtypepath);
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: _scaffoldtypepath ] == NO)
    {
        const char *dbpath = [_scaffoldtypepath UTF8String];
        if (sqlite3_open(dbpath, &_scaffoldTypeDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS ScaffoldTypeList (ID INTEGER PRIMARY KEY AUTOINCREMENT, ScaffoldID TEXT, ScaffoldName TEXT, Rate TEXT,Ftupto33 TEXT,Ftupto100 TEXT,Ftupto165 TEXT,Ftg165 TEXT,ft3upto1750 TEXT,Ft3upto7000 TEXT,Ft3g18000 TEXT)";
            
            
            if (sqlite3_exec(_scaffoldTypeDB, sql_stmt, NULL, NULL, &errMsg)
                != SQLITE_OK)
            {
                
                NSLog(@"Failed to create table");
                NSLog( @"Error while inserting '%s'", sqlite3_errmsg(_scaffoldTypeDB));
            }
            sqlite3_close(_scaffoldTypeDB);
            
        }
        
        else {
            NSLog( @"Failed to open/create database");
            
        }
        
    }
    [self DeleteScafftypeDBtable];
    for (int i=0; i<[_scaffoldtyperesultarray count]; i++)
    {
      _typemdl=(Scaffoldtypemdl *)[_scaffoldtyperesultarray objectAtIndex:i];
        

    [self insertscaffoldtypetoDB];
    }
    
    
}
-(void)insertscaffoldtypetoDB
{
    sqlite3_stmt    *statement;
    
        const char *dbpath = [_scaffoldtypepath UTF8String];
    
        
        
        if (sqlite3_open(dbpath, &_scaffoldTypeDB) == SQLITE_OK)
        {
           
            

            NSString *InsertSQl=[NSString stringWithFormat:@"INSERT INTO ScaffoldTypeList(ScaffoldID,ScaffoldName,Rate,Ftupto33,Ftupto100,Ftupto165,Ftg165,ft3upto1750,Ft3upto7000,Ft3g18000) VALUES (\"%d\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",_typemdl.scaffoldid,_typemdl.typeName,_typemdl.rate,_typemdl.ftupto33,_typemdl.ftupto100,_typemdl.ftupto165,_typemdl.ftg165,_typemdl.ft3upto1750,_typemdl.ft3upto7000,_typemdl.ft3g18000];
            
            
            
            const char *insert_stmt = [InsertSQl UTF8String];
            sqlite3_prepare_v2(_scaffoldTypeDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
                
                NSLog( @"ScaffoldType data added");
                
            } else {
                //status.text = @"Failed to add contact";
                NSLog( @"Failed to add scaffoldtype Data ");
            }
            sqlite3_finalize(statement);
            sqlite3_close(_scaffoldTypeDB);
            
        }
        
    
    
}

-(void)createscaffsequenceDB
{
    
    _dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _docsDir = [_dirPaths objectAtIndex:0];
    
    /* Build the path to the database file*/
    
    _sequencepath = [[NSString alloc] initWithString: [_docsDir stringByAppendingPathComponent:@"ScaffSequence.db"]];
    NSLog(@"Path %@",_sequencepath);
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: _sequencepath ] == NO)
    {
        const char *dbpath = [_sequencepath UTF8String];
        if (sqlite3_open(dbpath, &_scaffsequenceDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS ScaffSequenceList (ID INTEGER PRIMARY KEY AUTOINCREMENT, SequenceID TEXT, SequenceName TEXT)";
            
            
            if (sqlite3_exec(_scaffsequenceDB, sql_stmt, NULL, NULL, &errMsg)
                != SQLITE_OK)
            {
                
                NSLog(@"Failed to create table");
                NSLog( @"Error while inserting '%s'", sqlite3_errmsg(_scaffsequenceDB));
            }
            sqlite3_close(_scaffsequenceDB);
            
        }
        
        else {
            NSLog( @"Failed to open/create database");
            
        }
        
    }
    [self DeleteSequenceDBtable];
    for (int i=0; i<[_sequencearray count]; i++) {
        _sname = [_sequencearray objectAtIndex:i];
        _sid = [_sequenceiddict objectForKey:[_sequencearray objectAtIndex:i]];
        [self insertsequnecedatatodb];
    }

    
}
-(void)insertsequnecedatatodb
{
    
    
        sqlite3_stmt    *statement;
        const char *dbpath = [_sequencepath UTF8String];
        
        
        
        if (sqlite3_open(dbpath, &_scaffsequenceDB) == SQLITE_OK)
        {
            NSString *InsertSQl=[NSString stringWithFormat:@"INSERT INTO ScaffSequenceList(SequenceID,SequenceName) VALUES (\"%@\",\"%@\")",_sid,_sname];
            
            
            const char *insert_stmt = [InsertSQl UTF8String];
            sqlite3_prepare_v2(_scaffsequenceDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
                
                NSLog( @"SequenceData added");
                
            } else {
                //status.text = @"Failed to add contact";
                NSLog( @"Failed to add Sequence Data ");
            }
            sqlite3_finalize(statement);
            sqlite3_close(_scaffsequenceDB);
            
        }
        
        
    }

-(void)createphasedata{
    
    _dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _docsDir = [_dirPaths objectAtIndex:0];
    
    /* Build the path to the database file*/
    
    _phasepath = [[NSString alloc] initWithString: [_docsDir stringByAppendingPathComponent:@"ScaffPhase.db"]];
    NSLog(@"Path %@",_phasepath);
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: _phasepath ] == NO)
    {
        const char *dbpath = [_phasepath UTF8String];
        if (sqlite3_open(dbpath, &_scaffPhaseDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS ScaffPhaseList (ID INTEGER PRIMARY KEY AUTOINCREMENT, PhaseID TEXT, PhaseName TEXT)";
            
            
            if (sqlite3_exec(_scaffPhaseDB, sql_stmt, NULL, NULL, &errMsg)
                != SQLITE_OK)
            {
                
                NSLog(@"Failed to create table");
                NSLog( @"Error while inserting '%s'", sqlite3_errmsg(_scaffPhaseDB));
            }
            sqlite3_close(_scaffPhaseDB);
            
        }
        
        else {
            NSLog( @"Failed to open/create database");
            
        }
        
    }
    [self DeleteDBtable];
    for (int i=0; i<[_phasearray count]; i++) {
        _pname = [_phasearray objectAtIndex:i];
        _pid = [_phasedict objectForKey:[_phasearray objectAtIndex:i]];
        [self insertphasetoDB];
    }

    
}
-(void)insertphasetoDB
{
    sqlite3_stmt    *statement;
    const char *dbpath = [_phasepath UTF8String];
    
    
    
    if (sqlite3_open(dbpath, &_scaffPhaseDB) == SQLITE_OK)
    {
        NSString *InsertSQl=[NSString stringWithFormat:@"INSERT INTO ScaffPhaseList(PhaseID,PhaseName) VALUES (\"%@\",\"%@\")",_pid,_pname];
        
        
        const char *insert_stmt = [InsertSQl UTF8String];
        sqlite3_prepare_v2(_scaffPhaseDB, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            
            NSLog( @"phasedata added");
            
        } else {
            //status.text = @"Failed to add contact";
            NSLog( @"Failed to add phase Data ");
        }
        sqlite3_finalize(statement);
        sqlite3_close(_scaffPhaseDB);
        
    }
    
    
    
}
-(void)createDatabase
{
    
    _dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _docsDir = [_dirPaths objectAtIndex:0];
    
    /* Build the path to the database file*/
    
    _ScaffoldPath = [[NSString alloc] initWithString: [_docsDir stringByAppendingPathComponent: @"AllScaffold.db"]];
    NSLog(@"Path %@",_ScaffoldPath);
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: _ScaffoldPath ] == NO)
    {
        const char *dbpath = [_ScaffoldPath UTF8String];
        if (sqlite3_open(dbpath, &_AllscaffoldDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS AllScaffoldList (ID INTEGER PRIMARY KEY AUTOINCREMENT, Unit TEXT, SubUnit TEXT, Equipment TEXT, ProjectHeader TEXT, ScaffoldType TEXT, Length TEXT, Width TEXT,Height TEXT,Quantity TEXT,Elevation TEXT,Sequence TEXT,Phase TEXT,Description TEXT,PlanID TEXT,IWF TEXT,PPE TEXT,UPW TEXT,Manhour TEXT,DismantileHour TEXT,ErectHour TEXT,PlanFactor TEXT)";
            
            
            if (sqlite3_exec(_AllscaffoldDB, sql_stmt, NULL, NULL, &errMsg)
                != SQLITE_OK)
            {
                
                NSLog(@"Failed to create table");
                NSLog( @"Error while inserting '%s'", sqlite3_errmsg(_AllscaffoldDB));
            }
            sqlite3_close(_AllscaffoldDB);
            
        }
        
        else {
            NSLog( @"Failed to open/create database");
            
        }
        
    }
}
-(void)insertScaffoldToDB{
    sqlite3_stmt    *statement;
    const char *dbpath = [_ScaffoldPath UTF8String];
    
   
    NSString *scaffoldid=[_scaffoldidDict objectForKey:_scaffoldtyprbtn.titleLabel.text];
    NSString *phaseid=[_phasedict objectForKey:_phasebtn.titleLabel.text];
    NSString *sequenceid=[_sequenceiddict objectForKey:_sequencebtn.titleLabel.text];
   
    if (sqlite3_open(dbpath, &_AllscaffoldDB) == SQLITE_OK)
    {
        NSString *InsertSQl=[NSString stringWithFormat:@"INSERT INTO AllScaffoldList(Unit, SubUnit, Equipment, ProjectHeader,ScaffoldType, Length, Width,Height,Quantity,Elevation,Sequence,Phase,PlanID) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",_unittextfield.text,_subunittextfld.text,_equipmenttextfield.text,_proheadertextfield.text,scaffoldid,_lengthtextfield.text,_widthtextfield.text,_heighttextfield.text,_qtytextfield.text,_elevationtextfield.text,sequenceid,phaseid,_planid];
        
        
        const char *insert_stmt = [InsertSQl UTF8String];
        sqlite3_prepare_v2(_AllscaffoldDB, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            
            NSLog( @"Scaffold Data added");
            if (!self.allctrlr)
            {
                self.allctrlr=[[AllDetailsplandisplayViewController alloc]initWithNibName:@"AllDetailsplandisplayViewController" bundle:nil];
            }
            _allctrlr.Scafldarry=_scaffoldingplanlistarray;
            _allctrlr.newscfoldtypearry=_scaffoldtyperesultarray;
            _allctrlr.btnindx=btnindex;
            _allctrlr.optionidentifier=optionidentifier;
            _allctrlr.len=_lengthtextfield.text;
            _allctrlr.wid=_widthtextfield.text;
            _allctrlr.height=_heighttextfield.text;
            _allctrlr.ele=_heighttextfield.text;
            _allctrlr.unit=_unittextfield.text;
            _allctrlr.ph=_proheadertextfield.text;
            _allctrlr.equip=_equipmenttextfield.text;
            _allctrlr.sid=[_scaffoldidDict objectForKey:_scaffoldtyprbtn.titleLabel.text];
            _allctrlr.qty=_qtytextfield.text;
            _allctrlr.planid=_planid;
            _allctrlr.phaseid=[_phasedict objectForKey:_phasebtn.titleLabel.text];
            _allctrlr.sequenceid=[_sequenceiddict objectForKey:_sequencebtn.titleLabel.text];
            _allctrlr.subunit=_subunittextfld.text;
            _allctrlr.iwfcheck=first;
            _allctrlr.ppecheck=sec;
            _allctrlr.upwcheck=third;
            NSInteger scfid= [_allctrlr.sid integerValue];
            switch (scfid) {
                case 1:
                    _allctrlr.scaffoldtypeindex=0;
                    
                    break;
                case 2:
                    _allctrlr.scaffoldtypeindex=1;
                    
                    break;
                case 3:
                    _allctrlr.scaffoldtypeindex=2;
                    
                    break;
                case 4:
                    _allctrlr.scaffoldtypeindex=3;
                    
                    break;
                case 5:
                    _allctrlr.scaffoldtypeindex=4;
                    
                    break;
                    
                default:
                    
                    break;
            }


            [UIView transitionFromView:self.addscaffoldrecordview
                                toView:self.allctrlr.view
                              duration:1
                               options:UIViewAnimationOptionTransitionFlipFromRight
                            completion:nil];
            
            [self.navigationController pushViewController:_allctrlr animated:NO];
            
        } else {
            //status.text = @"Failed to add contact";
            NSLog( @"Failed to add Scaffold Data ");
        }
        sqlite3_finalize(statement);
        sqlite3_close(_AllscaffoldDB);
        
    }
    
    
}
-(void)fetchphase{
    
    _dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _docsDir = [_dirPaths objectAtIndex:0];
    
    /* Build the path to the database file*/
    
    _phasepath = [[NSString alloc] initWithString: [_docsDir stringByAppendingPathComponent: @"ScaffPhase.db"]];
    NSLog(@"Path %@",_phasepath);
    
    const char *dbpath = [_phasepath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &_scaffPhaseDB) == SQLITE_OK)
    {
        
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM ScaffPhaseList"];
        // NSLog(@"Sql%@",querySQL);
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(_scaffPhaseDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            // NSLog(@"sqlite %@",sqlite3_step(statement));
            _phasearray=[[NSMutableArray alloc]init];
            _phasedict=[[NSMutableDictionary alloc]init];
            while (sqlite3_step(statement) == SQLITE_ROW)
                
                
            {
                
                const char* key = (const char*)sqlite3_column_text(statement, 0);
                NSString *pkey= key == NULL ? nil : [[NSString alloc] initWithUTF8String:key];
                
                const char* pid = (const char*)sqlite3_column_text(statement, 1);
                NSString *sqlitephase = pid == NULL ? nil : [[NSString alloc] initWithUTF8String:pid];
                
                
                const char*pname = (const char*)sqlite3_column_text(statement, 2);
                NSString *sqlitephasename= pname== NULL ? nil : [[NSString alloc] initWithUTF8String:pname];
                [_phasedict setObject:sqlitephase forKey:sqlitephasename];
                
                
                
                [_phasearray addObject:sqlitephasename];
                
                
            }
            
            
            
            
            
        }
        sqlite3_finalize(statement);
        
    }
    sqlite3_close(_scaffPhaseDB);
    [_popovertableview reloadData];
    
    
}
-(void)fetchsequencedata
{
    
    _dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _docsDir = [_dirPaths objectAtIndex:0];
    
    /* Build the path to the database file*/
    
    _sequencepath = [[NSString alloc] initWithString: [_docsDir stringByAppendingPathComponent: @"ScaffSequence.db"]];
    NSLog(@"Path %@",_sequencepath);
    
    const char *dbpath = [_sequencepath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &_scaffsequenceDB) == SQLITE_OK)
    {
        
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM ScaffSequenceList"];
        // NSLog(@"Sql%@",querySQL);
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(_scaffsequenceDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            // NSLog(@"sqlite %@",sqlite3_step(statement));
            _sequencearray=[[NSMutableArray alloc]init];
            _sequenceiddict=[[NSMutableDictionary alloc]init];
            while (sqlite3_step(statement) == SQLITE_ROW)
                
                
            {
                
                const char* key = (const char*)sqlite3_column_text(statement, 0);
                NSString *pkey= key == NULL ? nil : [[NSString alloc] initWithUTF8String:key];
                
                const char* sid = (const char*)sqlite3_column_text(statement, 1);
                NSString *sqliteSequence = sid == NULL ? nil : [[NSString alloc] initWithUTF8String:sid];
                
                
                const char*sname = (const char*)sqlite3_column_text(statement, 2);
                NSString *sqlitesequencename= sname== NULL ? nil : [[NSString alloc] initWithUTF8String:sname];
                [_sequenceiddict setObject:sqliteSequence forKey:sqlitesequencename];
                
                
                
                [_sequencearray addObject:sqlitesequencename];
                
                
            }
            
            
            
            
            
        }
        sqlite3_finalize(statement);
        
    }
    sqlite3_close(_scaffsequenceDB);
    [_popovertableview reloadData];
    
    
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
             _scaffoldidDict=[[NSMutableDictionary alloc]init];
          
           // _phasedict=[[NSMutableDictionary alloc]init];
            while (sqlite3_step(statement) == SQLITE_ROW)
                
                
            {
                  _typemdl=[[Scaffoldtypemdl alloc]init];
                const char* key = (const char*)sqlite3_column_text(statement, 0);
                NSString *pkey= key == NULL ? nil : [[NSString alloc] initWithUTF8String:key];
                
                const char* pid = (const char*)sqlite3_column_text(statement, 1);
                NSString *typeid = pid == NULL ? nil : [[NSString alloc] initWithUTF8String:pid];
                _typemdl.scaffoldid=[typeid integerValue];
                
                const char*pname = (const char*)sqlite3_column_text(statement, 2);
                NSString *typename= pname== NULL ? nil : [[NSString alloc] initWithUTF8String:pname];
                _typemdl.typeName=typename;
                 [_scaffoldidDict setObject:typeid forKey:typename];
                const char*Rate = (const char*)sqlite3_column_text(statement, 3);
                NSString *rate= Rate== NULL ? nil : [[NSString alloc] initWithUTF8String:Rate];
                _typemdl.rate=rate;
                
                const char*upto33 = (const char*)sqlite3_column_text(statement, 4);
                NSString *ftupto33= upto33== NULL ? nil : [[NSString alloc] initWithUTF8String:upto33];
                _typemdl.ftupto33=ftupto33;
                
                const char*upto100 = (const char*)sqlite3_column_text(statement, 4);
                NSString *Ftupto100= upto100== NULL ? nil : [[NSString alloc] initWithUTF8String:upto100];
                _typemdl.Ftupto100=Ftupto100;
                
                const char*upto165 = (const char*)sqlite3_column_text(statement, 4);
                NSString *Ftupto165= upto165== NULL ? nil : [[NSString alloc] initWithUTF8String:upto165];
                _typemdl.Ftupto165=Ftupto165;
                
                const char*g165 = (const char*)sqlite3_column_text(statement, 4);
                NSString *Ftg165= g165== NULL ? nil : [[NSString alloc] initWithUTF8String:g165];
                _typemdl.Ftg165=Ftg165;
                
                const char*upto1750 = (const char*)sqlite3_column_text(statement, 4);
                NSString *ft3upto1750= upto1750== NULL ? nil : [[NSString alloc] initWithUTF8String:upto1750];
                _typemdl.ft3upto1750=ft3upto1750;
                
                const char*upto7000 = (const char*)sqlite3_column_text(statement, 4);
                NSString *Ft3upto7000= upto7000== NULL ? nil : [[NSString alloc] initWithUTF8String:upto7000];
                _typemdl.Ft3upto7000=Ft3upto7000;
                
                const char*g18000 = (const char*)sqlite3_column_text(statement, 4);
                NSString *Ft3g18000= g18000== NULL ? nil : [[NSString alloc] initWithUTF8String:g18000];
                _typemdl.Ft3g18000=Ft3g18000;

                
                
                
                [_scaffoldtyperesultarray addObject:_typemdl];
                
                
            }
            
            
            
            
            
        }
        sqlite3_finalize(statement);
        
    }
    sqlite3_close(_scaffoldTypeDB);
    [_popovertableview reloadData];
    
    
}

-(void)DeleteDBtable{
    
    
    sqlite3_stmt *statement;
    const char *dbPath=[_phasepath UTF8String];
    if(sqlite3_open(dbPath, &_scaffPhaseDB)==SQLITE_OK)
    {
        NSString *deleteSql=[NSString stringWithFormat:@"DELETE FROM ScaffPhaseList"];
        
        const char *delete_stmt=[deleteSql UTF8String];
        
        
        sqlite3_prepare_v2(_scaffPhaseDB, delete_stmt, -1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE) {
            
            NSLog(@"List Deleted");
            
            
        }else{
            
            
            NSLog(@"Failed to Delete");
        }
        sqlite3_finalize(statement);
        sqlite3_close(_scaffPhaseDB);
    }
    
    
}
-(void)DeleteSequenceDBtable{
    
    
    sqlite3_stmt *statement;
    const char *dbPath=[_sequencepath UTF8String];
    if(sqlite3_open(dbPath, &_scaffsequenceDB)==SQLITE_OK)
    {
        NSString *deleteSql=[NSString stringWithFormat:@"DELETE FROM ScaffSequenceList"];
        
        const char *delete_stmt=[deleteSql UTF8String];
        
        
        sqlite3_prepare_v2(_scaffsequenceDB, delete_stmt, -1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE) {
            
            NSLog(@"List Deleted");
            
            
        }else{
            
            
            NSLog(@"Failed to Delete");
        }
        sqlite3_finalize(statement);
        sqlite3_close(_scaffsequenceDB);
    }
    
    
}
-(void)DeleteScafftypeDBtable{
    
    
    sqlite3_stmt *statement;
    const char *dbPath=[_scaffoldtypepath UTF8String];
    if(sqlite3_open(dbPath, &_scaffoldTypeDB)==SQLITE_OK)
    {
        NSString *deleteSql=[NSString stringWithFormat:@"DELETE FROM ScaffoldTypeList"];
        
        const char *delete_stmt=[deleteSql UTF8String];
        
        
        sqlite3_prepare_v2(_scaffoldTypeDB, delete_stmt, -1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE) {
            
            NSLog(@"List Deleted");
            
            
        }else{
            
            
            NSLog(@"Failed to Delete");
        }
        sqlite3_finalize(statement);
        sqlite3_close(_scaffoldTypeDB);
    }
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
   
    if(textField==_lengthtextfield)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_lengthtextfield.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Length" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }
    if(textField==_heighttextfield)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_heighttextfield.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Height" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }
    if(textField==_widthtextfield)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_widthtextfield.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Width" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }
    if(textField==_qtytextfield)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_qtytextfield.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Quantity" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }
    if(textField==_elevationtextfield)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_elevationtextfield.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Elevation" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }


    
    
}

#pragma mark-Alertview Delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if ([alertView.message isEqualToString:@"Invalid Height"]) {
        _heighttextfield.text=@"";
        
        
    }
    if ([alertView.message isEqualToString:@"Invalid Width"]) {
        _widthtextfield.text=@"";
        
        
    }
    if ([alertView.message isEqualToString:@"Invalid Length"]) {
        _lengthtextfield.text=@"";
        
        
    }
    if ([alertView.message isEqualToString:@"Invalid Quantity"]) {
        _qtytextfield.text=@"";
        
        
    }
    if ([alertView.message isEqualToString:@"Invalid Elevation"]) {
        _elevationtextfield.text=@"";
        
        
    }
}

@end
