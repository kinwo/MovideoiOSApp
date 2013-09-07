//
//  ViewController.h
//  Movideo
//
//  Created by HENRY CHAN on 5/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MediaCollectionView.h"

@interface MasterViewController : UIViewController

@property(nonatomic, strong) IBOutlet MediaCollectionView* collectionView;

- (void) searchByKeywords:(NSString*) keywords;

@end
