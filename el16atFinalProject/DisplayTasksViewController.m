//
//  DisplayTasksViewController.m
//  el16atFinalProject
//
//  Created by Alice Tiler [el16at] on 27/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DisplayTasksViewController.h"

@interface DisplayTasksViewController ()

@end

@implementation DisplayTasksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate]; //code is from https://stackoverflow.com/questions/10297542/how-to-get-all-records-from-coredata-base-using-nsmanagedobjectsubclass
    
    NSManagedObjectContext *context = [[appDelegate persistentContainer] viewContext];
    
    
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Task"];
    
    NSError *error = nil;
    
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    
    
  
    
    if (error == nil) {
        
        //Deal with failure
    }
   
    
    //[request release];
}



//forgot to push so need to add something



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
