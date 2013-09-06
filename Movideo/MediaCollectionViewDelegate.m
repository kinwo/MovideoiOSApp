//
//  MediaCollectionViewDelegate.m
//  Movideo
//
//  Created by HENRY CHAN on 6/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import "MediaCollectionViewDelegate.h"
#import "MediaCollectionViewCell.h"

@implementation MediaCollectionViewDelegate

- (id) initDelegate {
    self = [super init];
    
    if (!self ) {
        return nil;
    }
    
    return self;
}

#pragma mark UICollectionViewDataSource, UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MediaCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mediaCollectionViewCell" forIndexPath:indexPath];
    cell.mediaTitle.text = @"ABC News";
    
    return cell;
}


@end
