//
//  EditTask.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 27/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "EditTask.h"
#import "Task+AddTheTasks.h"

@interface EditTask ()

@end

@implementation EditTask

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
NSEntityDescription *entity = [NSEntityDescription entityForName:@"entityname" inManagedObjectContext:context];
NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userID like %@",userID];
[fetchRequest setPredicate:predicate];
[fetchRequest setFetchLimit:1];
[fetchRequest setEntity:entity];
NSError *error;
NSArray *arrResult = [context executeFetchRequest:fetchRequest error:&error];
YourEntityname *entity = arrResult[0];
entity.userID = @"2"
[appdelegate saveContext]; //https://stackoverflow.com/questions/38458195/delete-and-update-data-in-core-data-in-ios
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