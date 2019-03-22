# HKLSegmentedControl

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

```swift
public class HKLSegmentedControl : UISegmentedControl {

/// The object that acts as the delegate of the segmented control.
public weak var delegate: HKLSegmentedControlDelegate?

/// Current highlighted segment index you touch. If you don't touch it,
///  The value is same with that of <code>selectedSegmentIndex</code> property.
public private(set) var highlightedSegmentIndex: Int
}

public protocol HKLSegmentedControlDelegate: class {

/// Called when start touching the segmented control.
///
/// This is optional.
///
/// - Parameters:
///   - control: The HKLSegmentedControl object you touched.
///   - highlightedSegmentIndex: Current segment index you touched.
func segmentedControl(_ control:HKLSegmentedControl, didBeginTouch index:Int)


/// Called when the touched segment is changed.
///
/// This method is only called when you are touching the segmented control.
/// It is not called if you touch up it. To handle touch end event, use default "Value Changed" event.
/// This is optional.
///
/// - Parameters:
///   - control: The HKLSegmentedControl object you touched.
///   - index: Current segment index you are touching.
func segmentedControl(_ control: HKLSegmentedControl, didChangedIndex index: Int)
}
```

### Receive update events

Use `segmentedControl(_:didChangedIndex:)` delegate method.

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

iOS 10.3 or later

## Installation

### Carthage
Add the following line to you **Cartfile**.

```
github "hirohitokato/HKLSegmentedControl"
```

To install with carthage, follow the instruction on [Carthage](https://github.com/Carthage/Carthage).

## Author

Hirohito Kato

## License

HKLSegmentedControl is available under the MIT license. See the LICENSE file for more info.
