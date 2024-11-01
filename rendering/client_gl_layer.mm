#import "client_gl_layer.h"


@implementation ClientGlLayer

- (instancetype)init {
    self = [super init];
    if (self) {
        _hue = 0.0; // 初始色相
        [self startColorChange];
    }
    return self;
}

- (void)drawInContext:(CGContextRef)ctx {
    // 将色相转换为颜色
    NSColor *color = [NSColor colorWithHue:self.hue saturation:1.0 brightness:1.0 alpha:1.0];
    
    // 设置填充颜色
    CGContextSetFillColorWithColor(ctx, [color CGColor]);
    
    // 填充整个图层的区域
    CGContextFillRect(ctx, self.bounds);
}

- (void)startColorChange {
    // 使用定时器每隔0.1秒更新色相
    [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:self
                                   selector:@selector(updateColor)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)updateColor {
    // 更新色相并重绘
    self.hue += 0.01; // 增加色相
    if (self.hue > 1.0) {
        self.hue = 0.0; // 重置色相
    }
    [self setNeedsDisplay]; // 触发重绘
}
@end