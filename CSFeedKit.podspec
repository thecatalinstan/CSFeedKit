Pod::Spec.new do |s|

  s.name                        =  "CSFeedKit"
  s.version                     =  "1.0.0"
  s.license                     =  "MIT"

  s.summary                     =  "An RSS feed generator and parser for macOS. Swift and Objective-C compatible."

  s.homepage                    =  "https://github.com/thecatalinstan/CSFeedKit"
  s.author                      =   { "Cătălin Stan" => "catalin.stan@me.com" }
  s.social_media_url            =   "http://twitter.com/catalinstan"

  s.source                      =  { :git => "https://github.com/thecatalinstan/CSFeedKit.git", :tag => s.version }

  s.module_name                 = "CSFeedKit"

  s.source_files                = "CSFeedKit/Source/*.{h,m}", "CSFeedKit/Headers/CSFeedKit/*.h"
  s.public_header_files         = "CSFeedKit/Headers/CSFeedKit/*.h"

  s.osx.deployment_target       = "10.9"
  s.osx.frameworks              = "Foundation"

  s.requires_arc                = true
end
