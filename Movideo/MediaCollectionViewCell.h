//
//  MediaCollectionViewCell.h
//  Movideo
//
//  Created by HENRY CHAN on 6/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong) IBOutlet UILabel* mediaTitle;
@property(nonatomic, strong) IBOutlet UIImageView* mediaImage;

@end
