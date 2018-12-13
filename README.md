# Associate

## Description

This set of methods helps to reduce an amount of a boilerplate code when working with Associated Objects.

## Installation

To install Associate, simply add the following lines to your Podfile:
```ruby
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/wowbroforce/Specs.git'

...

pod 'Associate'
```

## Usage

Examples:

```swift
import UIKit
import Associate

private var textColorNameKey: Void?

extension UILabel {
    @IBInspectable var textColorName: String? {
        get {
            return associated(with: self, by: &textColorNameKey, default: { nil })
        }
        set {
            return associate(value: newValue, with: self, by: &textColorNameKey)
        }
    }
}
```

```swift
import Foundation
import Associate

protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}

private var errorTrackerKey: Void?
private var activityIndicatorKey: Void?

extension ViewModelType {
    var errorTracker: ErrorTracker {
        get {
            return associated(with: self, by: &errorTrackerKey) { ErrorTracker() }
        }
        set {
            associate(value: newValue, with: self, by: &errorTrackerKey)
        }
    }

    var activityIndicator: ActivityIndicator {
        get {
            return associated(with: self, by: &activityIndicatorKey) { ActivityIndicator() }
        }
        set {
            associate(value: newValue, with: self, by: &activityIndicatorKey)
        }
    }
}
```

```swift
import RxSwift
import Associate

private var disposeBagKey: Void?

extension NSObject {
    var disposeBag: DisposeBag {
        get {
            return associated(with: self, by: &disposeBagKey) { DisposeBag() }
        }
        set {
            associate(value: newValue, with: self, by: &disposeBagKey)
        }
    }
}
```

## Author

wowbroforce, wowbroforce@gmail.com

## License

Associate is available under the MIT license. See the LICENSE file for more info.
