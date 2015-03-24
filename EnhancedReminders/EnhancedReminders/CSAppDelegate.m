//
//  CSAppDelegate.m
//  EnhancedReminders
//
//  Created by iOS Developer on 2015-03-10.
//  Copyright (c) 2015 UPEICS. All rights reserved.
//

#import "CSAppDelegate.h"
#import "THDReminderListController.h"
#import "THDReminder.h" //DELETE ME WHEN DONE TESTING

@implementation CSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Load or create array of reminders
    NSMutableArray *reminders = nil;
    //if (archive exists on system)
    //    load from system
    //else
    //reminders = [[NSMutableArray alloc] init];
    
    //DELETE ME WHEN DONE TESTING
    THDReminder* test1 = [[THDReminder alloc] initWithTitle:@"Reminder 1" description:@"Description 1" beginDate:[[NSDate alloc] initWithTimeIntervalSinceNow:2160000] endDate:nil];
    THDReminder* test2 = [[THDReminder alloc] initWithTitle:@"Reminder 2" description:@"Description 2" beginDate:nil endDate:[[NSDate alloc] initWithTimeIntervalSinceNow:2160000]];
    THDReminder* test3 = [[THDReminder alloc] initWithTitle:@"Reminder 3" description:@"Description 3" beginDate:[[NSDate alloc] initWithTimeIntervalSinceNow:2160000] endDate:[[NSDate alloc] initWithTimeIntervalSinceNow:2160060]];
    reminders = [[NSMutableArray alloc] initWithObjects:test1, test2, test3, nil];
    
    //Set up Navigation Controller
    THDReminderListController *thdReminderListController = [[THDReminderListController alloc] initWithReminders:reminders];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:thdReminderListController];
    [[self window] setRootViewController:navController];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    //******************************
    //received a local notification;
    //automatically called after
    //didFinishLaunchingWithOptions
    //******************************
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
