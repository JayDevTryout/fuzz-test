//
//  WebViewController.m
//  FuzzTest
//
//  Created by j on 3/23/15.
//  Copyright (c) 2015 j. All rights reserved.
//

#import "WebViewController.h"

#define SITE_URL @"https://fuzzproductions.com/"

@interface WebViewController ()

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:SITE_URL]
                                                  cachePolicy: NSURLRequestUseProtocolCachePolicy
                                              timeoutInterval: 100];
    [self.webView loadRequest: request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
