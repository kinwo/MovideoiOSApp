//
//  MediaCollectionView.m
//  Movideo
//
//  Created by HENRY CHAN on 6/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import "MediaCollectionView.h"

#import "MediaCollectionViewDelegate.h"

@implementation MediaCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        MediaCollectionViewDelegate* delegate =[[MediaCollectionViewDelegate alloc] init];
        self.dataSource = delegate;
        self.delegate = delegate;
    }
    return self;
}

@end
