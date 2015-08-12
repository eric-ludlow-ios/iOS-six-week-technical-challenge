//
//  XQEntity.h
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "XQList.h"

@class XQList;

@interface XQEntity : XQList

@property (nonatomic, retain) NSString * nameOfEntity;
@property (nonatomic, retain) XQList *entityList;

@end
