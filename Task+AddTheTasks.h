//
//  Task+AddTheTasks.h
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Task+CoreDataClass.h"
#import "AppDelegate.h"

@interface Task (AddTheTasks)
+ (Task *)addTaskInfoFromDictionary :(NSDictionary *)taskInfo;


@end
