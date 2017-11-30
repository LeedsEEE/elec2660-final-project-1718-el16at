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
    

    //NSArray *taskToEdit =[taskMethods searchTaskName:self.SearchTaskNameField.text];
    NSArray *taskToEdit = [taskMethods searchTaskName:self.SearchTaskNameField.text];
    
    Task *taskdata = [taskToEdit objectAtIndex:0]; //https://stackoverflow.com/questions/7314492/how-to-bind-textfields-to-attributes-of-one-core-data-entity-containing-one-row
    
   /* NSString *detail = [NSString stringWithFormat:@"%@ %@ %@", [tempTask valueForKey:@"difficulty"], [tempTask valueForKey:@"dueDate"], [tempTask valueForKey :@"estimatedTime"]];*/

    self.TaskNameField.text = taskdata.taskName;
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
