//
//  THDReminderListController.m
//  EnhancedReminders
//
//  Created by iOS Developer on 2015-03-12.
//  Copyright (c) 2015 UPEICS. All rights reserved.
//

#import "THDReminderListController.h"
#import "THDReminderDetailsController.h"
#import "THDOptionsController.h"
#import "THDReminderEditController.h"
#import "THDReminder.h"

@interface THDReminderListController ()

@end

@implementation THDReminderListController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _reminders = [[NSMutableArray alloc] init];
        //[self setEditing:YES animated:YES];
    }
    return self;
}

-(id)initWithReminders:(NSMutableArray *)reminders
{
    self = [super init];
    if (self) {
        _reminders = reminders;
        //[self setEditing:YES animated:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Reminders"];
    
    //create options button on the right of the navigation bar
    UIBarButtonItem *optionsButton = [[UIBarButtonItem alloc] initWithTitle:@"Options" style:UIBarButtonItemStylePlain target:self action:@selector(optionsButtonPressed)];
    [[self navigationItem] setRightBarButtonItem:optionsButton];
    
    UIBarButtonItem *addNewReminderButton = [[UIBarButtonItem alloc]initWithTitle:@"New" style:UIBarButtonItemStylePlain target:self action:@selector(createNewButtonPressed)];
    [[self navigationItem]setLeftBarButtonItem:addNewReminderButton];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)createNewButtonPressed{
    UIViewController *controller = [[THDReminderEditController alloc]init];
    [[self navigationController] pushViewController:controller animated:YES];
}

-(void)optionsButtonPressed
{
    UIViewController *controller = [[THDOptionsController alloc] init];
    [[self navigationController] pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_reminders count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *myCellID = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myCellID];
    
    if(cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:myCellID];
    
    // Configure the cell...
    THDReminder *reminder = [_reminders objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[NSString stringWithFormat:@"Row %ld", (long)[indexPath row]]];;
    //[[cell imageView] setImage:[UIImage imageNamed:@"puppy.jpg"]];
    [[cell detailTextLabel] setText:@"blah"];
    [cell setAccessoryType:UITableViewCellAccessoryDetailButton];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Details");
    
    //Redirect to the THDReminderDetailsController.  Initialize using the ID for the selected row.
    UIViewController *next = nil;
    next = [[THDReminderDetailsController alloc] init];
    
    if(next != nil)
    {
        [[self navigationController] pushViewController:next animated:YES];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
