//
//  MediaCollectionViewDelegate.h
//  Movideo
//
//  Created by HENRY CHAN on 6/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MediaSearchResult.h"

@interface MediaCollectionViewDelegate : NSObject<UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, strong) MediaSearchResult* result;

- (id) initDelegate;

@end
