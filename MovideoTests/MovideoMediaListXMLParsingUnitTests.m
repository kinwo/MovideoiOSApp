//
//  MovideoMediaListXMLParsingUnitTests.m
//  MovideoTests
//
//  Created by HENRY CHAN on 5/09/13.
//  Copyright (c) 2013 HENRY CHAN. All rights reserved.
//

#import "MovideoMediaListXMLParsingUnitTests.h"
#import "MediaListXMLParserDelegate.h"

@interface MovideoMediaListXMLParsingUnitTests()

@end

@implementation MovideoMediaListXMLParsingUnitTests

- (void)setUp
{
    [super setUp];
    

}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testSearchResultXML
{
    // Set-up code here.
    MediaListXMLParserDelegate* delegate = [self loadXMLFileAndParse:@"SearchResult"];
    
    NSInteger expected = 10;
    NSInteger searchResultCount = [delegate.searchResult count];
    STAssertTrue(searchResultCount == expected, @"Expected %d but was %d", expected, searchResultCount);
}

- (void)testMostPlayedListXML
{
    // Set-up code here.
    MediaListXMLParserDelegate* delegate = [self loadXMLFileAndParse:@"MostPlayedList"];
    
    NSInteger expected = 10;
    NSInteger searchResultCount = [delegate.searchResult count];
    STAssertTrue(searchResultCount == expected, @"Expected %d but was %d", expected, searchResultCount);
}

- (MediaListXMLParserDelegate*) loadXMLFileAndParse:(NSString*) fileName {
    NSString* xmlFilePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"xml"];
    NSString *xmlString = [NSString stringWithContentsOfFile:xmlFilePath encoding:NSUTF8StringEncoding error:NULL];
    NSData* data = [xmlString dataUsingEncoding:NSUTF8StringEncoding];
    NSXMLParser* parser = [[NSXMLParser alloc] initWithData:data];
    
    MediaListXMLParserDelegate* delegate = [[MediaListXMLParserDelegate alloc] init];
    parser.delegate = delegate;
    [parser parse];

    return delegate;
}

@end
