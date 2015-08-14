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
    
    switch ([ModelController sharedInstance].matchType) {
        case MatchedViewMatchTypeAssign: {
            
            Item *item = [self items][indexPath.row];
            matchedCell.leadingLabel.text = item.nameOfItem;
            matchedCell.matchedImageView.image = [UIImage imageNamed:@"arrow_forward"];
            matchedCell.trailingLabel.text = self.randomArray[indexPath.row];
            break;
        }
        case MatchedViewMatchTypePair:
            
            matchedCell.leadingLabel.text = self.randomArray[indexPath.row];
            matchedCell.matchedImageView.image = [UIImage imageNamed:@"arrows_back_forward"];
            matchedCell.trailingLabel.text = self.randomArray[[self numberOfRows] + indexPath.row];
            break;
            
        default:
            break;
    }
    
    
    
    return matchedCell;
}

- (NSArray *)items {
    
    return [ModelController sharedInstance].currentItems;
}

- (NSInteger)numberOfRows {
    
    switch ([ModelController sharedInstance].matchType) {
        case MatchedViewMatchTypeAssign:
        case MatchedViewMatchTypeToList:
            
            return (self.randomArray.count);
            break;
        
        case MatchedViewMatchTypePair:
            
            return (self.randomArray.count / 2);
            break;
            
        default:
            
            return 0;
            break;
    }
}

- (NSArray *)randomizeArray:(NSArray *)array {
    
    NSMutableArray *originalArray = [NSMutableArray new];
    
    for (Item *item in array) {
        [originalArray addObject:item.nameOfItem];
    }
    
    if ([ModelController sharedInstance].matchType == MatchedViewMatchTypePair) {
        
        if ((array.count % 2) != 0) {
            [originalArray addObject:@"Wildcard"];
        }
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
        
        if ([ModelController sharedInstance].matchType == MatchedViewMatchTypeAssign) {
            
            BOOL checkAssignments = YES;
            
            while (checkAssignments == YES) {
                _randomArray = [self randomizeArray:[self items]];
                checkAssignments = [self isItemAssignedToSelf];
            }
        } else {
            
            _randomArray = [self randomizeArray:[self items]];
        }
    }
    
    return _randomArray;
}

- (BOOL)isItemAssignedToSelf {
    
    BOOL check = NO;
    
    int i = 0;
    
    for (Item *item in [self items]) {
        
        if ([item.nameOfItem isEqualToString:self.randomArray[i]]) {
            check = YES;
        }
        i++;
    }
    
    return check;
}

@end
