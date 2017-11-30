//
//  DeleteTaskViewViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 28/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DeleteTaskViewViewController.h"

@interface DeleteTaskViewViewController ()

@end

@implementation DeleteTaskViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
- (IBAction)SearchTaskNameBtton:(UIButton*)sender {
    //[taskMethods searchTaskName:taskname];
    
    
    self.TaskNameField.text = [taskMethods searchTaskName:self.SearchTaskNameText.text].description;
    self.SelectedTaskOutput.text = [taskMethods searchTaskName:self.SearchTaskNameText.text].description;
    
    
}
- (IBAction)DeleteButton:(UIButton*)sender {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    NSArray *taskToDelete = [taskMethods searchTaskName:self.SearchTaskNameText.text];
    //[context deleteObject:taskToDelete];  //https://stackoverflow.com/questions/11039575/delete-object-in-core-data this line deletes the task that was delected
    
    /*+ (NSArray*)searchTaskName :(NSDictionary *)taskname {
        AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
        
        Task *taskEntity = nil; //first tutorial
        NSError *error;
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
        request.predicate = [NSPredicate predicateWithFormat:@"taskName == %@", taskname];
        NSArray *fetchedTask = [context executeFetchRequest:request error:&error];
        NSMutableArray *results = [[NSMutableArray alloc] init];
        for (taskEntity in fetchedTask) {
            [results addObject:[self createObjectFromEntity:taskEntity]];
        }
        return results;
    }
    + (NSDictionary *)createObjectFromEntity:(Task *)taskInfo
    {
        NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
        tempDict[@"taskName"] = taskInfo.taskName;
        tempDict[@"taskID"] = [NSString stringWithFormat:@"%D", taskInfo.taskID];
        tempDict[@"dueDate"] = taskInfo.dueDate;
        tempDict[@"displayColour"] = [NSString stringWithFormat:@"%D", taskInfo.displayColour];
        tempDict[@"estimatedTime"] = [NSString stringWithFormat:@"%D", taskInfo.estimatedTime];
        tempDict[@"difficulty"] = taskInfo.difficulty;
        tempDict[@"completed"] = [NSString stringWithFormat:@"%D",taskInfo.completed];
        return tempDict;
    }*/

    
    
    
    
   // NSArray *TaskToDelete =[taskMethods searchTaskName:self.SearchTaskNameText.text];
    
    //[[self managedObjectContext] deleteObject:[taskMethods searchTaskName:self.SearchTaskNameText.text]];
    
    
    /*for (NSManagedObject *managedObject in TaskToDelete)
    {
        [context deleteObject:managedObject]; //https://stackoverflow.com/questions/38458195/delete-and-update-data-in-core-data-in-ios
    }*/
    
    
    
    
    /*
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSManagedObjectContext * context = appDelegate.persistentContainer.viewContext;
    NSError *error;

    NSEntityDescription *Task = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"taskName == %@",taskName];
    [request setEntity:Task];
    [request setPredicate:predicate]
    
    NSError *error;
    NSArray *items = [context executeFetchRequest:fetchRequest error:&error];
    
    for (NSManagedObject *managedObject in items)
    {
        [context deleteObject:managedObject]; //https://stackoverflow.com/questions/38458195/delete-and-update-data-in-core-data-in-ios
    }*/

    
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
