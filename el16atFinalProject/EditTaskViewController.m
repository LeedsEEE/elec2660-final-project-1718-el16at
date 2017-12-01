//
//  EditTaskViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 30/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "EditTaskViewController.h"


@interface EditTaskViewController ()

@end

@implementation EditTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SearchTaskNameButton:(UIButton *)sender {
    /*
    //NSArray *taskToEdit = [taskMethods editTask:self.SearchTaskNameField.text];
    
   // Task *taskdata = [taskToEdit objectAtIndex:0]; //https://stackoverflow.com/questions/7314492/how-to-bind-textfields-to-attributes-of-one-core-data-entity-containing-one-row
    
    NSString *detail = [NSString stringWithFormat:@"%@ %@ %@", [tempTask valueForKey:@"difficulty"], [tempTask valueForKey:@"dueDate"], [tempTask valueForKey :@"estimatedTime"]];*/
    
    NSArray* taskArray = [taskMethods searchTaskName:self.SearchTaskNameField.text];
    NSDictionary* task = [taskArray objectAtIndex:0];
    NSLog(@">>FOUND TASK: %@", task);
    
    self.TaskNameField.text = [task objectForKey:@"taskName"];
    self.EditTimeField.text = [task objectForKey:@"estimatedTime"];
    self.EditDifficultyField.text = [task objectForKey:@"difficulty"];
    self.EditDueDate.date = [task objectForKey:@"dueDate"];
    
    
    
}



- (IBAction)SaveEditButton:(UIButton *)sender {
    
    [taskMethods deleteTask:self.SearchTaskNameField.text]; //deletes old object

    NSDictionary *taskInfo = @{@"taskName": self.TaskNameField.text,
                               @"dueDate" : self.EditDueDate.date,
                               @"estimatedTime" : self.EditTimeField.text,
                               @"difficulty": self.EditDifficultyField.text};
    [Task addTaskInfoFromDictionary:taskInfo];
    
    //save data permenantly
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];//
    NSError *saveError = nil;       //https://stackoverflow.com/questions/11878107/saving-coredata-permanently
    [[[appDelegate persistentContainer] viewContext] save:&saveError];
    
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
