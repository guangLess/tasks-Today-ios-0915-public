//
//  FISViewController.m
//  tasksToday
//
//  Created by Joe Burgess on 6/19/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"
#import <EventKit/EventKit.h>
#import "FISEventDetailViewController.h"

@interface FISViewController ()

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self requestCalendarPermission];
    [self getLastYearsEvents];
    [self getNextYearsEvents];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    FISEventDetailViewController * dvc = segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"nextYear"]){
        NSMutableString *text = [[NSMutableString alloc] init];//------questions <<-------------

        for (EKEvent * event in self.getNextYearsEvents){
            [text appendString:[NSString stringWithFormat:@"%@\n",event.title]];
        }
        dvc.eventTexts = text;
    }
    

    if ([segue.identifier isEqualToString:@"lastYear"]){
        
        //FISEventDetailViewController * dvc = segue.destinationViewController;
        NSMutableString *text = [[NSMutableString alloc] init];//------questions <<-------------
        for (EKEvent * event in self.getLastYearsEvents){
            [text appendString:[NSString stringWithFormat:@"%@\n",event.title]];
        }
        dvc.eventTexts = text;
    }

}

- (void)requestCalendarPermission
{
    EKEventStore *store = [[EKEventStore alloc] init];
    [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        
    }];
}

- (NSArray *)getNextYearsEvents
{
    
    EKEventStore *store = [[EKEventStore alloc] init];
    // Get the appropriate calendar
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    
    // Create the end date components
    NSDateComponents *oneYearFromNowComponents = [[NSDateComponents alloc] init];
    oneYearFromNowComponents.year = 1;
    NSDate *oneYearFromNow = [calendar dateByAddingComponents:oneYearFromNowComponents
                                                       toDate:[NSDate date]
                                                      options:0];
    
    // Create the predicate from the event store's instance method
    NSPredicate *predicate = [store predicateForEventsWithStartDate:[NSDate date]
                                                            endDate:oneYearFromNow
                                                          calendars:nil];
    
    // Fetch all events that match the predicate
    NSArray *events = [store eventsMatchingPredicate:predicate];
    return events;
}

- (NSArray *)getLastYearsEvents
{
    
    EKEventStore *store = [[EKEventStore alloc] init];
    // Get the appropriate calendar
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // Create the start date components
    
    // Create the end date components
    NSDateComponents *oneYearFromNowComponents = [[NSDateComponents alloc] init];
    oneYearFromNowComponents.year = -1;
    NSDate *oneYearFromNow = [calendar dateByAddingComponents:oneYearFromNowComponents
                                                       toDate:[NSDate date]
                                                      options:0];
    
    // Create the predicate from the event store's instance method
    NSPredicate *predicate = [store predicateForEventsWithStartDate:oneYearFromNow
                                                            endDate:[NSDate date]
                                                          calendars:nil];
    
    // Fetch all events that match the predicate
    NSArray *events = [store eventsMatchingPredicate:predicate];
    return events;
}






@end
