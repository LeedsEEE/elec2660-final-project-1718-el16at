//
//  EditTaskViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 30/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "EditTaskViewController.h"


@interface EditTaskViewController ()
{
    NSArray *fetchedTasks;
    
}
@property (nonatomic, strong) NSArray *fetchedTasks;


@end

@implementation EditTaskViewController

@synthesize fetchedTasks;

- (void)viewDidLoad {
    [super viewDidLoad];
    [_CompletedSwitch setOn:NO animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)SearchTaskNameButton:(UIButton *)sender {
    
    
    @try{
        NSArray* taskArray = [taskMethods searchTaskName:self.SearchTaskNameField.text];
        NSDictionary* task = [taskArray objectAtIndex:0];
        NSLog(@">>FOUND TASK: %@", task);
        self.TaskNameField.text = [task objectForKey:@"taskName"];
        self.EditTimeField.text = [task objectForKey:@"estimatedTime"];
        self.EditDifficultyField.text = [task objectForKey:@"difficulty"];
        self.EditDueDate.date = [task objectForKey:@"dueDate"];
        
    }
    @catch (NSException *exception) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error 404"
                                                                       message:@"File not found"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil]; //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
        
    }
    

}



- (IBAction)SaveEditButton:(UIButton *)sender {
    
    [taskMethods deleteTask:self.SearchTaskNameField.text]; //deletes old object
    
    if ([_CompletedSwitch isOn]){
        NSLog(@"switch is on");
    } else {
    NSDictionary *taskInfo = @{@"taskName": self.TaskNameField.text,
                               @"dueDate" : self.EditDueDate.date,
                               @"estimatedTime" : self.EditTimeField.text,
                               @"difficulty": self.EditDifficultyField.text,
                               @"completed": [NSNumber numberWithBool:self.CompletedSwitch.on]};
    [Task addTaskInfoFromDictionary:taskInfo];
    
    //save data permenantly
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];//
    NSError *saveError = nil;       //https://stackoverflow.com/questions/11878107/saving-coredata-permanently
    [[[appDelegate persistentContainer] viewContext] save:&saveError];
        
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Saved"
                                                                       message:@"Task saved"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                              UIViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"mainMenu"];
                                                              [self presentViewController:vc animated:YES completion:nil];}];
        
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil]; //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
        

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
