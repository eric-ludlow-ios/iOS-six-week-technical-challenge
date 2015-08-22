//
//  ListViewTableViewDataSource.h
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
#import "List.h"

@interface ItemsViewTableViewDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic)List *list;

@end
