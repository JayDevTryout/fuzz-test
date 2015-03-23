//
//  DataManager.h
//  FuzzTest
//
//  Created by j on 3/22/15.
//  Copyright (c) 2015 j. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IMAGE_TYPE @"image"
#define TEXT_TYPE @"text"

@interface DataManager : NSObject

+ (NSError *) init;

+ (NSArray *) getAll;
+ (NSArray *) getText;
+ (NSArray *) getImages;

@end
