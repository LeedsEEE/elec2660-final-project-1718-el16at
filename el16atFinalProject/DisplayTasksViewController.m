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
    self.TaskNameLabel.text = [NSString stringWithFormat:@"Name: %@", self.taskString];     //displays selected task from table view in labels
    self.EstimatedTimeLabel.text = [NSString stringWithFormat:@"Estimated Time: %@", self.timeString];
    self.DueDateLabel.text = [NSString stringWithFormat:@"Due Date: %@", self.dateString];
    self.DifficutyLabel.text = [NSString stringWithFormat:@"Difficulty: %@", self.diffcString];
}



- (IBAction)completedButton:(UIButton *)sender {
    
    
    [taskMethods deleteTask:self.taskString];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Welldone Task completed"
                                                                   message:@"Completed Task will be removed from the Task File"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                              UIViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"mainMenu"];
                                                              [self presentViewController:vc animated:YES completion:nil];}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil]; //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller

    //save data permenantly
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];//
    NSError *saveError = nil;       //https://stackoverflow.com/questions/11878107/saving-coredata-permanently
    [[[appDelegate persistentContainer] viewContext] save:&saveError];

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    //etchedTasks.predicate = [NSPredicate predicateWithFormat:@"taskName = %@", self.taskEntity];
   // 
    //Task *taskEntity;
    /*
    self.TaskNameLabel.text = _taskEntity.taskName;
    self.DueDateLabel.text = [NSString stringWithFormat:@"%@", _taskEntity.dueDate];
    self.EstimatedTimeLabel.text = [NSString stringWithFormat:@"%hd",_taskEntity.estimatedTime];
    self.DifficutyLabel.text = _taskEntity.difficulty;
    
    */
    
    
    
    /*AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate]; //code is from https://stackoverflow.com/questions/10297542/how-to-get-all-records-from-coredata-base-using-nsmanagedobjectsubclass
    
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    
    
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Task"];
    
    NSError *error = nil;
    
    NSArray *results = [context executeFetchRequest:request error:&error];*/
    
    
    
  
    
    //if (error == nil) {
        
        //Deal with failure
    //}
   
    
    //[request release];
}



//forgot to push so need to add something



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
