//
//  MovideoAPIService.h
//  Movideo
//
//  Created by HENRY CHAN on 6/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MediaSearchResult.h"
#import "MediaListXMLParserDelegate.h"

typedef void (^SearchCompletionHandler)(MediaSearchResult* result, NSError* error) ;


@interface MovideoAPIService : NSObject {

}


- (void) findMostPlayed:(SearchCompletionHandler) handler;

- (void) searchByKeywords:(NSString*) searchKeywords handler:(SearchCompletionHandler) handler;


@end
