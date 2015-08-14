//
//  Item.h
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/13/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class List;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * nameOfItem;
@property (nonatomic, retain) List *myList;

@end
