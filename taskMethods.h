//
//  taskMethods.h
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 28/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task+AddTheTasks.h"
#import "AppDelegate.h"

@interface taskMethods : NSObject

+ (int)numberOfTasks;
+ (Task *)searchTaskName :(NSDictionary *)taskname;
+ (NSDictionary *)createObjectFromEntity:(Task *)taskInfo;
+ (void) deleteTask :(NSDictionary *)taskname;
+ (Task *)editTask :(NSDictionary *)taskname;

@end
