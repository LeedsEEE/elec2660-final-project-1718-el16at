//
//  EventViewController.h
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "eventMethods.h"

@interface EventViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@property (strong, nonatomic) NSString *eventNameString;
@property (strong, nonatomic) NSString *eventDateString;



@end
