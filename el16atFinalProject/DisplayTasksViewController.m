//
//  DisplayTasksViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 27/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DisplayTasksViewController.h"

@interface DisplayTasksViewController ()

@end

@implementation DisplayTasksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void) viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    self.TaskNameLabel.text = [NSString stringWithFormat:@"Name: %@", self.taskString];                     //displays selected task from table view in labels
    self.EstimatedTimeLabel.text = [NSString stringWithFormat:@"Estimated Time: %@", self.timeString];
    self.DueDateLabel.text = [NSString stringWithFormat:@"Due Date: %@", self.dateString];
    self.DifficutyLabel.text = [NSString stringWithFormat:@"Difficulty: %@", self.diffcString];
}

- (IBAction)completedButton:(UIButton *)sender {
    
    
    [taskMethods deleteTask:self.taskString];                                                               //deletes completed event
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Well done Task completed"
                                                                   message:@"Completed Task will be removed from the Task File"
                                                            preferredStyle:UIAlertControllerStyleAlert];    //alert congradulating user for completing task wil apear
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                              UIViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"mainMenu"];
                                                              [self presentViewController:vc animated:YES completion:nil];}];   //when user clicks ok the get sent back to the main menu
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];                                         //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller

    //save data permenantly
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];         //These lines make the task being deleted permenant
    NSError *saveError = nil;                                                                       //https://stackoverflow.com/questions/11878107/saving-coredata-permanently
    [[[appDelegate persistentContainer] viewContext] save:&saveError];

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
