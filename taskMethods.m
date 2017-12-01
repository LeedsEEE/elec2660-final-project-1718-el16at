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
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    NSManagedObjectContext * context = appDelegate.persistentContainer.viewContext;
    NSError *error;
    NSUInteger taskCount = [context countForFetchRequest:request error:&error]; //Oran Deutsch (student) this line counts the number of tasks in the entity task
    return (int)taskCount;
}

//this code is from https://www.youtube.com/watch?v=p_INW9noMDI

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
+ (NSDictionary *)createObjectFromEntity:(Task *)taskInfo
{
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

+ (void) deleteTask :(NSDictionary *)taskname
{
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
+ (NSArray *)editTask :(NSDictionary *)taskname {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    
    Task *taskEntity = nil; //first tutorial
    NSError *error;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    request.predicate = [NSPredicate predicateWithFormat:@"taskName == %@", taskname];
    NSArray *fetchedTask = [context executeFetchRequest:request error:&error];
    NSLog(@"%@----------------------------------" , fetchedTask);
    NSMutableArray *results = [[NSMutableArray alloc] init];
    NSLog(@"%@----------------", results);
    for (taskEntity in fetchedTask) {
        [results addObject:[self createObjectFromEntity:taskEntity]];
        NSLog(@"%@-----------------------------", taskEntity);
    }
    return results;
   
}

/*
+ (void) editTask :(NSDictionary *)taskname
{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    Task *taskEntity = nil;
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *Task = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"taskName == %@",taskname];
    [request setEntity:Task];
    [request setPredicate:predicate];
    
    NSError *error;
    NSArray *objectToEdit = [context executeFetchRequest:request error:&error];
    
    taskEntity *taskToEdit = [objectToEdit objectAtIndex:0];
    
    
    
    for (NSManagedObject *managedObject in objectToEdit)
    {
        [context deleteObject:managedObject];
    }
}*/
/*
+ (NSArray*)editTask :(NSDictionary *)taskname {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    
    Task *taskEntityEdit = nil; //first tutorial
    NSError *error;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    request.predicate = [NSPredicate predicateWithFormat:@"taskName == %@", taskname];
    NSArray *fetchedTask = [context executeFetchRequest:request error:&error];
    
        taskEntityEdit = [fetchedTask objectAtIndex:0]; // https://stackoverflow.com/questions/7314492/how-to-bind-textfields-to-attributes-of-one-core-data-entity-containing-one-row
    NSMutableArray *results = [[NSMutableArray alloc] init];
    
    
    Task *tempTask = [fetchedTask objectAtIndex:0];
    
    //NSString *detail = [NSString stringWithFormat:@"%@ %@ %@", [tempTask valueForKey:@"difficulty"], [tempTask valueForKey:@"dueDate"], [tempTask valueForKey :@"estimatedTime"]];
    for (taskEntityEdit in fetchedTask) {
        [results addObject:[self createObjectFromEntity:taskEntityEdit]];
    }
    return results;
    
}*/






+ (void) saveData {
//save data permenantly
AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];//
NSError *saveError = nil;       //https://stackoverflow.com/questions/11878107/saving-coredata-permanently
[[[appDelegate persistentContainer] viewContext] save:&saveError];
}

/*

+(NSArray*)deleteTask :(
AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
NSFetchRequest *request = [[NSFetchRequest alloc] init];
NSManagedObjectContext * context = appDelegate.persistentContainer.viewContext;
NSError *error;

NSEntityDescription *Task = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:context];
NSPredicate *predicate = [NSPredicate predicateWithFormat:@"taskName == %@",taskName];
[request setEntity:Task];
[request setPredicate:predicate]

NSError *error;
NSArray *items = [context executeFetchRequest:fetchRequest error:&error];

for (NSManagedObject *managedObject in items)
{
    [context deleteObject:managedObject]; //https://stackoverflow.com/questions/38458195/delete-and-update-data-in-core-data-in-ios
}*/
/*
+ (NSDictionary *)convertToString:(Task *)taskInfo
{
    NSString *taskIDAsString = [NSNumber stringValue];
    
    
}*/

/*+
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer>ViewContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    NSError *error = nil;
    NSError *saveError = nil;
    NSArray *taskArray = [context executeFetchRequest:request error:&error];
    [[AppDelegate managedObjectContext] save:&saveError];*/









@end
