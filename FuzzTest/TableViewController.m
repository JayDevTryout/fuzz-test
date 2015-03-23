//
//  TableViewController.m
//  FuzzTest
//
//  Created by j on 3/22/15.
//  Copyright (c) 2015 j. All rights reserved.
//

#import "TableViewController.h"
#import "ImageTableViewCell.h"
#import "TextTableViewCell.h"
#import "ImageViewController.h"
#import "WebViewController.h"
#import "DataManager.h"
#import "FuzzData.h"

#define IMAGE_CELL_HEIGHT 100.0f
#define TEXT_CELL_HEIGHT 200.0f

#define ALL 0
#define TEXT 1
#define IMAGES 2

@interface TableViewController ()

@property (nonatomic, strong) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic, weak) NSArray *tableData;

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _segmentedControl.enabled = NO;
    
    if (![DataManager init])
    {
        _tableData = [DataManager getAll];
        
        [_segmentedControl addTarget:self
                              action:@selector(segmentedControlValueChanged:)
                    forControlEvents:UIControlEventValueChanged];
        
        _segmentedControl.enabled = YES;
    
        self.tableView.rowHeight = UITableViewAutomaticDimension;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segmented control selector

-(void) segmentedControlValueChanged:(id)sender
{
    switch ([sender selectedSegmentIndex]) {
        case TEXT:
            _tableData = [DataManager getText];
            break;
        case IMAGES:
            _tableData = [DataManager getImages];
            break;
        default:
            _tableData = [DataManager getAll];
            break;
    }
    
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FuzzData *data = [_tableData objectAtIndex:indexPath.row];
    
    NSString *reuseIdentifier = TEXT_TYPE;
    if ([data.type isEqualToString:IMAGE_TYPE]) reuseIdentifier = IMAGE_TYPE;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1)
    {
        cell.contentView.frame = cell.bounds;
        cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin |UIViewAutoresizingFlexibleTopMargin |UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    }
    
    
    // Configure the cell...
    [self configureCell:cell withData:data];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FuzzData *data = [_tableData objectAtIndex:indexPath.row];
    
    if ([data.type isEqualToString:IMAGE_TYPE])
    {
        ImageViewController *imgVC = [self.navigationController.storyboard
                                      instantiateViewControllerWithIdentifier:@"ImageViewController"];
        imgVC.data = data;
        [self.navigationController pushViewController:imgVC
                                             animated:YES];
    }
    else
    {
        WebViewController *webVC = [self.navigationController.storyboard
                                    instantiateViewControllerWithIdentifier:@"WebViewController"];
        [self.navigationController pushViewController:webVC
                                             animated:YES];
    }
}

#pragma mark - Table view helpers

-(void) configureCell:(UITableViewCell *)cell withData:(FuzzData *)data
{
    if ([cell isKindOfClass:[ImageTableViewCell class]])
    {
        ((ImageTableViewCell *)cell).dateLabel.text = data.date;
        ((ImageTableViewCell *)cell).data = data;
        data.delegate = (id<ImageFetchProtocol>)cell;
    }
    else
    {
        ((TextTableViewCell *)cell).txtLabel.text = data.data;
        ((TextTableViewCell *)cell).dateLabel.text = data.date;
    }
}

@end
