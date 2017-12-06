//
//  AddTaskFormViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "AddTaskFormViewController.h"
#import "Task+AddTheTasks.h"
#import "Task+AddTheTasks.m"
#import "AppDelegate.h"
//#import "taskMethods.h"

@interface AddTaskFormViewController ()
@property (weak, nonatomic) IBOutlet UITextField *NameText;
@property (weak, nonatomic) IBOutlet UIDatePicker *DatePicker;
@property (weak, nonatomic) IBOutlet UITextField *TimeHoursText; //NEDD TO SORT TIE SO THAT HOURS AND MINUTES GO TO ONE TIME NOT GOING TO ADDTO DICITIONARY JUST YET WELL ILL ADD A TIME BUT NOT MINUTES
@property (weak, nonatomic) IBOutlet UITextField *TimeMinutesText;
@property (weak, nonatomic) IBOutlet UITextField *DifficultyText;
//@property (weak, nonatomic) IBOutlet UITextView *DisplayOutput;

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
    [taskMethods numberOfTasks];
    _calculatedTaskID =  taskMethods.numberOfTasks + 1;
    NSNumber *IDOfTask = [NSNumber numberWithInt:_calculatedTaskID]; //Converts int to NSNumber as core data cant save data type inthttps://forums.macrumors.com/threads/converting-an-int-into-an-nsnumber-then-saving-to-an-array.547952/
    
    
        NSArray *taskArray = [taskMethods searchTaskName:self.NameText.text];

        NSLog(@"count = %d", [taskArray count]);
        

    if ([taskArray count] >= 1) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Not Saved"
                                                                       message:@"Task with this name already exsits"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil]; //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
    } else {
        NSDictionary *taskInfo = @{@"taskName": self.NameText.text,
                                   @"dueDate" : self.DatePicker.date,
                                   @"estimatedTime" : self.TimeHoursText.text,
                                   @"difficulty": self.DifficultyText.text,
                                   @"taskID": IDOfTask};
        
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
                                                              handler:^(UIAlertAction * action) {}];
        
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
