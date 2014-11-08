AQSTwitterActivity
==================

![](http://img.shields.io/cocoapods/v/AQSTwitterActivity.svg?style=flat)

[iOS] UIActivity subclass for Twitter that shows even if the user is not logged in.

Usage
---

```objc
UIActivity *twitterActivity = [[AQSTwitterActivity alloc] init];

UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:twitterActivity];
activityViewController.excludedActivityTypes = @[UIActivityTypePostToTwitter];

[self presentViewController:activityViewController animated:YES completion:NULL];
```

Installation
---

```
pod "AQSTwitterActivity"
```

Related Projects
---

- [AQSShareService](https://github.com/AquaSupport/AQSShareService) - UX-improved sharing feature in few line. 
