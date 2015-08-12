//
//  WorkbookViewTableViewDataSource.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "WorkbookViewTableViewDataSource.h"

@implementation WorkbookViewTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *listCell = [tableView dequeueReusableCellWithIdentifier:@"listCell"];
    
    listCell.textLabel.text = @"List 1";
    
    return listCell;
}

@end
