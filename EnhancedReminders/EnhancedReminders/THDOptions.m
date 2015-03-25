//
//  THDOptions.m
//  EnhancedReminders
//
//  Created by iOS Developer on 2015-03-25.
//  Copyright (c) 2015 UPEICS. All rights reserved.
//

#import "THDOptions.h"

@implementation THDOptions

-(id)init
{
    self = [super init];
    if (self) {
        _twentyFourHourClock = false;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        _twentyFourHourClock = [coder decodeBoolForKey:@"twentyFourHourClock"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeBool:_twentyFourHourClock forKey:@"twentyFourHourClock"];
}

@end
