//
//  CSRSSFeedItemEnclosure.h
//  CSFeedKit-macOS
//
//  Created by Catalin Stan on 21/08/2020.
//  Copyright © 2020 Cătălin Stan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSRSSFeedItemEnclosure : NSObject

@property (nonatomic, strong) NSString *url;
@property (nonatomic) NSInteger length;
@property (nonatomic, strong) NSString *type;

- (instancetype)initWithURL:(NSString *)url length:(NSInteger)length type:(NSString *)type NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithXMLElement:(NSXMLElement *)element;
- (nullable instancetype)initWithXMLString:(NSString *)string error:(NSError * _Nullable __autoreleasing * _Nullable)error;
- (NSXMLElement *)XMLElement;

@end

NS_ASSUME_NONNULL_END
