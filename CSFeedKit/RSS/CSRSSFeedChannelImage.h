//
//  CSRSSFeedChannelImage.h
//  CSFeedKit-macOS
//
//  Created by Catalin Stan on 21/08/2020.
//  Copyright © 2020 Cătălin Stan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSRSSFeedChannelImage : NSObject

@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong, nullable) NSString *imageDescription;
@property (nonatomic) NSUInteger width;
@property (nonatomic) NSUInteger height;

- (instancetype)initWithURL:(NSString *)url title:(NSString *)title link:(NSString *)link NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithXMLElement:(NSXMLElement *)element;
- (nullable instancetype)initWithXMLString:(NSString *)string error:(NSError * _Nullable __autoreleasing * _Nullable)error;
- (NSXMLElement *)XMLElement;

@end

NS_ASSUME_NONNULL_END
