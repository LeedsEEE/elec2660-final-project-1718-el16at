//
//  Task+CoreDataProperties.h
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Task+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Task (CoreDataProperties)

+ (NSFetchRequest<Task *> *)fetchRequest;

@property (nonatomic) int16_t taskID;
@property (nullable, nonatomic, copy) NSString *taskName;
@property (nullable, nonatomic, copy) NSDate *dueDate;
@property (nonatomic) int16_t displayColour;
@property (nonatomic) int16_t estimatedTime;
@property (nullable, nonatomic, copy) NSString *difficulty;
@property (nonatomic) BOOL completed;

@end

NS_ASSUME_NONNULL_END
