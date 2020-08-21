//
//  main.swift
//  CSFeedKitExamples
//
//  Created by Cătălin Stan on 31/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

import Foundation
import CSFeedKit

// MARK: - Export the files in the home directory as an RSSFeed
do {
    let homeURL = FileManager.default.homeDirectoryForCurrentUser;
    let homePath = homeURL.path

    let channel = CSRSSFeedChannel(title: "Contents of \(homePath)", link: homeURL.absoluteString, description: "Lists the contents of \(homePath)")
    channel.category = "Filesystem"
    
    var items = Array<CSRSSFeedItem>()

    let files = try FileManager.default.contentsOfDirectory(atPath: homePath)
    for file in files {
        let url = URL(fileURLWithPath: file, relativeTo: homeURL)
        let item = CSRSSFeedItem(title: url.lastPathComponent, link: url.absoluteString, description: "Description of \(url.lastPathComponent)")
        do {
            let attributes = try FileManager.default.attributesOfItem(atPath: url.path)
            item.pubDate = attributes[.modificationDate] as! Date
            item.creator = attributes[.ownerAccountName] as? String
        } catch {
            item.pubDate = Date.distantPast
            item.creator = NSFullUserName()
        }
        items.append(item)
    }
    
    channel.items = items
    
    let feed = CSRSSFeed()
    feed.channels = [channel]

    print(feed.xmlElement().xmlString(options: .nodePrettyPrint))
} catch {
    print(error)
}

// MARK: - Parse a feed from the web
do {
    let xmlString = try String(contentsOf: URL(string: "https://news.ycombinator.com/rss")!)
    let feed = try CSRSSFeed(xmlString: xmlString)
    
    let channel = feed.channels[0]
    print("channel: \(channel.title) - \(channel.pubDate)")
    
    for item in channel.items as! [CSRSSFeedItem] {
        print(" * \(item.pubDate) - \(item.title) (\(item.link))")
    }
} catch {
    print(error)
}
