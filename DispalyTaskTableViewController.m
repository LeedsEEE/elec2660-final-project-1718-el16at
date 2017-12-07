//
//  DispalyTaskTableViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 28/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DispalyTaskTableViewController.h"

@interface DispalyTaskTableViewController ()
{
    NSArray *fetchedTasks;

}
@property (nonatomic, strong) NSArray *fetchedTasks;

@end

@implementation DispalyTaskTableViewController

@synthesize fetchedTasks;


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
    return 1;                   //sets number of sections to 1
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSInteger numberOfRows;
    [taskMethods numberOfTasks];                        //counts number of tasks
    if (section == 0) {
        numberOfRows = taskMethods.numberOfTasks;       //makes number of rows equal to number of tasks
    }
    return numberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell" forIndexPath:indexPath];
    

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
        [request setSortDescriptors:sortDescriptors];                                                               //Sorts all the tasks by their due date from earliest to latesthttps://stackoverflow.com/questions/11600571/what-is-the-best-way-to-sort-a-core-data-entity
        [request setEntity:entity];
        fetchedTasks = [context executeFetchRequest:request error:&error];                                          //https://stackoverflow.com/questions/11110431/core-data-to-populate-uitableview-cant-get-a-nsstring
        Task *tempTask = [fetchedTasks objectAtIndex: indexPath.row];                                               //makes temporary entity out of all of the fetched Tasks
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"MMMM dd, yyyy HH:mm"];
        NSString *detail = [format stringFromDate:[tempTask valueForKey:@"dueDate"]];       //formats the date to how it needs to be displayed
        cell.textLabel.text = tempTask.taskName;                                            //displays all the task names in the title cell of the table view
        cell.detailTextLabel.text = detail;                                                 //displays all the due dates in the detail cell of the table view

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowTask"]) {
        DisplayTasksViewController *dvc = [segue destinationViewController];        //defines the destination of segue
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];          //finds selected row
        if (indexPath.section == 0) {
            Task *tempTask = [fetchedTasks objectAtIndex:indexPath.row];        //just gets the task name from the text label
            NSLog(@"Test task name is: %@",tempTask.taskName);
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"MMMM dd, yyyy HH:mm"];
            NSString *formattedDate = [format stringFromDate:[tempTask valueForKey:@"dueDate"]];        //formats the date how I want it to be displayed
            dvc.taskString = tempTask.taskName;                                         //sets strings deffined in the TaskEventViewController  to the relevant data from the selected task
            dvc.dateString = formattedDate;
            dvc.diffcString = tempTask.difficulty;
            dvc.timeString = [NSString stringWithFormat:@"%hd" ,tempTask.estimatedTime];
        }
    }
}

@end
