//
//  ListViewController.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)addNewEntityButtonPressed:(id)sender {
    
    UIAlertController *addNewEntityNameAlert = [UIAlertController alertControllerWithTitle:@"Add Entity to List"
                                                                                 message:@"Type the name of a new entity:"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [addNewEntityNameAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        
        //add code here to add new list name to listArray?
    }];
    
    [addNewEntityNameAlert addAction:[UIAlertAction actionWithTitle:@"Add"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              
                                                              //add code here to add new list name to listArray?
                                                          }]];
    
    [addNewEntityNameAlert addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                            style:UIAlertActionStyleDestructive
                                                          handler:nil]];
    
    [self.navigationController presentViewController:addNewEntityNameAlert
                                            animated:YES
                                          completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
