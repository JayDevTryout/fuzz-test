//
//  FuzzData.h
//  FuzzTest
//
//  Created by j on 3/22/15.
//  Copyright (c) 2015 j. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ImageFetchProtocol <NSObject>

-(void)imageFetched:(UIImage *)image;

@end

@interface FuzzData : NSObject

-(id) initWithData:(NSDictionary *)dataDict;

@property (nonatomic, weak) id<ImageFetchProtocol> delegate;

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *data;



@end
