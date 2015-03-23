//
//  ImageViewController.h
//  FuzzTest
//
//  Created by j on 3/23/15.
//  Copyright (c) 2015 j. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FuzzData.h"

@interface ImageViewController : UIViewController <ImageFetchProtocol>

@property (nonatomic, weak) FuzzData *data;

@end
