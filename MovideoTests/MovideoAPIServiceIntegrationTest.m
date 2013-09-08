//
//  MovideoAPIServiceIntegrationTest.m
//  Movideo
//
//  Created by HENRY CHAN on 8/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import "MovideoAPIServiceIntegrationTest.h"
#import "MovideoAPIService.h"
#import "AGWaitForAsyncTestHelper.h"

@implementation MovideoAPIServiceIntegrationTest

- (void)setUp
{
    [super setUp];
    
    
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testFindMostPlayedServiceEndPoint {
    //__block ensures modification inside block is visible to outside
    __block BOOL jobDone = NO;
    __block BOOL isSuccess = NO;
    
    MovideoAPIService* service = [[MovideoAPIService alloc] init];
    
    [service findMostPlayed:^(MediaSearchResult *result, NSError *error) {
        if (error) {
            isSuccess = NO;
        } else if ([result count] > 0) {
            isSuccess = YES;
        }
        
        jobDone = YES;
    }];
    
    WAIT_WHILE(!jobDone, 10.0);
    
    STAssertTrue(isSuccess == YES, @"Expected successful response with non empty media list");
}

- (void)testSearchByKeywordsServiceEndPoint {
    //__block ensures modification inside block is visible to outside
    __block BOOL jobDone = NO;
    __block BOOL isSuccess = NO;
    
    MovideoAPIService* service = [[MovideoAPIService alloc] init];
    
    [service searchByKeywords:@"[\"nasa\"]" handler:^(MediaSearchResult *result, NSError *error) {
        if (error) {
            isSuccess = NO;
        } else if ([result count] > 0) {
            isSuccess = YES;
        }
        
        jobDone = YES;
    }];
    
    WAIT_WHILE(!jobDone, 10.0);
    
    STAssertTrue(isSuccess == YES, @"Expected successful response with non empty media list");
}

- (void)testGetNewTokenServiceEndPoint {
    //__block ensures modification inside block is visible to outside
    __block BOOL jobDone = NO;
    __block BOOL isSuccess = NO;
    
    MovideoAPIService* service = [[MovideoAPIService alloc] init];
    
    [service getNewToken:^(NSString *token, NSError *error) {
        if ([token length] > 0 && !error) {
            isSuccess = YES;
        } else {
            isSuccess = NO;
        }
        
        jobDone = YES;
    }];
    
    WAIT_WHILE(!jobDone, 10.0);
    
    STAssertTrue(isSuccess == YES, @"Expected successful response with non empty token string");
}

@end
