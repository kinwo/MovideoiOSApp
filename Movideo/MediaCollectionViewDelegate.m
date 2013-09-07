//
//  MediaCollectionViewDelegate.m
//  Movideo
//
//  Created by HENRY CHAN on 6/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import "MediaCollectionViewDelegate.h"
#import "MediaCollectionViewCell.h"
#import "AFImageRequestOperation.h"

@interface MediaCollectionViewDelegate()

@property (nonatomic, strong) NSOperationQueue *imageOperationQueue;

@end

@implementation MediaCollectionViewDelegate

- (id) initDelegate {
    self = [super init];
    
    if (!self ) {
        return nil;
    }
    
    self.result = [[MediaSearchResult alloc] init];
    self.imageOperationQueue = [[NSOperationQueue alloc] init];
    [self.imageOperationQueue setMaxConcurrentOperationCount:5];
    
    return self;
}

#pragma mark UICollectionViewDataSource, UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.result count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MediaCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mediaCollectionViewCell" forIndexPath:indexPath];
    MediaModel* media = [self.result getMediaByIndex:indexPath.row];
    cell.mediaTitle.text = media.title;
    
    //load image async
    NSURL* imageURL = [NSURL URLWithString:media.defaultImageURL];
    
    AFImageRequestOperation *operation = [AFImageRequestOperation imageRequestOperationWithRequest:[NSURLRequest requestWithURL:imageURL] success:^(UIImage *image) {
        cell.mediaImage.image = image;
    }];

    [operation setQueuePriority:NSOperationQueuePriorityHigh];
    [self.imageOperationQueue addOperation:operation];

    return cell;
}


@end
