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
#pragma mark - Make Task object

+ (Task *)addTaskInfoFromDictionary :(NSDictionary *)taskInfo                               //I set up core data with this tutorialhttps://www.youtube.com/watch?v=EGO9XBFrZE0
{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];        //defines appDelegate
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];              
    Task *taskEntity = nil;
    
    //Create new object
    taskEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:context];
    taskEntity.taskID = (int)[(NSNumber *)[taskInfo valueForKey:@"taskID"] integerValue];
    taskEntity.taskName = [taskInfo valueForKey:@"taskName"];
    taskEntity.dueDate =  [taskInfo valueForKey:@"dueDate"];
    taskEntity.displayColour = (int)[(NSNumber *)[taskInfo valueForKey:@"displayColour"] integerValue];
    taskEntity.estimatedTime = (int)[(NSNumber *)[taskInfo valueForKey:@"estimatedTime"] integerValue];
    taskEntity.difficulty = [taskInfo valueForKey:@"difficulty"];
    taskEntity.completed = [taskInfo valueForKey:@"completed"];
    
    return taskEntity;
}

@end
