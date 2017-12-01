//
//  Event+AddEvents.h
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 01/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Event+CoreDataClass.h"
#import "AppDelegate.h"

@interface Event (AddEvents)
+ (Event *)addEventInfoFromDictionary :(NSDictionary *)eventInfo;

@end
