//
//  AddTaskFormViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "AddTaskFormViewController.h"
#import "Task+AddTheTasks.h"

@interface AddTaskFormViewController ()
@property (weak, nonatomic) IBOutlet UITextField *NameText;
@property (weak, nonatomic) IBOutlet UITextField *DateDayText;//DATE
@property (weak, nonatomic) IBOutlet UITextField *DateMonthText; //DATE
@property (weak, nonatomic) IBOutlet UITextField *DateYearText; //DATE
@property (weak, nonatomic) IBOutlet UITextField *TimeHoursText; //NEDD TO SORT TIE SO THAT HOURS AND MINUTES GO TO ONE TIME NOT GOING TO ADDTO DICITIONARY JUST YET WELL ILL ADD A TIME BUT NOT MINUTES
@property (weak, nonatomic) IBOutlet UITextField *TimeMinutesText;
@property (weak, nonatomic) IBOutlet UITextField *DifficultyText;
@property (weak, nonatomic) IBOutlet UITextView *DisplayOutput;

@end

@implementation AddTaskFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
    - (IBAction)SaveButton:(UIButton *)sender {
        NSDictionary *taskInfo = @{@"taskName": self.NameText.text, @"dueDate" : self.DateDayText.text,  @"estimatedTime" : self.TimeHoursText.text, @"difficulty": self.DifficultyText.text};
        
        [Task addTaskInfoFromDictionary:taskInfo];
    }*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SaveButton:(UIButton *)sender {
    /*
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd.MMM.yy"];
    
    NSDate *date = (NSDate *) [NSManagedObject valueForKey:@"dueDate"];*/
    
    //NSLog(@"theDate: |%@| \n", [dateFormat stringFromDate:date]);//output is null
   
    NSDictionary *taskInfo = @{@"taskName": self.NameText.text, @"dueDate" : self.DateDayText.text,  @"estimatedTime" : self.TimeHoursText.text, @"difficulty": self.DifficultyText.text};
    
    [Task addTaskInfoFromDictionary:taskInfo];
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
