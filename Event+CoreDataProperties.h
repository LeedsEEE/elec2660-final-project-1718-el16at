//
//  Event+CoreDataProperties.h
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 01/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Event+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Event (CoreDataProperties)

+ (NSFetchRequest<Event *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *eventName;
@property (nonatomic) int16_t eventTimeHours;
@property (nonatomic) int16_t eventTimeMinutes;
@property (nonatomic) int16_t eventID;
@property (nullable, nonatomic, copy) NSDate *eventDate;
@property (nonatomic) BOOL completed;

@end

NS_ASSUME_NONNULL_END
