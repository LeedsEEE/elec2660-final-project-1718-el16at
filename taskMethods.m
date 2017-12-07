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
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate]; //defines app delegate
    NSFetchRequest *request = [[NSFetchRequest alloc] init];                            //creates fetch request
    request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];                      //Fetches task entity
    NSManagedObjectContext * context = appDelegate.persistentContainer.viewContext;
    NSError *error;
    NSUInteger taskCount = [context countForFetchRequest:request error:&error]; //Oran Deutsch (student) this line counts the number of tasks in the entity task
    return (int)taskCount;
}

//this code is from https://www.youtube.com/watch?v=p_INW9noMDI
#pragma mark - Search for specified Task name
+ (NSArray*)searchTaskName :(NSDictionary *)taskname {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    Task *taskEntity = nil; //first tutorial
    NSError *error;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    request.predicate = [NSPredicate predicateWithFormat:@"taskName == %@", taskname];
    NSArray *fetchedTask = [context executeFetchRequest:request error:&error];
    NSMutableArray *results = [[NSMutableArray alloc] init];
    for (taskEntity in fetchedTask) {
        [results addObject:[self createObjectFromEntity:taskEntity]];
    }
    return results;
}
#pragma mark - creates an object from task entity
+ (NSDictionary *)createObjectFromEntity:(Task *)taskInfo {
    NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
    tempDict[@"taskName"] = taskInfo.taskName;
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
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *Task = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"taskName == %@",taskname];
    [request setEntity:Task];
    [request setPredicate:predicate];
    
    NSError *error;
    NSArray *objectToDelete = [context executeFetchRequest:request error:&error];
    
    for (NSManagedObject *managedObject in objectToDelete)
    {
        [context deleteObject:managedObject];
    }
}


#pragma mark - Formats Date For Display
+ (NSString *)formatDate:(NSDate *)taskDate {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMMM dd, yyyy (EEEE)"];
    NSDate *now = [NSDate date];
    NSString *dateAsString = [format stringFromDate:now];       //https://stackoverflow.com/questions/3712140/convert-nsdate-to-nsstring-with-nsdateformatter-with-timezone-without-gmt-time-m
    return dateAsString;
}


    #pragma mark - saves data permenantly
//+ (void) saveData {     //being defined wrong currently not called
//save data permenantly
//AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
//NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];//
//NSError *saveError = nil;       //https://stackoverflow.com/questions/11878107/saving-coredata-permanently
//[[[appDelegate persistentContainer] viewContext] save:&saveError];
//}




@end
