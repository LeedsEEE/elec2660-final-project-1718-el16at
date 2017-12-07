//
//  taskMethods.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 28/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "taskMethods.h"

@implementation taskMethods
    
+ (int)numberOfTasks {
    #pragma mark - Counts all Tasks
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate]; //defines appDelegate
    NSFetchRequest *request = [[NSFetchRequest alloc] init];                                //creates fetch request
    request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];                          //Fetches task entity
    NSManagedObjectContext * context = appDelegate.persistentContainer.viewContext;
    NSError *error;
    NSUInteger taskCount = [context countForFetchRequest:request error:&error];             //Oran Deutsch (student) this line counts the number of tasks in the entity task
    return (int)taskCount;          //returns the number of tasks as an integer
}

//this code is from https://www.youtube.com/watch?v=p_INW9noMDI
#pragma mark - Search for specified Task name
+ (NSArray*)searchTaskName :(NSDictionary *)taskname {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];        //defines appDelegate
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];              //defines context as NSManagedObject
    Task *taskEntity = nil; //https://www.youtube.com/watch?v=EGO9XBFrZE0
    NSError *error;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];                  //creates fetch request
    request.predicate = [NSPredicate predicateWithFormat:@"taskName == %@", taskname];              //request to fetch task with specific taskName
    NSArray *fetchedTask = [context executeFetchRequest:request error:&error];                      //fetches object with specific taskName
    NSMutableArray *results = [[NSMutableArray alloc] init];
    for (taskEntity in fetchedTask) {
        [results addObject:[self createObjectFromEntity:taskEntity]];                               //makes objects for all the tasks that have been fetched
    }
    return results;
}
#pragma mark - creates an object from task entity
+ (NSDictionary *)createObjectFromEntity:(Task *)taskInfo {
    NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];                         //makes temporary dictionary
    tempDict[@"taskName"] = taskInfo.taskName;                                                  //makes temporary object
    tempDict[@"taskID"] = [NSString stringWithFormat:@"%D", taskInfo.taskID];
    tempDict[@"dueDate"] = taskInfo.dueDate;
    tempDict[@"displayColour"] = [NSString stringWithFormat:@"%D", taskInfo.displayColour];
    tempDict[@"estimatedTime"] = [NSString stringWithFormat:@"%D", taskInfo.estimatedTime];
    tempDict[@"difficulty"] = taskInfo.difficulty;
    tempDict[@"completed"] = [NSString stringWithFormat:@"%D",taskInfo.completed];
    return tempDict;
}
#pragma mark - Deletes Task
+ (void) deleteTask :(NSDictionary *)taskname {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];                    //defines appDelagate
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];                                                    //creates fetch request
    NSEntityDescription *Task = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"taskName == %@",taskname];                      //request to fetch task with specific name
    [request setEntity:Task];
    [request setPredicate:predicate];
    
    NSError *error;
    NSArray *objectToDelete = [context executeFetchRequest:request error:&error];                               //fetches object withspecific task name
    
    for (NSManagedObject *managedObject in objectToDelete)
    {
        [context deleteObject:managedObject];                                                                   //deletes fetched task
    }
}


@end
