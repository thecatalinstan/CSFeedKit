[![Version Status](https://img.shields.io/cocoapods/v/CSFeedKit.svg?style=flat)](http://cocoadocs.org/docsets/CSFeedKit)  [![Platform](http://img.shields.io/cocoapods/p/CSFeedKit.svg?style=flat)](http://cocoapods.org/?q=CSFeedKit) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg?style=flat)](https://opensource.org/licenses/MIT)

# CSFeedKit

An RSS feed generator and parser for macOS. Swift and Objective-C compatible.

## Installation

You can install by either cloning the repo directy and adding the included project or by using one of the package managers, as described below.

### Swift Package Manager

Add the package to your project's dependencies. If you have a `Package.swift`, it should look similar to this:

```swift
dependencies: [
    .package(name: "CSFeedKit", url: "https://github.com/thecatalinstan/CSFeedKit", from: "1.0.0"),
]
```

Install using [CocoaPods](http://cocoapods.org) by adding this line to your `Podfile`:

````ruby
use_frameworks!

target 'MyApp' do
    pod 'CSFeedKit'
end
````

## Creating an RSS Feed

The example below creates an RSS feed and prints the resulting XML string.

```swift
// Create a channel
let channel = CSRSSFeedChannel.init(title: "My RSS feed", link: "http://my.rss.feed/", description: "My first CSFeedKit RSS feed")
channel.category = "Examples"

// Add two items to the channel
var items = Array<CSRSSFeedItem>()
items.append(CSRSSFeedItem(title: "Item 1" , link: "http://my.rss.feed/item1", description: "The coolest item so far."))
items.append(CSRSSFeedItem(title: "Item 2" , link: "http://my.rss.feed/item2", description: "An even cooler item."))
channel.items = items

// Create the feed
let feed = CSRSSFeed()

// Add the channel to the feed
feed.channels = [channel]

// Output the XML
print(feed.xmlElement().xmlString(options: .nodePrettyPrint))
```

## Parsing an RSS feed

The following prints out the titles and URLs of the items in the [Hacker News RSS feed](https://news.ycombinator.com/rss).

```swift
// Get the XML string (don't do it like this in the real-world ;) )
let xmlString = try String(contentsOf: URL(string: "https://news.ycombinator.com/rss")!)

// Init the feed
let feed = try CSRSSFeed(xmlString: xmlString)

// Print channel info
let channel = feed.channels[0]
print("channel: \(channel.title) - \(channel.pubDate ?? Date.distantPast)")

// Print the items
for item in channel.items {
    print(" * \(item.pubDate ?? Date.distantPast) - \(item.title) (\(item.link))")
}
```

## What’s Next

Run the built-in example: [https://github.com/thecatalinstan/CSFeedKit/blob/master/CSFeedKitExamples/CSFeedKitExamples/main.swift](https://github.com/thecatalinstan/CSFeedKit/blob/master/CSFeedKitExamples/CSFeedKitExamples/main.swift)

Check out the complete documentation on [CocoaDocs](http://cocoadocs.org/docsets/CSFeedKit/).
