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
#import "SearchBarDelegate.h"

#import "UIView+Toast.h"

@interface MasterViewController ()

@property(nonatomic, strong) MediaCollectionViewDelegate* collectionViewDelegate;
@property(nonatomic, strong) MovideoAPIService* movideoAPIService;
@property(nonatomic, strong) UIView *searchBarViewOverlay;
@property(nonatomic, strong) SearchBarDelegate* searchBarDelegate;

@property(nonatomic, strong) IBOutlet UISearchBar* searchBar;

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.collectionViewDelegate = [[MediaCollectionViewDelegate alloc] initDelegate];
    self.collectionView.dataSource = self.collectionViewDelegate;
    self.collectionView.delegate = self.collectionViewDelegate;
    self.movideoAPIService = [[MovideoAPIService alloc] init];
    self.searchBarDelegate = [[SearchBarDelegate alloc] initWithMasterViewController:self];
    
    [self initSearchBar];
    
    [self loadMostPlayedList];
    
}

- (void) initSearchBar {
    // Search bar view overlay
    self.searchBar.delegate = self.searchBarDelegate;
}

- (IBAction) gotoHome {
    [self.searchBar resignFirstResponder];
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
    // show spinner
    [self clearResult];
    [self.view makeToastActivity];
    NSString* jsonKeywords = [NSString stringWithFormat:@"[\"%@\"]", keywords];
    
    // load data
    [self.movideoAPIService searchByKeywords:jsonKeywords handler:^(MediaSearchResult* result, NSError* error) {
        // stop spinner when successful or failure
        [self.view hideToastActivity];
        
        // set to collectionViewDelegate when successful
        self.collectionViewDelegate.result = result;
        
        // reload collection view when successful
        [self.collectionView reloadData];
    }];

    
}

- (void) clearResult {
    // set to collectionViewDelegate when successful
    self.collectionViewDelegate.result = [[MediaSearchResult alloc] init];
    
    // reload collection view when successful
    [self.collectionView reloadData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
