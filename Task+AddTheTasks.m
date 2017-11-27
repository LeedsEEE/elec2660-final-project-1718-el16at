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
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    
    Task *taskEntity = nil; //first tutorial
    
    /*NSNumber *taskID = taskInfo [@"taskID"];            //second tutorial
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"task"];  //creates request to search through the database
    request.predicate = [NSPredicate predicateWithFormat:@"taskID = @%", taskID];
    
    NSError *error;
    NSArray *matchFound = [context executeFetchRequest: request error: &error];   //goes through the database fetching all the taskID and returns the error if there is an error
    //CHECK LINE ABOVE
    if (!matchFound || error || ([matchFound count] > 1)) { //these are errors that could happen and they will be delt with in this loop
        //hadle errors here
    }
    else if ([matchFound count]) {
        taskEntity = [matchFound firstObject]; //returns the object (if its there)
    }
    else {
        //Create new object (if the object does'nt exsist already
        
        //First tutorial
        
        taskEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:context];
        
        taskEntity.taskID = (int)[(NSNumber *)[taskInfo valueForKey:@"taskID"] integerValue];
        taskEntity.taskName = [taskInfo valueForKey:@"taskName"];
        taskEntity.dueDate =  [taskInfo valueForKey:@"dueDate"];
        taskEntity.displayColour = (int)[(NSNumber *)[taskInfo valueForKey:@"displayColour"] integerValue];
        taskEntity.estimatedTime = (int)[(NSNumber *)[taskInfo valueForKey:@"estimatedTime"] integerValue];
        taskEntity.difficulty = [taskInfo valueForKey:@"difficulty"];
        taskEntity.completed = [taskInfo valueForKey:@"completed"];
        
    }*/
        
    
    
    //Create new object
    
    //First tutorial
    
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
