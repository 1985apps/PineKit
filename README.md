# PineKit

[![CI Status](http://img.shields.io/travis/Prakash Raman/PineKit.svg?style=flat)](https://travis-ci.org/Prakash Raman/PineKit)
[![Version](https://img.shields.io/cocoapods/v/PineKit.svg?style=flat)](http://cocoapods.org/pods/PineKit)
[![License](https://img.shields.io/cocoapods/l/PineKit.svg?style=flat)](http://cocoapods.org/pods/PineKit)
[![Platform](https://img.shields.io/cocoapods/p/PineKit.svg?style=flat)](http://cocoapods.org/pods/PineKit)

## About

PineKit is a highly extendable iOS Swift UI Framework for building iOS Applications

We at [1985](http://1985.co.in) use this Library for all our iOS development! And we built it :)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

PineKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PineKit", git: "https://github.com/1985apps/PineKit.git"
```

## Dependecies
PineKit uses some to the best support Pods out there. Currently the list of pods which PineKit installs are
- SnapKit
- Cartography
- Alamofire

Do see that these pods are included in your Podfile (as a fail safe). And you would find them extremely useful too :)

## PineElements
PineKit is a framework containing a lot of classes and structures which are completely extendable. The elements are grouped by the following

- UI Elements (PineTextField, PineLabel, PineRadioGroup, ...)
- Layout Elements (PineLinearLayout, PineMenuViewController, ...)
- Base Elements (PineBaseViewController, ...)

### UI Elements
#### PineLabel(title: String) : UILabel
Creates a label with the fonts set in the PineConfig

```swift
     let lable = PineLabel(title: String)
     self.view.addSubview(label)
```

#### PineTextField(placeholder: String) : UITextField
A float placeholder text field, where the floating placeholder only shows when the textfield is not empty

```swift
     let tf = PineTextField(title: String)
     tf.textAlignment = .Center
     self.view.addSubview(tf)
```

#### PineButton(title: String) : UIButton
A Solid Button with rounded corners

```swift
     let button = PineButton(title: String)
     self.view.addSubview(button)
```

#### PineButton.Hollow(title: String) : UIButton
A sub class of the PineButton where only the border is visiable and the background color is "clearColor()"

```swift
     let button = PineButton.Hollow(title: String)
     self.view.addSubview(button)
```

## Author

Prakash Raman, prakash.raman.ka@gmail.com

## License

PineKit is available under the MIT license. See the LICENSE file for more info.
