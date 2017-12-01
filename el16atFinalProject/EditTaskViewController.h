//
//  EditTaskViewController.h
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 30/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "taskMethods.h"

@interface EditTaskViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *SearchTaskNameField;
@property (weak, nonatomic) IBOutlet UIButton *SearchTaskNameButton;
@property (weak, nonatomic) IBOutlet UITextView *TaskNameField;
@property (weak, nonatomic) IBOutlet UITextView *EditTimeField;
@property (weak, nonatomic) IBOutlet UITextView *EditDifficultyField;

@property (weak, nonatomic) IBOutlet UIDatePicker *EditDueDate;
@property (nonatomic) int calculatedTaskID;


@end
