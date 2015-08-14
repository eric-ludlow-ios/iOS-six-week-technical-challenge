//
//  ListViewController.h
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "List.h"

@interface ListViewController : UIViewController

@property (strong, nonatomic) List *list;
@property (weak, nonatomic, readonly) IBOutlet UITableView *itemsTableView;

@end
