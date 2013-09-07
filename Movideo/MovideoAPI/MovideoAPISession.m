//
//  MovideoAPISession.m
//  Movideo
//
//  Created by HENRY CHAN on 7/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import "MovideoAPISession.h"
#import "MovideoAPIService.h"
#import "MovideoConstants.h"

@interface MovideoAPISession()

@property(nonatomic, strong) MovideoAPIService* service;

@end

@implementation MovideoAPISession

- (id) initWithService:(MovideoAPIService*) service {
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    self.service = service;
    return self;
}

- (void) acquireToken:(SessionTokenCompletionHandler) handler {
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    NSString* token = [userDefaults stringForKey:USER_DEFAULTS_KEY_SESSION_TOKEN];
    NSDate* creationDateTime = [userDefaults objectForKey:USER_DEFAULTS_KEY_SESSION_TOKEN_CREATION_TIME];
    // add 90 mins
    NSDate* expiredDateTime = [creationDateTime dateByAddingTimeInterval:5400];
    NSDate* currentDateTime = [NSDate date];
    
    if (token && [currentDateTime compare:expiredDateTime] == NSOrderedAscending) {
        handler(token, nil);
    } else {
        // get new token
        [self.service getNewToken:^(NSString *token, NSError *error) {
            if (error) {
                handler(nil, error);
            } else {
                // update userDefaults and sync
                [userDefaults setObject:token forKey:USER_DEFAULTS_KEY_SESSION_TOKEN];
                [userDefaults setObject:[NSDate date] forKey:USER_DEFAULTS_KEY_SESSION_TOKEN_CREATION_TIME];
                [userDefaults synchronize];
                handler(token, nil);
            }
        }];
        
    }
    
}

@end
