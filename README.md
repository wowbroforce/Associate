# Associate

## Description

This set of methods helps to reduce an amount of a boilerplate code when working with Associated Objects.

## Installation

To install Associate, simply add the following lines to your Podfile:

```ruby
source 'git@github.com:wowbroforce/Specs.git'

pod "Associate"
```

## Usage

```swift
extension UIView {
  static var identifierKey: Void?
  var identifier: String {
    get {
      return associated(with: self, by: &UIView.identifierKey)
    }
    set {
      associate(value: newValue, with: self, by: &UIView.identifierKey)
    }
  }
}
```

```swift
let view = UIView()
view.identifier = "some identifier"
print(view.identifier) // 'some identifier' text will be printed
```

## Author

wowbroforce, wowbroforce@gmail.com

## License

Associate is available under the MIT license. See the LICENSE file for more info.
