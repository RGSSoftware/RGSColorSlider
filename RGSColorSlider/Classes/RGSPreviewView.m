//
//  RGSPreviewView.m
//  testColorSlider
//
//  Created by PC on 5/23/16.
//  Copyright © 2016 Randel Smith. All rights reserved.
//

#import "RGSPreviewView.h"

@interface RGSPreviewView ()

@property (nonatomic, strong)UIView *colorView;
@property (nonatomic, strong)UIView *arrowView;

@end

@implementation RGSPreviewView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _colorView = [[UIView alloc] initWithFrame:CGRectInset(self.bounds, 3, 3)];
        _colorView.layer.cornerRadius = CGRectGetWidth(_colorView.frame)/2;
        [self addSubview:_colorView];
        
        _arrowView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 19, 18)];
        
        CGRect rect = _arrowView.frame;
        rect.origin.y = CGRectGetHeight(self.bounds) - 15;
        rect.origin.x = CGRectGetMidX(self.bounds) - round(CGRectGetWidth(_arrowView.frame)/2);
        _arrowView.frame = rect;
        
        _arrowView.transform = CGAffineTransformMakeRotation(M_PI_2/2);
        _arrowView.layer.cornerRadius = 4;
    
        [self addSubview:_arrowView];
        [self sendSubviewToBack:_arrowView];
        
        
    }
    return self;
}

-(void)tintColorDidChange{
    self.backgroundColor = self.tintColor;
    self.arrowView.backgroundColor = self.tintColor;
}

-(void)setColor:(UIColor *)color{
    _color = color;
    
    self.colorView.backgroundColor = color;
}
@end
