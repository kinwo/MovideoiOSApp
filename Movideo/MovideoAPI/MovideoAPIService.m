//
//  MovideoAPIService.m
//  Movideo
//
//  Created by HENRY CHAN on 6/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import "MovideoAPIService.h"
#import "MovideoAPIClient.h"
#import "MovideoConstants.h"


@implementation MovideoAPIService

+ (void) findMostPlayed:(SearchCompletionHandler) handler {
    NSString* path = [NSString stringWithFormat:@"/rest/media/mostPlayed/month?token=%@", MOVIDEO_API_SESSION_TOKEN];
    
    [[MovideoAPIClient sharedClient] getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler(nil, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
        handler(nil, error);
    }];
     
}

+ (void) searchByKeywords:(SearchCompletionHandler) handler keywords:(NSString*) searchKeywords {
    NSString* path = [NSString stringWithFormat:@"/rest/media/search?keywords=%@&token=%@", searchKeywords, MOVIDEO_API_SESSION_TOKEN];

    [[MovideoAPIClient sharedClient] getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler(nil, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
        handler(nil, error);
    }];

}


@end
