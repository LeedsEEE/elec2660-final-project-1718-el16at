//
//  TaskEventTableViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "TaskEventTableViewController.h"

@interface TaskEventTableViewController ()
{
    NSArray *fetchedTasks;
    NSArray *fetchedEvents;
    
}
@property (nonatomic, strong) NSArray *fetchedTasks;
@property (nonatomic, strong) NSArray *fetchedEvents;

@end


@implementation TaskEventTableViewController

@synthesize fetchedTasks;
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows;
    [taskMethods numberOfTasks];
    [eventMethods numberOfEvents];
    if (section == 0) {                                 //makes first section have the same amount of rows as tasks
        numberOfRows = taskMethods.numberOfTasks;
    } else if (section == 1) {                          //makes second section have same amount of rows as events
        numberOfRows = eventMethods.numberOfEvents;
    }
    return numberOfRows;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0) {      //gives the sections titles
        return @"Tasks";
    } else  {
        return @"Events";
    }
} //https://stackoverflow.com/questions/7670038/add-separate-title-to-each-section-of-uitableview



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskEventCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSManagedObjectContext * context = appDelegate.persistentContainer.viewContext;
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:context];   //gets all of the tasks from the task entity
        NSError *error = nil;
        [request setEntity:entity];
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"dueDate"
                                                                       ascending:YES];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        [request setSortDescriptors:sortDescriptors];                                           //Sorts all the tasks by their due date from earliest to latest https://stackoverflow.com/questions/11600571/what-is-the-best-way-to-sort-a-core-data-entity
        [request setEntity:entity];
        fetchedTasks = [context executeFetchRequest:request error:&error];                      //https://stackoverflow.com/questions/11110431/core-data-to-populate-uitableview-cant-get-a-nsstring
        Task *tempTask = [fetchedTasks objectAtIndex: indexPath.row];                           //makes temporary entity out of all of the fetched Tasks
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"MMMM dd, yyyy HH:mm"];
        NSString *detail = [format stringFromDate:[tempTask valueForKey:@"dueDate"]];           //formats the date to how it needs to be displayed
        cell.textLabel.text = tempTask.taskName;                                                //displays all the task names in the title cell of the table view
        cell.detailTextLabel.text = detail;                                                     //displays all the due dates in the detail cell of the table view
        
    }  else if (indexPath.section == 1) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSManagedObjectContext * context = appDelegate.persistentContainer.viewContext;
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:context];  //gets all the events from the event entity
        NSError *error = nil;
        [request setEntity:entity];
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"eventDate"
                                                                       ascending:YES];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        [request setSortDescriptors:sortDescriptors];                                           //sorts all events by their date from earliest to latest https://stackoverflow.com/questions/11600571/what-is-the-best-way-to-sort-a-core-data-entity
        [request setEntity:entity];
        fetchedEvents = [context executeFetchRequest:request error:&error];                     //https://stackoverflow.com/questions/11110431/core-data-to-populate-uitableview-cant-get-a-nsstring
        Event *tempEvent = [fetchedEvents objectAtIndex: indexPath.row];                        //makes temporary entity out of all the fetched events
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"MMMM dd, yyyy HH:mm"];
        NSString *detail = [format stringFromDate:[tempEvent valueForKey:@"eventDate"]];        //formats date how it needs to be displayed
        cell.textLabel.text = tempEvent.eventName;                                              //displays all the event names in the title cell of the table view
        cell.detailTextLabel.text = detail;                                                     //displays all the dates in the detail cell of the table view
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
    if ([[segue identifier] isEqualToString:@"ShowTaskEvent"]) {
        TaskEventViewController *dvc = [segue destinationViewController];       //defines the destination of segue
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];      //finds selected row
        if (indexPath.section == 0) {                                           //if a task was selected
            Task *tempTask = [fetchedTasks objectAtIndex:indexPath.row];
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"MMMM dd, yyyy HH:mm"];
            NSString *formattedDate = [format stringFromDate:[tempTask valueForKey:@"dueDate"]];    //formats the date how I want it to be displayed
            dvc.nameString = tempTask.taskName;                                                     //sets strings deffined in the TaskEventViewController  to the relevant data from the selected task
            dvc.dateString = formattedDate;
            dvc.diffcString = tempTask.difficulty;
            dvc.timeString = [NSString stringWithFormat:@"%hd" ,tempTask.estimatedTime];
            dvc.taskOrEvent = 1;

        } else {                                                                                            //if an event was selected
            Event *tempEvent = [fetchedEvents objectAtIndex:indexPath.row];
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"MMMM dd, yyyy"];
            NSString *formattedDate = [format stringFromDate:[tempEvent valueForKey:@"eventDate"]];         //formates the date how I want it to be displayed
            NSDateFormatter *formatTime = [[NSDateFormatter alloc] init];
            [formatTime setDateFormat:@"HH:mm"];
            NSString *formattedTime = [formatTime stringFromDate:[tempEvent valueForKey:@"eventDate"]];     //formats the time how I want it to be displayed
            dvc.nameString = tempEvent.eventName;                                                           //sets strings deffined in the TaskEventViewController  to the relevant data from the selected event
            dvc.dateString = formattedDate;
            dvc.timeString = formattedTime;
            
        }
    }
    
}


@end
