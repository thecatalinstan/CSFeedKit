# Change Log

This file includes all notable changes to CSFeedKit.

`CSFeedKit` uses [Semantic Versioning](http://semver.org/).

---

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
