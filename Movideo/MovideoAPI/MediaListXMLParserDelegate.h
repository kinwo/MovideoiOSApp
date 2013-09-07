//
//  MediaListXMLParserDelegate.h
//  Movideo
//
//  Created by HENRY CHAN on 7/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import "MediaSearchResult.h"

@interface MediaListXMLParserDelegate : NSObject<NSXMLParserDelegate>

@property(nonatomic, strong) MediaSearchResult* searchResult;


@end
