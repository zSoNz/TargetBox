# TargetBox

[![CI Status](https://img.shields.io/travis/KikacheishviliBogdan/TargetBox.svg?style=flat)](https://travis-ci.org/KikacheishviliBogdan/TargetBox)
[![Version](https://img.shields.io/cocoapods/v/TargetBox.svg?style=flat)](https://cocoapods.org/pods/TargetBox)
[![License](https://img.shields.io/cocoapods/l/TargetBox.svg?style=flat)](https://cocoapods.org/pods/TargetBox)
[![Platform](https://img.shields.io/cocoapods/p/TargetBox.svg?style=flat)](https://cocoapods.org/pods/TargetBox)

Tool for split file with two or more targets on independence parts.

## Example and explanation on View Controller

First you need to define and inherit from String and Targets Type a new Targets enum:
```swift
enum ExampleTargets: String, TargetsType {

    // String version should be the same as target name. It's case sensitive. 
    case targetBox = "TargetBox" 
    case anotherTarget = "AnotherTarget"
}
```
Then definne functions for each target and add box variable in to controller class:
```swift
private var box: TargetsBox<TargetBoxEmulation, ExampleTargets>?

private func prepareTargetBox() {
    print("Hello Box Target")
}

private func prepareForOthers() {
    print("Hello Others Target")
}
``` 
Then definne functions like this and call it on init:
```swift
private func createTargetBox() {

    // This will create weak reference on function in your controller. 
    let targetBoxFunction = WeakFunction(
        signature: ExampleViewController.prepareTargetBox, 
        object: self
    )
    
    /*
    @param function Created early weak function.
    @param trigger Selector after which our weaked function will be called, function must be dynamic or marked as dynamic
    @param target The target, what be defined early, on which the function should be called
    */
    let containerTargetBox = TargetingFunctionContainer(
        function: targetBoxFunction, 
        trigger: #selector(ExampleViewController.viewDidLoad), 
        target: ExampleTargets.targetBox
    )
    
    let otherTargetFunction = WeakFunction(
        signature: ExampleViewController.prepareForOthers,
        object: self
    )
    
    let containerOthers = TargetingFunctionContainer(
        function: otherTargetFunction,
        trigger: #selector(ExampleViewController.viewDidLoad),
        target: ExampleTargets.anotherTarget
    )
    
    self.box = TargetsBox(containers: [containerTargetBox, containerOthers])
}
```
And then after someone call your trigger function, weak function be called on your selected target.

## Installation

TargetBox is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TargetBox'
```

## Author

Kikacheishvili Bogdan, <bogdan.kikacheishvili@idapgroup.com>

## License

TargetBox is available under the MIT license. See the LICENSE file for more info.
