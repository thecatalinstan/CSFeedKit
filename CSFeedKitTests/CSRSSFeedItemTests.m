//
//  CSRSSFeedItemTests.m
//  CSFeedKit
//
//  Created by Cătălin Stan on 30/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CSRSSFeedItem.h"

@interface CSRSSFeedItemTests : XCTestCase

@end

@implementation CSRSSFeedItemTests

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
    item.creator = @"The creator";
    XCTAssertNotNil(item);
    XCTAssertNoThrow(item.XMLElement);
}

//- (void)testInitWithXMLString {
//    NSString * XMLString = @"<item><title>The title</title><link>http://catalinstan.com/the-feed</link><comments></comments><guid isPermaLink=\"true\">http://catalinstan.com/the-feed</guid><description><![CDATA[Lorem ipsum dolor ...]]></description><dc:creator>The creator</dc:creator></item>";
//
//    NSError * error;
//    CSRSSFeedItem * item;
//    XCTAssertNoThrow (item = [[CSRSSFeedItem alloc] initWithXMLString:XMLString error:&error]);
//    XCTAssertNotNil(item);
//    XCTAssertNil(error);
//    XCTAssertNotNil(item.creator);
////    XCTAssertIsEqual(@"The creator", item.creator);
//
//    NSString * blankXMLString = @"";
//    NSError * blankError;
//    CSRSSFeedItem * blankItem;
//
//    XCTAssertNoThrow (blankItem = [[CSRSSFeedItem alloc] initWithXMLString:blankXMLString error:&blankError]);
//    XCTAssertNotNil(blankItem);
//    XCTAssertNotNil(blankError);
//
//    NSString * nilXMLString = nil;
//    NSError * nilError;
//    CSRSSFeedItem * nilItem;
//
//    XCTAssertThrows(nilItem = [[CSRSSFeedItem alloc] initWithXMLString:nilXMLString error:&nilError]);
//    XCTAssertNil(nilItem);
//    XCTAssertNil(nilError);
//}

@end
