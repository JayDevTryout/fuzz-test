//
//  ImageViewController.m
//  FuzzTest
//
//  Created by j on 3/23/15.
//  Copyright (c) 2015 j. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@property (nonatomic, strong) IBOutlet UIImageView *imgView;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _data.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ImageFetchedProtocol

-(void) imageFetched:(UIImage *)image
{
    NSLog(@"IMAGE VC FETCHED: %@", _imgView);
    _imgView.image = image;
}

@end
