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
#import "NSString+URLEncode.h"
#import "MovideoAPISession.h"
#import "SessionTokenXMLParserDelegate.h"

@interface MovideoAPIService()

@property(nonatomic, strong) MovideoAPISession* session;

@end


@implementation MovideoAPIService

- (id) init {
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    self.session = [[MovideoAPISession alloc] initWithService:self];
    return self;
}

- (void) getNewToken:(SessionTokenCompletionHandler) handler {
    NSString* path = [NSString stringWithFormat:@"/rest/session?applicationalias=%@&key=%@", MOVIDEO_API_APPLICATION_ALIAS, MOVIDEO_API_APPLICATION_KEY];
    
    [[MovideoAPIClient sharedClient] getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSXMLParser* parser = (NSXMLParser*) responseObject;
        SessionTokenXMLParserDelegate* delegate = [[SessionTokenXMLParserDelegate alloc] init];
        parser.delegate = delegate;
        BOOL isSuccess = [parser parse];
        
        if (!isSuccess) {
            NSMutableDictionary* details = [NSMutableDictionary dictionary];
            [details setValue:@"Error caught when parsing XML response from get session request." forKey:NSLocalizedDescriptionKey];
            NSError * error = [NSError errorWithDomain:@"net.kinwo.movideo" code:200 userInfo:details];
            handler(nil, error);
        }
        
        handler(delegate.token, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
        handler(nil, error);
    }];
    
}

- (void) findMostPlayed:(SearchCompletionHandler) handler {
    [self.session acquireToken:^(NSString *token, NSError *error) {
        if (error) {
            handler(nil, error);
            return;
        }
        
        NSString* path = [NSString stringWithFormat:@"/rest/media/mostPlayed/month?token=%@", token];
        
        [[MovideoAPIClient sharedClient] getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSXMLParser* parser = (NSXMLParser*) responseObject;
            MediaListXMLParserDelegate* delegate = [[MediaListXMLParserDelegate alloc] init];
            parser.delegate = delegate;
            BOOL isSuccess = [parser parse];
            
            if (!isSuccess) {
                NSMutableDictionary* details = [NSMutableDictionary dictionary];
                [details setValue:@"Error caught when parsing XML response from mostPlayed request." forKey:NSLocalizedDescriptionKey];
                NSError * error = [NSError errorWithDomain:@"net.kinwo.movideo" code:200 userInfo:details];
                handler(nil, error);
            }
            
            handler(delegate.searchResult, nil);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@", [error localizedDescription]);
            handler(nil, error);
        }];
    }];
    
}

- (void) searchByKeywords:(NSString*) searchKeywords handler:(SearchCompletionHandler) handler {
    [self.session acquireToken:^(NSString *token, NSError *error) {
        if (error) {
            handler(nil, error);
            return;
        }
        
        NSString* path = [NSString stringWithFormat:@"/rest/media/search?keywords=%@&token=%@", [searchKeywords urlencode], token];
        NSLog(@"%@", path);
        
        [[MovideoAPIClient sharedClient] getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSXMLParser* parser = (NSXMLParser*) responseObject;
            MediaListXMLParserDelegate* delegate = [[MediaListXMLParserDelegate alloc] init];
            parser.delegate = delegate;
            BOOL isSuccess = [parser parse];
            
            if (!isSuccess) {
                NSMutableDictionary* details = [NSMutableDictionary dictionary];
                [details setValue:@"Error caught when parsing XML response from search request." forKey:NSLocalizedDescriptionKey];
                NSError * error = [NSError errorWithDomain:@"net.kinwo.movideo" code:200 userInfo:details];
                handler(nil, error);
            }
            
            handler(delegate.searchResult, nil);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@", [error localizedDescription]);
            handler(nil, error);
        }];

    }];

}


@end
