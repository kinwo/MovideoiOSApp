//
//  SearchBarDelegate.m
//  Movideo
//
//  Created by HENRY CHAN on 7/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import "SearchBarDelegate.h"

@interface SearchBarDelegate()

@property(nonatomic, strong) MasterViewController* controller;

@end

@implementation SearchBarDelegate

- (id) initWithMasterViewController:(MasterViewController*) controller {
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    self.controller = controller;
    return self;
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [self.controller searchByKeywords:searchBar.text];
}


@end
