# Associate

[![CI Status](http://img.shields.io/travis/wowbroforce/Associate.svg?style=flat)](https://travis-ci.org/wowbroforce/Associate)
[![Version](https://img.shields.io/cocoapods/v/Associate.svg?style=flat)](http://cocoapods.org/pods/Associate)
[![License](https://img.shields.io/cocoapods/l/Associate.svg?style=flat)](http://cocoapods.org/pods/Associate)
[![Platform](https://img.shields.io/cocoapods/p/Associate.svg?style=flat)](http://cocoapods.org/pods/Associate)

## Description

This set of methods helps to reduce an amount of a boilerplate code when working with Associated Objects.

## Installation

To install Associate, simply add the following line to your Podfile:

```ruby
pod "Associate"
```

## Usage

```swift
extension NSObject {
  static var identifierKey: Void?
  var identifier: String {
    get {
      return associated(with: self, by: &identifierKey)
    }
    set {
      associate(value: newValue, with: self, by: &identifierKey)
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
