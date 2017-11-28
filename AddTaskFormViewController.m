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
@property (weak, nonatomic) IBOutlet UITextView *DisplayOutput;

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
    //need to convertNSNumber to NSInteger
    /*int taskID;                             //https://stackoverflow.com/questions/22826563/objective-c-cant-convert-nsnumber-to-int
    taskID = [taskIDInteger intvalue];*/
    
    /*
    NSInteger *taskID = taskInfo [@"taskID"];            //second tutorial
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"task"];  //creates request to search through the database
    request.predicate = [NSPredicate predicateWithFormat:@"taskID = @%", taskID];
    taskID++;*/
    
    //////****************repeated code need to sort
    /*
+ (Task *)addTaskInfoFromDictionary :(NSDictionary *)taskInfo{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
        
        Task *taskEntity = nil; //first tutorial*/

    //NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"taskEntity"]; //code adapted from https://stackoverflow.com/questions/35578789/core-data-nsfetchrequest-within-specific-object-using-nspredicate
    //[NSPredicate predicateWithFormat : @"taskEntity.taskID"];
   // request.predicate = [NSPredicate predicateWithFormat:@"taskID = @%", taskID];
    
    /*taskMethods *taskMethod;
    taskMethod =[[taskMethods alloc] init];
    [taskMethod numberOfTasks:TaskCount];*/ //https://stackoverflow.com/questions/3572448/objective-c-call-function-on-another-class
    
    [taskMethods numberOfTasks];
    _calculatedTaskID =  taskMethods.numberOfTasks + 1;
    NSNumber *IDOfTask = [NSNumber numberWithInt:_calculatedTaskID]; //Converts int to NSNumber as core data cant save data type inthttps://forums.macrumors.com/threads/converting-an-int-into-an-nsnumber-then-saving-to-an-array.547952/
    


    
   
    NSDictionary *taskInfo = @{@"taskName": self.NameText.text,
                               @"dueDate" : self.DatePicker.date,
                               @"estimatedTime" : self.TimeHoursText.text,
                               @"difficulty": self.DifficultyText.text,
                               @"taskID": IDOfTask};
    
    self.DisplayOutput.text = [Task addTaskInfoFromDictionary:taskInfo].description;
    /*
    
    AppDelegate *appDelegate = (appDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;//

    NSError *error = nil;
    NSError *saveError = nil;
    NSArray *taskArray = [context executeFetchRequest:request error:&error];
    [[AppDelegate managedObjectContext] save:&saveError];*/
    
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
