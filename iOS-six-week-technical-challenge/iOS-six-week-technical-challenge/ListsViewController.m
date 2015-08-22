//
//  ViewController.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "ListsViewController.h"
#import "ItemsViewController.h"
#import "ListAndItemController.h"
#import "List.h"
#import "ItemsViewTableViewDataSource.h"

@interface ListsViewController () <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *listsTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@end

@implementation ListsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.editButton.title = @"Edit";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    //do i need this here?
    [self.listsTableView reloadData];
}

- (IBAction)addNewListPressed:(id)sender {
    
    UIAlertController *addNewListNameAlert = [UIAlertController alertControllerWithTitle:@"New List"
                                                                                 message:@"Type the name of a new list:"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [addNewListNameAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        
        textField.placeholder = @"'iOS3 Cohort' or 'Th Night Pickup Group'";
    }];
    
    [addNewListNameAlert addAction:[UIAlertAction actionWithTitle:@"Add"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              
                                                              UITextField *textField = addNewListNameAlert.textFields[0];
                                                              
                                                              List *list = [[ListAndItemController sharedInstance] createList];
                                                              list.nameOfList = textField.text;
                                                              [[ListAndItemController sharedInstance] save];

                                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                                  
                                                                  [self.listsTableView reloadData];
                                                              });
                                                          }]];
    
    [addNewListNameAlert addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                            style:UIAlertActionStyleDestructive
                                                          handler:nil]];
    
    [self.navigationController presentViewController:addNewListNameAlert
                                            animated:YES
                                          completion:nil];
}

- (IBAction)editButtonPressed:(id)sender {
    
    BOOL shouldEdit;
    if (self.listsTableView.editing == NO) {
        shouldEdit = YES;
        self.editButton.title = @"Done";
    } else {
        shouldEdit = NO;
        self.editButton.title = @"Edit";
    }
    
    [self.listsTableView setEditing:shouldEdit animated:YES];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"segueViewList"]) {
        
        ItemsViewController *destinationItemsViewControllerInstance = segue.destinationViewController;
        ItemsViewTableViewDataSource *itemsDataSource = destinationItemsViewControllerInstance.itemsTableView.dataSource;

        NSIndexPath *indexPath = [self.listsTableView indexPathForSelectedRow];
        
        List *list = [ListAndItemController sharedInstance].allLists[indexPath.row];
        
        destinationItemsViewControllerInstance.list = list;
        itemsDataSource.list = list;
    }
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

@end


