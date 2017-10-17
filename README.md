# HKLSegmentedControl
[![Version](https://img.shields.io/cocoapods/v/HKLSegmentedControl.svg?style=flat)](http://cocoadocs.org/docsets/HKLSegmentedControl)
[![License](https://img.shields.io/cocoapods/l/HKLSegmentedControl.svg?style=flat)](http://cocoadocs.org/docsets/HKLSegmentedControl)
[![Platform](https://img.shields.io/cocoapods/p/HKLSegmentedControl.svg?style=flat)](http://cocoadocs.org/docsets/HKLSegmentedControl)

A subclass of UISegmentedControl which supports dynamically value changing.

HKLSegmentedControl is a fully compatible class with UISegmentedControl.
In addition to that, it supports touch moving events.
The delegate method is called each time when you swipe on the control.

<img src="https://raw.githubusercontent.com/hirohitokato/HKLSegmentedControl/master/images/screenshots_1.gif" width="320px" />

## :bulb: Features

- Fully compatible with UISegmentedControll class
- Support dynamic event handling
- Of course, support Value Changed event, too.
- Works on iOS

## :book: Usage
- [:link: iOS Example Project](https://github.com/hirohitokato/HKLSegmentedControl/tree/master/Examples)

### Interface

is very simple!

```objc
@interface HKLSegmentedControl : UISegmentedControl
@property (nonatomic, weak)id<HKLSegmentedControlDelegate> delegate;
@property (nonatomic, readonly)NSInteger highlightedSegmentIndex;
@end

@protocol HKLSegmentedControlDelegate <NSObject>
@optional
- (void)segmentedControl:(HKLSegmentedControl*)control didBeginTouch:(NSInteger)highlightedSegmentIndex;
- (void)segmentedControl:(HKLSegmentedControl*)control didChangedHighlightedIndex:(NSInteger)highlightedSegmentIndex;
@end
```

### Receive update events

Use `segmentedControl:didChangedHighlightedIndex:` delegate method.

```objc
@interface ViewController () <HKLSegmentedControlDelegate>
@property (weak, nonatomic) IBOutlet HKLSegmentedControl *segment;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _segment.delegate = self;
}

// Receive dynamic update events
- (void)segmentedControl:(HKLSegmentedControl *)control didChangedHighlightedIndex:(NSInteger)highlightedSegmentIndex {
    // Do anything!
}

// Can receive Value Changed(=touch up inside) event.
- (IBAction)selected:(id)sender {
}
@end
```

## Requirements

iOS 8.4 or later

## Installation

### CocoaPods

HKLSegmentedControl is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

`pod 'HKLSegmentedControl'`

### Carthage
Add the following line to you **Cartfile**.

```
github "hirohitokato/DetailScrubber"
```

To install with carthage, follow the instruction on [Carthage](https://github.com/Carthage/Carthage).

## Author

Hirohito Kato

## License

HKLSegmentedControl is available under the MIT license. See the LICENSE file for more info.
