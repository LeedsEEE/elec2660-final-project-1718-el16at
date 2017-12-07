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
    [_completedSwitch setOn:NO animated:YES];       //sets UIswitch to off
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)SearchEventNameButton:(UIButton *)sender {
    
    @try{
    NSArray* eventArray = [eventMethods searchEventName:self.SearchNameFeild.text];             //makes an array of the event searched for in SearchNameFeild
    NSDictionary* event = [eventArray objectAtIndex:0];                                         //gets first event from array (there will only be one event in the array)
    self.EditNameField.text = [event objectForKey:@"eventName"];                                //displays event in fext field and picker
    self.EditDatePicker.date = [event objectForKey:@"eventDate"];

        
    }
    @catch (NSException *exception) {                                                           //if no event is found it runs the code below showing an error mesage
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error 404"
                                                                       message:@"File not found"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];                         //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
    }
        
}

- (IBAction)SaveEdit:(UIButton *)sender {
    [eventMethods deleteEvent:self.SearchNameFeild.text];                       //deletes unedited event
    
    if ([_completedSwitch isOn]){                                               //if switch is on nothing is saved and event has just been deleted
        NSLog(@"switch is on");
    } else {
    NSDictionary *eventInfo = @{@"eventName": self.EditNameField.text,
                               @"eventDate" : self.EditDatePicker.date};        //makes new event into dictionary
    [Event addEventInfoFromDictionary:eventInfo];
    
    //save data permenantly
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Event"];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    NSError *saveError = nil;                                                               //https://stackoverflow.com/questions/11878107/saving-coredata-permanently
    [[[appDelegate persistentContainer] viewContext] save:&saveError];                      //saves edited event permenantly in event entity
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Saved"
                                                                       message:@"Event saved"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                              UIViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"mainMenu"];
                                                              [self presentViewController:vc animated:YES completion:nil];}];
        
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil]; //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
    //alert saying the event has been saved then sends the user back to the main menu
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
