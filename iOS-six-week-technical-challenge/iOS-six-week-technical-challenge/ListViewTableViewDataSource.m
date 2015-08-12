//
//  ListViewTableViewDataSource.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "ListViewTableViewDataSource.h"

@implementation ListViewTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *entityCell = [tableView dequeueReusableCellWithIdentifier:@"entityCell"];
    
    entityCell.textLabel.text = @"Entity 1";
    
    return entityCell;
}

@end
