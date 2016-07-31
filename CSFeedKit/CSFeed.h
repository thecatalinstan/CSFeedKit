//
//  CSFeed.h
//  CSFeedKit
//
//  Created by Cătălin Stan on 31/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CSFeedChannel;

NS_ASSUME_NONNULL_BEGIN

@interface CSFeed : NSObject

@property (nonatomic, strong) NSString * version;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSString *> * namespaces;
@property (nonatomic, strong) NSMutableArray<CSFeedChannel *> * channels;
@property (nonatomic, strong) NSString * nodeName;

- (instancetype)initWithNodeName:(NSString * _Nullable)nodeName NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithXMLElement:(NSXMLElement *)element;
- (instancetype)initWithXMLDocument:(NSXMLDocument *)document;
- (instancetype)initWithXMLString:(NSString *)string error:(NSError * _Nullable __autoreleasing * _Nullable)error;

- (NSXMLElement *)XMLElement;
- (NSXMLDocument *)XMLDocument;

@end

NS_ASSUME_NONNULL_END