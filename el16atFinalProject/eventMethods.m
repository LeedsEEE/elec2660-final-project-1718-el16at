//
//  eventMethods.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 01/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "eventMethods.h"

@implementation eventMethods

+ (NSArray*)searchEventName :(NSDictionary *)eventname {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    Event *eventEntity = nil; //first tutorial
    NSError *error;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Event"];
    request.predicate = [NSPredicate predicateWithFormat:@"eventName == %@", eventname];
    NSArray *fetchedTask = [context executeFetchRequest:request error:&error];
    NSMutableArray *results = [[NSMutableArray alloc] init];
    for (eventEntity in fetchedTask) {
        [results addObject:[self createObjectFromEntity:eventEntity]];
    }
    return results;
}
+ (NSDictionary *)createObjectFromEntity:(Event *)eventInfo
{
    NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
    tempDict[@"eventName"] = eventInfo.eventName;
    tempDict[@"eventID"] = [NSString stringWithFormat:@"%D", eventInfo.eventID];
    tempDict[@"eventDate"] = eventInfo.eventDate;
    tempDict[@"eventTimeHours"] = [NSString stringWithFormat:@"%D", eventInfo.eventTimeHours];
    tempDict[@"eventTimeMinutes"] = [NSString stringWithFormat:@"%D", eventInfo.eventTimeMinutes];
    tempDict[@"completed"] = [NSString stringWithFormat:@"%D",eventInfo.completed];
    return tempDict;
}

@end
