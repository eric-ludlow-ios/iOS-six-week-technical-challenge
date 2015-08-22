//
//  ListViewController.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "ItemsViewController.h"
#import "MatchedViewController.h"
#import "ListAndItemController.h"
#import "Item.h"
#import "Stack.h"
#import "MatchedViewTableViewDataSource.h"
#import "ItemsViewTableViewDataSource.h"

@interface ItemsViewController () <UITableViewDelegate, MatchedViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ItemsViewTableViewDataSource *itemsDataSource = self.itemsTableView.dataSource;
    itemsDataSource.list = self.list;
    
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
                                                              
                                                              UITextField *textField = addNewItemNameAlert.textFields[0];
                                                              
                                                              Item *item = [[ListAndItemController sharedInstance] createItem];
                                                              item.nameOfItem = textField.text;
                                                              item.myList = self.list;
                                                              
                                                              [[ListAndItemController sharedInstance] save];
                                                              
                                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                                  
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
    
    MatchedViewController *destinationMatchedViewControllerInstance = segue.destinationViewController;
    
    destinationMatchedViewControllerInstance.delegate = self;
        
    destinationMatchedViewControllerInstance.list = self.list;

    if ([segue.identifier isEqualToString:@"segueAssignments"]) {
        
        destinationMatchedViewControllerInstance.matchType = MatchedViewMatchTypeAssign;
    }

    if ([segue.identifier isEqualToString:@"seguePairings"]) {
        
        destinationMatchedViewControllerInstance.matchType = MatchedViewMatchTypePair;
    }
    
    if ([segue.identifier isEqualToString:@"segueToList"]) {
        
        destinationMatchedViewControllerInstance.matchType = MatchedViewMatchTypeToList;
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
