//
//  MatchedViewTableViewDataSource.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "MatchedViewTableViewDataSource.h"
#import "MatchedViewTableViewCell.h"

@implementation MatchedViewTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MatchedViewTableViewCell *matchedCell = [tableView dequeueReusableCellWithIdentifier:@"matchedEntitiesCell"];
    
    //for now, just use textLabel:
    matchedCell.textLabel.text = @"Entity 1 <---> Entity 2";
    
    return matchedCell;
}

@end
