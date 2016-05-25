//
//  RGSUIslider.m
//  testColorSlider
//
//  Created by PC on 5/16/16.
//  Copyright © 2016 Randel Smith. All rights reserved.
//

#import "RGSColorSlider.h"
#import "RGSPreviewView.h"

@interface RGSColorSlider ()


@property (nonatomic, strong)UIImageView *colorTrackImageView;

@property (nonatomic, strong)RGSPreviewView *previewView;

@end

@implementation RGSColorSlider

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self baseInit];
    }
    return self;
}

-(void)baseInit{
    NSBundle *containerBundle = [NSBundle bundleForClass:RGSColorSlider.class];
    NSString *path = [containerBundle pathForResource:@"RGSColorSlider" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    
    NSString *imagePath = [bundle pathForResource:@"colorTrack" ofType:@"png"];
    NSURL *url = [NSURL fileURLWithPath:imagePath];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    UIImage* image = [UIImage imageWithData:data];
    
    _colorTrackImageView = [[UIImageView alloc] initWithImage:image];
    [self addSubview:_colorTrackImageView];
    [self sendSubviewToBack:_colorTrackImageView];
    
    _previewOffset = -45;
    _showPreview = true;
    
    _previewAppearAnimateDuration = 0.07;
    _previewDismissAnimateDuration = 0.06;
    
    _colorTrackHeight = 2;
    
    [self setMinimumTrackImage:[self imageFromColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [self setMaximumTrackImage:[self imageFromColor:[UIColor clearColor]] forState:UIControlStateNormal];

}

-(void)layoutSubviews{
    [super layoutSubviews];

    self.colorTrackImageView.frame = [self trackRectForBounds:self.bounds];
    CGPoint center = self.colorTrackImageView.center;
    CGRect rect = self.colorTrackImageView.frame;
    rect.size.height = self.colorTrackHeight;
    self.colorTrackImageView.frame = rect;
    self.colorTrackImageView.center = center;
    
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch
                     withEvent:(UIEvent *)event{
    BOOL tracking = [super beginTrackingWithTouch:touch withEvent:event];
    
    if (self.showPreview) {
        if (CGRectContainsPoint(CGRectInset([self currentThumbRect], -8, -8), [touch locationInView:self])) {
            if (!self.previewView) {
                
                CGRect rect = CGRectOffset(CGRectInset([self currentThumbRect], -1, -1), 0, self.previewOffset);
                
                self.previewView = [self previewViewWithFrame:rect color:[self colorFromCurrentValue]];
                [self addSubview:self.previewView];
                
                
                [UIView animateWithDuration:self.previewAppearAnimateDuration animations:^{
                    self.previewView.alpha = 1;
                }];
                
            }

        }
    }
    return tracking;
}

-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    BOOL con = [super continueTrackingWithTouch:touch withEvent:event];
    
    if (self.showPreview) {
        if (self.isTracking) {
            if (!self.previewView) {
                
                CGRect rect = CGRectOffset(CGRectInset([self currentThumbRect], -1, -1), 0, self.previewOffset);
                
                self.previewView = [self previewViewWithFrame:rect color:[self colorFromCurrentValue]];
                [self addSubview:self.previewView];
                
                [UIView animateWithDuration:self.previewAppearAnimateDuration animations:^{
                    self.previewView.alpha = 1;
                }];
                
                
            } else {
                
                CGRect rect = self.previewView.frame;
                rect.origin.x = CGRectGetMidX([self currentThumbRect]) - CGRectGetWidth(rect)/2;
                self.previewView.frame = rect;
                self.previewView.color = [self colorFromCurrentValue];
                
            }
        }

    }
    
    
    return con;
    
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    [super endTrackingWithTouch:touch withEvent:event];
    if (self.showPreview) {
        [self removePreview];
    }
    
    
}

- (void)cancelTrackingWithEvent:(UIEvent *)event{
    [super cancelTrackingWithEvent:event];
    if (self.showPreview) {
        [self removePreview];
    }
}

-(void)removePreview{
    CGRect rect = self.previewView.frame;
    rect.origin.x = CGRectGetMidX([self currentThumbRect]) - CGRectGetWidth(rect)/2;
    self.previewView.frame = rect;
    self.previewView.color = [self colorFromCurrentValue];
    
    
    [UIView animateWithDuration:self.previewDismissAnimateDuration delay:0 options:UIViewAnimationOptionCurveLinear |UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.previewView.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            if (self.previewView) {
                [self.previewView removeFromSuperview];
                self.previewView = nil;
            }
        }
    }];
    
}


-(CGRect)currentThumbRect{
    return [self thumbRectForBounds:self.bounds trackRect:[self trackRectForBounds:self.bounds] value:self.value];
}

-(RGSPreviewView *)previewViewWithFrame:(CGRect)frame color:(UIColor *)color{
    RGSPreviewView *preview = [[RGSPreviewView alloc] initWithFrame:frame];
    preview.tintColor = [UIColor whiteColor];
    preview.layer.cornerRadius = CGRectGetWidth(preview.frame)/2;
    preview.alpha = 0.2;
    preview.color = color;
    
    return preview;
}


-(UIColor *)colorFromCurrentValue{

    return [UIColor colorWithHue: self.value
                                        saturation: 1
                                        brightness: 1.0
                                             alpha:1.0];
}

- (UIImage *)imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(void)setColor:(UIColor *)color{
    CGFloat hue;
    [color getHue:&hue saturation:nil brightness:nil alpha:nil];
    
    self.value = hue;
}

-(UIColor *)color{
    return [self colorFromCurrentValue];
}


@end
