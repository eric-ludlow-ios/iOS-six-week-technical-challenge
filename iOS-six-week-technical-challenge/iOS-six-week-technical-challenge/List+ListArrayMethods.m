//
//  List+ListArrayMethods.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/21/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "List+ListArrayMethods.h"
#import "ListAndItemController.h"

@implementation List (ListWithArrayMethods)


- (NSArray *)myItemsRandomArrayForAssigns {
    
    NSArray *tentativeArray = @[];
    BOOL checkAssignments = YES;
    
    while (checkAssignments == YES) {
        tentativeArray = [self randomizedArrayFromArray:self.myItems.array];
        checkAssignments = NO;
        int i = 0;
        
        for (Item *item in self.myItems.array) {
            Item *tentativeItem = tentativeArray[i];
            if ([item.nameOfItem isEqualToString:tentativeItem.nameOfItem]) {
                checkAssignments = YES;
            }
            i++;
        }
    }
    
    return tentativeArray;
}

- (NSArray *)myItemsRandomArrayForPairs {
    
    NSMutableArray *originalArray = [self.myItems.array mutableCopy];
    
    if ((self.myItems.array.count % 2) != 0) {
        
        Item *item = [[ListAndItemController sharedInstance] createItem];
        item.nameOfItem = @"Wildcard";
        [originalArray addObject:item];
    }
    
    return [self randomizedArrayFromArray:originalArray];
}

- (NSArray *)myItemsRandomArrayForToList {
    
    return @[];
}

- (NSArray *)randomizedArrayFromArray:(NSArray *)array {
    
    NSMutableArray *mutableArray = [NSMutableArray new];
    
    int i = 1;
    
    for (id item in array) {
        
        [mutableArray insertObject:item atIndex:arc4random_uniform(i)];
        i++;
    }
    return mutableArray;
}

@end
