//
//  MovideoAPIClient.h
//  Movideo
//
//  Created by HENRY CHAN on 6/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import "AFHTTPClient.h"

@interface MovideoAPIClient : AFHTTPClient

+ (MovideoAPIClient *)sharedClient ;

@end
