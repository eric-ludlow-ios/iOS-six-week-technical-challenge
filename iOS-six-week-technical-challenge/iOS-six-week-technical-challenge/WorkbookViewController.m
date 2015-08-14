//
//  ViewController.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "WorkbookViewController.h"
#import "ListViewController.h"
#import "ModelController.h"
#import "List.h"
#import "ListViewTableViewDataSource.h"

@interface WorkbookViewController () <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *listsTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@end

@implementation WorkbookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.editButton.title = @"Edit";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [self.listsTableView reloadData];
}

- (IBAction)addNewListPressed:(id)sender {
    
    UIAlertController *addNewListNameAlert = [UIAlertController alertControllerWithTitle:@"Add List"
                                                                                 message:@"Type the name of a new list:"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [addNewListNameAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        
        //configure text field prior to displaying?
    }];
    
    [addNewListNameAlert addAction:[UIAlertAction actionWithTitle:@"Add"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              
                                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                                  UITextField *textField = addNewListNameAlert.textFields[0];
                                                                  
                                                                  List *list = [[ModelController sharedInstance] createList];
                                                                  list.nameOfList = textField.text;
                                                                  [[ModelController sharedInstance] save];
                                                                  
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
        
        ListViewController *destinationViewControllerInstance = segue.destinationViewController;
        
        NSIndexPath *indexPath = [self.listsTableView indexPathForSelectedRow];
        
        List *list = [ModelController sharedInstance].allLists[indexPath.row];
        
        destinationViewControllerInstance.title = list.nameOfList;
        
        [ModelController sharedInstance].currentList = list;
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


