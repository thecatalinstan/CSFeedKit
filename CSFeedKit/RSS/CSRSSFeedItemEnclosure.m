//
//  CSRSSFeedItemEnclosure.m
//  CSFeedKit-macOS
//
//  Created by Catalin Stan on 21/08/2020.
//  Copyright © 2020 Cătălin Stan. All rights reserved.
//

#import "CSRSSFeedItemEnclosure.h"

@implementation CSRSSFeedItemEnclosure

- (instancetype)init {
    return [self initWithURL:@"" length:0 type:@""];
}

- (instancetype)initWithURL:(NSString *)url length:(NSInteger)length type:(NSString *)type {
    self = [super init];
    if (self != nil) {
        self.url = url;
        self.length = length;
        self.type = type;
    }
    return self;
}

- (instancetype)initWithXMLElement:(NSXMLElement *)element {
    NSString *url = [element attributeForName:@"url"].stringValue ?: @"";
    NSInteger length = [element attributeForName:@"length"].stringValue.integerValue;
    NSString *type = [element attributeForName:@"type"].stringValue ?: @"";

    return [self initWithURL:url length:length type:type];
}

- (instancetype)initWithXMLString:(NSString *)string error:(NSError * _Nullable __autoreleasing * _Nullable)error {
    return [self initWithXMLElement:[[NSXMLElement alloc] initWithXMLString:string error:error]];
}

- (NSXMLElement *)XMLElement {
    NSXMLElement * element = [NSXMLElement elementWithName:@"enclosure"];
    [element setAttributesWithDictionary:@{
        @"url": self.url,
        @"length": @(self.length).stringValue,
        @"type": self.type
    }];
    return element;
}

@end

