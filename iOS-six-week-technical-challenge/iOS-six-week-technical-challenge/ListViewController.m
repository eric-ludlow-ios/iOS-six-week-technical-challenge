//
//  ListViewController.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "ListViewController.h"
#import "MatchedViewController.h"
#import "ModelController.h"
#import "Item.h"
#import "Stack.h"

@interface ListViewController () <UITableViewDelegate, MatchedViewControllerDelegate>

@property (weak, nonatomic, readwrite) IBOutlet UITableView *itemsTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.list.nameOfList;
    
    self.editButton.title = @"Edit";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [self.itemsTableView reloadData];
}

- (IBAction)addNewItemButtonPressed:(id)sender {
    
    UIAlertController *addNewItemNameAlert = [UIAlertController alertControllerWithTitle:@"Add Item to List"
                                                                                 message:@"Type the name of a new person or item:"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [addNewItemNameAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        
        //configure text field prior to displaying?
    }];
    
    [addNewItemNameAlert addAction:[UIAlertAction actionWithTitle:@"Add"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              
                                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                                  UITextField *textField = addNewItemNameAlert.textFields[0];
                                                                  
                                                                  Item *item = [[ModelController sharedInstance] createItem];
                                                                  item.nameOfItem = textField.text;
                                                                  item.myList = self.list;
                                                                  
                                                                  [[ModelController sharedInstance] save];
                                                                  
                                                                  [self.itemsTableView reloadData];
                                                              });
                                                          }]];
    
    [addNewItemNameAlert addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                            style:UIAlertActionStyleDestructive
                                                          handler:nil]];
    
    [self.navigationController presentViewController:addNewItemNameAlert
                                            animated:YES
                                          completion:nil];
}

- (IBAction)editButtonPressed:(id)sender {
    
    BOOL shouldEdit;
    if (self.itemsTableView.editing == NO) {
        shouldEdit = YES;
        self.editButton.title = @"Done";
    } else {
        shouldEdit = NO;
        self.editButton.title = @"Edit";
    }
    
    [self.itemsTableView setEditing:shouldEdit animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"segueViewMatches"]) {
        
        MatchedViewController *matchedViewControllerInstance = segue.destinationViewController;
        
        matchedViewControllerInstance.list = self.list;
        matchedViewControllerInstance.delegate = self;
    }
}

- (void)matchedViewControllerDidFinish:(MatchedViewController *)matchedViewController {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

# pragma mark - table view delegate method

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.editing) {
        
        return UITableViewCellEditingStyleDelete;
    } else {
        
        return UITableViewCellEditingStyleNone;
    }
}

# pragma mark - memory warning method

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
