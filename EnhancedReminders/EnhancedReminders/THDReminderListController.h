//
//  THDReminderListController.h
//  EnhancedReminders
//
//  Created by iOS Developer on 2015-03-12.
//  Copyright (c) 2015 UPEICS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THDOptions.h"

@interface THDReminderListController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray* reminders;
@property THDOptions* options;

@end
