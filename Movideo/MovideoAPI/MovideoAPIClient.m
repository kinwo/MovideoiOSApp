//
//  MovideoAPIClient.m
//  Movideo
//
//  Created by HENRY CHAN on 6/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import "MovideoAPIClient.h"
#import "AFXMLRequestOperation.h"
#import "MovideoConstants.h"

@implementation MovideoAPIClient

+ (MovideoAPIClient *)sharedClient {
    static MovideoAPIClient *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:MOVIDEO_API_SERVICE_BASE_URL]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFXMLRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/xml"];
    
    return self;
}


@end
