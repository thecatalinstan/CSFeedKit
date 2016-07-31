//
//  CSFeedItem.m
//  CSFeedKit
//
//  Created by Cătălin Stan on 30/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import "CSFeedItem.h"

@implementation CSFeedItem

- (instancetype)init {
    return [self initWithTitle:@"" link:@"" description:@""];
}

- (instancetype)initWithTitle:(NSString *)title link:(NSString *)link description:(NSString *)description {
    self = [super init];
    if ( self != nil ) {
        self.title = title;
        self.link = link;
        self.itemDescription = description;
        self.GUID = self.link;
        self.GUIDIsPermaLink = YES;
    }
    return self;
}

- (instancetype)initWithXMLElement:(NSXMLElement *)element {
    NSString * title = [element elementsForName:@"title"].firstObject.stringValue;
    NSString * link = [element elementsForName:@"link"].firstObject.stringValue;
    NSString * comments = [element elementsForName:@"comments"].firstObject.stringValue;

    NSXMLElement * GUIDElement = [element elementsForName:@"guid"].firstObject;
    NSString * guid = GUIDElement.stringValue;
    BOOL guidIsPermalink = [[GUIDElement attributeForName:@"isPermaLink"].stringValue isEqualToString:@"true"];

    NSString * description = [element elementsForName:@"description"].firstObject.children.firstObject.stringValue;
    NSString * info = [element elementsForName:@"info"].firstObject.stringValue;

    CSFeedItem * item = [self initWithTitle:title link:link description:description];
    item.comments = comments;
    item.GUID = guid;
    item.GUIDIsPermaLink = guidIsPermalink;
    item.info = info;

    return item;
}

- (instancetype)initWithXMLString:(NSString *)string error:(NSError * _Nullable __autoreleasing * _Nullable)error {
    return [self initWithXMLElement:[[NSXMLElement alloc] initWithXMLString:string error:error]];
}

- (NSXMLElement *)XMLElement {
    NSXMLElement * xmlElement = [NSXMLElement elementWithName:@"item"];

    [xmlElement addChild:[NSXMLElement elementWithName:@"title" stringValue:self.title]];
    [xmlElement addChild:[NSXMLElement elementWithName:@"link" stringValue:self.link]];
    [xmlElement addChild:[NSXMLElement elementWithName:@"comments" stringValue:self.comments]];

    NSXMLElement * GUIDElement = [NSXMLElement elementWithName:@"guid" stringValue:self.GUID];
    [GUIDElement setAttributesWithDictionary:@{@"isPermaLink" : self.GUIDIsPermaLink ? @"true" : @"false" }];
    [xmlElement addChild:GUIDElement];

    NSXMLElement * descElement = [NSXMLElement elementWithName:@"description"];
    NSXMLNode * cdataDescNode = [[NSXMLNode alloc] initWithKind:NSXMLTextKind options:NSXMLNodeIsCDATA];
    cdataDescNode.stringValue = self.description;
    [descElement addChild:cdataDescNode];
    [xmlElement addChild:descElement];

    if ( self.info.length > 0 ) {
        [xmlElement addChild:[NSXMLElement elementWithName:@"info" stringValue:self.info]];
    }

    NSLog(@"%@", xmlElement.XMLString);
    
    return xmlElement;
}

@end
