# Change Log

This file includes all notable changes to CSFeedKit.

`CSFeedKit` uses [Semantic Versioning](http://semver.org/).

---

## [1.0.0](https://github.com/thecatalinstan/CSFeedKit/releases/tag/1.0.0) (06/22/2021)

**Released on Tuesday, June 22, 2021**.

This release adds support for the Swift Package Manager. It also updates the projects to Xcode 12.5 recommended build settings. 
Minimum macOS version is now `10.9`, mainly for Xcode 12 compatibility, should still work fine on macOS >= 10.7.

## [0.3.0](https://github.com/thecatalinstan/CSFeedKit/releases/tag/0.3.0) (08/21/2020)

**Released on Friday, August 21, 2020**.

This release adds support for the `image` and `enclosure` properties of an RSS channel and item respectively. It also updates the projects to Xcode 11.6 recommended build settings and the Xcode project format to 9.3. The examples have also been updated to Swift 5.

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
