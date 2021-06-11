//
//  CSRSSFeedChannelImage.m
//  CSFeedKit-macOS
//
//  Created by Catalin Stan on 21/08/2020.
//  Copyright © 2020 Cătălin Stan. All rights reserved.
//

#import <CSFeedKit/CSRSSFeedChannelImage.h>

@implementation CSRSSFeedChannelImage

- (instancetype)init {
    return [self initWithURL:@"" title:@"" link:@""];
}

- (instancetype)initWithURL:(NSString *)url title:(NSString *)title link:(NSString *)link {
    self = [super init];
    if (self != nil) {
        self.url = url;
        self.title = title;
        self.link = link;
        self.width = 0;
        self.height = 0;
        self.imageDescription = @"";
    }
    return self;
}

- (instancetype)initWithXMLElement:(NSXMLElement *)element {
    NSString *url = [element elementsForName:@"url"].firstObject.stringValue;
    NSString *title = [element elementsForName:@"title"].firstObject.stringValue;
    NSString *link = [element elementsForName:@"link"].firstObject.stringValue;
    
    self = [self initWithURL:url title:title link:link];
    if ( self != nil ) {
        self.imageDescription = [element elementsForName:@"description"].firstObject.children.firstObject.stringValue ?: self.imageDescription;
        self.width = [element elementsForName:@"width"].firstObject.stringValue.integerValue ?: self.width;
        self.height = [element elementsForName:@"height"].firstObject.stringValue.integerValue ?: self.height;
    }
    return self;
}

- (instancetype)initWithXMLString:(NSString *)string error:(NSError * _Nullable __autoreleasing * _Nullable)error {
    return [self initWithXMLElement:[[NSXMLElement alloc] initWithXMLString:string error:error]];
}

- (NSXMLElement *)XMLElement {
    NSXMLElement * element = [NSXMLElement elementWithName:@"image"];

    [element addChild:[NSXMLElement elementWithName:@"url" stringValue:self.url]];
    [element addChild:[NSXMLElement elementWithName:@"title" stringValue:self.title]];
    [element addChild:[NSXMLElement elementWithName:@"link" stringValue:self.link]];
    
    if (self.width) {
        [element addChild:[NSXMLElement elementWithName:@"width" stringValue:@(self.width).stringValue]];
    }
    
    if (self.height) {
        [element addChild:[NSXMLElement elementWithName:@"height" stringValue:@(self.height).stringValue]];
    }

    if (self.imageDescription.length) {
        NSXMLElement * descriptionElement = [NSXMLElement elementWithName:@"description"];
        NSXMLNode * cdataDescriptionNode = [[NSXMLNode alloc] initWithKind:NSXMLTextKind options:NSXMLNodeIsCDATA];
        cdataDescriptionNode.stringValue = self.imageDescription;
        [descriptionElement addChild:cdataDescriptionNode];
        [element addChild:descriptionElement];
    }

    return element;
}

@end
