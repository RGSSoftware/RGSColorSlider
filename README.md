# RGSColorSlider

[![Version](https://img.shields.io/cocoapods/v/RGSColorSlider.svg?style=flat)](http://cocoapods.org/pods/RGSColorSlider)
[![License](https://img.shields.io/cocoapods/l/RGSColorSlider.svg?style=flat)](http://cocoapods.org/pods/RGSColorSlider)
[![Platform](https://img.shields.io/cocoapods/p/RGSColorSlider.svg?style=flat)](http://cocoapods.org/pods/RGSColorSlider)

A simple color slider for iOS.

<img src="https://github.com/RGSSoftware/RGSColorSlider/blob/master/screenshots/screenshot.gif" alt="iPhone 5" width="396" />

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

RGSColorSlider is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RGSColorSlider"
```

## Using RGSColorSlider
```objc
-(IBAction)sliderDidChange:(RGSColorSlider *)sender{
    self.colorView.backgroundColor = sender.color;
}
```

## Customization

`RGSColorSlider` can be customized via the following @properties

```objective-c
@property (nonatomic, strong)UIColor *color;

@property (nonatomic)int previewOffset; //negative moves up, positive moves down
@property (nonatomic)BOOL showPreview;

@property (nonatomic, )float previewAppearAnimateDuration;
@property (nonatomic, )float previewDismissAnimateDuration;

@property (nonatomic)int colorTrackHeight;
```

##Limitation

RGSColorSlider only supports hue, therefor it doesn't support saturation and brightness viewing or picking.

## License

RGSColorSlider is available under the MIT license. See the LICENSE file for more info.
