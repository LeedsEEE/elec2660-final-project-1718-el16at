//
//  AddEventViewController.h
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 01/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event+AddEvents.h"
#import "eventMethods.h"

@interface AddEventViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *AddEventText;
@property (weak, nonatomic) IBOutlet UIDatePicker *AddDatePicker;
@end
