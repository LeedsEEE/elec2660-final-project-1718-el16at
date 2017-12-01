//
//  EditEventViewController.h
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 01/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditEventViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *EditNameField;

@property (weak, nonatomic) IBOutlet UIDatePicker *EditDatePicker;

@property (weak, nonatomic) IBOutlet UITextField *SeachNameFeild;

@end
