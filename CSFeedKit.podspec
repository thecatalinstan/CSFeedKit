Pod::Spec.new do |s|

  s.name                        =  "CSFeedKit"
  s.version                     =  "0.3.0"
  s.license                     =  "MIT"

  s.summary                     =  "An RSS feed generator and parser for macOS. Swift and Objective-C compatible."

  s.homepage                    =  "https://github.com/thecatalinstan/CSFeedKit"
  s.author                      =   { "Cătălin Stan" => "catalin.stan@me.com" }
  s.social_media_url            =   "http://twitter.com/catalinstan"

  s.source                      =  { :git => "https://github.com/thecatalinstan/CSFeedKit.git", :tag => s.version }

  s.module_name                 = "CSFeedKit"

  s.source_files                = "CSFeedKit/*.{h,m}", "CSFeedKit/RSS/*.{h,m}"
  s.public_header_files         = "CSFeedKit/CSFeedKit.h", "CSFeedKit/CSFeed.h", "CSFeedKit/CSFeedChannel.h", "CSFeedKit/CSFeedItem.h", "CSFeedKit/RSS/CSRSSFeed.h", "CSFeedKit/RSS/CSRSSFeedChannel.h", "CSFeedKit/RSS/CSRSSFeedChannelImage.h",  "CSFeedKit/RSS/CSRSSFeedItem.h", "CSFeedKit/RSS/CSRSSFeedItemEnclosure.h"

  s.osx.deployment_target       = "10.9"
  s.osx.frameworks              = "Foundation"

  s.requires_arc                = true

end
