//
//  TaskEventViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "TaskEventViewController.h"

@interface TaskEventViewController ()

@end

@implementation TaskEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = [NSString stringWithFormat:@"Name: %@", self.nameString];     //displays selected task or event from table view in labels
    self.dateLabel.text = [NSString stringWithFormat:@"Date: %@", self.dateString];
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %@", self.timeString];
    self.difficultyLabel.text = self.diffcString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
