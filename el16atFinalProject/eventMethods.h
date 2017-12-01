//
//  eventMethods.h
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 01/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Event+AddEvents.h"

@interface eventMethods : NSObject
+ (NSArray*)searchEventName :(NSDictionary *)eventname;
@end
