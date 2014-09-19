//
//  CommentsViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/21/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "CommentsViewController.h"

@interface CommentsViewController ()

@end

@implementation CommentsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //new cmmnt
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _scrollview.frame=CGRectMake(0, 0,1004, 768);
    [_scrollview setContentSize:CGSizeMake(1004,850)];
    _commentArray=[[NSMutableArray alloc]init];
    _commentTable.layer.borderWidth = 2.0;
    _commentTable.layer.borderColor = [UIColor blackColor].CGColor;


    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [_commentArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"newCommentCell" owner:self options:nil];
        cell=_commentcell;
        
        
    }
    cell.textLabel.text=[_commentArray objectAtIndex:indexPath.row];
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


-(IBAction)saveComment:(id)sender
{
    _savebtnlbl.enabled=NO;
    [_commentArray addObject:_cmntTextView.text];
    [_commentTable reloadData];
}
-(IBAction)cancelcomment:(id)sender
{
    _cmntTextView.text=@"";
}

@end
