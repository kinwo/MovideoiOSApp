//
//  MediaSearchResult.h
//  Movideo
//
//  Created by HENRY CHAN on 6/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MediaModel.h"

@interface MediaSearchResult : NSObject

@property(nonatomic, strong) NSMutableArray* mediaModelList;

- (NSInteger) count;

- (void) addNewMedia:(MediaModel*) model;

- (MediaModel*) getMediaByIndex:(NSInteger) index;

@end
