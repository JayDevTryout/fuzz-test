//
//  FuzzData.m
//  FuzzTest
//
//  Created by j on 3/22/15.
//  Copyright (c) 2015 j. All rights reserved.
//

#import "FuzzData.h"
#import "DataManager.h"

#define IDENTIFIER @"id"
#define ERROR @"Error"

@interface FuzzData ()

@property (nonatomic, strong) UIImage *image;

@end

@implementation FuzzData

-(id) initWithData:(NSDictionary *)dataDict
{
    self = [super init];
    if (self)
    {
        [dataDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {

            if ([key isEqualToString:IDENTIFIER]) _identifier = obj;
            else [self setValue:obj forKey:key];
            
        }];
        
        if (!_data || [_data length] == 0)
        {
            _data = ERROR;
        }
        if (!_date || [_date length] == 0)
        {
            _date = ERROR;
        }
        
        if ([_type isEqualToString:IMAGE_TYPE]) [self fetchImage];
    }
    return self;
}

-(void) setDelegate:(id<ImageFetchProtocol>)delegate
{
    if (_image) [delegate imageFetched:_image];
    else _delegate = delegate;
}

-(void) fetchImage
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,
                                             (unsigned long)NULL), ^(void) {
        
        NSError *error;
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:_data]
                                                  options:NSDataReadingUncached
                                                    error:&error];
        
        if (error)
        {
            _image = [UIImage imageNamed:@"error"];
        }
        else
        {
            _image = [UIImage imageWithData:imageData];
        }
        
        if (_delegate)
        {
            [_delegate imageFetched:_image];
        }
        
    });
}

@end
