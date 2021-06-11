//
//  CSRSSFeedChannel.h
//  CSFeedKit
//
//  Created by Cătălin Stan on 31/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import <CSFeedKit/CSFeedChannel.h>

@class CSRSSFeedChannelImage;

NS_ASSUME_NONNULL_BEGIN

/**
 *  The `CSRSSFeedChannel` class represents an RSS feed channel.
 */

@interface CSRSSFeedChannel : CSFeedChannel

@property (nonatomic, strong, nullable) CSRSSFeedChannelImage *image;

@end

NS_ASSUME_NONNULL_END
