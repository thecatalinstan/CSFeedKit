//
//  CSFeedChannelTests.m
//  CSFeedKit
//
//  Created by Cătălin Stan on 30/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CSFeedChannel.h"
#import "CSFeedItem.h"

@interface CSFeedChannelTests : XCTestCase

@end

@implementation CSFeedChannelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testXMLElementNoThrow {
    CSFeedChannel * channel = [[CSFeedChannel alloc] initWithTitle:@"The title" link:@"http://catalinstan.com/the-feed" description:@"Lorem ipsum dolor ..."];

    CSFeedItem * item = [[CSFeedItem alloc] initWithTitle:@"The title" link:@"http://catalinstan.com/the-feed" description:@"Lorem ipsum dolor ..."];
    [channel.items addObject:item];

    XCTAssertNotNil(channel);
    XCTAssertNoThrow(channel.XMLElement);
}

- (void)testInitWithXMLString {
    NSString * XMLString = @"<channel><title>The title</title><link>http://catalinstan.com/the-feed</link><description><![CDATA[Lorem ipsum dolor ...]]></description><generator>(null), v(null) build (null)</generator><lastBuildDate>Sun, 31 Jul 2016 19:23:31 +0200</lastBuildDate><language>en</language><ttl>3600</ttl><item><title>The title</title><link>http://catalinstan.com/the-feed</link><comments></comments><guid isPermaLink=\"true\">http://catalinstan.com/the-feed</guid><description><![CDATA[Lorem ipsum dolor ...]]></description></item></channel>";
    NSError * error;
    CSFeedChannel * channel;
    XCTAssertNoThrow (channel = [[CSFeedChannel alloc] initWithXMLString:XMLString error:&error]);
    XCTAssertNotNil(channel);
    XCTAssertNil(error);

    NSString * blankXMLString = @"";
    NSError * blankError;
    CSFeedChannel * blankChannel;

    XCTAssertNoThrow (blankChannel = [[CSFeedChannel alloc] initWithXMLString:blankXMLString error:&blankError]);
    XCTAssertNotNil(blankChannel);
    XCTAssertNotNil(blankError);

    NSString * nilXMLString = nil;
    NSError * nilError;
    CSFeedChannel * nilChannel;

    XCTAssertThrows(nilChannel = [[CSFeedChannel alloc] initWithXMLString:nilXMLString error:&nilError]);
    XCTAssertNil(nilChannel);
    XCTAssertNil(nilError);
}

@end
