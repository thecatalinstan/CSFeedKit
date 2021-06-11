//
//  CSFeed.m
//  CSFeedKit
//
//  Created by Cătălin Stan on 31/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import <CSFeedKit/CSFeed.h>
#import <CSFeedKit/CSFeedChannel.h>

@implementation CSFeed

- (instancetype)init {
    return [self initWithNodeName:nil];
}

- (instancetype)initWithNodeName:(NSString *)nodeName {
    self = [super init];
    if ( self != nil ) {
        self.nodeName = nodeName ? : @"feed";
        self.namespaces = @{};
        self.channels = @[];
    }
    return self;
}

- (instancetype)initWithXMLElement:(NSXMLElement *)element {
    self = [self initWithNodeName:element.name];
    if ( self != nil ) {
        self.version = [element attributeForName:@"version"].stringValue;
        
        NSMutableDictionary<NSString *, NSString *> *namespaces = [NSMutableDictionary dictionaryWithCapacity:element.namespaces.count];
        for (NSXMLNode *namespace in namespaces) {
            namespaces[namespace.name] = namespace.stringValue;
        }
        self.namespaces = namespaces;
        
        NSArray<NSXMLElement *> *channelElements = [element elementsForName:@"channel"];
        NSMutableArray<CSFeedChannel *> *channels = [NSMutableArray arrayWithCapacity:channelElements.count];
        for (NSXMLElement *channelElement in channelElements) {
            CSFeedChannel *channel = [[CSFeedChannel alloc] initWithXMLElement:channelElement];
            [channels addObject:channel];
        }
        self.channels = channels;
    }
    return self;
}

- (instancetype)initWithXMLDocument:(NSXMLDocument *)document {
    return [self initWithXMLElement:document.rootElement];
}

- (instancetype)initWithXMLString:(NSString *)string error:(NSError * _Nullable __autoreleasing * _Nullable)error {
    return [self initWithXMLDocument:[[NSXMLDocument alloc] initWithXMLString:string options:0 error:error]];
}

- (NSXMLDocument *)XMLDocument {
    NSXMLDocument * document = [NSXMLDocument documentWithRootElement:self.XMLElement];
    document.version = @"1.0";
    document.characterEncoding = @"utf-8";
    return document;
}

- (NSXMLElement *)XMLElement {
    NSXMLElement * element = [NSXMLElement elementWithName:self.nodeName];

    if ( self.version.length > 0 ) {
        [element addAttribute:[NSXMLNode attributeWithName:@"version" stringValue:self.version]];
    }

    [self.namespaces enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        [element addAttribute:[NSXMLNode attributeWithName:[NSString stringWithFormat:@"xmlns:%@", key] stringValue:obj]];
    }];

    [self.channels enumerateObjectsUsingBlock:^(CSFeedChannel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [element addChild:obj.XMLElement];
    }];

    return element;
}


@end
