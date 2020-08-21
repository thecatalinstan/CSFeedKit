//
//  CSRSSFeedChannel.m
//  CSFeedKit
//
//  Created by Cătălin Stan on 31/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import "CSRSSFeedChannel.h"
#import "CSRSSFeedChannelImage.h"
#import "CSRSSFeedItem.h"

@implementation CSRSSFeedChannel

- (instancetype)initWithXMLElement:(NSXMLElement *)element {
    self = [super initWithXMLElement:element];
    if ( self != nil ) {
        NSArray<NSXMLElement *> * itemElements = [element elementsForName:@"item"];
        NSMutableArray<CSRSSFeedItem *> *items = [NSMutableArray arrayWithCapacity:itemElements.count];
        for (NSXMLElement * _Nonnull itemElement in itemElements) {
            CSRSSFeedItem *item = [[CSRSSFeedItem alloc] initWithXMLElement:itemElement];
            [items addObject:item];
        }
        self.items = items;
    }
    return self;
}

- (NSXMLElement *)XMLElement {
    NSXMLElement *element = [super XMLElement];
    if (self.image) {
        [element addChild:self.image.XMLElement];
    }
    return element;
}

@end
