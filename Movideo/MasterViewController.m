//
//  ViewController.m
//  Movideo
//
//  Created by HENRY CHAN on 5/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import "MasterViewController.h"
#import "MediaCollectionViewDelegate.h"
#import "MovideoAPIService.h"

#import "UIView+Toast.h"

@interface MasterViewController ()

@property(nonatomic, strong) MediaCollectionViewDelegate* collectionViewDelegate;
@property(nonatomic, strong) MovideoAPIService* movideoAPIService;


@end

@implementation MasterViewController

static NSInteger POPULAR_LIST = 0;
static NSInteger SEARCH_LIST = 1;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.collectionViewDelegate = [[MediaCollectionViewDelegate alloc] initDelegate];
    self.collectionView.dataSource = self.collectionViewDelegate;
    self.collectionView.delegate = self.collectionViewDelegate;
    self.movideoAPIService = [[MovideoAPIService alloc] init];
    
    [self loadMostPlayedList];
    
}

- (void) loadMostPlayedList {
    // show spinner
    [self.view makeToastActivity];
    
    // load data
    [self.movideoAPIService findMostPlayed:^(MediaSearchResult* result, NSError* error) {
        // stop spinner when successful or failure
        [self.view hideToastActivity];

        // set to collectionViewDelegate when successful
        self.collectionViewDelegate.result = result;
        
        // reload collection view when successful
        [self.collectionView reloadData];
    }];
    
}

- (void) searchByKeywords:(NSString*) keywords {
    
}

- (IBAction) touchSegmentedControl:(id) sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSInteger selected = [segmentedControl selectedSegmentIndex];
    if (selected == SEARCH_LIST) {
        [self searchByKeywords:@""];
    } else if (selected == POPULAR_LIST) {
        [self loadMostPlayedList];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
