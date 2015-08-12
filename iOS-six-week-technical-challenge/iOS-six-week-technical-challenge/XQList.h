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
@property (nonatomic, retain) NSSet *listEntities;

@end

@interface XQList (CoreDataGeneratedAccessors)

- (void)addListEntitiesObject:(XQEntity *)value;
- (void)removeListEntitiesObject:(XQEntity *)value;
- (void)addListEntities:(NSSet *)values;
- (void)removeListEntities:(NSSet *)values;

@end
