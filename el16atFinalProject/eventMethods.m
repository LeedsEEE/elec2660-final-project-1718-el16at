//
//  eventMethods.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 01/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "eventMethods.h"

@implementation eventMethods


+ (int)numberOfEvents {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request = [NSFetchRequest fetchRequestWithEntityName:@"Event"];
    NSManagedObjectContext * context = appDelegate.persistentContainer.viewContext;
    NSError *error;
    NSUInteger eventCount = [context countForFetchRequest:request error:&error]; //Oran Deutsch (student) this line counts the number of tasks in the entity task
    return (int)eventCount;
}

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

+ (void) deleteEvent :(NSDictionary *)eventname
{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *Event = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"eventName == %@",eventname];
    [request setEntity:Event];
    [request setPredicate:predicate];
    
    NSError *error;
    NSArray *objectToDelete = [context executeFetchRequest:request error:&error];
    
    for (NSManagedObject *managedObject in objectToDelete)
    {
        [context deleteObject:managedObject];
    }
}

@end
