//
//  Task+CoreDataProperties.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Task+CoreDataProperties.h"

@implementation Task (CoreDataProperties)

+ (NSFetchRequest<Task *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Task"];
}

@dynamic taskID;
@dynamic taskName;
@dynamic dueDate;
@dynamic displayColour;
@dynamic estimatedTime;
@dynamic difficulty;
@dynamic completed;

@end
