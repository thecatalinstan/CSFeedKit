# Change Log

This file includes all notable changes to CSFeedKit.

`CSFeedKit` uses [Semantic Versioning](http://semver.org/).

---

## [0.3.0](https://github.com/thecatalinstan/CSFeedKit/releases/tag/0.3.0) (08/21/2020)

**Released on Friday, August 21, 2020**.

This release adds support for the `images` and `enclosure` properties of an RSS channel and item respecively. It also updates the projects to Xcode 11.6 and Xcode project format 9.3. The examples have also been updated to Swift 5.


#### Added

* The `enclosure` property to `CSFeedItem` 
* The `image` property to `CSFeedChannel`

## [0.2.1](https://github.com/thecatalinstan/CSFeedKit/releases/tag/0.2.1) (08/24/2016)

**Released on Wednesday, August 24, 2016**.

Hotfix release.

#### Fixed

The value of the `pubDate` property of `CSFeedChannel` was mistalenly being exported as `lastBuildDate`. [`30b1bf6`](https://github.com/thecatalinstan/CSFeedKit/commit/30b1bf6cac48c2789d5bfd6ee8ff32c868e51a6d).

## [0.2.0](https://github.com/thecatalinstan/CSFeedKit/releases/tag/0.2.0) (08/24/2016)

**Released on Wednesday, August 24, 2016**.

This releases fixes a bug when generating RSS feeds and adds the  pubDate property to feed channels and feed items.

#### Fixed

The RSS feeds where being generated using the “feed” tag instead of the “rss” tag. [`7cf0e4d`](https://github.com/thecatalinstan/CSFeedKit/commit/7cf0e4d91dc5e826362f0a7f97d62bf1d8417b26).

#### Added

Both the `CSFeedItem` and `CSFeedChannel` now have a `pubDate` property.

## [0.1.0](https://github.com/thecatalinstan/CSFeedKit/releases/tag/0.1.0) (08/01/2016)

**Released on Monday, August 1, 2016**.

The initial release.
