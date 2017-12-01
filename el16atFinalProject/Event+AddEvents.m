//
//  Event+AddEvents.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 01/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Event+AddEvents.h"

@implementation Event (AddEvents)


+ (Event *)addEventInfoFromDictionary :(NSDictionary *)eventInfo
{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    
    Event *eventEntity = nil; //first tutorial
    //Create new object
    
    //First tutorial
    
    eventEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:context];
    
    eventEntity.eventID = (int)[(NSNumber *)[eventInfo valueForKey:@"eventID"] integerValue];
    eventEntity.eventName = [eventInfo valueForKey:@"eventName"];
    eventEntity.eventDate =  [eventInfo valueForKey:@"eventDate"];
    eventEntity.eventTimeHours = (int)[(NSNumber *)[eventInfo valueForKey:@"eventTimeHours"] integerValue];
    eventEntity.eventTimeMinutes = (int)[(NSNumber *)[eventInfo valueForKey:@"eventTimeMinutes"] integerValue];
    eventEntity.completed = [eventInfo valueForKey:@"completed"];
    
    
    return eventEntity;
}

@end
