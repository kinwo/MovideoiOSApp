//
//  ViewController.m
//  Movideo
//
//  Created by HENRY CHAN on 5/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import "MasterViewController.h"
#import "MediaCollectionViewDelegate.h"

@interface MasterViewController ()

@property(nonatomic, strong) MediaCollectionViewDelegate* collectionViewDelegate;

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.collectionViewDelegate = [[MediaCollectionViewDelegate alloc] initDelegate];
    self.collectionView.dataSource = self.collectionViewDelegate;
    self.collectionView.delegate = self.collectionViewDelegate;

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
