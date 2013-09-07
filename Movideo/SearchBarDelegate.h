//
//  SearchBarDelegate.h
//  Movideo
//
//  Created by HENRY CHAN on 7/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MasterViewController.h"

@interface SearchBarDelegate : NSObject<UISearchBarDelegate>

- (id) initWithMasterViewController:(MasterViewController*) controller;

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar;

@end
