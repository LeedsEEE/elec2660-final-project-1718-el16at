//
//  eventMethods.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 01/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "eventMethods.h"

@implementation eventMethods

#pragma mark - counts all events 
+ (int)numberOfEvents {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate]; //defines appDelegate
    NSFetchRequest *request = [[NSFetchRequest alloc] init];                                //creates fetch request
    request = [NSFetchRequest fetchRequestWithEntityName:@"Event"];                         //fetches event entity
    NSManagedObjectContext * context = appDelegate.persistentContainer.viewContext;
    NSError *error;
    NSUInteger eventCount = [context countForFetchRequest:request error:&error]; //Oran Deutsch (student) this line counts the number of tasks in the entity task
    return (int)eventCount;                                                                 //returns the number of events as an integer
}
#pragma mark - Search for specified Event name
+ (NSArray*)searchEventName :(NSDictionary *)eventname {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];    //defines appDelegate
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    Event *eventEntity = nil;
    NSError *error;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Event"];             //creates fetch request
    request.predicate = [NSPredicate predicateWithFormat:@"eventName == %@", eventname];        //request to fetch event with specifc name
    NSArray *fetchedTask = [context executeFetchRequest:request error:&error];                  //fetches object with specific name
    NSMutableArray *results = [[NSMutableArray alloc] init];
    for (eventEntity in fetchedTask) {
        [results addObject:[self createObjectFromEntity:eventEntity]];                          //make objects for all events that have been fetched
    }
    return results;
}
#pragma mark - Creates object from event entity
+ (NSDictionary *)createObjectFromEntity:(Event *)eventInfo {
    NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];                             //makes temporary dictionary
    tempDict[@"eventName"] = eventInfo.eventName;                                                   //makes temporary object
    tempDict[@"eventID"] = [NSString stringWithFormat:@"%D", eventInfo.eventID];
    tempDict[@"eventDate"] = eventInfo.eventDate;
    tempDict[@"eventTimeHours"] = [NSString stringWithFormat:@"%D", eventInfo.eventTimeHours];
    tempDict[@"eventTimeMinutes"] = [NSString stringWithFormat:@"%D", eventInfo.eventTimeMinutes];
    tempDict[@"completed"] = [NSString stringWithFormat:@"%D",eventInfo.completed];
    return tempDict;
}

#pragma mark - Deletes Event
+ (void) deleteEvent :(NSDictionary *)eventname {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];            //defines appDelagte
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];                                            //creates fetch request
    NSEntityDescription *Event = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"eventName == %@",eventname];            //request to fetch event with specific name
    [request setEntity:Event];
    [request setPredicate:predicate];                                                                   //fetches event with specific event name
    
    NSError *error;
    NSArray *objectToDelete = [context executeFetchRequest:request error:&error];
    
    for (NSManagedObject *managedObject in objectToDelete)
    {
        [context deleteObject:managedObject];                                                           //deletes fetched task
    }
}

@end
