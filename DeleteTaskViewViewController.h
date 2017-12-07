//
//  DeleteTaskViewViewController.h
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 28/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "taskMethods.h"

@interface DeleteTaskViewViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *SearchTaskNameText;

@property (weak, nonatomic) IBOutlet UIButton *SearchTaskNameButton;

@property (weak, nonatomic) IBOutlet UIButton *DeleteButton;

@property (weak, nonatomic) IBOutlet UILabel *taskNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *dueDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *difficultyLabel;

@end
