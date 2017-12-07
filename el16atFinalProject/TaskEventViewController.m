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
- (IBAction)completedButton:(UIButton *)sender {
    if (_taskOrEvent == 1) {
    [taskMethods deleteTask:self.nameString];                                                               //deletes completed event
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
    } else {
        [eventMethods deleteEvent:self.nameString];                                                        //deletes the completed event
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Well done Event completed"
                                                                       message:@"Completed Event will be removed from the Event File"
                                                                preferredStyle:UIAlertControllerStyleAlert];    //alert congradulating user on completing thier evnt
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                                  UIViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"mainMenu"];
                                                                  [self presentViewController:vc animated:YES completion:nil];}];    //sends user back to main menu after they have clicked ok
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];                                         //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        NSError *saveError = nil;                                                                               //https://stackoverflow.com/questions/11878107/saving-coredata-permanently
        [[[appDelegate persistentContainer] viewContext] save:&saveError];                                      //saves that event has been completed (saves that event has been deleted)
        
    }
    

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
