//
//  CSFeedItem.h
//  CSFeedKit
//
//  Created by Cătălin Stan on 30/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSFeedItem : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * link;
@property (nonatomic, strong) NSString * itemDescription;
@property (nonatomic, strong, nullable) NSString * comments;
@property (nonatomic, strong, nullable) NSString * GUID;
@property (nonatomic, assign) BOOL GUIDIsPermaLink;
@property (nonatomic, strong, nullable) NSString * info;

- (instancetype)initWithTitle:(NSString *)title link:(NSString *)link description:(NSString *)description NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithXMLElement:(NSXMLElement *)element;
- (instancetype)initWithXMLString:(NSString *)string error:(NSError * _Nullable __autoreleasing * _Nullable)error;

- (NSXMLElement *)XMLElement;

@end

NS_ASSUME_NONNULL_END