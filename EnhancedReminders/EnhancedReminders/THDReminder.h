//
//  THDReminder.h
//  EnhancedReminders
//
//  Created by iOS Developer on 2015-03-24.
//  Copyright (c) 2015 UPEICS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface THDReminder : NSObject <NSCoding>

@property NSString *title;
@property NSString *description;
@property NSDate *begin;
@property NSDate *end;
@property MKMapItem *location;

-(id) initWithTitle:(NSString *)title description:(NSString *)description beginDate:(NSDate *)begin endDate:(NSDate *)end;

@end
