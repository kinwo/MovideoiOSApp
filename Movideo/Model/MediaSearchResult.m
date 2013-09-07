//
//  MediaSearchResult.m
//  Movideo
//
//  Created by HENRY CHAN on 6/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import "MediaSearchResult.h"

@implementation MediaSearchResult


- (id) init {
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    self.mediaModelList = [[NSMutableArray alloc] init];
    
    return self;
}

- (void) addNewMedia:(MediaModel*) model {
    [self.mediaModelList addObject:model];
}

- (MediaModel*) getMediaByIndex:(NSInteger) index {
    return [self.mediaModelList objectAtIndex:(NSUInteger) index];
}

- (NSInteger) count {
    return [self.mediaModelList count];
}

@end
