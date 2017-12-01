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
    NSDictionary *taskname;
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *taskEntity = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"taskName == %@",taskname];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setFetchLimit:1];
    [fetchRequest setEntity:taskEntity];
    NSError *error;
    NSArray *arrResult = [context executeFetchRequest:fetchRequest error:&error];
    Task *entity = arrResult[0];
    //entity.userID = @"2"
    //[appdelegate saveContext];*/
    
    //self.TaskNameField.text = entity.taskName;
    
    
    
    //}

    
    //taskEntityEdit = [fetchedTask objectAtIndex:0];

    
    //NSArray *taskToEdit = [taskMethods editTask:self.SearchTaskNameField.text];
    
   // Task *taskdata = [taskToEdit objectAtIndex:0]; //https://stackoverflow.com/questions/7314492/how-to-bind-textfields-to-attributes-of-one-core-data-entity-containing-one-row
    
   /* NSString *detail = [NSString stringWithFormat:@"%@ %@ %@", [tempTask valueForKey:@"difficulty"], [tempTask valueForKey:@"dueDate"], [tempTask valueForKey :@"estimatedTime"]];*/
    
    NSArray* taskArray = [taskMethods searchTaskName:self.SearchTaskNameField.text];
    NSDictionary* task = [taskArray objectAtIndex:0];
    NSLog(@">>FOUND TASK: %@", task);
    
//    NSLog(@"%@---------------------------------", self.SearchTaskNameField.text);
//    NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
//   
//    tempDict[@"Temp"] = self.SearchTaskNameField.text;
    self.TaskNameField.text = [task objectForKey:@"taskName"];
    self.EditTimeField.text = [task objectForKey:@"estimatedTime"];

    //Task *taskEntity = [taskMethods editTask:tempDict];
    
    
    
     //Task *taskEntity = [taskMethods editTask:self.SearchTaskNameField.text];
    
    //self.TaskNameField.text = taskEntity.taskName;
    
    
    
    
    
    
    //NSString *estimatedTimeString = [[NSNumber [editEntity.estimatedTime]]stringValue];
    //self.EditTimeField.text = editEntity.estimatedTime;
    //self.EditTimeField.text = [NSString stringWithFormat:@"%D", editEntity.estimatedTime];
    
    
    
    
    
    
    //self.TaskNameField.text = [taskMethods searchTaskName:self.SearchTaskNameField.text];
    
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
