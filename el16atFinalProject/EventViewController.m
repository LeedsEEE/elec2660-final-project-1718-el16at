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
    self.eventNameLabel.text = self.eventNameString;
    self.timeLabel.text = self.eventDateString;
}


- (IBAction)eventCompleted:(UIButton *)sender {
    [eventMethods deleteEvent:self.eventNameString];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Welldone Event completed"
                                                                   message:@"Completed Event will be removed fromthe Event File"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil]; //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Event"];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];//
    NSError *saveError = nil;       //https://stackoverflow.com/questions/11878107/saving-coredata-permanently
    [[[appDelegate persistentContainer] viewContext] save:&saveError];
    
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
