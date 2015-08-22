//
//  ListViewController.h
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "List.h"

@interface ItemsViewController : UIViewController

//should be able to delete this public property??
@property (weak, nonatomic) IBOutlet UITableView *itemsTableView;

@property (strong, nonatomic) List *list;

@end
