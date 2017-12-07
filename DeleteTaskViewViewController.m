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
    
    @try{
        NSArray* taskArray = [taskMethods searchTaskName:self.SearchTaskNameText.text];
        NSDictionary* task = [taskArray objectAtIndex:0];
        NSLog(@">>FOUND TASK: %@", task);
        self.taskNameLabel.text = [NSString stringWithFormat:@"Name: %@", [task objectForKey:@"taskName"]];
        NSLog(@"Test task name is: %@",[task objectForKey:@"dueDate"]);
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"MMMM dd, yyyy HH:mm"];
        NSString *formattedDate = [format stringFromDate:[task valueForKey:@"dueDate"]];
        self.dueDateLabel.text = [NSString stringWithFormat:@"Due Date: %@", formattedDate];
        self.timeLabel.text = [NSString stringWithFormat:@"Estimated Time: %@", [task objectForKey:@"estimatedTime"]];
        self.difficultyLabel.text = [NSString stringWithFormat:@"Difficulty: %@", [task objectForKey:@"difficulty"]];
    }
    @catch (NSException *exception) { //if no event is found it runs the code below showing an error mesage
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error 404"
                                                                       message:@"File not found"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil]; //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
    }
}
- (IBAction)DeleteButton:(UIButton*)sender {
    [taskMethods deleteTask:self.SearchTaskNameText.text];
    //save data permenantly
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];//
    NSError *saveError = nil;       //https://stackoverflow.com/questions/11878107/saving-coredata-permanently
    [[[appDelegate persistentContainer] viewContext] save:&saveError];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Task Deleted"
                                                                   message:@"Task has been removed from the Task File"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                              UIViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"mainMenu"];
                                                              [self presentViewController:vc animated:YES completion:nil];}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil]; //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
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
