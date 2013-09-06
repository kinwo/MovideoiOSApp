//
//  MovideoAPIService.h
//  Movideo
//
//  Created by HENRY CHAN on 6/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MediaSearchResult.h"

typedef void (^SearchCompletionHandler)(MediaSearchResult* user, NSError* error) ;


@interface MovideoAPIService : NSObject

+ (void) findMostPlayed:(SearchCompletionHandler) handler;

+ (void) searchByKeywords:(SearchCompletionHandler) handler keywords:(NSString*) searchKeywords;


@end
