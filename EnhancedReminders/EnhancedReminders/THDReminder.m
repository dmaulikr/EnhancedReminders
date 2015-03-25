//
//  THDReminder.m
//  EnhancedReminders
//
//  Created by iOS Developer on 2015-03-24.
//  Copyright (c) 2015 UPEICS. All rights reserved.
//

#import "THDReminder.h"

@implementation THDReminder

-(id)init
{
    self = [super init];
    if(self) {
        _title = @"New Reminder";
        _description = @"";
        _begin = nil;
        _end = nil;
    }
    return self;
}

#warning Delete when done with test reminders
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

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        _title = [coder decodeObjectForKey:@"title"];
        _description = [coder decodeObjectForKey:@"description"];
        _begin = [coder decodeObjectForKey:@"begin"];
        _end = [coder decodeObjectForKey:@"end"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:_title forKey:@"title"];
    [coder encodeObject:_description forKey:@"description"];
    [coder encodeObject:_begin forKey:@"begin"];
    [coder encodeObject:_end forKey:@"end"];
}

@end
