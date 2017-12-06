//
//  DeleteEventViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 01/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DeleteEventViewController.h"


@interface DeleteEventViewController ()

@end

@implementation DeleteEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SearchEventButton:(UIButton *)sender {
   // self.OutputEventField.text= [eventMethods searchEventName:self.SearchEventField.text].description;
    @try{
        NSArray* eventArray = [eventMethods searchEventName:self.SearchEventField.text];
        NSDictionary* event = [eventArray objectAtIndex:0];
        NSLog(@">>FOUND TASK: %@", event);
        self.eventNameLabel.text = [event objectForKey:@"eventName"];
        NSLog(@"Test event name is: %@",[event objectForKey:@"eventDate"]);
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"MMMM dd, yyyy HH:mm"];
        NSString *formattedDate = [format stringFromDate:[event valueForKey:@"eventDate"]];
        self.dateLabel.text = formattedDate;
        
        
    }
    @catch (NSException *exception) { //if no event is found it runs the code below showing an error mesage
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error 404"
                                                                       message:@"File not found"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil]; //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
    }

    
}


- (IBAction)DeleteButton:(UIButton *)sender {
    [eventMethods deleteEvent:self.SearchEventField.text];
    
    //save data permenantly
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Event"];
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];//
    NSError *saveError = nil;       //https://stackoverflow.com/questions/11878107/saving-coredata-permanently
    [[[appDelegate persistentContainer] viewContext] save:&saveError];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Event Deleted"
                                                                   message:@"Event has been removed fromthe Event File"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                              UIViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"mainMenu"];
                                                              [self presentViewController:vc animated:YES completion:nil];}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil]; //https://stackoverflow.com/questions/42173060/how-to-use-uialertcontroller
    


    
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
