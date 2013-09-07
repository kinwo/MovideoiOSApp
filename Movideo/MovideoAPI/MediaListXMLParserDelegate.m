//
//  MediaListXMLParserDelegate.m
//  Movideo
//
//  Created by HENRY CHAN on 7/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import "MediaListXMLParserDelegate.h"
#import "MediaSearchResult.h"
#import "MediaModel.h"

@interface MediaListXMLParserDelegate()

@property(nonatomic, strong) MediaModel* media;
@property(nonatomic, strong) NSString* currentValue;
@property(nonatomic) BOOL isParsingDefaultImage;
@property(nonatomic) BOOL isParsingTitle;


@end

@implementation MediaListXMLParserDelegate

- (id) init {
    self = [super init];
    
    if(!self) {
        return nil;
    }
    
    self.isParsingDefaultImage = NO;
    self.isParsingTitle = NO;
    
    return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if([elementName isEqualToString:@"list"]) {
        //Initialize the MediaSearchResult.
        self.searchResult = [[MediaSearchResult alloc] init];
    } else if([elementName isEqualToString:@"media"]) {
        //Initialize the media model.
        self.media = [[MediaModel alloc] init];
    } else if ([elementName isEqualToString:@"defaultImage"]) {
        self.isParsingDefaultImage = YES;
    } else if ([elementName isEqualToString:@"title"]) {
        self.isParsingTitle = YES;
    }
    
    // debug
    //NSLog(@"Processing Element: %@", elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (self.isParsingDefaultImage || self.isParsingTitle) {
        self.currentValue = string;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if([elementName isEqualToString:@"title"] && self.isParsingTitle) {
        self.media.title = self.currentValue;
        self.isParsingTitle = NO;
    } else if([elementName isEqualToString:@"url"] && self.isParsingDefaultImage) {
        self.media.defaultImageURL = self.currentValue;
    } else if([elementName isEqualToString:@"defaultImage"]) {
        self.isParsingDefaultImage = NO;
    } else if([elementName isEqualToString:@"media"]) {
        [self.searchResult addNewMedia:self.media];
    }
}

@end
