//
//  MatchedViewController.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "MatchedViewController.h"
#import "MatchedViewTableViewDataSource.h"

@interface MatchedViewController ()

@property (weak, nonatomic, readwrite) IBOutlet UITableView *matchTableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItem;

@end

@implementation MatchedViewController

@synthesize navigationItem;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@: %@", self.list.nameOfList, self.subtitle];
}

- (IBAction)doneButtonPressed:(id)sender {
    
    [self.delegate matchedViewControllerDidFinish:self];
}

- (IBAction)refreshButtonPressed:(id)sender {
    
    MatchedViewTableViewDataSource *dataSource = self.matchTableView.dataSource;
    dataSource.randomArray = nil;
    
    [self.matchTableView reloadData];
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
