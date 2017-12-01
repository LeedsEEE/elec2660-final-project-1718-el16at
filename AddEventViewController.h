//
//  AddEventViewController.h
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 01/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEventViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *AddEventText;
@property (weak, nonatomic) IBOutlet UITextField *AddTimeHoursText;
@property (weak, nonatomic) IBOutlet UIDatePicker *AddDueDatePicker;
@property (weak, nonatomic) IBOutlet UITextField *AddTimeMinutes;

@end
