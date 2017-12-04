//
//  DisplayTasksViewController.h
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 27/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Task+AddTheTasks.h"

@interface DisplayTasksViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *TaskNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *DueDateLabel;

@property (weak, nonatomic) IBOutlet UILabel *EstimatedTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *DifficutyLabel;
@property (weak, nonatomic) IBOutlet UISwitch *CompletedSwitch;





@end
