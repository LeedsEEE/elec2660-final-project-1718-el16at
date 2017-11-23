//
//  Task+AddTheTasks.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Task+AddTheTasks.h"
#import "AppDelegate.h"

@implementation Task (AddTheTasks)

+ (Task *)addTaskInfoFromDictionary :(NSDictionary *)taskInfo
{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    Task *taskEntity = nil;
    //Create new object
    taskEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:context];
    
    taskEntity.taskID = [taskInfo valueForKey:@"taskID"];
    taskEntity.taskName = [taskInfo valueForKey:@"taskName"];
    taskEntity.dueDate = [taskInfo valueForKey:@"dueDate"];
    taskEntity.displayColour = [taskInfo valueForKey:@"displayColour"];
    taskEntity.estimatedTime = [taskInfo valueForKey:@"estimatedTime"];
    taskEntity.difficulty = [taskInfo valueForKey:@"difficulty"];
    taskEntity.completed = [taskInfo valueForKey:@"completed"];
    
    
    return taskEntity;
    
}

@end
