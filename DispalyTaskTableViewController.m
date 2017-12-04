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
    NSArray *data;
}
@property (nonatomic, strong) NSArray *fetchedTasks;
@property (strong, nonatomic) NSArray *data;

@end

@implementation DispalyTaskTableViewController

@synthesize fetchedTasks;
@synthesize data;

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

    NSInteger numberOfRows;
    [taskMethods numberOfTasks];
    if (section == 0) {
        numberOfRows = taskMethods.numberOfTasks;
    }
    return numberOfRows;
}

/*
- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - %@",
            [super description], Task.dueDate];
}*/


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell" forIndexPath:indexPath];
    

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
        [request setSortDescriptors:sortDescriptors];
        
        fetchedTasks = [context executeFetchRequest:request error:&error];
        
        
        
        for(Task *t in fetchedTasks){ //////////
            NSLog(@" %@", t.dueDate);
        }
        
        
      //  [fetchedTasks objectAtIndex:0];
        [request setEntity:entity];
        fetchedTasks = [context executeFetchRequest:request error:&error];//https://stackoverflow.com/questions/11110431/core-data-to-populate-uitableview-cant-get-a-nsstring


        Task *tempTask = [fetchedTasks objectAtIndex: indexPath.row];
        
       // NSDate *theDate =[tempTask valueForKey:@"dueDate"];
        //NSString *formattedDate = [taskMethods formatDate: theDate];
        //NSString *detail = [NSString stringWithFormat:@"%@", formattedDate];
    
        
        
        NSString *detail = [NSString stringWithFormat:@"%@", [tempTask valueForKey:@"dueDate"]];
        cell.textLabel.text = tempTask.taskName;
        cell.detailTextLabel.text = detail;

    }
    
    return cell;
}


// NSError *error = nil;
//[request setEntity:entity];
//fetchedTasks = [context executeFetchRequest:request error:&error];

//NSArray *arrayForAllAlarms = [managedObjectContext executeFetchRequest:fetchRequest error:&error];

//  [taskMethods datesToOrder:]


//NSDateFormatter *format = [[NSDateFormatter alloc] init];
//[format setDateFormat:@"MMMM dd, yyyy (EEEE) HH:mm:ss z Z"];
//NSDate *now = [NSDate date];
//NSString *nsstr = [format stringFromDate:now];

/*
 NSArray *sortedTaskArray = [tempTask sortedArrayUsingComparator:^NSComparisonResult(tempTask *tempTask1, tempTask *tempTask2) {
 return [[tempTask1.dueDate compare:tempTask2.dueDate];
 }];*/
/* NSLog(@"nodeEventArray == %@", tempTask);
 NSSortDescriptor *dateDescriptor = [NSSortDescriptor
 sortDescriptorWithKey:@"dueDate"
 ascending:YES];
 NSArray *sortDescriptors = [NSArray arrayWithObject:dateDescriptor];
 NSArray *sortedtaskArray = [tempTask
 sortedArrayUsingDescriptors:sortDescriptors];
 NSLog(@"sortedEventArray == %@", tempTask);*/ //https://stackoverflow.com/questions/6083408/sort-nsarray-of-custom-objects-by-their-nsdate-properties

//NSSortDescriptor *dateDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"dueDate" ascending:YES selector:@selector(compare:)];  //https://stackoverflow.com/questions/6083408/sort-nsarray-of-custom-objects-by-their-nsdate-properties



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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
