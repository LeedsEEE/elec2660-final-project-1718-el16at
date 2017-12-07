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
//#warning Incomplete implementation, return the number of sections
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    NSInteger numberOfRows;
    [taskMethods numberOfTasks];
    [eventMethods numberOfEvents];
    if (section == 0) {
        numberOfRows = taskMethods.numberOfTasks;
    } else if (section == 1) {
        numberOfRows = eventMethods.numberOfEvents;
    }
    return numberOfRows;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0) {
        return @"Tasks";
    } else  {
        return @"Events";
    }
} //https://stackoverflow.com/questions/7670038/add-separate-title-to-each-section-of-uitableview



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskEventCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (indexPath.section == 0) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSManagedObjectContext * context = appDelegate.persistentContainer.viewContext;
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:context];
        
        NSError *error = nil;
        [request setEntity:entity];
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"dueDate"
                                                                       ascending:YES];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        [request setSortDescriptors:sortDescriptors];       //https://stackoverflow.com/questions/11600571/what-is-the-best-way-to-sort-a-core-data-entity
        fetchedTasks = [context executeFetchRequest:request error:&error];
        [request setEntity:entity];
        fetchedTasks = [context executeFetchRequest:request error:&error];//https://stackoverflow.com/questions/11110431/core-data-to-populate-uitableview-cant-get-a-nsstring
        
        
        Task *tempTask = [fetchedTasks objectAtIndex: indexPath.row];
        
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"MMMM dd, yyyy HH:mm"];
        NSString *detail = [format stringFromDate:[tempTask valueForKey:@"dueDate"]];

        cell.textLabel.text = tempTask.taskName;
        cell.detailTextLabel.text = detail;
        
    }  else if (indexPath.section == 1) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSManagedObjectContext * context = appDelegate.persistentContainer.viewContext;
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:context];
        
        NSError *error = nil;
        [request setEntity:entity];
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"eventDate"
                                                                       ascending:YES];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        [request setSortDescriptors:sortDescriptors];       //https://stackoverflow.com/questions/11600571/what-is-the-best-way-to-sort-a-core-data-entity
        fetchedEvents = [context executeFetchRequest:request error:&error];
        
        
        [request setEntity:entity];
        fetchedEvents = [context executeFetchRequest:request error:&error];//https://stackoverflow.com/questions/11110431/core-data-to-populate-uitableview-cant-get-a-nsstring
        
        
        Event *tempEvent = [fetchedEvents objectAtIndex: indexPath.row];
        
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"MMMM dd, yyyy HH:mm"];
        NSString *detail = [format stringFromDate:[tempEvent valueForKey:@"eventDate"]];
        
        //NSString *detail = [NSString stringWithFormat:@"%@", [tempTask valueForKey:@"dueDate"]];
        cell.textLabel.text = tempEvent.eventName;
        cell.detailTextLabel.text = detail;
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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"ShowTaskEvent"]) {
        TaskEventViewController *dvc = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        if (indexPath.section == 0) {
            Task *tempTask = [fetchedTasks objectAtIndex:indexPath.row];        //just gets the task name from the text label
            NSLog(@"Test task name is: %@",tempTask.taskName);
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"MMMM dd, yyyy HH:mm"];
            NSString *formattedDate = [format stringFromDate:[tempTask valueForKey:@"dueDate"]];
            dvc.nameString = tempTask.taskName;
            dvc.dateString = formattedDate;
            dvc.diffcString = tempTask.difficulty;
            dvc.timeString = [NSString stringWithFormat:@"%hd" ,tempTask.estimatedTime];

        } else {
            Event *tempEvent = [fetchedEvents objectAtIndex:indexPath.row];        //just gets the task name from the text label
            NSLog(@"Test event name is: %@",tempEvent.eventName);
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"MMMM dd, yyyy"];
            NSString *formattedDate = [format stringFromDate:[tempEvent valueForKey:@"eventDate"]];
            NSDateFormatter *formatTime = [[NSDateFormatter alloc] init];
            [formatTime setDateFormat:@"HH:mm"];
            NSString *formattedTime = [formatTime stringFromDate:[tempEvent valueForKey:@"eventDate"]];
            dvc.nameString = tempEvent.eventName;
            dvc.dateString = formattedDate;
            dvc.timeString = formattedTime;
            
        }
    }
    
}


@end
