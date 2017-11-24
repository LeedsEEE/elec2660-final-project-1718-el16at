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
    
    Task *taskEntity = nil;
    
    //Create new object
    taskEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:context];
    
    taskEntity.taskID = (int)[(NSNumber *)[taskInfo valueForKey:@"taskID"] integerValue];
    taskEntity.taskName = [taskInfo valueForKey:@"taskName"];
    
    
    
    /*NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd.MMM.yy"];
    NSDate *date = (NSDate *) [taskInfo valueForKey:@"dueDate"];*/
    
    /*
    NSDateFormatter *myXMLdateReader = [[NSDateFormatter alloc] init];
    [myXMLdateReader setDateFormat:@"dd/MM/yy"];
    NSDate *itsDate = [myXMLdateReader dateFromString: [TBXML textForElement:xmlDate]];
    [myXMLdateReader release];
    [Sets setValue:itsDate forKey:@"dueDate"];
    */
    /*
    NSDateFormatter *parseFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [parseFormatter setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"US"] autorelease]];
    [parseFormatter setDateFormat:@"EEE, dd MM yy Z"];
    NSString *dateString = @"Mon, 02 May 2011 +0000";
    NSDate *dateToAdd = [parser.parseFormatter dateFromString:dateString];
     */
    
    taskEntity.dueDate =  [taskInfo valueForKey:@"dueDate"];
    taskEntity.displayColour = (int)[(NSNumber *)[taskInfo valueForKey:@"displayColour"] integerValue];
    taskEntity.estimatedTime = (int)[(NSNumber *)[taskInfo valueForKey:@"estimatedTime"] integerValue];
    taskEntity.difficulty = [taskInfo valueForKey:@"difficulty"];
    taskEntity.completed = [taskInfo valueForKey:@"completed"];
    
    
    return taskEntity;
    
}

@end
