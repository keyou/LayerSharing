#ifndef CA_LAYER_CLIENT_GL_LAYER_H
#define CA_LAYER_CLIENT_GL_LAYER_H

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>

@interface ClientGlLayer : CALayer
@property (nonatomic) CGFloat hue; // 用于存储当前颜色的色相
- (void)startColorChange;
@end

#endif // CA_CLIENT_GL_LAYER_H
