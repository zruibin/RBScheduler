
<h2>RBScheduler</h2>

A Mission Scheduler 

## About
This project is maintained by Ruibin.Chow

## Requirements

- iOS 8.0+
- mac os 10.8+
- xcode 7

## Installation

Just add the RBScheduler folder to your project.

or use [CocoaPods](https://cocoapods.org) with Podfile:

``` ruby
pod 'RBScheduler', :git => 'https://github.com/zruibin/RBScheduler.git'
or
pod 'RBScheduler', :git => 'https://github.com/zruibin/RBScheduler.git', :tag => '2.1.2'
```

or [Carthage](https://github.com/Carthage/Carthage) users can simply add to their `Cartfile`:

```
github "zruibin/RBScheduler"
```

## Usage

1. handle you mission or delayed mission in you code

```objective-c
/*Each task, even a delayed task, has only one background thread for serial scheduling!*/
[[RBScheduler sharedInstance] runTask:^{
    [NSThread sleepForTimeInterval:2];
    
	...
}];
```