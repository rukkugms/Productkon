//
//  TileViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "TileViewController.h"

@interface TileViewController ()

@end

@implementation TileViewController

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
   
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(companyPage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.companyinfoview addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(branchpage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.Documentsview addGestureRecognizer:doubleTap1];
//    UITapGestureRecognizer *doubleTap2 = [[UITapGestureRecognizer alloc]
//                                          initWithTarget:self
//                                          action:@selector(servicesPage)];
//    doubleTap2.numberOfTapsRequired=1;
//    doubleTap2.delegate=(id)self;
//    [self.servicesview addGestureRecognizer:doubleTap2];
    
    
    UITapGestureRecognizer *doubleTap3 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(foldersPage)];
    doubleTap3.numberOfTapsRequired=1;
    doubleTap3.delegate=(id)self;
    [self.foldersview addGestureRecognizer:doubleTap3];
    
    UITapGestureRecognizer *doubleTap4 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(usersPage)];
    doubleTap4.numberOfTapsRequired=1;
    doubleTap4.delegate=(id)self;
    [self.usersview addGestureRecognizer:doubleTap4];
    
    UITapGestureRecognizer *doubleTap5 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(workProcedurePage)];
    doubleTap5.numberOfTapsRequired=1;
    doubleTap5.delegate=(id)self;
    [self.workprocedureview addGestureRecognizer:doubleTap5];

//    UITapGestureRecognizer *doubleTap6 = [[UITapGestureRecognizer alloc]
//                                          initWithTarget:self
//                                          action:@selector(workphasePage)];
//    doubleTap6.numberOfTapsRequired=1;
//    doubleTap6.delegate=(id)self;
//    [self.workphaseview addGestureRecognizer:doubleTap6];
    
    UITapGestureRecognizer *doubleTap7= [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(jobsitereqPage)];
    doubleTap7.numberOfTapsRequired=1;
    doubleTap7.delegate=(id)self;
    [self.jobsitereqview addGestureRecognizer:doubleTap7];
    UITapGestureRecognizer *doubleTap8 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(basicReqPage)];
    doubleTap8.numberOfTapsRequired=1;
    doubleTap8.delegate=(id)self;
    [self.basicreqview addGestureRecognizer:doubleTap8];

    UITapGestureRecognizer *doubleTap9 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(serailnumpage)];
    doubleTap9.numberOfTapsRequired=1;
    doubleTap9.delegate=(id)self;
    [self.serialview addGestureRecognizer:doubleTap9];
//    UITapGestureRecognizer *doubleTap10 = [[UITapGestureRecognizer alloc]
//                                          initWithTarget:self
//                                          action:@selector(worktypepage)];
//    doubleTap10.numberOfTapsRequired=1;
//    doubleTap10.delegate=(id)self;
//    [self.worktypeview addGestureRecognizer:doubleTap10];
    UITapGestureRecognizer *doubleTap11 = [[UITapGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(wrksetngpage)];
    doubleTap11.numberOfTapsRequired=1;
    doubleTap11.delegate=(id)self;
    [self.wrksetngview addGestureRecognizer:doubleTap11];
    
    UITapGestureRecognizer *doubleTap12 = [[UITapGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(securitypage)];
    doubleTap12.numberOfTapsRequired=1;
    doubleTap12.delegate=(id)self;
    [self.securityview addGestureRecognizer:doubleTap12];

}

-(void)companyPage
{
    if (!self.compVCtrl) {
        self.compVCtrl=[[CompanyViewController alloc]initWithNibName:@"CompanyViewController" bundle:nil];
    }
   _compVCtrl.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:_compVCtrl
                       animated:YES completion:NULL];
}
-(void)branchpage
{
    
    if (!self.branchVCtrl) {
        self.branchVCtrl=[[BranchViewController alloc]initWithNibName:@"BranchViewController" bundle:nil];
    }
    //_branchVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_branchVCtrl
                       animated:YES completion:NULL];

}
//-(void)servicesPage
//{
//    if (!self.serviceVCtrl) {
//        self.serviceVCtrl=[[ServiceViewController alloc]initWithNibName:@"ServiceViewController" bundle:nil];
//    }
//    _serviceVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
//    [self presentViewController:_serviceVCtrl
//                       animated:YES completion:NULL];
//}
-(void)foldersPage
{
    if (!self.folderVCtrl) {
        self.folderVCtrl=[[folderrightsViewController alloc]initWithNibName:@"folderrightsViewController" bundle:nil];
    }
    _folderVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_folderVCtrl
                       animated:YES completion:NULL];
}
-(void)usersPage
{
    if (!self.usersVctrl) {
        self.usersVctrl=[[UsersViewController alloc]initWithNibName:@"UsersViewController" bundle:nil];
    }
    _usersVctrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_usersVctrl
                       animated:YES completion:NULL];
}
-(void)workProcedurePage
{
    if (!self.cmpnyVCtrl) {
        self.cmpnyVCtrl=[[CmpnydocsViewController alloc]initWithNibName:@"CmpnydocsViewController" bundle:nil];
    }
    _cmpnyVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_cmpnyVCtrl
                       animated:YES completion:NULL];

    
}
//-(void)workphasePage
//{
//    if (!self.workVCtrl) {
//        self.workVCtrl=[[workPhasesViewController alloc]initWithNibName:@"workPhasesViewController" bundle:nil];
//    }
//    _workVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
//    [self presentViewController:_workVCtrl
//                       animated:YES completion:NULL];
//
//}
-(void)jobsitereqPage
{
    if (!self.typeVCtrl) {
        self.typeVCtrl=[[TypeViewController alloc]initWithNibName:@"TypeViewController" bundle:nil];
    }
    _typeVCtrl.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:_typeVCtrl
                       animated:YES completion:NULL];
}
-(void)basicReqPage
{
    if (!self.basicreqVctrl) {
        self.basicreqVctrl=[[BasicReqViewController alloc]initWithNibName:@"BasicReqViewController" bundle:nil];
    }
   // _basicreqVctrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_basicreqVctrl
                       animated:YES completion:NULL];
}

-(void)serailnumpage{
    if (!self.SerialVCtrl) {
        self.SerialVCtrl=[[SerialViewController alloc]initWithNibName:@"SerialViewController" bundle:nil];
    }
     _SerialVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_SerialVCtrl
                       animated:YES completion:NULL];
}

    
//-(void)worktypepage{
//    
//    if (!self.wrktypeVCtrl) {
//        self.wrktypeVCtrl=[[WorktypeViewController alloc]initWithNibName:@"WorktypeViewController" bundle:nil];
//    }
//    _wrktypeVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
//    [self presentViewController:_wrktypeVCtrl animated:YES completion:nil];
//}
-(void)wrksetngpage{
    
    if (!self.wrkstngVCtrlr) {
        self.wrkstngVCtrlr=[[SettngsViewController alloc]initWithNibName:@"SettngsViewController" bundle:nil];
    }
    _wrkstngVCtrlr.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_wrkstngVCtrlr animated:YES completion:nil];
}
-(void)securitypage{
  //  if (!self.securityVCtrl) {
        self.securityVCtrl=[[SecurityViewController alloc]initWithNibName:@"SecurityViewController" bundle:nil];
    //}
    _securityVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_securityVCtrl animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closethetile:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
