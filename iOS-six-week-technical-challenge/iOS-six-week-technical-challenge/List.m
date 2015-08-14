//
//  List.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/13/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "List.h"
#import "Item.h"
#import "ModelController.h"


@implementation List

@dynamic nameOfList;
@dynamic myItems;

- (void)removeMyItemsObject:(Item *)value {
    
    NSMutableOrderedSet *tempOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self mutableOrderedSetValueForKey:@"myItems"]];
    NSUInteger index = [tempOrderedSet indexOfObject:value];
    if (index != NSNotFound) {
        NSIndexSet *indexes = [NSIndexSet indexSetWithIndex:index];
        [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"myItems"];
        [tempOrderedSet removeObject:value];
        [self setPrimitiveValue:tempOrderedSet forKey:@"myItems"];
        [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"myItems"];
    }
}

@end
