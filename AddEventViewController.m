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
    
    
    NSArray *eventArray = [eventMethods searchEventName:self.AddEventText.text];                    //makes an array of all the events with the name of the event the user is trying to add
    if ([eventArray count] >= 1) {                                                                  //if an event with that name already exsists there will be an alert message
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Not Saved"
                                                                       message:@"Event with this name already exsits"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];                             //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
    }else {                                                                                         //if there are no exsisting events with this event name then the event will be saved
    
    NSDictionary *eventInfo = @{@"eventName": self.AddEventText.text, @"eventDate": self.AddDatePicker.date};                       //adds data entered to a dictionary
     [Event addEventInfoFromDictionary:eventInfo];
    
    //save data permenantly
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];         //defines appDelegate
    NSError *saveError = nil;                                                                       //https://stackoverflow.com/questions/11878107/saving-coredata-permanently
    [[[appDelegate persistentContainer] viewContext] save:&saveError];                              //saves event permenantly
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Saved"
                                                                   message:@"Event saved"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                              UIViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"mainMenu"];
                                                              [self presentViewController:vc animated:YES completion:nil];}];   //this takes the user back to the main menu when ok is clicked
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];                                //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
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
