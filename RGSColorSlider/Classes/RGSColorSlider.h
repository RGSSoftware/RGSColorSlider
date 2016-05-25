//
//  RGSUIslider.h
//  testColorSlider
//
//  Created by PC on 5/16/16.
//  Copyright © 2016 Randel Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGSColorSlider : UISlider

@property (nonatomic, strong)UIColor *color;

@property (nonatomic)int previewOffset;
@property (nonatomic)BOOL showPreview;

@property (nonatomic, )float previewAppearAnimateDuration;
@property (nonatomic, )float previewDismissAnimateDuration;

@property (nonatomic)int colorTrackHeight;
@end
