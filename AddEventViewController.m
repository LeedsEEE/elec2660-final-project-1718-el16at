//
//  AddEventViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 01/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "AddEventViewController.h"

@interface AddEventViewController ()

@end

@implementation AddEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SaveEvent:(UIButton *)sender {
    
    
    NSArray *eventArray = [eventMethods searchEventName:self.AddEventText.text];
    
    if ([eventArray count] >= 1) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Not Saved"
                                                                       message:@"Event with this name already exsits"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil]; //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
    }else {
    
    NSDictionary *eventInfo = @{@"eventName": self.AddEventText.text, @"eventTimeHours": self.AddTimeHoursText.text, @"eventTimeMinutes": self.AddTimeMinutes.text, @"eventDate": self.AddDatePicker.date};
     [Event addEventInfoFromDictionary:eventInfo];
    
    //save data permenantly
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Event"];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];//
    NSError *saveError = nil;       //https://stackoverflow.com/questions/11878107/saving-coredata-permanently
    [[[appDelegate persistentContainer] viewContext] save:&saveError];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Saved"
                                                                   message:@"Event saved"
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
