//
//  MatchedViewTableViewDataSource.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "MatchedViewTableViewDataSource.h"
#import "MatchedViewTableViewCell.h"
#import "ListAndItemController.h"
#import "Item.h"
#import "List+ListArrayMethods.h"


@implementation MatchedViewTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (self.matchType) {
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MatchedViewTableViewCell *matchedCell = [tableView dequeueReusableCellWithIdentifier:@"matchedItemsCell"];
    
    switch (self.matchType) {
        case MatchedViewMatchTypeAssign: {
            
            Item *item = self.list.myItems.array[indexPath.row];
            matchedCell.leadingLabel.text = item.nameOfItem;
            matchedCell.matchedImageView.image = [UIImage imageNamed:@"arrow_forward"];
            item = self.randomArray[indexPath.row];
            matchedCell.trailingLabel.text = item.nameOfItem;
            break;
        }
        case MatchedViewMatchTypePair: {
            
            Item *item = self.randomArray[indexPath.row * 2];
            matchedCell.leadingLabel.text = item.nameOfItem;
            matchedCell.matchedImageView.image = [UIImage imageNamed:@"arrows_back_forward"];
            item = self.randomArray[indexPath.row * 2 + 1];
            matchedCell.trailingLabel.text =item.nameOfItem;
            break;
        }
        default:
            break;
    }
    
    return matchedCell;
}

- (NSArray *)randomArray {
    
    if (!_randomArray) {
        
        switch (self.matchType) {
            case MatchedViewMatchTypeAssign:
                _randomArray = [self.list myItemsRandomArrayForAssigns];
                break;
            
            case MatchedViewMatchTypePair:
                _randomArray = [self.list myItemsRandomArrayForPairs];
                break;
                
            case MatchedViewMatchTypeToList:
                _randomArray = [self.list myItemsRandomArrayForToList];
                break;
                
            default:
                _randomArray = @[];
                break;
        }
    }
    
    return _randomArray;
}

@end
