//
//  XQList.h
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XQEntity;

@interface XQList : NSManagedObject

@property (nonatomic, retain) NSString * nameOfList;
@property (nonatomic, retain) NSOrderedSet *listEntities;
@end

@interface XQList (CoreDataGeneratedAccessors)

- (void)insertObject:(XQEntity *)value inListEntitiesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromListEntitiesAtIndex:(NSUInteger)idx;
- (void)insertListEntities:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeListEntitiesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInListEntitiesAtIndex:(NSUInteger)idx withObject:(XQEntity *)value;
- (void)replaceListEntitiesAtIndexes:(NSIndexSet *)indexes withListEntities:(NSArray *)values;
- (void)addListEntitiesObject:(XQEntity *)value;
- (void)removeListEntitiesObject:(XQEntity *)value;
- (void)addListEntities:(NSOrderedSet *)values;
- (void)removeListEntities:(NSOrderedSet *)values;
@end
