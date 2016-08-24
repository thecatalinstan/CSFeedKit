//
//  main.swift
//  CSFeedKitExamples
//
//  Created by Cătălin Stan on 31/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

import Foundation
import CSFeedKit

// Export the files in the home directory as an RSSFeed
do {

    let homePath = NSString(string:"~").stringByExpandingTildeInPath
    let homeURL = NSURL.fileURLWithPath(homePath)

    let channel = CSRSSFeedChannel.init(title: "Contents of \(homePath)", link: homeURL.absoluteString, description: "Lists the contents of \(homePath)")
    channel.category = "Filesystem"

    let files = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(homePath)
    for (_, path) in files.enumerate() {
        var link:NSURL = NSURL.fileURLWithPath(path)
        let item = CSRSSFeedItem(title: link.lastPathComponent! , link: link.absoluteString, description: "Description of \(link.lastPathComponent!)");
        do {
            let attributes = try NSFileManager.defaultManager().attributesOfItemAtPath("\(homePath)/\(path)")
            print(attributes)
            item.pubDate = attributes[NSFileCreationDate] as! NSDate
            item.creator = attributes[NSFileOwnerAccountName] as? String
        } catch {
            item.pubDate = NSDate.distantPast()
            item.creator = NSFullUserName()
        }
        channel.items.addObject(item)
    }

    let feed = CSRSSFeed()
    feed.channels.addObject(channel)

    print ( feed.XMLElement().XMLStringWithOptions(NSXMLNodePrettyPrint))
} catch {
    print(error)
}


// Parse a feed from the web
do {
    let xmlString = try NSString.init(contentsOfURL: NSURL(string: "https://news.ycombinator.com/rss")!, encoding: NSUTF8StringEncoding)
    let feed = try CSRSSFeed.init(XMLString: xmlString as String)
    let channel = feed.channels.firstObject as! CSRSSFeedChannel

    print("channel: \(channel.title) - \(channel.pubDate)")
    for (_, item) in channel.items.enumerate() {
        var rssItem = item as! CSRSSFeedItem
        print(" * \(rssItem.pubDate) - \(rssItem.title) (\(rssItem.link))")
    }
} catch {
    print(error)
}
