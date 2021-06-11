//
//  CSFeedTests.m
//  CSFeedKit
//
//  Created by Cătălin Stan on 30/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CSFeedKit/CSFeed.h>
#import <CSFeedKit/CSFeedChannel.h>
#import <CSFeedKit/CSFeedItem.h>

@interface CSFeedTests : XCTestCase

@end

@implementation CSFeedTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testXMLElementNoThrow {
    CSFeedItem * item = [[CSFeedItem alloc] initWithTitle:@"The title" link:@"http://catalinstan.com/the-feed" description:@"Lorem ipsum dolor ..."];

    CSFeedChannel * channel = [[CSFeedChannel alloc] initWithTitle:@"The title" link:@"http://catalinstan.com/the-feed" description:@"Lorem ipsum dolor ..."];
    channel.items = @[item];

    CSFeed * feed = [[CSFeed alloc] init];
    feed.channels = @[channel];
    feed.version = @"1.0.0";
    feed.namespaces = @{
        @"cs": @"http://catalinstan.com/cs.dtd"//
    };

    XCTAssertNotNil(feed);
    XCTAssertNoThrow(feed.XMLElement);
    XCTAssertNoThrow(feed.XMLDocument);
}

- (void)testInitWithXMLString {
    NSString * XMLString = @"<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?><feed xmlns:cs=\"http://catalinstan.com/cs.dtd\"><channel><title>The title</title><link>http://catalinstan.com/the-feed</link><description><![CDATA[Lorem ipsum dolor ...]]></description><generator>(null), v(null) build (null)</generator><lastBuildDate>Sun, 31 Jul 2016 20:25:32 +0200</lastBuildDate><language>en</language><ttl>3600</ttl><item><title>The title</title><link>http://catalinstan.com/the-feed</link><comments></comments><guid isPermaLink=\"true\">http://catalinstan.com/the-feed</guid><description><![CDATA[Lorem ipsum dolor ...]]></description></item></channel></feed>";

    NSError * error;
    CSFeed * feed;
    XCTAssertNoThrow (feed = [[CSFeed alloc] initWithXMLString:XMLString error:&error]);
    XCTAssertNotNil(feed);
    XCTAssertNil(error);

    NSString * blankXMLString = @"";
    NSError * blankError;
    CSFeed * blankFeed;

    XCTAssertNoThrow (blankFeed = [[CSFeed alloc] initWithXMLString:blankXMLString error:&blankError]);
    XCTAssertNotNil(blankFeed);
    XCTAssertNotNil(blankError);

    NSString * nilXMLString = nil;
    NSError * nilError;
    CSFeed * nilFeed;

    XCTAssertThrows(nilFeed = [[CSFeed alloc] initWithXMLString:nilXMLString error:&nilError]);
    XCTAssertNil(nilFeed);
    XCTAssertNil(nilError);
}

@end
