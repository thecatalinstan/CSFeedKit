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
        item.creator = NSFullUserName()
        channel.items.addObject(item)
    }

    let feed = CSRSSFeed()
    feed.channels.addObject(channel)

    print ( feed.XMLElement().XMLStringWithOptions(NSXMLNodePrettyPrint))
} catch {
}


// Parse a feed from the web
var semaphore = dispatch_semaphore_create(0)

let feedURL = NSURL(string: "https://news.ycombinator.com/rss")
let request:NSMutableURLRequest = NSMutableURLRequest(URL: feedURL!)
request.HTTPMethod = "GET"
let task:NSURLSessionDataTask = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) in
    if ( error != nil ) {
        print(error)
        dispatch_semaphore_signal(semaphore)
        return
    }

    do {
        let xmlString = NSString.init(data: data!, encoding: NSUTF8StringEncoding)
        let feed = try CSRSSFeed.init(XMLString: xmlString! as String)
        let channel:CSRSSFeedChannel = feed.channels.firstObject as! CSRSSFeedChannel

        print("channel: \(channel.title)")
        for (_, item) in channel.items.enumerate() {
            var rssItem = item as! CSRSSFeedItem
            print(" * \(rssItem.title) (\(rssItem.link))")
        }
    } catch {
        print(error)
    }

    dispatch_semaphore_signal(semaphore)
}

task.resume()
dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER )

