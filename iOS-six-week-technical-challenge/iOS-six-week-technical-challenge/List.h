//
//  List.h
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/13/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface List : NSManagedObject

@property (nonatomic, retain) NSString * nameOfList;
@property (nonatomic, retain) NSOrderedSet *myItems;
@end

@interface List (CoreDataGeneratedAccessors)

- (void)insertObject:(Item *)value inMyItemsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromMyItemsAtIndex:(NSUInteger)idx;
- (void)insertMyItems:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeMyItemsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInMyItemsAtIndex:(NSUInteger)idx withObject:(Item *)value;
- (void)replaceMyItemsAtIndexes:(NSIndexSet *)indexes withMyItems:(NSArray *)values;
- (void)addMyItemsObject:(Item *)value;
- (void)removeMyItemsObject:(Item *)value;
- (void)addMyItems:(NSOrderedSet *)values;
- (void)removeMyItems:(NSOrderedSet *)values;
@end
