//
//  SessionTokenXMLParserDelegate.m
//  Movideo
//
//  Created by HENRY CHAN on 7/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import "SessionTokenXMLParserDelegate.h"

@interface SessionTokenXMLParserDelegate()

@property(nonatomic) BOOL isParsingToken;

@end

@implementation SessionTokenXMLParserDelegate

- (id) init {
    self = [super init];
    
    if(!self) {
        return nil;
    }
    
    self.isParsingToken = NO;
    return self;
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if([elementName isEqualToString:@"token"]) {
        self.isParsingToken = YES;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (self.isParsingToken) {
        self.token = string;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if([elementName isEqualToString:@"token"] && self.isParsingToken) {
        self.isParsingToken = NO;
    }
}


@end
