//
//  AddTaskFormViewController.h
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "taskMethods.h"
#import "Task+AddTheTasks.h"
#import "AppDelegate.h"


@interface AddTaskFormViewController : UIViewController
@property (nonatomic) int calculatedTaskID;

@property (weak, nonatomic) IBOutlet UITextField *NameText;
@property (weak, nonatomic) IBOutlet UIDatePicker *DatePicker;
@property (weak, nonatomic) IBOutlet UITextField *TimeHoursText;
@property (weak, nonatomic) IBOutlet UITextField *DifficultyText;
@end


