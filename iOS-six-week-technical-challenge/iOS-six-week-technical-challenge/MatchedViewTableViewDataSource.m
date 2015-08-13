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
    
    return [self numberOfRows];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MatchedViewTableViewCell *matchedCell = [tableView dequeueReusableCellWithIdentifier:@"matchedEntitiesCell"];
    
    //for now, just use textLabel:
    matchedCell.leadingLabel.text = self.randomArray[indexPath.row];
    matchedCell.imageView.image = [UIImage imageNamed:@"arrows_back_forward"];
    matchedCell.trailingLabel.text = self.randomArray[((self.randomArray.count / 2) + indexPath.row)];
    
    return matchedCell;
}

- (NSArray *)fakeData {
    
    return @[@"student 1", @"student 2", @"student 3", @"student 4", @"student 5"];
}

- (NSInteger)numberOfRows {
    
    return (self.randomArray.count / 2);
}

- (NSArray *)randomizeArray:(NSArray *)array {
    
    NSMutableArray *originalArray = [NSMutableArray arrayWithArray:array];
    
    if ((array.count % 2) != 0) {
        [originalArray addObject:@"Wildcard"];
    }
    
    NSMutableArray *randomizedArray = [NSMutableArray new];
    
    int i = 1;
    
    for (NSString *string in originalArray) {
        
        [randomizedArray insertObject:string atIndex:arc4random_uniform(i)];
        i++;
    }
    return randomizedArray;
}

- (NSArray *)randomArray {
    
    if (!_randomArray) {
        _randomArray = [self randomizeArray:[self fakeData]];
        return _randomArray;
    } else {
        return _randomArray;
    }
}

@end
