//
//  MatchedViewTableViewDataSource.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "MatchedViewTableViewDataSource.h"
#import "MatchedViewTableViewCell.h"
#import "ModelController.h"
#import "Item.h"


@implementation MatchedViewTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self numberOfRows];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MatchedViewTableViewCell *matchedCell = [tableView dequeueReusableCellWithIdentifier:@"matchedItemsCell"];
    
    matchedCell.leadingLabel.text = self.randomArray[indexPath.row];
    matchedCell.matchedImageView.image = [UIImage imageNamed:@"arrows_back_forward"];
    matchedCell.trailingLabel.text = self.randomArray[((self.randomArray.count / 2) + indexPath.row)];
    
    return matchedCell;
}

- (NSArray *)items {
    
    return [ModelController sharedInstance].currentItems;
}

- (NSInteger)numberOfRows {
    
    return (self.randomArray.count / 2);
}

- (NSArray *)randomizeArray:(NSArray *)array {
    
    NSMutableArray *originalArray = [NSMutableArray new];
    
    for (Item *item in array) {
        [originalArray addObject:item.nameOfItem];
    }
    
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
        _randomArray = [self randomizeArray:[self items]];
        return _randomArray;
    } else {
        return _randomArray;
    }
}

@end
