//
//  CSRSSFeedTests.m
//  CSFeedKit
//
//  Created by Cătălin Stan on 31/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CSRSSFeed.h"
#import "CSRSSFeedChannel.h"
#import "CSRSSFeedItem.h"

@interface CSRSSFeedTests : XCTestCase

@end

@implementation CSRSSFeedTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testXMLElementNoThrow {
    CSRSSFeedItem * item = [[CSRSSFeedItem alloc] initWithTitle:@"The title" link:@"http://catalinstan.com/the-feed" description:@"Lorem ipsum dolor ..."];
    item.creator = @"Cătălin Stan";

    CSRSSFeedChannel * channel = [[CSRSSFeedChannel alloc] initWithTitle:@"The title" link:@"http://catalinstan.com/the-feed" description:@"Lorem ipsum dolor ..."];
    [channel.items addObject:item];

    CSRSSFeed * feed = [[CSRSSFeed alloc] init];
    [feed.channels addObject:channel];

    XCTAssertNotNil(feed);
    XCTAssertNoThrow(feed.XMLElement);
    XCTAssertNoThrow(feed.XMLDocument);
}

- (void)testInitWithString {
    NSString * XMLString = @"<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?><feed version=\"2.0\" xmlns:content=\"http://purl.org/rss/1.0/modules/content/\" xmlns:wfw=\"http://wellformedweb.org/CommentAPI/\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\"><channel><title>The title</title><link>http://catalinstan.com/the-feed</link><description><![CDATA[Lorem ipsum dolor ...]]></description><generator>(null), v(null) build (null)</generator><lastBuildDate>Sun, 31 Jul 2016 21:23:48 +0200</lastBuildDate><language>en</language><ttl>3600</ttl><item><title>The title</title><link>http://catalinstan.com/the-feed</link><comments></comments><guid isPermaLink=\"true\">http://catalinstan.com/the-feed</guid><description><![CDATA[Lorem ipsum dolor ...]]></description><dc:creator>Cătălin Stan</dc:creator></item></channel></feed>";

    NSError * error;
    CSRSSFeed * feed;
    XCTAssertNoThrow (feed = [[CSRSSFeed alloc] initWithXMLString:XMLString error:&error]);
    XCTAssertNotNil(feed);
    XCTAssertNil(error);

    NSString * blankXMLString = @"";
    NSError * blankError;
    CSRSSFeed * blankFeed;

    XCTAssertNoThrow (blankFeed = [[CSRSSFeed alloc] initWithXMLString:blankXMLString error:&blankError]);
    XCTAssertNotNil(blankFeed);
    XCTAssertNotNil(blankError);

    NSString * nilXMLString = nil;
    NSError * nilError;
    CSRSSFeed * nilFeed;

    XCTAssertThrows(nilFeed = [[CSRSSFeed alloc] initWithXMLString:nilXMLString error:&nilError]);
    XCTAssertNil(nilFeed);
    XCTAssertNil(nilError);
}

@end
