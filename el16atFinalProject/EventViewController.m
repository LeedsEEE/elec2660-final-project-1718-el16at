//
//  EventViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "EventViewController.h"

@interface EventViewController ()

@end

@implementation EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void) viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    self.eventNameLabel.text = [NSString stringWithFormat:@"Name: %@", self.eventNameString];               //displays selected event from table view in labels
    self.dateLabel.text = [NSString stringWithFormat:@"Date: %@", self.eventDateString];
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %@", self.eventTimeString];
}


- (IBAction)eventCompleted:(UIButton *)sender {
    [eventMethods deleteEvent:self.eventNameString];                                                        //deletes the completed event
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Welldone Event completed"
                                                                   message:@"Completed Event will be removed from the Event File"
                                                            preferredStyle:UIAlertControllerStyleAlert];    //alert congradulating user on completing thier evnt
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                              UIViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"mainMenu"];
                                                              [self presentViewController:vc animated:YES completion:nil];}];    //sends user back to main menu after they have clicked ok
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];                                         //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Event"];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    NSError *saveError = nil;                                                                               //https://stackoverflow.com/questions/11878107/saving-coredata-permanently
    [[[appDelegate persistentContainer] viewContext] save:&saveError];                                      //saves that event has been completed (saves that event has been deleted)
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
