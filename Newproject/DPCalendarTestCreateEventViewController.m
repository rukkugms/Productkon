//
//  DPCalendarTestCreateEventViewController.m
//  DPCalendar
//
//  Created by Ethan Fang on 21/01/14.
//  Copyright (c) 2014 Ethan Fang. All rights reserved.
//

#import "DPCalendarTestCreateEventViewController.h"
#import "DPCalendarTestOptionsCell.h"
#import "NSDate+DP.h"

@interface DPCalendarTestCreateEventViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DPCalendarTestCreateEventViewController

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
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonSelected)];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonSelected)];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.tableView.allowsSelection = NO;
    
    [self.view addSubview:self.tableView];
}

- (void) doneButtonSelected{
    NSMutableArray *events = @[].mutableCopy;
    NSDate*starttime=[[NSDate date]dateByAddingTimeInterval:60*60*24*2];
      NSDate*enddate=[[NSDate date]dateByAddingTimeInterval:60*60*24*2];
    _event=[[DPCalendarEvent alloc]initWithTitle:@"New......." startTime:starttime endTime:enddate colorIndex:0];
    
     // _event = [[DPCalendarEvent alloc]initWithTitle:@"Manpower" startTime:self.event.startTime endTime:self.event.endTime  days:0] colorIndex:0];
    [events addObject:self.event];

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) cancelButtonSelected{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource

#define NEW_EVENT_CELL_IDENTIFIER @"NEW_EVENT_CELL_IDENTIFIER"
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DPCalendarTestOptionsCell *cell = [tableView dequeueReusableCellWithIdentifier:NEW_EVENT_CELL_IDENTIFIER];
    if (!cell) {
        cell = [[DPCalendarTestOptionsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NEW_EVENT_CELL_IDENTIFIER];
        
    }
    switch (indexPath.row) {
        case 0:
            [cell setTitle:@"Event Name"];
            [cell setTextValue:@"Test"];
            break;
        case 1:
            [cell setTitle:@"Start Time"];
            [cell setDate:[[NSDate date] dateByAddingYears:0 months:0 days:-1]];
            break;
        case 2:
            [cell setTitle:@"End Time"];
            [cell setDate:[[NSDate date] dateByAddingYears:0 months:0 days:1]];
            break;
        default:
            break;
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"event name" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//    [alert show];
//}
@end
