//
//  EventTableViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "EventTableViewController.h"

@interface EventTableViewController ()
{
    NSArray *fetchedEvents;
    
}
@property (nonatomic, strong) NSArray *fetchedEvents;

@end

@implementation EventTableViewController

@synthesize fetchedEvents;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    NSInteger numberOfRows;
    [eventMethods numberOfEvents];
    if (section == 0) {
        numberOfRows = eventMethods.numberOfEvents;
    }
    return numberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSManagedObjectContext * context = appDelegate.persistentContainer.viewContext;
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:context]; //gets all the events from the event entity
        NSError *error = nil;
        [request setEntity:entity];
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"eventDate"
                                                                       ascending:YES];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        [request setSortDescriptors:sortDescriptors];       //sorts all events by their date from earliest to latest https://stackoverflow.com/questions/11600571/what-is-the-best-way-to-sort-a-core-data-entity
        [request setEntity:entity];
        fetchedEvents = [context executeFetchRequest:request error:&error];//https://stackoverflow.com/questions/11110431/core-data-to-populate-uitableview-cant-get-a-nsstring
        Event *tempEvent = [fetchedEvents objectAtIndex: indexPath.row];    //makes temporary entity out of all the fetched events
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"MMMM dd, yyyy HH:mm"];
        NSString *detail = [format stringFromDate:[tempEvent valueForKey:@"eventDate"]];    //formats date how it needs to ne displayed
        cell.textLabel.text = tempEvent.eventName;                                          //displays all event names in the title cell of the table view
        cell.detailTextLabel.text = detail;                                                 //displays all the dates in the detail cell of the table view
        
    }
    
    return cell;
}
    


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowEvent"]) {
        EventViewController *dvc = [segue destinationViewController];           //defines the destination of segue
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];      //finds selected row
        if (indexPath.section == 0) {
            Event *tempEvent = [fetchedEvents objectAtIndex:indexPath.row];
            NSLog(@"Test event name is: %@",tempEvent.eventName);
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"MMMM dd, yyyy"];
            NSString *formattedDate = [format stringFromDate:[tempEvent valueForKey:@"eventDate"]];     //formats the date how i want it to be dispalayed
            NSDateFormatter *formatTime = [[NSDateFormatter alloc] init];
            [formatTime setDateFormat:@"HH:mm"];
            NSString *formattedTime = [formatTime stringFromDate:[tempEvent valueForKey:@"eventDate"]];     //formats the time how I want it to be displayed
            dvc.eventNameString = tempEvent.eventName;      //sets strings deffined in the TaskEventViewController  to the relevant data from the selected event
            dvc.eventDateString = formattedDate;
            dvc.eventTimeString = formattedTime;
        }
    }
}

@end
