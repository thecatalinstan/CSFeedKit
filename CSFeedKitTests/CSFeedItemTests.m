//
//  CSFeedItemTests.m
//  CSFeedKit
//
//  Created by Cătălin Stan on 30/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CSFeedItem.h"

@interface CSFeedItemTests : XCTestCase

@end

@implementation CSFeedItemTests

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
    XCTAssertNotNil(item);
    XCTAssertNoThrow(item.XMLElement);
}

- (void)testInitWithXMLString {
    NSString * XMLString = @"<item><title>The title</title><link>http://catalinstan.com/the-feed</link><comments></comments><guid isPermaLink=\"true\">http://catalinstan.com/the-feed</guid><description><![CDATA[Lorem ipsum dolor ...]]></description></item>";
    NSError * error;
    CSFeedItem * item;
    XCTAssertNoThrow (item = [[CSFeedItem alloc] initWithXMLString:XMLString error:&error]);
    XCTAssertNotNil(item);
    XCTAssertNil(error);

    NSString * blankXMLString = @"";
    NSError * blankError;
    CSFeedItem * blankItem;

    XCTAssertNoThrow (blankItem = [[CSFeedItem alloc] initWithXMLString:blankXMLString error:&blankError]);
    XCTAssertNotNil(blankItem);
    XCTAssertNotNil(blankError);

    NSString * nilXMLString = nil;
    NSError * nilError;
    CSFeedItem * nilItem;

    XCTAssertThrows(nilItem = [[CSFeedItem alloc] initWithXMLString:nilXMLString error:&nilError]);
    XCTAssertNil(nilItem);
    XCTAssertNil(nilError);
}



@end
