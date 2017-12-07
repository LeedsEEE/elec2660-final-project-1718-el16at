//
//  AddTaskFormViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "AddTaskFormViewController.h"


@interface AddTaskFormViewController ()

@end

@implementation AddTaskFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SaveButton:(UIButton *)sender {
        NSArray *taskArray = [taskMethods searchTaskName:self.NameText.text];                   //makes an array of all the tasks with the name of the task the user is trying to add
    if ([taskArray count] >= 1) {                                                               //if there are any tasks with that task name already an aleart will apear
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Not Saved"
                                                                       message:@"Task with this name already exsits"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];                         //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
    } else {                                                                                    //if there are no existing tasks with the task name then the task will be saved
        NSDictionary *taskInfo = @{@"taskName": self.NameText.text,
                                   @"dueDate" : self.DatePicker.date,
                                   @"estimatedTime" : self.TimeHoursText.text,
                                   @"difficulty": self.DifficultyText.text};                    //adds the entered text and date to a dictionary
        
        [Task addTaskInfoFromDictionary:taskInfo];
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];     //defines appDelegate
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];              //creates fetch request
        NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
        NSError *saveError = nil;                                                                   //https://stackoverflow.com/questions/11878107/saving-coredata-permanently
        [[[appDelegate persistentContainer] viewContext] save:&saveError];                          //saves task permenantly
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Saved"
                                                                       message:@"Task saved"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                                  UIViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"mainMenu"];
                                                                  [self presentViewController:vc animated:YES completion:nil];}];   //https://stackoverflow.com/questions/16134361/how-to-call-a-view-controller-programmatically        this takes the user back to the main menu when ok is clicked
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];                             //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
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
