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

-(NSString *)getArchivePathFor:(NSString *)data;
-(void)loadRemindersAndOptions;

@end

@implementation THDReminderListController

-(id)init
{
    return [self initWithStyle:UITableViewStylePlain];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        //[self setEditing:YES animated:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Reminders"];
    [self loadRemindersAndOptions];
    
    //create options button on the right of the navigation bar
    UIBarButtonItem *optionsButton = [[UIBarButtonItem alloc] initWithTitle:@"Options" style:UIBarButtonItemStylePlain target:self action:@selector(optionsButtonPressed)];
    [[self navigationItem] setRightBarButtonItem:optionsButton];
    
    UIBarButtonItem *addNewReminderButton = [[UIBarButtonItem alloc]initWithTitle:@"New" style:UIBarButtonItemStylePlain target:self action:@selector(createNewButtonPressed)];
    [[self navigationItem]setLeftBarButtonItem:addNewReminderButton];
    
    //register as an observer
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:app];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)createNewButtonPressed
{
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
    
    //configure cell
    THDReminder *reminder = [_reminders objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[reminder title]];
    [[cell detailTextLabel] setText:[reminder description]];
    [cell setAccessoryType:UITableViewCellAccessoryDetailButton];
    #warning Hook up images
    //[[cell imageView] setImage:[UIImage imageNamed:@"puppy.jpg"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    //redirect to the THDReminderDetailsController initializing using the ID for the selected row
    #warning Pass reminder over to details viewer
    UIViewController *next = [[THDReminderDetailsController alloc] init];
    
    if(next != nil)
        [[self navigationController] pushViewController:next animated:YES];
}

-(NSString *)getArchivePathFor:(NSString *)data
{
    NSString* file = [[NSString alloc] initWithFormat:@"%@.data", data];
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:file];
}

-(void)loadRemindersAndOptions
{
    //load or create array of reminders
    NSString* path = [self getArchivePathFor:@"reminders"];
    NSMutableArray* reminders = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if(!reminders) {
        #warning Delete me when done testing
        THDReminder* test1 = [[THDReminder alloc] initWithTitle:@"Reminder 1" description:@"Description 1" beginDate:[[NSDate alloc] initWithTimeIntervalSinceNow:120] endDate:nil];
        THDReminder* test2 = [[THDReminder alloc] initWithTitle:@"Reminder 2" description:@"Description 2" beginDate:nil endDate:[[NSDate alloc] initWithTimeIntervalSinceNow:180]];
        THDReminder* test3 = [[THDReminder alloc] initWithTitle:@"Reminder 3" description:@"Description 3" beginDate:[[NSDate alloc] initWithTimeIntervalSinceNow:90] endDate:[[NSDate alloc] initWithTimeIntervalSinceNow:150]];
        THDReminder* test4 = [[THDReminder alloc] init];
        reminders = [[NSMutableArray alloc] initWithObjects:test1, test2, test3, test4, nil];
    }
    _reminders = reminders;
    
    //load or create options
    path = [self getArchivePathFor:@"options"];
    THDOptions* options = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if(!reminders) {
        options = [[THDOptions alloc] init];
    }
    _options = options;
}

-(void) applicationDidEnterBackground:(UIApplication*)app
{
    //archive reminders
    NSString* path = [self getArchivePathFor:@"reminders"];
    [NSKeyedArchiver archiveRootObject:_reminders toFile:path];
    
    //archive options
    path = [self getArchivePathFor:@"options"];
    [NSKeyedArchiver archiveRootObject:_options toFile:path];
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
