//
//  DeleteTaskViewViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 28/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DeleteTaskViewViewController.h"

@interface DeleteTaskViewViewController ()

@end

@implementation DeleteTaskViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
- (IBAction)SearchTaskNameBtton:(UIButton*)sender {
    //[taskMethods searchTaskName:taskname];
    
    
    self.TaskNameField.text = [taskMethods searchTaskName:self.SearchTaskNameText.text].description;
    self.SelectedTaskOutput.text = [taskMethods searchTaskName:self.SearchTaskNameText.text].description;
    
    
}


/*NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
NSEntityDescription *entity = [NSEntityDescription entityForName:@"entityname" inManagedObjectContext:context];
NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userID like %@",userID];
[fetchRequest setEntity:entity];
[fetchRequest setPredicate:predicate]

NSError *error;
NSArray *items = [context executeFetchRequest:fetchRequest error:&error];

for (NSManagedObject *managedObject in items)
{
    [context deleteObject:managedObject]; //https://stackoverflow.com/questions/38458195/delete-and-update-data-in-core-data-in-ios
}*/











/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
