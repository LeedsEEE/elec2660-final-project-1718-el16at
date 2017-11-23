//
//  AddTaskFormViewController.h
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddTaskFormViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *NameText;
@property (weak, nonatomic) IBOutlet UITextField *DateDayText;
@property (weak, nonatomic) IBOutlet UITextField *DateMonthText;
@property (weak, nonatomic) IBOutlet UITextField *DateYearText;
@property (weak, nonatomic) IBOutlet UITextField *TimeHoursText;
@property (weak, nonatomic) IBOutlet UITextField *TimeMinutesText;
@property (weak, nonatomic) IBOutlet UITextField *DifficultyText;
@property (weak, nonatomic) IBOutlet UITextView *DispplayOutput;

@end

@implementation AddTaskFormViewController

- (IBAction)SaveButton:(id)sender {
}

@end
