//
//  ViewController.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "WorkbookViewController.h"
#import "ListViewController.h"
#import "XQListController.h"
#import "XQList.h"

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
                                                                  
                                                                  XQList *list = [[XQListController sharedInstance] createList];
                                                                  list.nameOfList = textField.text;
                                                                  [[XQListController sharedInstance] save];
                                                                  
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
        
        //NSIndexPath *indexPath = [self.listsTableView indexPathForSelectedRow];
        
        //to be implemented once the models and model controllers are up
//        destinationViewControllerInstance.entity = [EntityController sharedInstance].listOfEntities[indexPath.row];
        //for now...
        destinationViewControllerInstance.title = @"List 1";
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


@end


//Write a Pair Randomizer application that takes a list of objects and pairs them together. Potential use cases may be creating an app for Pair Programming teams, or matching people for a Secret Santa gift exchange. Add the following features:
//
//Add entities to a list
//Edit the entities
//Display a list of the added entities, with some visible annotation to convey that two of the entities have been paired together
//Include a button that allows me to randomize the list
//Persist the list of entities