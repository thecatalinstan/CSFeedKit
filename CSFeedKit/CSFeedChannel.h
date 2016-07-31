//
//  CSFeedChannel.h
//  CSFeedKit
//
//  Created by Cătălin Stan on 31/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CSFeedItem;

NS_ASSUME_NONNULL_BEGIN

@interface CSFeedChannel : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * link;
@property (nonatomic, strong) NSString * channelDescription;
@property (nonatomic, strong) NSDate * lastBuildDate;
@property (nonatomic, strong) NSString * generator;
@property (nonatomic, strong) NSString * language;
@property (nonatomic, strong) NSMutableArray<CSFeedItem *> * items;
@property (nonatomic) NSUInteger ttl;
@property (nonatomic, strong) NSString * category;

- (instancetype)initWithTitle:(NSString *)title link:(NSString *)link description:(NSString *)description NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithXMLElement:(NSXMLElement *)element;
- (instancetype)initWithXMLString:(NSString *)string error:(NSError * _Nullable __autoreleasing * _Nullable)error;

- (NSXMLElement *)XMLElement;

@end

NS_ASSUME_NONNULL_END