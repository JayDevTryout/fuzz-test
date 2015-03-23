//
//  DataManager.m
//  FuzzTest
//
//  Created by j on 3/22/15.
//  Copyright (c) 2015 j. All rights reserved.
//

#import "DataManager.h"
#import "FuzzData.h"

#define FUZZ_URL @"http://quizzes.fuzzstaging.com/quizzes/mobile/1/data.json"

static NSMutableArray *all;
static NSMutableArray *text;
static NSMutableArray *images;

@implementation DataManager


+ (NSError *) init
{
    if (all==nil)
    {
        all = [[NSMutableArray alloc] init];
        text = [[NSMutableArray alloc] init];
        images = [[NSMutableArray alloc] init];
    }

    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:FUZZ_URL]
                                         options:NSDataReadingMappedIfSafe
                                           error:&error];
    
    if (error) return error;
    
    NSArray* json = [NSJSONSerialization JSONObjectWithData:data
                                                    options:kNilOptions
                                                      error:&error];
    
    if (error) return error;
    
    for (NSDictionary *dict in json) {
        
        FuzzData *fd = [[FuzzData alloc] initWithData:dict];
        
        [all addObject:fd];
        
        if ([fd.type isEqualToString:TEXT_TYPE]) [text addObject:fd];
        else [images addObject:fd];
    
    }
    
    return nil;
}

+ (NSArray *) getAll
{
    return all;
}

+ (NSArray *) getText
{
    return text;
}

+ (NSArray *) getImages
{
    return images;
}

@end