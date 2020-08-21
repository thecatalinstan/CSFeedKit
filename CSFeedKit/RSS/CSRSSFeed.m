//
//  CSRSSFeed.m
//  CSFeedKit
//
//  Created by Cătălin Stan on 31/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import "CSRSSFeed.h"
#import "CSRSSFeedChannel.h"

@implementation CSRSSFeed

- (instancetype)init {
    return [self initWithNodeName:@"rss"];
}

- (instancetype)initWithNodeName:(NSString *)nodeName {
    self = [super initWithNodeName:nodeName];
    if ( self != nil ) {
        self.nodeName = nodeName ? : @"rss";
        self.namespaces[@"content"] = @"http://purl.org/rss/1.0/modules/content/";
        self.namespaces[@"wfw"] = @"http://wellformedweb.org/CommentAPI/";
        self.namespaces[@"dc"] = @"http://purl.org/dc/elements/1.1/";
        self.version = @"2.0";
    }
    return self;
}

- (instancetype)initWithXMLElement:(NSXMLElement *)element {
    self = [super initWithXMLElement:element];
    if (self != nil) {
        NSArray<NSXMLElement *> *channelElements = [element elementsForName:@"channel"];
        NSMutableArray<CSRSSFeedChannel *> *channels = [NSMutableArray arrayWithCapacity:channelElements.count];
        for (NSXMLElement *channelElement in channelElements) {
            CSRSSFeedChannel *channel = [[CSRSSFeedChannel alloc] initWithXMLElement:channelElement];
            [channels addObject:channel];
        }
        self.channels = channels;
    }
    return self;
}

@end
