//
//  ListViewController.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "ListViewController.h"
#import "MatchedViewController.h"
#import "XQListController.h"
#import "XQEntity.h"
#import "Stack.h"

@interface ListViewController () <UITableViewDelegate, MatchedViewControllerDelegate>

@property (weak, nonatomic, readwrite) IBOutlet UITableView *entitiesTableView;
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
    
    [self.entitiesTableView reloadData];
}

- (IBAction)addNewEntityButtonPressed:(id)sender {
    
    UIAlertController *addNewEntityNameAlert = [UIAlertController alertControllerWithTitle:@"Add Entity to List"
                                                                                 message:@"Type the name of a new entity:"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [addNewEntityNameAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        
        //configure text field prior to displaying?
    }];
    
    [addNewEntityNameAlert addAction:[UIAlertAction actionWithTitle:@"Add"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              
                                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                                  UITextField *textField = addNewEntityNameAlert.textFields[0];
                                                                  
                                                                  NSEntityDescription *nsEntity = [NSEntityDescription entityForName:@"XQEntity" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
                                                                  
                                                                  XQEntity *entity = [[XQEntity alloc] initWithEntity:nsEntity insertIntoManagedObjectContext:[Stack sharedInstance].managedObjectContext];
                                                                  entity.nameOfEntity = textField.text;
                                                                  entity.entityList = self.list;
                                                                  
                                                                  [[XQListController sharedInstance] save];
                                                                  
                                                                  [self.entitiesTableView reloadData];
                                                              });
                                                          }]];
    
    [addNewEntityNameAlert addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                            style:UIAlertActionStyleDestructive
                                                          handler:nil]];
    
    [self.navigationController presentViewController:addNewEntityNameAlert
                                            animated:YES
                                          completion:nil];
}

- (IBAction)editButtonPressed:(id)sender {
    
    BOOL shouldEdit;
    if (self.entitiesTableView.editing == NO) {
        shouldEdit = YES;
        self.editButton.title = @"Done";
    } else {
        shouldEdit = NO;
        self.editButton.title = @"Edit";
    }
    
    [self.entitiesTableView setEditing:shouldEdit animated:YES];
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
