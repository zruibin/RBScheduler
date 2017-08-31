
#RBScheduler

A Mission Scheduler 

## About
This project is maintained by Ruibin.Chow

## Requirements

- iOS 8.0+
- xcode 8

## Installation

Just add the RBScheduler folder to your project.

or use [CocoaPods](https://cocoapods.org) with Podfile:

``` ruby
pod 'RBScheduler', :git => 'https://github.com/zruibin/RBScheduler.git'
or
pod 'RBScheduler', :git => 'https://github.com/zruibin/RBScheduler.git', :tag => '1.0.0'
```

or [Carthage](https://github.com/Carthage/Carthage) users can simply add to their `Cartfile`:

```
github "zruibin/RBScheduler"
```

## Usage

1. runing the main Scheduler in `didFinishLaunchingWithOptions`

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[RBScheduler sharedInstance] run];
}
```

2. handle you mission or delayed mission in you code

```objective-c
RBSchedulerObject *obj = [RBSchedulerObject new];

/*every mission, even delayed mission, but the return value of the scheduler block must be true, and then the scheduler can continue running.

NOTE: Reference cycles can be caused!!!
*/
[obj setSchedulerBlock:^{
    [NSThread sleepForTimeInterval:2];
    
    return YES;
}];

[[RBScheduler sharedInstance] runTask:obj];

```