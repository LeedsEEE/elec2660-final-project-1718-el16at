//
//  EditEventViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 01/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "EditEventViewController.h"

@interface EditEventViewController ()

@end

@implementation EditEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)SearchEventNameButton:(UIButton *)sender {
    NSArray* eventArray = [eventMethods searchEventName:self.SearchNameFeild.text];
    NSDictionary* event = [eventArray objectAtIndex:0];
    NSLog(@">>FOUND TASK: %@", event);
    
    self.EditNameField.text = [event objectForKey:@"eventName"];
    //self.EditTimeField.text = [task objectForKey:@"estimatedTime"];
    //self.EditDifficultyField.text = [task objectForKey:@"difficulty"];
    self.EditDatePicker.date = [event objectForKey:@"eventDate"];
    
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
