//
//  BasicReqViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 16/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "BasicReqViewController.h"

@interface BasicReqViewController ()

@end

@implementation BasicReqViewController


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
    _addreqview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     self.openviewindex=NSNotFound;
//    _previousopenviewindex=NSNotFound;
    _basicreqtable.layer.borderWidth = 2.0;
    _basicreqtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    /*searchbar*/
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate = (id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.basicreqtable.tableHeaderView =_searchbar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;
    _autocompletearray=[[NSMutableArray alloc]init];
    //_vendertextfield.delegate=(id)self;
//    _autotable = [[UITableView alloc] initWithFrame:CGRectMake(490, 400, 200, 100) style:UITableViewStylePlain];
//    _autotable.delegate = self;
//    _autotable.dataSource = self;
//    _autotable.rowHeight= 32;
//    _basicreqtable.layer.borderWidth = 1.0;
//    _autotable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
//    _autotable.separatorColor=[UIColor cyanColor];
//    _autotable.scrollEnabled = YES;
//    _autotable.hidden = YES;
//    
//    [self.addreqview addSubview:_autotable];
    //[self SelectAllRequirements];

    // Do any additional setup after loading the view from its nib.
}
-(void)newaction
{
    self.openviewindex=NSNotFound;

    [self SelectAllRequirements];
    [self SelectAllCraft];
    [self SelectAllItemType];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _result=@"";
     _searchbar.text=@"";
    _basicreqtable.userInteractionEnabled=YES;
    _disclosurearray=[[NSMutableArray alloc]initWithObjects:@"Vendor", nil];
    [self SelectAllRequirements];
    //[self SelectAllCraft];
    [self SelectAllItemType];
   
    
    //[self SelectAllJobSites];

}
#pragma mark-Textfield Delegates
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if(textField==_vendertextfield)
    {
       // poptype=4;
    
    _autotable.hidden = NO;
    NSString *substring = [NSString stringWithString:_vendertextfield.text];
    substring = [substring stringByReplacingCharactersInRange:range withString:string];
    [self searchAutocompleteEntriesWithSubstring:substring];
}
    if(textField==_itemnametextfield)
    {
        NSUInteger newLength = [_itemnametextfield.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
    if(textField==_ratetextfield)
    {
        NSUInteger newLength = [_ratetextfield.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_hourstextfield)
    {
        NSUInteger newLength = [_hourstextfield.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    
    if(textField==_codetextfield)
    {
        NSUInteger newLength = [_codetextfield.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
        
    

    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    Validation*val=[[Validation alloc]init];
    if (textField==_ratetextfield) {
        int value2=[val isNumeric:_ratetextfield.text];
        if (value2==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }
    if (textField==_hourstextfield) {
        int value2=[val isNumeric:_hourstextfield.text];
        if (value2==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Duration" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }

    return YES;
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([alertView.message isEqualToString:@"Invalid Rate"]) {
        
        
        _ratetextfield.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Invalid Duration"]) {
        
        
        _hourstextfield.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"Item Name is required"])
    {
        _itemnametextfield.text=@"";
    }
    if ([alertView.message isEqualToString:_soapstring]) {
        
        if (optionidentifier==1) {
            
        _result=@"";
        _itemnametextfield.text=@"";
        _codetextfield.text=@"";
        _hourstextfield.text=@"";
        _vendertextfield.text=@"";
        _ratetextfield.text=@"";
        [_typebtn setTitle:@"Select" forState:UIControlStateNormal];
        [_jobbtn setTitle:@"Select" forState:UIControlStateNormal];
        [_craftbtn setTitle:@"Select" forState:UIControlStateNormal];
        [_craftcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_expirycheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_defaultcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_inhousecheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            _searchbar.text=@"";
            _updatebtn.enabled=YES;
        }
        else if(optionidentifier==2)
        {
            _addreqview.hidden=YES;
             _basicreqtable.userInteractionEnabled=YES;
            _itemnametextfield.text=@"";
            _codetextfield.text=@"";
            _hourstextfield.text=@"";
            _vendertextfield.text=@"";
            _ratetextfield.text=@"";
            [_typebtn setTitle:@"Select" forState:UIControlStateNormal];
            [_jobbtn setTitle:@"Select" forState:UIControlStateNormal];
            [_craftbtn setTitle:@"Select" forState:UIControlStateNormal];
            [_craftcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_expirycheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_defaultcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_inhousecheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];_searchbar.text=@"";
            _updatebtn.enabled=YES;
            _result=@"";
        }
    }

}

- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring {
    
    // Put anything that starts with this substring into the autocompleteUrls array
    // The items in this array is what will show up in the table view
    [_autocompletearray removeAllObjects];
    for(NSString * curString in _venderlistarray) {
        NSRange substringRange = [curString rangeOfString:substring];
        if (substringRange.location == 0) {
            
            [_autocompletearray addObject:curString];
            
        }
    }
    [_autotable reloadData];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-Tableview datasources
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{ if(tableView==_basicreqtable)
{
    return [_allrequirementarray count];
}
//    if(tableView==_autotable)
//    {
//        return [_autocompletearray count];
//    }
    if(tableView==_popOverTableView)
    {
        switch (poptype) {
            case 1:
                return [_joblistarray count];
                break;
            case 2:
                return [_craftlistarray count];
                break;
            case 3:
                return [_typelistarray count];
                break;
            case 4:
                return [_disclosurearray count];
                break;
            case 5:
                return [_brcraftarray count];
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
        if(tableView==_basicreqtable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"custombasicreqcell" owner:self options:nil];
            cell=_reqcell;
            
        }
//         if(tableView==_popOverTableView)
//         {
//             cell.selectionStyle=UITableViewCellSelectionStyleBlue;
//         }
    }
        if(tableView==_popOverTableView)
        {
            cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
            cell.textLabel.font = [UIFont systemFontOfSize:12.0];
            
        Craftreqmtmdl*crftreqmdl=(Craftreqmtmdl *)[_brcraftarray objectAtIndex:indexPath.row];
            switch (poptype) {
                case 1:
                    cell.textLabel.text=[_joblistarray objectAtIndex:indexPath.row];
                    break;
                case 2:
                    cell.textLabel.text=[_craftlistarray objectAtIndex:indexPath.row];
                    break;
                case 3:
                    cell.textLabel.text=[_typelistarray objectAtIndex:indexPath.row];
                    break;
                case 4:
                    cell.textLabel.text=[_disclosurearray objectAtIndex:indexPath.row];
                    break;
                case 5:
                
                    cell.textLabel.text=crftreqmdl.Brdescriptn;
                    break;
                default:
                    break;
            }
           
        }
//    if(tableView==_autotable)
//    {
//        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
//        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
//
//         cell.textLabel.text=[_autocompletearray objectAtIndex:indexPath.row];
//    }
    if (tableView==_basicreqtable)
    {
        basicreqmdl*reqmdl=(basicreqmdl *)[_allrequirementarray objectAtIndex:indexPath.row];
        _itemnamelabel=(UILabel *)[cell viewWithTag:1];
        _itemnamelabel.text=reqmdl.itemname;
        _codelabel=(UILabel *)[cell viewWithTag:2];
        _codelabel.text=reqmdl.code;
        _ratelabel=(UILabel *)[cell viewWithTag:3];
        _ratelabel.text=[NSString stringWithFormat:@"$%@",reqmdl.rate];
        //_ratelabel.text=reqmdl.rate;
        _typelabel=(UILabel *)[cell viewWithTag:4];
        _typelabel.text=reqmdl.typname;
        
        _expirylbl=(UILabel *)[cell viewWithTag:5];
        _defbtn=(UIButton *)[cell viewWithTag:6];
        _inhousebtn=(UIButton *)[cell viewWithTag:7];
        _allcrftbtn=(UIButton *)[cell viewWithTag:8];
        _crftlabel=(UILabel *)[cell viewWithTag:9];
        _crftlabel.text=reqmdl.des;
        
        _expirylbl.text=reqmdl.hrs;
           _venderlabel=(UILabel *)[cell viewWithTag:11];
            if (reqmdl.def==0) {
            [_defbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            
        }
        else if(reqmdl.def==1){
            [_defbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
            
        }
        if (reqmdl.inhouse==0) {
            [_inhousebtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
              _venderlabel.text=reqmdl.vendername;
            
        }
        else if(reqmdl.inhouse==1){
            [_inhousebtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
              //_venderlabel.text=reqmdl.vendername;
            
            
        }
        if (reqmdl.allcraft==0) {
                _cellcraftbtnlbl.enabled=YES;
           // [_allcrftbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_cellcraftbtnlbl setTitle:@"Craft" forState:UIControlStateNormal];
            
        }
        else if(reqmdl.allcraft==1){
            _cellcraftbtnlbl.enabled=NO;
           // [_allcrftbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
             [_cellcraftbtnlbl setTitle:@"All Craft" forState:UIControlStateNormal];
            
            
        }
        
        _joblabel=(UILabel *)[cell viewWithTag:10];
        _joblabel.text=reqmdl.jobname;
        NSLog(@"%@",reqmdl.jobname);
    
      
//        if (reqmdl.inhouse==1) {
//            _popOverTableView.userInteractionEnabled=NO;
//            
//        }
//        else if(reqmdl.inhouse==0)
//        {
//            _popOverTableView.userInteractionEnabled=NO;
//        }


     

        
   
//       butt=[UIButton buttonWithType:UIButtonTypeCustom];
//        [butt setImage:[UIImage imageNamed:@"carat"] forState:UIControlStateNormal];
//        //[butt setImage:[UIImage imageNamed:@"carat-open.png"] forState:UIControlStateSelected];
//        butt.tag=indexPath.row;
//        [butt addTarget:self
//                   action:@selector(showaction:) forControlEvents:UIControlEventTouchUpInside];
////        [butt addTarget:self
////                 action:@selector(noaction:) forControlEvents:UIControlEventTouchUpOutside];
//        //[butt setTitle:@"cellButton" forState:UIControlStateNormal];
//        butt.frame = CGRectMake(120.0, 0.0, 50.0, 40.0);
//        [cell.contentView addSubview:butt];
        
    }
    return cell;
}
//-(void)noaction:(UIButton*)sender
//{
//     self.openviewindex=NSNotFound;
//    _venderlbl.hidden=YES;
//    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ _animatedview
//        .frame =  CGRectMake(200, 10, 0, 0);} completion:nil];
//    
//    _animatedview.hidden=YES;
//
//}
//-(void)showaction:(UIButton*)sender{
//   // [_animatedview removeFromSuperview];
//    _venderlbl.hidden=YES;
//    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ _animatedview
//        .frame =  CGRectMake(150, 10, 0, 0);} completion:nil];
//    
//    _animatedview.hidden=YES;
//    basicreqmdl*reqmdl=(basicreqmdl *)[_allrequirementarray objectAtIndex:sender.tag];
//    
//    button = (UIButton *)sender;
//    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
//    CGPoint center= button.center;
//    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.basicreqtable];
//    NSIndexPath *textFieldIndexPath = [self.basicreqtable indexPathForRowAtPoint:rootViewPoint];
//    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
//    btnindex=textFieldIndexPath.row;
//    
//    //create uiview
//    _animatedview=[[UIView alloc]initWithFrame:CGRectMake(150, 10, 0, 25)];
//    _animatedview.backgroundColor=[UIColor colorWithRed:99.0/255.0f green:184.0/255.0f blue:255.0/255.0f alpha:1.0f];
//    _venderlbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 25)];
//    _venderlbl.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
//    _venderlbl.textColor=[UIColor blackColor];
//    _venderlbl.text=@"Add Vendor";
//    [self.animatedview addSubview:_venderlbl];
//    _venderlbl.hidden=YES;
//    UITapGestureRecognizer *tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toVender)];
//    [self.animatedview addGestureRecognizer:tap];
//    
//    [cell addSubview:_animatedview];
//    
//    NSLog(@"I Clicked a button %d",sender.tag);
//    _animatedview.hidden=NO;
//    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ _animatedview
//        .frame =  CGRectMake(150, 10, 70, 25);} completion:nil];
//    
//    _venderlbl.hidden=NO;
//    if (reqmdl.inhouse==1) {
//        _venderlbl.enabled=NO;
//        _animatedview.userInteractionEnabled=NO;
//        
//    }
//
//    [self showviewWithUserAction:YES];
//}
//
//-(void)showviewWithUserAction:(BOOL)userAction{
//    
//    // Toggle the disclosure button state.
//    
//    butt.selected = !butt.selected;
//    
//    if (userAction) {
//        if (butt.selected) {
//            _animatedview.hidden=NO;
//            [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ _animatedview
//                .frame =  CGRectMake(150, 10, 70, 25);} completion:nil];
//            [self viewopened:btnindex];
//            _venderlbl.hidden=NO;
//            
//            
//            
//        }
//        else{
//            [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ _animatedview
//                .frame =  CGRectMake(150, 10, 70, 25);} completion:nil];
//            [self viewclosed:btnindex];
//            //_venderlbl.hidden=YES;
//            
//        }
//        
//        
//    }
//}
//-(void)viewopened:(NSInteger)viewopened{    
//
//    
//    selectedcell=viewopened;
//    NSInteger previousOpenviewIndex = self.openviewindex;
//    
//    if (previousOpenviewIndex != NSNotFound) {
//////        Section *previousOpenSection=[sectionArray objectAtIndex:previousOpenviewIndex];
//////        previousOpenSection.open=NO;
//        [self showviewWithUserAction:NO];
////        NSInteger countOfRowsToDelete = selectedcell;
////        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
//            _venderlbl.hidden=YES;
//            [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{  _animatedview
//                .frame =  CGRectMake(100, 10, 0, 0);} completion:nil];
//            
//            _animatedview.hidden=YES;
//            
//            
//       //}
//        
//        
//    }
//    
//    self.openviewindex=viewopened;
//    
//    
// 
//    
//    
//
//}
//-(void)viewclosed:(NSInteger)viewclosed
//{
//    
//    viewclosed=btnindex;
//    _animatedview.hidden=YES;
//    self.openviewindex = NSNotFound;
//    
//    
//}




//-(void)aMethod:(UIButton*)sender
//{
//    _venderlbl.hidden=YES;
//    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ _animatedview
//        .frame =  CGRectMake(200, 5, 0, 0);} completion:nil];
//    
//    _animatedview.hidden=YES;
//    basicreqmdl*reqmdl=(basicreqmdl *)[_allrequirementarray objectAtIndex:sender.tag];
//    
//    button = (UIButton *)sender;
//    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
//    CGPoint center= button.center;
//    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.basicreqtable];
//    NSIndexPath *textFieldIndexPath = [self.basicreqtable indexPathForRowAtPoint:rootViewPoint];
//    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
//    btnindex=textFieldIndexPath.row;
//
//    //create uiview
//    _animatedview=[[UIView alloc]initWithFrame:CGRectMake(200, 5, 0, 25)];
//    _animatedview.backgroundColor=[UIColor colorWithRed:110.0/255.0f green:123.0/255.0f blue:139.0/255.0f alpha:1.0f];
//    _venderlbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 25)];
//    _venderlbl.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
//    _venderlbl.textColor=[UIColor blackColor];
//    _venderlbl.text=@"Process Applicant";
//    [self.animatedview addSubview:_venderlbl];
//    _venderlbl.hidden=YES;
//    UITapGestureRecognizer *tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toVender)];
//    [self.animatedview addGestureRecognizer:tap];
//    
//    [cell addSubview:_animatedview];
//
//    NSLog(@"I Clicked a button %d",sender.tag);
//    _animatedview.hidden=NO;
//    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ _animatedview
//        .frame =  CGRectMake(200, 5, 70, 25);} completion:nil];
//    
//    _venderlbl.hidden=NO;
//    if (reqmdl.inhouse==1) {
//        _venderlbl.enabled=NO;
//        _animatedview.userInteractionEnabled=NO;
//    
//    }
//
//    }
//-(void)toVender
//{
//
//    basicreqmdl*reqmdl=(basicreqmdl *)[_allrequirementarray objectAtIndex:btnindex];
//    NSLog(@"%d",reqmdl.eid);
//    if(!_venderVCtrl)
//    {
//        _venderVCtrl=[[venderViewController alloc]initWithNibName:@"venderViewController" bundle:nil];
//    }
//    _venderVCtrl.delegate=self;
//    _venderVCtrl.itemid=reqmdl.eid;
//    _venderVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
//    [self presentViewController:_venderVCtrl animated:YES completion:NULL];
//}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==_popOverTableView) {
        basicreqmdl*reqmdl=(basicreqmdl *)[_allrequirementarray objectAtIndex:btnindex];

        switch (poptype) {
            case 1:
                [_jobbtn setTitle:[_joblistarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
               
                
                break;
            case 2:
                [_craftbtn setTitle:[_craftlistarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                
                
                break;
            case 3:
                [_typebtn setTitle:[_typelistarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                
                
                break;
            case 4:
                NSLog(@"%dre",reqmdl.inhouse);
                if (reqmdl.inhouse==1) {
                    _popOverTableView.userInteractionEnabled=NO;
                   // [_popOverTableView setBackgroundColor:[UIColor grayColor]];
                   // cell.contentView.backgroundColor = [UIColor grayColor]
                   
                    
                }
                else if(reqmdl.inhouse==0)
                {
                    _popOverTableView.userInteractionEnabled=YES;
                        //[_popOverTableView setBackgroundColor:[UIColor colorWithRed:173.0/255.0f green:216/255.0f blue:230/255.0f alpha:1.0f]];
                    
                 _searchbar.text=@"";

                                    NSLog(@"%d",reqmdl.eid);
                
                        _venderVCtrl=[[venderViewController alloc]initWithNibName:@"venderViewController" bundle:nil];
                
                    _venderVCtrl.delegate=self;
                    _venderVCtrl.itemid=reqmdl.eid;
                    _venderVCtrl.moduleid=_moduleid;
                   _venderVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
                    [self dismissViewControllerAnimated:YES completion:^{   [self presentViewController:_venderVCtrl
                                                                                               animated:YES completion:NULL];
                        
                    }];

                }
                
                break;
            default:
                break;
        }
        
        
    }
    if (tableView==_autotable) {

        _vendertextfield.text=[_autocompletearray objectAtIndex:indexPath.row];
                        _autotable.hidden = YES;
    }
    [self.popOverController dismissPopoverAnimated:YES];
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_basicreqtable)
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
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [self UserLogmaindelete];
        path=indexPath.row;
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        
        
        if (rightsmodel.DeleteModule==0) {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to delete a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        else
        {

        [self DeleteRequirements];
        [_allrequirementarray removeObject:indexPath];
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
-(void)deleteaction
{
        if (self.editing) {
        [super setEditing:NO animated:NO];
        [_basicreqtable setEditing:NO animated:NO];
        [_basicreqtable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_basicreqtable setEditing:YES animated:YES];
        [_basicreqtable reloadData];
        
    }


}

#pragma mark-IBActions

-(IBAction)updateaction:(id)sender
{
   
    _updatebtn.enabled=NO;
    _result=@"";
    x=1;
    _moduleid=23;
    
    [self UserRightsforparticularmoduleselect];

}
-(void)updatereqaction
{
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
        
        if(optionidentifier==1)
        {
            Validation *val=[[Validation alloc]init];
            int value1=[val isBlank:[_itemnametextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
            if(value1==0)
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Item Name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                 _updatebtn.enabled=YES;
            }
            else if ([_codetextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Code is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                 _updatebtn.enabled=YES;
                
            }
            
            
            else if ([_typebtn.titleLabel.text isEqualToString:@"Select"]||[_typebtn.titleLabel.text isEqualToString:@""])
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Type is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                 _updatebtn.enabled=YES;
                
            }
            
            else
            {
                [self UserLogmaininsert];
            
                [self insertrequirements];
            }
            
            
            
        }
        else if(optionidentifier==2)
        {
            Validation *val=[[Validation alloc]init];
            int value1=[val isBlank:[_itemnametextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
            if(value1==0)
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Item Name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                 _updatebtn.enabled=YES;
            }
            else if ([_codetextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Code is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                 _updatebtn.enabled=YES;
                
            }
            
            else if ([_typebtn.titleLabel.text isEqualToString:@"Select"]||[_typebtn.titleLabel.text isEqualToString:@""])
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Type is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                 _updatebtn.enabled=YES;
                
            }
            
            
            else{
                 [self UserLogmainupdate];
                [self UpdateRequirements];
                
            }
            
            
        }
    }

}

-(IBAction)closetheBASicreqview:(id)sender
{ _addreqview.hidden=YES;
    _updatebtn.enabled=YES;
    _result=@"";
     _basicreqtable.userInteractionEnabled=YES;
     self.openviewindex=NSNotFound;
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)addbasicreq:(id)sender
{
    _updatebtn.enabled=YES;
     _basicreqtable.userInteractionEnabled=NO;
    optionidentifier=1;
     self.openviewindex=NSNotFound;
    [self SelectAllCourseVendor];
    _addreqview.hidden=NO;
    _cancelbtn.enabled=YES;
    _cancelbtn.titleLabel.textColor=[UIColor colorWithRed:70.0/255.0f green:130.0/255.0f blue:180.0/255.0f alpha:1.0f];
    _navItem.title=@"Create";
    inhouse=0;
    _craftview.hidden=NO;
    _seperatorview.hidden=NO;
    expiry=0;
    craft=0;
    defaultcheck=0;
    [_typebtn setTitle:@"Select" forState:UIControlStateNormal];
     [_craftbtn setTitle:@"Select" forState:UIControlStateNormal];
    _resultdisplaylabel.hidden=YES;
}
-(IBAction)editBasicreq:(id)sender
{     
     _basicreqtable.userInteractionEnabled=NO;
    optionidentifier=2;
    _addreqview.hidden=NO;
    _navItem.title=@"Edit";
    _updatebtn.enabled=YES;
    _cancelbtn.enabled=NO;
    [_cancelbtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
     self.openviewindex=NSNotFound;
    _resultdisplaylabel.hidden=YES;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.basicreqtable];
    NSIndexPath *textFieldIndexPath = [self.basicreqtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    basicreqmdl*reqmdl=(basicreqmdl *)[_allrequirementarray objectAtIndex:textFieldIndexPath.row];
    
    _itemnametextfield.text=reqmdl.itemname;
    
    _ratetextfield.text=[NSString stringWithFormat:@"$%@",reqmdl.rate];
    _codetextfield.text=reqmdl.code;
    _hourstextfield.text=reqmdl.hrs;
    _vendertextfield.text=reqmdl.vendername;
    
//    if ([reqmdl.vendername stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length!=0) {
//        
//        _inhousecheckbtn.enabled=NO;
//        
////        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Vendor Exist" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
////        [alert show];
//    }
//    else{
//        _inhousecheckbtn.enabled=YES;
//        
//    }

      [_typebtn setTitle:reqmdl.typname forState:UIControlStateNormal];
    [_jobbtn setTitle:reqmdl.jobname forState:UIControlStateNormal];
    [_craftbtn setTitle:reqmdl.des forState:UIControlStateNormal];
    if (reqmdl.haveexpirydate==0) {
        [_expirycheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        expiry=0;
        
    }
    else if(reqmdl.haveexpirydate==1){
        [_expirycheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        expiry=1;
    }
    if (reqmdl.def==0) {
        [_defaultcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        defaultcheck=0;
        _craftview.hidden=NO;
        _seperatorview.hidden=NO;
    }
    else if(reqmdl.def==1){
        [_defaultcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        [_craftcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        craft=0;
        defaultcheck=1;
        _craftview.hidden=YES;
        _seperatorview.hidden=YES;
    }
    if (reqmdl.inhouse==0) {
        [_inhousecheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        inhouse=0;
    }
    else if(reqmdl.inhouse==1){
        [_inhousecheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        inhouse=1;
    }
    if (reqmdl.allcraft==0) {
        [_craftcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        craft=0;
    }
    else if(reqmdl.allcraft==1){
        [_craftcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        craft=1;
    }
    




}
-(IBAction)closeeditBasicreqview:(id)sender
{[self SelectAllRequirements];
    self.openviewindex=NSNotFound;
     _basicreqtable.userInteractionEnabled=YES;
    _resultdisplaylabel.hidden=YES;
    _addreqview.hidden=YES;
    _itemnametextfield.text=@"";
    _updatebtn.enabled=YES;
    _codetextfield.text=@"";
    _hourstextfield.text=@"";
    _vendertextfield.text=@"";
    _ratetextfield.text=@"";
    [_typebtn setTitle:@"" forState:UIControlStateNormal];
    [_jobbtn setTitle:@"" forState:UIControlStateNormal];
    [_craftbtn setTitle:@"" forState:UIControlStateNormal];
    [_craftcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_expirycheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_defaultcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_inhousecheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
}
-(IBAction)expirycheckaction:(id)sender
{    expirystring=@"expiry";
    if (expiry==0) {
        [_expirycheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        expiry=1;
        
    }
    
    else{
        [_expirycheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        expiry=0;
        
    }

}
-(IBAction)defaultcheckaction:(id)sender
{    defaultstring=@"default";
    checkstring=@"clicked";
    if (defaultcheck==0) {
        [_defaultcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
            [_craftcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        defaultcheck=1;
           craft=1;
        _craftview.hidden=YES;
        _seperatorview.hidden=YES;
        
    }
    
    else{
        [_defaultcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        defaultcheck=0;
         _craftview.hidden=NO;
        _seperatorview.hidden=NO;
        
    }

}
-(IBAction)inhousecheckaction:(id)sender
{    inhousestring=@"inhouse";
    if (inhouse==0) {
        [_inhousecheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        inhouse=1;
        
    }
    
    else{
        [_inhousecheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        inhouse=0;
        
    }

}
-(IBAction)deleterequirements:(id)sender
{
    x=2;
    _moduleid=23;
    [self UserRightsforparticularmoduleselect];
    
}

-(IBAction)craftcheckaction:(id)sender
{
    checkstring=@"clicked";
    if (craft==0) {
        [_craftcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _craftbtn.enabled=NO;
        craft=1;
        
    }
    
    else{
        [_craftcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        _craftbtn.enabled=YES;
        craft=0;
        
    }

}
-(IBAction)selectreqvender:(id)sender
{
    button = (UIButton *)sender;
    //UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.basicreqtable];
    NSIndexPath *textFieldIndexPath = [self.basicreqtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;

    _animatedview.hidden=NO;
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ _animatedview
        .frame =  CGRectMake(150, 5, 100, 25);} completion:nil];
    
    _venderlbl.hidden=NO;
    
}
- (IBAction)addcancelbtn:(id)sender {
    _itemnametextfield.text=@"";
    
    _codetextfield.text=@"";
    _hourstextfield.text=@"";
    _vendertextfield.text=@"";
    _ratetextfield.text=@"";
    [_typebtn setTitle:@"" forState:UIControlStateNormal];
    [_jobbtn setTitle:@"" forState:UIControlStateNormal];
    [_craftbtn setTitle:@"" forState:UIControlStateNormal];
    [_craftcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_expirycheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_defaultcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_inhousecheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
     _craftview.hidden=NO;
    _seperatorview.hidden=NO;
}
- (IBAction)cellcraftbtn:(id)sender {
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.basicreqtable];
    NSIndexPath *textFieldIndexPath = [self.basicreqtable indexPathForRowAtPoint:rootViewPoint];
    
    basicreqmdl*reqmdl=(basicreqmdl *)[_allrequirementarray objectAtIndex:textFieldIndexPath.row];
    
    self.craftVCtrl=[[CraftViewController alloc]initWithNibName:@"CraftViewController" bundle:nil];
    
    
    self.craftVCtrl.modalPresentationStyle = UIModalPresentationFormSheet;
    _craftVCtrl.reqid=reqmdl.eid;
    
    [self presentViewController:self.craftVCtrl
                       animated:YES completion:NULL];
    
    
    
    
    //      poptype=4;
    //    button = (UIButton *)sender;
    //    CGPoint center= button.center;
    //    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.basicreqtable];
    //    NSIndexPath *textFieldIndexPath = [self.basicreqtable indexPathForRowAtPoint:rootViewPoint];
    //    UITableViewCell *cell = [self.basicreqtable cellForRowAtIndexPath:textFieldIndexPath];
    //
    //
    //    UIViewController* popoverContent = [[UIViewController alloc]
    //                                        init];
    //    UIView* popoverView = [[UIView alloc]
    //                           initWithFrame:CGRectMake(0, 0, 150, 200)];
    //
    //    popoverView.backgroundColor = [UIColor lightTextColor];
    //    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 150, 200)];
    //    _popOverTableView.delegate=(id)self;
    //    _popOverTableView.dataSource=(id)self;
    //    _popOverTableView.rowHeight= 32;
    //
    //
    //
    //
    //    [popoverView addSubview:_popOverTableView];
    //    popoverContent.view = popoverView;
    //
    //    //resize the popover view shown
    //    //in the current view to the view's size
    //    popoverContent.contentSizeForViewInPopover = CGSizeMake(150, 200);
    //
    //    //create a popover controller
    //    self.popOverController = [[UIPopoverController alloc]
    //                              initWithContentViewController:popoverContent];
    //    [self.popOverController presentPopoverFromRect:_cellcraftbtnlbl.frame
    //                                            inView:cell
    //                          permittedArrowDirections:UIPopoverArrowDirectionUp
    //                                          animated:YES];
    
}

- (IBAction)allcraftbtn:(id)sender {
    allcraftstrg=@"Allcrafts";
    if (allcraft==0) {
        [_allcraftbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _craftbtn.enabled=NO;
        allcraft=1;
        
    }
    
    else{
        [_allcraftbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        allcraft=0;
        _craftbtn.enabled=YES;
        
    }
    
    
    
}
-(IBAction)toreqtype:(id)sender
{
    _moduleid=20;
    _result=@"";
    [self UserRightsforparticularmoduleselect];
}

#pragma mark-popover
-(IBAction)selectjobs:(id)sender
{   //[self SelectAllJobSites];
    poptype=1;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 150, 200)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 150, 200)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
   
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(150, 200);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popOverController.popoverContentSize=CGSizeMake(150.0f, 200.0f);
    self.popOverController=_popOverController;
    [self.popOverController presentPopoverFromRect:_jobbtn.frame
                                            inView:self.addreqview
                          permittedArrowDirections:UIPopoverArrowDirectionLeft
                                          animated:YES];
    
    
}
-(IBAction)selectcraft:(id)sender
{  // [self SelectAllCraft];
    poptype=2;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 150, 200)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 150, 200)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
     _popOverTableView.allowsMultipleSelection=YES;
 
   
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(150, 200);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popOverController.popoverContentSize=CGSizeMake(150.0f, 200.0f);
    self.popOverController=_popOverController;
    [self.popOverController presentPopoverFromRect:_craftbtn.frame
                                            inView:self.craftview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}
-(IBAction)selecttype:(id)sender
{
    [self SelectAllItemType];
    poptype=3;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 211, 275)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 211, 275)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
   
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(211, 275);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popOverController.popoverContentSize=CGSizeMake(211.0f, 275.0f);
    self.popOverController=_popOverController;
    [self.popOverController presentPopoverFromRect:_typebtn.frame
                                            inView:self.addreqview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    

}
-(IBAction)selectdisclosure:(id)sender
{
   
    
    button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.basicreqtable];
    NSIndexPath *textFieldIndexPath = [self.basicreqtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;

    basicreqmdl*reqmdl=(basicreqmdl *)[_allrequirementarray objectAtIndex:btnindex];
    if (reqmdl.inhouse==1) {
       
        
        
    }
    else if(reqmdl.inhouse==0)
    {
        
    

    poptype=4;
    UIViewController* popoverContent = [[UIViewController alloc]init];
    UIView* popoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 130, 43)];
    // popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 130, 43)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 40;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //_popovertableview.separatorColor=[UIColor blackColor];
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    popoverContent.contentSizeForViewInPopover = CGSizeMake(130, 43);
    
        
    //UITableView *table = (UITableView *)[cell superview];
    self.popOverController = [[UIPopoverController alloc]initWithContentViewController:popoverContent];
        self.popOverController.popoverContentSize=CGSizeMake(130.0f, 43.0f);
        self.popOverController=_popOverController;
    [self.popOverController presentPopoverFromRect:_vendorbtn.frame inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
   
    //[_popovertableview reloadData];
    }
}



#pragma mark- WebService
-(void)SelectAllRequirements
{
    recordresults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllRequirements xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllRequirements>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
     //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllRequirements" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)DeleteRequirements
{   webtype=2;
    recordresults = FALSE;
    NSString *soapMessage;
    basicreqmdl*reqmdl=(basicreqmdl *)[_allrequirementarray objectAtIndex:path];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DeleteRequirements xmlns=\"http://ios.kontract360.com/\">\n"
                   "<entryid>%d</entryid>\n"
                   "</DeleteRequirements>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",reqmdl.eid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
  //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/DeleteRequirements" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SelectAllCourseVendor{
    recordresults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllCourseVendor xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllCourseVendor>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
  //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllCourseVendor" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SelectAllItemType{
    webtype=3;
    recordresults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllItemType xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllItemType>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllItemType" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllCraft{
    recordresults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllCraft xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllCraft>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllCraft" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SelectAllJobSites{
    recordresults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllJobSites xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllJobSites>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
   //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllJobSites" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)insertrequirements
{
    webtype=1;
    NSInteger house;
    NSInteger def;
    NSInteger exp;
    NSInteger allcraft;
    if (expiry==0) {
        exp=0;
    }
    else{
        exp=1;
        
    }
    if (defaultcheck==0) {
            def=0;
        }
        else{
            def=1;
            
        }
    NSString *craftid;
    if (craft==0) {
        allcraft=0;
        craftid=[_craftlistdictionary objectForKey:_craftbtn.titleLabel.text];
    }
    else{
        allcraft=1;
         craftid=@"0";
        
    }
    if (inhouse==0) {
        house=0;
    }
    else{
        house=1;
        
    }


    NSString *typid=[_typelistdictionary objectForKey:_typebtn.titleLabel.text];
    NSString*ratevl=   [_ratetextfield.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    
    recordresults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertRequirements xmlns=\"http://ios.kontract360.com/\">\n"
                   "<itemname>%@</itemname>\n"
                   "<code>%@</code>\n"
                   "<rate>%f</rate>\n"
                   "<haveexpiry>%d</haveexpiry>\n"
                   "<type>%d</type>\n"
                   "<default1>%d</default1>\n"
                   "<craft>%d</craft>\n"
                   "<allcraft>%d</allcraft>\n"
                   "<hrs>%f</hrs>\n"
                   "<inhouse>%d</inhouse>\n"
                   "</InsertRequirements>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_itemnametextfield.text,_codetextfield.text,[ratevl doubleValue],exp,[typid integerValue],def,[craftid integerValue],allcraft,[_hourstextfield.text doubleValue],house];
    NSLog(@"soapmsg%@",soapMessage);
    
    
   //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/InsertRequirements" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SearchRequirements{
    //webtype=2;
    recordresults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SearchRequirements xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</SearchRequirements>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
  //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SearchRequirements" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)UpdateRequirements
{
    webtype=1;
   
    NSInteger house;
    NSInteger def;
    NSInteger exp;
    NSInteger allcraft;
    if (expiry==0) {
        exp=0;
    }
    else{
        exp=1;
        
    }
    if (defaultcheck==0) {
        def=0;
    }
    else{
        def=1;
        
    }
     basicreqmdl*rmdl=(basicreqmdl *)[_allrequirementarray objectAtIndex:btnindex];
     NSString *craftid;
    if([checkstring isEqualToString:@"clicked"])
    {
        if (craft==0) {
        allcraft=0;
        craftid=[_craftlistdictionary objectForKey:_craftbtn.titleLabel.text];
        }
        else{
        allcraft=1;
        craftid=@"0";
        
        }
        checkstring=@"";
    }
    
    else
    {
        allcraft=rmdl.allcraft;
        if (allcraft==0) {
        craftid=[_craftlistdictionary objectForKey:_craftbtn.titleLabel.text];
            NSLog(@"%@",_craftbtn.titleLabel.text);
        }
        else
        {
           
            craftid=@"0";
            
        }

    }
    if (inhouse==0) {
        house=0;
    }
    else{
        house=1;
        
    }
    
    
    NSString *typid=[_typelistdictionary objectForKey:_typebtn.titleLabel.text];
    //NSString *jobid=[_joblistdictionary objectForKey:_jobbtn.titleLabel.text];
   
//    if(allcraft==0)
//    {
//        craftid=[_craftlistdictionary objectForKey:_craftbtn.titleLabel.text];
//       
//        
//    }
//    else if(allcraft==1)
//    {
//        craftid=@"0";
//        
//
//        
//    }
    
    NSString*ratevl=   [_ratetextfield.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    
    recordresults = FALSE;
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateRequirements xmlns=\"http://ios.kontract360.com/\">\n"
                   "<entryid>%d</entryid>\n"
                   "<itemname>%@</itemname>\n"
                   "<code>%@</code>\n"
                   "<rate>%f</rate>\n"
                   "<haveexpiry>%d</haveexpiry>\n"
                   "<type>%d</type>\n"
                   "<default1>%d</default1>\n"
                   "<craft>%d</craft>\n"
                   "<allcraft>%d</allcraft>\n"
                   "<hrs>%f</hrs>\n"
                   "<inhouse>%d</inhouse>\n"
                   "</UpdateRequirements>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",rmdl.eid,_itemnametextfield.text,_codetextfield.text,[ratevl doubleValue],exp,[typid integerValue],def,[craftid integerValue],allcraft,[_hourstextfield.text doubleValue],house];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateRequirements" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)UserRightsforparticularmoduleselect{
    webtype=5;
    recordresults = FALSE;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    userid = [defaults objectForKey:@"Userid"];
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserRightsforparticularmoduleselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "<ModuleId>%d</ModuleId>\n"
                   "</UserRightsforparticularmoduleselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[userid integerValue],_moduleid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserRightsforparticularmoduleselect" forHTTPHeaderField:@"Soapaction"];
    
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
    
    recordresults = FALSE;
    
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],_moduleid,@"Create",@"iOS",extnalip,intrnalip,Udid,0];
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
    
    recordresults = FALSE;
    
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],_moduleid,@"Edit",@"iOS",extnalip,intrnalip,Udid,0];
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
    
    recordresults = FALSE;
    
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
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],_moduleid,@"Delete",@"iOS",extnalip,intrnalip,Udid,0];
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
        if (webtype==3) {
        [_popOverTableView reloadData];
        webtype=6;
    }
   
    if(webtype==5)
    {
        if ([_result isEqualToString:@"Not yet set"]) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Your rights are not yet set" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
        
        else
        {
            
            if (_moduleid==20) {
                Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
                if (rightsmodel.ViewModule==1) {
                    
                    _searchbar.text=@"";
                    // if (!self.wrktypeVCtrl) {
                    self.typctl=[[TypeViewController alloc]initWithNibName:@"TypeViewController" bundle:nil];
                    //  }
                    _typctl.modalPresentationStyle=UIModalPresentationFormSheet;
                    _typctl.userrightsarray=_userrightsarray;
                    _typctl.moduleid=_moduleid;
                    [_typebtn setTitle:@"Select" forState:UIControlStateNormal];
                    [self presentViewController:_typctl animated:YES completion:nil];
                    webtype=3;
                    
                }
                else
                {
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                }
                
            }
            if (_moduleid==23) {
                if (x==1) {
                    [self updatereqaction];
                    webtype=1;
                    
                }
                else
                {
                    [self deleteaction];
                    webtype=2;
                }
                
            }
            

        }
        
    }
    
    [_basicreqtable reloadData];
    [_popOverTableView reloadData];


}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{

    if([elementName isEqualToString:@"SelectAllItemTypeResult"])
    {
        _typelistarray=[[NSMutableArray alloc]init];
        _typelistdictionary=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"entry_id"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"itemtypename"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"SelectAllCraftResult"])
    {
        _craftlistarray=[[NSMutableArray alloc]init];
        _craftlistdictionary=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"itemcode"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }

    if([elementName isEqualToString:@"Description"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"SelectAllJobSitesResponse"])
    {
        _joblistarray=[[NSMutableArray alloc]init];
        _joblistdictionary=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"Id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"JobSiteName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"Bidid"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"JobNumber"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"StartDate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"EndDate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"Status"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"LeadId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }





    if([elementName isEqualToString:@"SelectAllCourseVendorResult"])
    {
        _venderlistarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"vendername"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"SelectAllRequirementsResult"])
    {
        _allrequirementarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"ReqEntryId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"ItemName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"code"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"rate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"HaveExpiryDate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"ItemTypeName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"type"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }

    if([elementName isEqualToString:@"craft"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    
       if([elementName isEqualToString:@"craftname"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }

    if([elementName isEqualToString:@"allcraft"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"hrs"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"inhouse"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"VendorName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"SearchRequirementsResponse"])
    {
        _allrequirementarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"UpdateRequirementsResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"result"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }

    if([elementName isEqualToString:@"InsertRequirementsResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"UserRightsforparticularmoduleselectResponse"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    //    if([elementName isEqualToString:@"result"])
    //    {
    //
    //
    //        if(!_soapResults)
    //        {
    //            _soapResults = [[NSMutableString alloc] init];
    //        }
    //        recordresults = TRUE;
    //    }
    
    if([elementName isEqualToString:@"EntryId"])
    {
        _userrightsarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"UserId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"ModuleId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"ViewModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"EditModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"DeleteModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"PrintModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    
    

   



}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordresults )
        
	{
        
        
		[_soapResults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
   
    if([elementName isEqualToString:@"entry_id"])
    {
        
        recordresults = FALSE;
         _typestring=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"itemtypename"])
    {
        
        recordresults = FALSE;
        [_typelistarray addObject:_soapResults];
         [_typelistdictionary setObject:_typestring forKey:_soapResults];
       
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"id"])
    {
        
        recordresults = FALSE;
        _craftstring=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"itemcode"])
    {
        
        recordresults = FALSE;
        //[_craftlistarray addObject:_soapResults];
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        recordresults = FALSE;
        [_craftlistarray addObject:_soapResults];
         [_craftlistdictionary setObject:_craftstring forKey:_soapResults];
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        recordresults = FALSE;
        _jobstring=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobSiteName"])
    {
        
        recordresults = FALSE;
        
       
        [_joblistarray addObject:_soapResults];
        [_joblistdictionary setObject:_jobstring forKey:_soapResults];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Bidid"])
    {
        recordresults=FALSE;
        
        
        
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"JobNumber"])
    {
        recordresults=FALSE;
        
        
        
        _soapResults = nil;
        
        
    }

    if([elementName isEqualToString:@"StartDate"])
    {
        recordresults=FALSE;
        
        
        
        _soapResults = nil;
        
        
    }

    if([elementName isEqualToString:@"EndDate"])
    {
        recordresults=FALSE;
        
        
        
        _soapResults = nil;
        
        
    }

    if([elementName isEqualToString:@"Status"])
    {
        recordresults=FALSE;
        
        
        
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"LeadId"])
    {
        recordresults=FALSE;
        
        
        
        _soapResults = nil;
        
        
    }



    if([elementName isEqualToString:@"vendername"])
    {
        
        recordresults = FALSE;
        [_venderlistarray addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ReqEntryId"])
    {
        recordresults=FALSE;
        
        _basicmdl=[[basicreqmdl alloc]init];
        _basicmdl.eid=[_soapResults integerValue];
        _soapResults = nil;

        
    }
    if([elementName isEqualToString:@"ItemName"])
    {
        recordresults=FALSE;
        
        
        _basicmdl.itemname=_soapResults;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"code"])
    {
        recordresults=FALSE;
        
        
        _basicmdl.code=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"rate"])
    {
        recordresults=FALSE;
        
        
        _basicmdl.rate=_soapResults;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"HaveExpiryDate"])
    {
        recordresults=FALSE;
        
        
        if ([_soapResults isEqualToString:@"false"]) {
            _basicmdl.haveexpirydate=0;
            expiry=0;
            
        }
        else{
            _basicmdl.haveexpirydate=1;
            expiry=1;
        }
        
        _soapResults = nil;

        
        
    }
        if([elementName isEqualToString:@"type"])
    {
        recordresults=FALSE;
        
        
        _basicmdl.type=[_soapResults integerValue];
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"ItemTypeName"])
    {
        recordresults=FALSE;
        
        
        _basicmdl.typname=_soapResults;
        _soapResults = nil;
        
        
    }

    if([elementName isEqualToString:@"craft"])
    {
        recordresults=FALSE;
        
        
        if ([_soapResults isEqualToString:@"false"]) {
            _basicmdl.def=0;
            defaultcheck=0;
                        
        }
        else{
            _basicmdl.def=1;
            defaultcheck=1;
        }
        _soapResults = nil;
        
        
    }
//    if([elementName isEqualToString:@"jobsite"])
//    {
//        recordresults=FALSE;
//        
//        
//        _basicmdl.jobsite=[_soapResults integerValue];
//        _soapResults = nil;
//        
//        
//    }
//    if([elementName isEqualToString:@"jobsitename"])
//    {
//        recordresults=FALSE;
//        
//        
//        _basicmdl.jobname=_soapResults;
//        _soapResults = nil;
//        
//        
//    }

//    if([elementName isEqualToString:@"craft"])
//    {
//        recordresults=FALSE;
//        
//        
//        _basicmdl.craft=[_soapResults integerValue];
//        _soapResults = nil;
//        
//        
//    }
    if([elementName isEqualToString:@"craftname"])
    {
        recordresults=FALSE;
        
        if([_soapResults isEqualToString:@"No Craft"])
        {
        _basicmdl.des=@"";
        }else
        {
            _basicmdl.des=_soapResults;
        }
        _soapResults = nil;
        
        
    }

    if([elementName isEqualToString:@"allcraft"])
    {
        recordresults=FALSE;
        
        
        if ([_soapResults isEqualToString:@"false"]) {
            _basicmdl.allcraft=0;
            craft=0;
            
        }
        else{
            _basicmdl.allcraft=1;
            craft=1;
        }

        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"hrs"])
    {
        recordresults=FALSE;
        
        
        _basicmdl.hrs=_soapResults;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"inhouse"])
    {
        recordresults=FALSE;
        
        
        if ([_soapResults isEqualToString:@"false"]) {
            _basicmdl.inhouse=0;
            inhouse=0;
            
        }
        else{
            _basicmdl.inhouse=1;
            inhouse=1;
        }
 [_allrequirementarray addObject:_basicmdl];
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"VendorName"])
    {
        recordresults=FALSE;
        if([_soapResults isEqualToString:@"No Vendor"])
        {
            _basicmdl.vendername=@"";
        }
        else
        {
        
        _basicmdl.vendername=_soapResults;
        }
       
        _soapResults = nil;
        
        
    }


    if([elementName isEqualToString:@"result"])
    {
        recordresults = FALSE;
        if (webtype==1) {
            
            _soapstring=_soapResults;
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
            [self SelectAllRequirements];
            _searchbar.text=@"";
        }
        if(webtype==2)
        {
            
            if ([_soapResults isEqualToString:@"Already In  Use"]) {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];

            }
            [self SelectAllRequirements];
            _searchbar.text=@"";
            
        }

        else if(webtype==5)
        {
            _result=@"Not yet set";
        }
       
        _soapResults = nil;
        
    }

    if([elementName isEqualToString:@"BREntryId"])
    {
        _craftmdl=[[Craftreqmtmdl alloc]init];
        
        recordresults=FALSE;
      
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"BRRequirementId"])
    {
        
        recordresults=FALSE;
        _craftmdl.BRreqid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"BRValue"])
    {
        
        recordresults=FALSE;
          _craftmdl.BRreqid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"BRDescription"])
    {
        
        recordresults=FALSE;
          _craftmdl.Brdescriptn=_soapResults;
        [_brcraftarray addObject:_craftmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryId"])
    {
        
        
        recordresults = FALSE;
        _rights=[[Rightscheck alloc]init];
        _rights.entryid=[_soapResults integerValue];
        
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"UserId"])
    {
        
        
        recordresults = FALSE;
        
        _rights.userid=[_soapResults integerValue];
        
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"ModuleId"])
    {
        
        
        recordresults = FALSE;
        
        _rights.moduleid=[_soapResults integerValue];
        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"ViewModule"])
    {
        
        recordresults = FALSE;
        
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.ViewModule=1;
            
            
        }
        else{
            _rights.ViewModule=0;
            
        }
        
        
        
        _soapResults=nil;
        
        
    }
    if([elementName isEqualToString:@"EditModule"])
    {
        recordresults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.EditModule=1;
            
            
        }
        else{
            _rights.EditModule=0;
            
        }
        _soapResults=nil;
        
        
    }
    if([elementName isEqualToString:@"DeleteModule"])
    {
        recordresults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.DeleteModule=1;
            
            
        }
        else{
            _rights.DeleteModule=0;
            
        }
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"PrintModule"])
    {
        recordresults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.PrintModule=1;
            
            
        }
        else{
            _rights.PrintModule=0;
            
        }
        
        
        
        [_userrightsarray addObject:_rights];
        _soapResults=nil;
        
    }
    

   
}


#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    [self SearchRequirements];
    [searchBar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self SelectAllRequirements];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_searchbar.text length]==0) {
        
        [self SelectAllRequirements];
        // [searchBar resignFirstResponder];
        
        
    }
    //[searchBar resignFirstResponder];
    
    
}



@end
