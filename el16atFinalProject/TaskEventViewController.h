//
//  TaskEventViewController.h
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "taskMethods.h"
#import "eventMethods.h"

@interface TaskEventViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *difficultyLabel;

@property (strong, nonatomic) NSString *nameString;
@property (strong, nonatomic) NSString *dateString;
@property (strong, nonatomic) NSString * timeString;
@property (strong, nonatomic) NSString *diffcString;
@property (nonatomic, assign) int *taskOrEvent;
@end
