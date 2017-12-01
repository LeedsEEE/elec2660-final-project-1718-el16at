//
//  Event+CoreDataProperties.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 01/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Event+CoreDataProperties.h"

@implementation Event (CoreDataProperties)

+ (NSFetchRequest<Event *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Event"];
}

@dynamic eventName;
@dynamic eventTimeHours;
@dynamic eventTimeMinutes;
@dynamic eventID;
@dynamic eventDate;
@dynamic completed;

@end
