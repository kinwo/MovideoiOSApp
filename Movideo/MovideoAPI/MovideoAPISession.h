//
//  MovideoAPISession.h
//  Movideo
//
//  Created by HENRY CHAN on 7/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovideoAPIService.h"

@interface MovideoAPISession : NSObject

- (id) initWithService:(MovideoAPIService*) service;

- (void) acquireToken:(SessionTokenCompletionHandler) handler;

@end
