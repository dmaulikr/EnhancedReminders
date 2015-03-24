//
//  THDReminder.m
//  EnhancedReminders
//
//  Created by iOS Developer on 2015-03-24.
//  Copyright (c) 2015 UPEICS. All rights reserved.
//

#import "THDReminder.h"

@implementation THDReminder

-(id) initWithTitle:(NSString *)title description:(NSString *)description beginDate:(NSDate *)begin endDate:(NSDate *)end
{
    self = [super init];
    if(self) {
        _title = title;
        _description = description;
        _begin = begin;
        _end = end;
    }
    return self;
}

@end
